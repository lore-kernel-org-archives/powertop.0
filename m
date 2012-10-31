Content-Type: multipart/mixed; boundary="===============8318550429642474267=="
MIME-Version: 1.0
From: Austin Zhang <zhang.austin at gmail.com>
Subject: Re: [Powertop] [Powertop ]compiling issue and running issue
Date: Thu, 01 Nov 2012 00:18:51 +0800
Message-ID: <CAGLu0vO-zTDaX_=mEeDMw65oRn36r1AH_W+-qhMKF_AJiLCGZA@mail.gmail.com>
In-Reply-To: 50914293.80704@linux.intel.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============8318550429642474267==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

thanks for your reply. In case I confused people, I list it as:

austin(a)austin-Studio:~$ uname -a

Linux austin-Studio 3.0.0-15-generic #26-Ubuntu SMP Fri Jan 20 17:23:00 UTC
2012 x86_64 x86_64 x86_64 GNU/Linux
austin(a)austin-Studio:~$ dpkg -L libnl2

/.
/usr
/usr/share
/usr/share/doc
/usr/share/doc/libnl2
/usr/share/doc/libnl2/copyright
/usr/share/doc/libnl2/changelog.Debian.gz
/usr/lib
/usr/lib/libnl-cli.so.2.0.0
/usr/lib/libnl-route.so.2.0.0
/usr/lib/libnl-genl.so.2.0.0
/usr/lib/libnl-nf.so.2.0.0
/usr/lib/libnl.so.2.0.0
/usr/lib/libnl-route.so.2
/usr/lib/libnl-cli.so.2
/usr/lib/libnl-genl.so.2
/usr/lib/libnl.so.2
/usr/lib/libnl-nf.so.2
austin(a)austin-Studio:~$ dpkg -L libnl3

/.
/usr
/usr/share
/usr/share/doc
/usr/share/doc/libnl3
/usr/share/doc/libnl3/README.Debian
/usr/share/doc/libnl3/copyright
/usr/share/doc/libnl3/changelog.Debian.gz
/usr/lib
/usr/lib/libnl-cli.so.3.0.0
/usr/lib/libnl-genl.so.3.0.0
/usr/lib/libnl-nf.so.3.0.0
/usr/lib/libnl-route.so.3.0.0
/usr/lib/libnl.so.3.0.0
/usr/lib/libnl-cli.so.3
/usr/lib/libnl-genl.so.3
/usr/lib/libnl-nf.so.3
/usr/lib/libnl-route.so.3
/usr/lib/libnl.so.3
austin(a)austin-Studio:~$


2012/10/31 Arjan van de Ven <arjan(a)linux.intel.com>

> On 10/31/2012 7:11 AM, Austin Zhang wrote:
> > Hi,
> >
> > I am trying to compile powertop on my box: ubuntu 12.04, X86-64.
> >
> > (1)compiling issue
> >
> > Here, my system didn=E2=80=99t install libnl-1, but I installed libnl2 =
(under
> /usr/lib) and libnl-3 (under /lib).
>
>
> on a 64 bit system, that should have been /usr/lib64 and  /lib64
> otherwise you got 32 bit libraries ;-)
>
>

--===============8318550429642474267==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

