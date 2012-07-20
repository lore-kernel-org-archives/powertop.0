Content-Type: multipart/mixed; boundary="===============8967426973136953098=="
MIME-Version: 1.0
From: Mikko Tiihonen <mikko.tiihonen at iki.fi>
Subject: [Powertop] writeback sysfs tunable only likes one magic value
Date: Fri, 20 Jul 2012 16:42:24 +0300
Message-ID: <CAOpbQOaEKEOKYyKDaXcNhTnbjUtQEQbeMM_xSnZsNQtztMva+w@mail.gmail.com>
In-Reply-To: CAOpbQOZiS3QLOfFin+oTNtdDqcaOocUMHzgKBvkJuahHNchJOw@mail.gmail.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============8967426973136953098==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi,

On one of my systems I have set dirty_writeback_centisecs to 2500. Because
it does not exactly match the powertop magic value of 1500 the powertop
reports it as a Bad value.
Would it be possible to modify the code to accept anything >=3D 1500 as Goo=
d?

I checked out the source code and the value seems to come from here:

In src/tuning/tuning.cpp:
add_sysfs_tunable(_("VM writeback timeout"),
"/proc/sys/vm/dirty_writeback_centisecs", "1500");

Maybe it would be possible to add an optional flag at the end to specify
the comparision function(eg.  =3D=3D > >=3D < <=3D) ?

-Mikko

--===============8967426973136953098==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PGRpdiBjbGFzcz0iZ21haWxfcXVvdGUiPkhpLDxicj48YnI+T24KIG9uZSBvZiBteSBzeXN0ZW1z
IEkgaGF2ZSBzZXQgZGlydHlfd3JpdGViYWNrX2NlbnRpc2VjcyB0byAyNTAwLiBCZWNhdXNlCiBp
dCBkb2VzIG5vdCBleGFjdGx5IG1hdGNoIHRoZSBwb3dlcnRvcCBtYWdpYyB2YWx1ZSBvZiAxNTAw
IHRoZSBwb3dlcnRvcAogcmVwb3J0cyBpdCBhcyBhIEJhZCB2YWx1ZS48YnI+V291bGQgaXQgYmUg
cG9zc2libGUgdG8gbW9kaWZ5IHRoZSBjb2RlIHRvIGFjY2VwdCBhbnl0aGluZyAmZ3Q7PSAxNTAw
IGFzIEdvb2Q/PGJyPgo8YnI+SSBjaGVja2VkIG91dCB0aGUgc291cmNlIGNvZGUgYW5kIHRoZSB2
YWx1ZSBzZWVtcyB0byBjb21lIGZyb20gaGVyZTo8YnI+PGJyPkluIHNyYy90dW5pbmcvdHVuaW5n
LmNwcDo8YnI+YWRkX3N5c2ZzX3R1bmFibGUoXygmcXVvdDtWTSB3cml0ZWJhY2sgdGltZW91dCZx
dW90OyksICZxdW90Oy9wcm9jL3N5cy92bS9kaXJ0eV93cml0ZWJhY2tfY2VudGlzZWNzJnF1b3Q7
LCAmcXVvdDsxNTAwJnF1b3Q7KTs8YnI+CgoKPGRpdj4KPGJyPk1heWJlIGl0IHdvdWxkIGJlIHBv
c3NpYmxlIHRvIGFkZCBhbiBvcHRpb25hbCBmbGFnIGF0IHRoZSBlbmQgdG8gc3BlY2lmeSB0aGUg
Y29tcGFyaXNpb24gZnVuY3Rpb24oZWcuwqAgPT0gJmd0OyAmZ3Q7PSAmbHQ7ICZsdDs9KSA/PHNw
YW4+PGZvbnQgY29sb3I9IiM4ODg4ODgiPjxicj48YnI+LU1pa2tvPC9mb250Pjwvc3Bhbj48L2Rp
dj4KPC9kaXY+PGJyPgo=

--===============8967426973136953098==--

