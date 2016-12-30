Content-Type: multipart/mixed; boundary="===============7839034589528384096=="
MIME-Version: 1.0
From: Paul Menzel <paulepanter at users.sourceforge.net>
Subject: [Powertop] [PATCH] cpu: Add space after comma
Date: Fri, 30 Dec 2016 12:23:16 +0100
Message-ID: <1483096996.3846.56.camel@users.sourceforge.net>
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============7839034589528384096==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Date: Fri, 30 Dec 2016 12:21:07 +0100

Fix up commit ab7108a6 (Fixed some potentially unterminated strings) by
adding a space after the comma.

Signed-off-by: Paul Menzel <paulepanter(a)users.sourceforge.net>
---
=C2=A0src/cpu/cpu.cpp | 2 +-
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/src/cpu/cpu.cpp b/src/cpu/cpu.cpp
index a801033..f3711f5 100644
--- a/src/cpu/cpu.cpp
+++ b/src/cpu/cpu.cpp
@@ -258,7 +258,7 @@ void enumerate_cpus(void)
=C2=A0				c++;
=C2=A0				if (*c =3D=3D ' ')
=C2=A0					c++;
-				pt_strcpy(vendor,c);
+				pt_strcpy(vendor, c);
=C2=A0			}
=C2=A0		}
=C2=A0		if (strncmp(line, "processor\t",10) =3D=3D 0) {
--=C2=A0
2.11.0

--===============7839034589528384096==
Content-Type: application/pgp-signature
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="signature.asc"

LS0tLS1CRUdJTiBQR1AgU0lHTkFUVVJFLS0tLS0KCmlGMEVBQkVDQUIwV0lRUTgrdzlkNDE0RkFW
QVJJcGs5ZlZvcmJBNGRXQVVDV0daRHBBQUtDUkE5ZlZvcmJBNGQKV09QUUFKOUIySHZZckVLY2Zs
UWxtKzZzOVNkV1FWWDdzQUNmVzNwdURrbFBQVjd4VmJiT0E1RVBwSkRSZHlJPQo9RWFWOAotLS0t
LUVORCBQR1AgU0lHTkFUVVJFLS0tLS0K

--===============7839034589528384096==--