dGhhbmtzIGZvciB5b3VyIHJlcGx5LiBJbiBjYXNlIEkgY29uZnVzZWQgcGVvcGxlLCBJIGxpc3Qg
aXQgYXM6PGRpdj48YnI+PC9kaXY+PGRpdj48ZGl2PmF1c3RpbkBhdXN0aW4tU3R1ZGlvOn4kIHVu
YW1lIC1hIKAgoCCgIKAgoCCgIKAgoCCgIKAgoCCgIKAgoCCgIKAgoCCgIKAgoCCgIKAgoCCgIKAg
oCCgIKAgoCCgIKAgoCCgIKAgoCCgIKAgoCCgIKAgoCCgIKAgoCCgIKAgoCCgIKAgoCCgIKCgPC9k
aXY+CjxkaXY+TGludXggYXVzdGluLVN0dWRpbyAzLjAuMC0xNS1nZW5lcmljICMyNi1VYnVudHUg
U01QIEZyaSBKYW4gMjAgMTc6MjM6MDAgVVRDIDIwMTIgeDg2XzY0IHg4Nl82NCB4ODZfNjQgR05V
L0xpbnV4PC9kaXY+PGRpdj5hdXN0aW5AYXVzdGluLVN0dWRpbzp+JCBkcGtnIC1MIGxpYm5sMiCg
IKAgoCCgIKAgoCCgIKAgoCCgIKAgoCCgIKAgoCCgIKAgoCCgIKAgoCCgIKAgoCCgIKAgoCCgIKAg
oCCgIKAgoCCgIKAgoCCgIKAgoCCgIKAgoCCgIKAgoCCgIKAgoCCgoDwvZGl2Pgo8ZGl2Pi8uPC9k
aXY+PGRpdj4vdXNyPC9kaXY+PGRpdj4vdXNyL3NoYXJlPC9kaXY+PGRpdj4vdXNyL3NoYXJlL2Rv
YzwvZGl2PjxkaXY+L3Vzci9zaGFyZS9kb2MvbGlibmwyPC9kaXY+PGRpdj4vdXNyL3NoYXJlL2Rv
Yy9saWJubDIvY29weXJpZ2h0PC9kaXY+PGRpdj4vdXNyL3NoYXJlL2RvYy9saWJubDIvY2hhbmdl
bG9nLkRlYmlhbi5nejwvZGl2PjxkaXY+L3Vzci9saWI8L2Rpdj48ZGl2PgovdXNyL2xpYi9saWJu
bC1jbGkuc28uMi4wLjA8L2Rpdj48ZGl2Pi91c3IvbGliL2xpYm5sLXJvdXRlLnNvLjIuMC4wPC9k
aXY+PGRpdj4vdXNyL2xpYi9saWJubC1nZW5sLnNvLjIuMC4wPC9kaXY+PGRpdj4vdXNyL2xpYi9s
aWJubC1uZi5zby4yLjAuMDwvZGl2PjxkaXY+L3Vzci9saWIvbGlibmwuc28uMi4wLjA8L2Rpdj48
ZGl2Pi91c3IvbGliL2xpYm5sLXJvdXRlLnNvLjI8L2Rpdj48ZGl2PgovdXNyL2xpYi9saWJubC1j
bGkuc28uMjwvZGl2PjxkaXY+L3Vzci9saWIvbGlibmwtZ2VubC5zby4yPC9kaXY+PGRpdj4vdXNy
L2xpYi9saWJubC5zby4yPC9kaXY+PGRpdj4vdXNyL2xpYi9saWJubC1uZi5zby4yPC9kaXY+PGRp
dj5hdXN0aW5AYXVzdGluLVN0dWRpbzp+JCBkcGtnIC1MIGxpYm5sMyCgIKAgoCCgIKAgoCCgIKAg
oCCgIKAgoCCgIKAgoCCgIKAgoCCgIKAgoCCgIKAgoCCgIKAgoCCgIKAgoCCgIKAgoCCgIKAgoCCg
IKAgoCCgIKAgoCCgIKAgoCCgIKAgoCCgIKAgoCCgPC9kaXY+CjxkaXY+Ly48L2Rpdj48ZGl2Pi91
c3I8L2Rpdj48ZGl2Pi91c3Ivc2hhcmU8L2Rpdj48ZGl2Pi91c3Ivc2hhcmUvZG9jPC9kaXY+PGRp
dj4vdXNyL3NoYXJlL2RvYy9saWJubDM8L2Rpdj48ZGl2Pi91c3Ivc2hhcmUvZG9jL2xpYm5sMy9S
RUFETUUuRGViaWFuPC9kaXY+PGRpdj4vdXNyL3NoYXJlL2RvYy9saWJubDMvY29weXJpZ2h0PC9k
aXY+PGRpdj4vdXNyL3NoYXJlL2RvYy9saWJubDMvY2hhbmdlbG9nLkRlYmlhbi5nejwvZGl2Pgo8
ZGl2Pi91c3IvbGliPC9kaXY+PGRpdj4vdXNyL2xpYi9saWJubC1jbGkuc28uMy4wLjA8L2Rpdj48
ZGl2Pi91c3IvbGliL2xpYm5sLWdlbmwuc28uMy4wLjA8L2Rpdj48ZGl2Pi91c3IvbGliL2xpYm5s
LW5mLnNvLjMuMC4wPC9kaXY+PGRpdj4vdXNyL2xpYi9saWJubC1yb3V0ZS5zby4zLjAuMDwvZGl2
PjxkaXY+L3Vzci9saWIvbGlibmwuc28uMy4wLjA8L2Rpdj48ZGl2Pi91c3IvbGliL2xpYm5sLWNs
aS5zby4zPC9kaXY+CjxkaXY+L3Vzci9saWIvbGlibmwtZ2VubC5zby4zPC9kaXY+PGRpdj4vdXNy
L2xpYi9saWJubC1uZi5zby4zPC9kaXY+PGRpdj4vdXNyL2xpYi9saWJubC1yb3V0ZS5zby4zPC9k
aXY+PGRpdj4vdXNyL2xpYi9saWJubC5zby4zPC9kaXY+PGRpdj5hdXN0aW5AYXVzdGluLVN0dWRp
bzp+JKA8L2Rpdj48L2Rpdj48ZGl2IGNsYXNzPSJnbWFpbF9leHRyYSI+PGJyPjxicj48ZGl2IGNs
YXNzPSJnbWFpbF9xdW90ZSI+CjIwMTIvMTAvMzEgQXJqYW4gdmFuIGRlIFZlbiA8c3BhbiBkaXI9
Imx0ciI+Jmx0OzxhIGhyZWY9Im1haWx0bzphcmphbkBsaW51eC5pbnRlbC5jb20iIHRhcmdldD0i
X2JsYW5rIj5hcmphbkBsaW51eC5pbnRlbC5jb208L2E+Jmd0Ozwvc3Bhbj48YnI+PGJsb2NrcXVv
dGUgY2xhc3M9ImdtYWlsX3F1b3RlIiBzdHlsZT0ibWFyZ2luOjAgMCAwIC44ZXg7Ym9yZGVyLWxl
ZnQ6MXB4ICNjY2Mgc29saWQ7cGFkZGluZy1sZWZ0OjFleCI+CjxkaXYgY2xhc3M9ImltIj5PbiAx
MC8zMS8yMDEyIDc6MTEgQU0sIEF1c3RpbiBaaGFuZyB3cm90ZTo8YnI+CiZndDsgSGksPGJyPgom
Z3Q7PGJyPgomZ3Q7IEkgYW0gdHJ5aW5nIHRvIGNvbXBpbGUgcG93ZXJ0b3Agb24gbXkgYm94OiB1
YnVudHUgMTIuMDQsIFg4Ni02NC48YnI+CiZndDs8YnI+CiZndDsgKDEpY29tcGlsaW5nIGlzc3Vl
PGJyPgomZ3Q7PGJyPgomZ3Q7IEhlcmUsIG15IHN5c3RlbSBkaWRuknQgaW5zdGFsbCBsaWJubC0x
LCBidXQgSSBpbnN0YWxsZWQgbGlibmwyICh1bmRlciAvdXNyL2xpYikgYW5kIGxpYm5sLTMgKHVu
ZGVyIC9saWIpLjxicj4KPGJyPgo8YnI+CjwvZGl2Pm9uIGEgNjQgYml0IHN5c3RlbSwgdGhhdCBz
aG91bGQgaGF2ZSBiZWVuIC91c3IvbGliNjQgYW5kIKAvbGliNjQ8YnI+Cm90aGVyd2lzZSB5b3Ug
Z290IDMyIGJpdCBsaWJyYXJpZXMgOy0pPGJyPgo8YnI+CjwvYmxvY2txdW90ZT48L2Rpdj48YnI+
PC9kaXY+Cg==

--===============8318550429642474267==--

