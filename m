Content-Type: multipart/mixed; boundary="===============3346683188014752123=="
MIME-Version: 1.0
From: Ronen Shitrit <rshitrit at annapurnalabs.com>
Subject: [Powertop] Seg fault on system with large page size
Date: Wed, 31 Dec 2014 14:28:09 +0200
Message-ID: <CAC9K06z0DQA6PbBi-sdbPRVDsyRv-2f1MAEC4iXjvkzPdP9G=g@mail.gmail.com>
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============3346683188014752123==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi,

I'm trying to run powertop on an ARM system which is using page size
of 64k and I get segmentation fault.
The seg fault is a result of failure in mmap of 8M (128 pages), It
seems there are many mmap like this going on...

Below is a small patch that reduce the amount of mmaped memory based
on the system page size.



Subject: [PATCH] Limit number of mmaped pages

Reduce number of pages mmaped, to prevent segmentation fault,
when system uses page size bigger than 4k.

Signed-off-by: Ronen Shitrit <rshitrit(a)annapurnalabs.com>
---
 src/perf/perf.cpp | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/src/perf/perf.cpp b/src/perf/perf.cpp
index b1103a7..b4d026f 100644
--- a/src/perf/perf.cpp
+++ b/src/perf/perf.cpp
@@ -207,7 +207,7 @@ perf_event::perf_event(void)
        allocate_pevent();
        name =3D NULL;
        perf_fd =3D -1;
-       bufsize =3D 128;
+       bufsize =3D 128 * 4096 / getpagesize();
        perf_mmap =3D NULL;
        cpu =3D 0;
        trace_type =3D 0;
-- =

1.9.1



-- =

Ronen Shitrit

--===============3346683188014752123==--

