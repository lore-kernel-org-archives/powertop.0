Content-Type: multipart/mixed; boundary="===============0297979925277565112=="
MIME-Version: 1.0
From: Paul Menzel <paulepanter at users.sourceforge.net>
Subject: [Powertop] [PATCH] src/process/do_process.cpp: Add suffix `u` to
 `4294967295` to signify an unsigned number
Date: Sat, 02 Feb 2013 23:23:09 +0100
Message-ID: <1359843789.5545.21.camel@mattotaupa>
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============0297979925277565112==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Date: Sat, 2 Feb 2013 22:32:20 +0100

The C++ compiler

        $ g++ --version
        g++-4.7.real (Debian 4.7.2-15) 4.7.2
        Copyright (C) 2012 Free Software Foundation, Inc.
        This is free software; see the source for copying conditions.  Ther=
e is NO
        warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR =
PURPOSE.

reports the following warning.

        $ make
        [=E2=80=A6]
          CXX    process/powertop-do_process.o
        process/do_process.cpp:595:3: warning: this decimal constant is uns=
igned only in ISO C90 [enabled by default]
        [=E2=80=A6]

Adding the suffix to the constant gets rid of the warning [1].

[1] http://stackoverflow.com/questions/2347936/cant-get-rid-of-this-decimal=
-constant-is-unsigned-only-in-iso-c90-warning
---
 src/process/do_process.cpp |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/src/process/do_process.cpp b/src/process/do_process.cpp
index 322ad4c..3bb1573 100644
--- a/src/process/do_process.cpp
+++ b/src/process/do_process.cpp
@@ -579,7 +579,7 @@ void perf_process_bundle::handle_trace_point(void *trac=
e, int cpu, uint64_t time
 	}
 	else if (strcmp(event->name, "cpu_idle") =3D=3D 0) {
 		ret =3D pevent_get_field_val(NULL, event, "state", &rec, &val, 0);
-		if (val =3D=3D 4294967295)
+		if (val =3D=3D 4294967295u)
 			consume_blame(cpu);
 		else
 			set_wakeup_pending(cpu);
-- =

1.7.10.4

--===============0297979925277565112==
Content-Type: application/pgp-signature
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="signature.asc"

LS0tLS1CRUdJTiBQR1AgU0lHTkFUVVJFLS0tLS0KVmVyc2lvbjogR251UEcgdjEuNC4xMiAoR05V
L0xpbnV4KQoKaUVZRUFCRUNBQVlGQWxFTmtjMEFDZ2tRUFgxYUsyd09IVmdzd1FDZldwZmpsdW5l
R1lSd1N4ZDlGQVhnY09JTQo5MFlBbjFreXZCdTVRUGJuaWhsOHRMbGIzR2pwOFZWMQo9SG1pcAot
LS0tLUVORCBQR1AgU0lHTkFUVVJFLS0tLS0K

--===============0297979925277565112==--

