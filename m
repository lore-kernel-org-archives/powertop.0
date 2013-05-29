Content-Type: multipart/mixed; boundary="===============9169389918189436308=="
MIME-Version: 1.0
From: Sergey Senozhatsky <sergey.senozhatsky at gmail.com>
Subject: Re: [Powertop] [PATCH] Fix running failure when > 69 CPUs for open
 file limitation
Date: Thu, 30 May 2013 00:00:14 +0300
Message-ID: <20130529210013.GA3075@swordfish>
In-Reply-To: 1369842247-11442-1-git-send-email-youquan.song@intel.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============9169389918189436308==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On (05/29/13 11:44), Youquan Song wrote:
> Powertop 2.3 fails to run on machine with > 69 CPUs because system open f=
iles
> limitation of one process is 1024 default,  While powertop will open one =
file
> for every monitored perf_event (at least 15) each CPU.
> =

> Like on 80 CPUs Westmere-EX machine, powertop will fail to run with below:
> =

> PowerTOP v2.3 needs the kernel to support the 'perf' subsystem
> as well as support for trace points in the kernel:
> CONFIG_PERF_EVENTS=3Dy
> CONFIG_PERF_COUNTERS=3Dy
> CONFIG_TRACEPOINTS=3Dy
> CONFIG_TRACING=3Dy
> =

> This patch is to change RLIMIT_NOFILE from default (1024) to max limition.
> =

> =


Hello,
I'd like to ask you to try out the following patch. We leak fd in read_file=
().




------8<--------8<--------

- Do not leak file descriptor in perf_bundle read_file().
- Clear perf event (unmap memory and close fd) on event destruction.


Signed-off-by: Sergey Senozhatsky <sergey.senozhatsky(a)gmail.com>

---

diff --git a/src/perf/perf.cpp b/src/perf/perf.cpp
index 35b4017..e919741 100644
--- a/src/perf/perf.cpp
+++ b/src/perf/perf.cpp
@@ -167,6 +167,7 @@ perf_event::~perf_event(void)
 	if (perf_event::pevent->ref_count =3D=3D 1) {
 		pevent_free(perf_event::pevent);
 		perf_event::pevent =3D NULL;
+		clear();
 	} else
 		pevent_unref(perf_event::pevent);
 }
diff --git a/src/perf/perf_bundle.cpp b/src/perf/perf_bundle.cpp
index 38e1e91..8d480e8 100644
--- a/src/perf/perf_bundle.cpp
+++ b/src/perf/perf_bundle.cpp
@@ -123,6 +123,7 @@ static char * read_file(const char *file)
 		buffer[len] =3D '\0';
 	}
 out:
+	close(fd);
 	return buffer;
 }
=20

--===============9169389918189436308==--

