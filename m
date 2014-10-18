Content-Type: multipart/mixed; boundary="===============8970550545654643560=="
MIME-Version: 1.0
From: SF Markus Elfring <elfring at users.sourceforge.net>
Subject: [Powertop] reserved identifier violation
Date: Sat, 18 Oct 2014 21:37:05 +0200
Message-ID: <5442C161.4020107@users.sourceforge.net>
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============8970550545654643560==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello,

I would like to point out that identifiers like "__INCLUDE_GUARD_DISPLAY_H_=
" and
"_INCLUDE_GUARD_AHCI_H" do not fit to the expected naming convention of the=
 C++
language standard.
Would you like to adjust your selection for unique names?
https://www.securecoding.cert.org/confluence/display/cplusplus/DCL32-CPP.+D=
o+not+declare+or+define+a+reserved+identifier#DCL32-CPP.Donotdeclareordefin=
eareservedidentifier-NoncompliantCodeExample%28HeaderGuard%29

https://github.com/fenrus75/powertop/blob/54956f7407c0e369665cd9712a189f601=
c6ab545/src/display.h#L25
https://github.com/fenrus75/powertop/blob/d7455ba1d0125efed4780a2114ef66165=
d0cadc1/src/devices/ahci.h#L25

Regards,
Markus

--===============8970550545654643560==--

