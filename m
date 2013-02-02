Content-Type: multipart/mixed; boundary="===============5654291235577210501=="
MIME-Version: 1.0
From: Paul Menzel <paulepanter at users.sourceforge.net>
Subject: [Powertop] [PATCH] src/cpu/cpu.cpp: Add suffix `u` to `4294967295` to
 signify an unsigned number
Date: Sat, 02 Feb 2013 23:19:22 +0100
Message-ID: <1359843562.5545.18.camel@mattotaupa>
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============5654291235577210501==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Date: Sat, 2 Feb 2013 22:27:58 +0100

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
          CXX    cpu/powertop-cpu.o
        cpu/cpu.cpp:776:3: warning: this decimal constant is unsigned only =
in ISO C90 [enabled by default]
        [=E2=80=A6]

Adding the suffix to the constant gets rid of the warning [1].

[1] http://stackoverflow.com/questions/2347936/cant-get-rid-of-this-decimal=
-constant-is-unsigned-only-in-iso-c90-warning
---
 src/cpu/cpu.cpp |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/src/cpu/cpu.cpp b/src/cpu/cpu.cpp
index f875e45..401bade 100644
--- a/src/cpu/cpu.cpp
+++ b/src/cpu/cpu.cpp
@@ -797,7 +797,7 @@ void perf_power_bundle::handle_trace_point(void *trace,=
 int cpunr, uint64_t time
                         exit(-1);
                 }
 =

-		if (val =3D=3D 4294967295)
+		if (val =3D=3D 4294967295u)
 			cpu->go_unidle(time);
 		else
 			cpu->go_idle(time);
-- =

1.7.10.4

--===============5654291235577210501==
Content-Type: application/pgp-signature
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="signature.asc"

LS0tLS1CRUdJTiBQR1AgU0lHTkFUVVJFLS0tLS0KVmVyc2lvbjogR251UEcgdjEuNC4xMiAoR05V
L0xpbnV4KQoKaUVVRUFCRUNBQVlGQWxFTmtPc0FDZ2tRUFgxYUsyd09IVmo1YmdDWXlYaHR0dFg3
L1psdFR3ak5YTitUQTlYMgo2d0NmY0tpcUttY0xkeVloaDMzcnptNDAyMGNwSEQ0PQo9bE1qUQot
LS0tLUVORCBQR1AgU0lHTkFUVVJFLS0tLS0K

--===============5654291235577210501==--

