Content-Type: multipart/mixed; boundary="===============6696492247179630970=="
MIME-Version: 1.0
From: Joerg Mayer <jmpt at loplof.de>
Subject: [Powertop] [Warning fixes 1/6] if 0/endif out unused function
 dbg_printf_pevent_info
Date: Fri, 24 Aug 2012 18:48:31 +0200
Message-ID: <20120824173217.DE322DFFDB@linda.rhrk.uni-kl.de>
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============6696492247179630970==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Is someone intending to use it or should it be removed instead?

Signed-off-by: Joerg Mayer <jmpt(a)loplof.de>

diff --git a/src/process/do_process.cpp b/src/process/do_process.cpp
index cb7c672..3db5331 100644
--- a/src/process/do_process.cpp
+++ b/src/process/do_process.cpp
@@ -186,6 +186,7 @@ int dont_blame_me(char *comm)
 	return 0;
 }
 =

+#if 0
 static void dbg_printf_pevent_info(struct event_format *event, struct peve=
nt_record *rec)
 {
 	static struct trace_seq s;
@@ -198,6 +199,7 @@ static void dbg_printf_pevent_info(struct event_format =
*event, struct pevent_rec
 	fprintf(stderr, "%.*s", s.len, s.buffer);
 	trace_seq_destroy(&s);
 }
+#endif
 =

 static char * get_pevent_field_str(void *trace, struct event_format *event=
, struct format_field *field)
 {
-- =

1.7.7


--===============6696492247179630970==--

