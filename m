Content-Type: multipart/mixed; boundary="===============4822918281592406063=="
MIME-Version: 1.0
From: Rui DaCosta <ruidc at yahoo.com>
Subject: [Powertop] segfault on Sheevaplug (ARM Kirkwood)
Date: Sun, 20 May 2012 01:41:42 -0700
Message-ID: <1337503302.67870.YahooMailNeo@web160301.mail.bf1.yahoo.com>
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============4822918281592406063==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

I get the following segfault running 2.0 from unmodified source and default=
 build options in Arch Linux ARM:
Linux alarm 3.1.10-10-ARCH #1 PREEMPT Thu May 10 02:00:37 UTC 2012 armv5tel=
 GNU/Linux


Cannot load from file /var/cache/powertop/saved_results.powertop
Cannot load from file /var/cache/powertop/saved_parameters.powertop
Segmentation fault


trace is:

#0  handle_one_cpu (model=3D0, family=3D0, vendor=3D0xbeffcf8c "", number=
=3D4294967295)
at cpu/cpu.cpp:210
#1  enumerate_cpus () at cpu/cpu.cpp:276
#2  0x000495d8 in main (argc=3D1, argv=3D0xbefffcc4) at main.cpp:382


please let me know if there's anything else I can provide to assist.

Regards,
RuiDC

--===============4822918281592406063==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PGh0bWw+PGJvZHk+PGRpdiBzdHlsZT0iY29sb3I6IzAwMDsgYmFja2dyb3VuZC1jb2xvcjojZmZm
OyBmb250LWZhbWlseTp0aW1lcyBuZXcgcm9tYW4sIG5ldyB5b3JrLCB0aW1lcywgc2VyaWY7Zm9u
dC1zaXplOjEycHQiPjxkaXY+SSBnZXQgdGhlIGZvbGxvd2luZyBzZWdmYXVsdCBydW5uaW5nIDIu
MCBmcm9tIHVubW9kaWZpZWQgc291cmNlIGFuZCBkZWZhdWx0IGJ1aWxkIG9wdGlvbnMgaW4gQXJj
aCBMaW51eCBBUk06PC9kaXY+PGRpdj5MaW51eCBhbGFybSAzLjEuMTAtMTAtQVJDSCAjMSBQUkVF
TVBUIFRodSBNYXkgMTAgMDI6MDA6MzcgVVRDIDIwMTIgYXJtdjV0ZWwgR05VL0xpbnV4PGJyPjwv
ZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+Q2Fubm90IGxvYWQgZnJvbSBmaWxlIC92YXIvY2FjaGUv
cG93ZXJ0b3Avc2F2ZWRfcmVzdWx0cy5wb3dlcnRvcDxicj5DYW5ub3QgbG9hZCBmcm9tIGZpbGUg
L3Zhci9jYWNoZS9wb3dlcnRvcC9zYXZlZF9wYXJhbWV0ZXJzLnBvd2VydG9wPGJyPlNlZ21lbnRh
dGlvbiBmYXVsdDxicj48L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2PnRyYWNlIGlzOjwvZGl2Pjxk
aXY+PGJyPjwvZGl2PjxkaXY+IzAgIGhhbmRsZV9vbmVfY3B1IChtb2RlbD0wLCBmYW1pbHk9MCwg
dmVuZG9yPTB4YmVmZmNmOGMgIiIsIG51bWJlcj00Mjk0OTY3Mjk1KTxicj4gICAgYXQgY3B1L2Nw
dS5jcHA6MjEwPGJyPiMxICBlbnVtZXJhdGVfY3B1cyAoKSBhdCBjcHUvY3B1LmNwcDoyNzY8YnI+
IzIgIDB4MDAwNDk1ZDggaW4gbWFpbiAoYXJnYz0xLCBhcmd2PTB4YmVmZmZjYzQpIGF0IG1haW4u
Y3BwOjM4Mjxicj48L2Rpdj48ZGl2PnBsZWFzZSBsZXQgbWUga25vdyBpZiB0aGVyZSdzIGFueXRo
aW5nIGVsc2UgSSBjYW4gcHJvdmlkZSB0bwogYXNzaXN0LjwvZGl2PjxkaXY+PGJyPjwvZGl2Pjxk
aXY+UmVnYXJkcyw8L2Rpdj48ZGl2PlJ1aURDPC9kaXY+PGRpdj48YnI+PC9kaXY+PC9kaXY+PC9i
b2R5PjwvaHRtbD4=
--===============4822918281592406063==--

