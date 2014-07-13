Content-Type: multipart/mixed; boundary="===============6293205326238376331=="
MIME-Version: 1.0
From: Mohammad Merajul Islam Molla <meraj.enigma at gmail.com>
Subject: [Powertop] Regarding powertop VFS ops/sec output
Date: Sun, 13 Jul 2014 15:19:38 +0600
Message-ID: <CAHu9=sNsO-Y4ovGjQMREFBymnVhcXENg+5fHwCKbwWettXtvJw@mail.gmail.com>
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============6293205326238376331==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello,

It looks like powertop requires a kernel patch to display VFS ops/sec.
The last patch was for kernel v3.3.0. The patch needs to be updated,
otherwise powertop always displays 0 VFS ops/sec.

Considering changes starting with kernel v3.9, the kernel side patch
would look like as below. I have tested it with kernel v3.16.0-rc4 and
with this patch powertop displays and updates VFS ops/sec.


diff --git a/fs/fs-writeback.c b/fs/fs-writeback.c
index be568b7..2bcd6d5 100644
--- a/fs/fs-writeback.c
+++ b/fs/fs-writeback.c
@@ -1156,6 +1156,9 @@ void __mark_inode_dirty(struct inode *inode, int flag=
s)
  if ((inode->i_state & flags) =3D=3D flags)
  return;

+ if (flags & (I_DIRTY_SYNC | I_DIRTY_DATASYNC | I_DIRTY_PAGES))
+               trace_writeback_inode_dirty(inode, flags);
+
  if (unlikely(block_dump))
  block_dump___mark_inode_dirty(inode);

diff --git a/include/trace/events/writeback.h b/include/trace/events/writeb=
ack.h
index cee02d6..c1b1a95 100644
--- a/include/trace/events/writeback.h
+++ b/include/trace/events/writeback.h
@@ -102,6 +102,35 @@ DEFINE_EVENT(writeback_dirty_inode_template,
writeback_dirty_inode,
  TP_ARGS(inode, flags)
 );

+/*
+ * Tracepoint for dirtying an inode; used by PowerTOP
+ */
+TRACE_EVENT(writeback_inode_dirty,
+
+       TP_PROTO(struct inode *inode, int flags),
+
+       TP_ARGS(inode, flags),
+
+       TP_STRUCT__entry(
+                __field(        __kernel_dev_t, dev             )
+                __field(        ino_t,          ino             )
+                __field(        u32,            flags           )
+        ),
+
+       TP_fast_assign(
+                __entry->dev    =3D inode->i_sb->s_dev;
+                __entry->ino    =3D inode->i_ino;
+                __entry->flags  =3D flags;
+        ),
+
+       TP_printk("dev %d:%d ino %lu flags %d %s", MAJOR(__entry->dev),
+                 MINOR(__entry->dev),
+                  (unsigned long) __entry->ino,
+                  __entry->flags,
+                 show_inode_state(__entry->flags)
+       )
+);
+
 DECLARE_EVENT_CLASS(writeback_write_inode_template,

  TP_PROTO(struct inode *inode, struct writeback_control *wbc),


However, there is an alternative thought.

Starting with kernel v3.9, kernel provides a built in trace event
called - "writeback_dirty_inode" -

DEFINE_EVENT(writeback_dirty_inode_template, writeback_dirty_inode,

        TP_PROTO(struct inode *inode, int flags),

        TP_ARGS(inode, flags)
);

But since the traceevent powertop expects is "writeback_inode_dirty" and
the names and output format don't match, it would require changes in
powertop; some kernel side patch may be needed too to account for DIRTY_PAG=
ES.

Any comment or thought on this?

--
Thanks,
-Meraj

--===============6293205326238376331==--

