Content-Type: multipart/mixed; boundary="===============2827096376055614863=="
MIME-Version: 1.0
From: Joerg Mayer <jmpt at loplof.de>
Subject: [Powertop] [Warning fixes 4/6] Fix warning: warning: this decimal
 constant is unsigned only in ISO C90 [enabled by default] by explicitely
 declaring the value as UL
Date: Fri, 24 Aug 2012 19:20:12 +0200
Message-ID: <20120824173217.E08E3E00D1@linda.rhrk.uni-kl.de>
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============2827096376055614863==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Joerg Mayer <jmpt(a)loplof.de>

diff --git a/src/process/do_process.cpp b/src/process/do_process.cpp
index 3db5331..e127572 100644
--- a/src/process/do_process.cpp
+++ b/src/process/do_process.cpp
@@ -581,7 +581,7 @@ void perf_process_bundle::handle_trace_point(void *trac=
e, int cpu, uint64_t time
 	}
 	else if (strcmp(event->name, "cpu_idle") =3D=3D 0) {
 		ret =3D pevent_get_field_val(NULL, event, "state", &rec, &val, 0);
-		if (val =3D=3D 4294967295)
+		if (val =3D=3D 4294967295UL)
 			consume_blame(cpu);
 		else
 			set_wakeup_pending(cpu);
-- =

1.7.7


--===============2827096376055614863==--

