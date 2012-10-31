Content-Type: multipart/mixed; boundary="===============1310020083451128429=="
MIME-Version: 1.0
From: Austin Zhang <zhang.austin at gmail.com>
Subject: Re: [Powertop] [Powertop ]compiling issue and running issue
Date: Thu, 01 Nov 2012 00:25:18 +0800
Message-ID: <CAGLu0vNHMPJaZj+e-P9Hw8JjhGXvfR=zh7ybgWO3R-c4o1VLRA@mail.gmail.com>
In-Reply-To: CAGLu0vO-zTDaX_=mEeDMw65oRn36r1AH_W+-qhMKF_AJiLCGZA@mail.gmail.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============1310020083451128429==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

In another box with i686 installed, it also encounted into similar issue
(cannot link against libnl2)

root(a)h-desktop:~# dpkg -L libnl2


/.
/usr
/usr/share
/usr/share/doc
/usr/share/doc/libnl2
/usr/share/doc/libnl2/copyright
/usr/share/doc/libnl2/changelog.Debian.gz
/usr/lib
/usr/lib/libnl-cli.so.2.0.0
/usr/lib/libnl-genl.so.2.0.0
/usr/lib/libnl-nf.so.2.0.0
/usr/lib/libnl-route.so.2.0.0
/usr/lib/libnl.so.2.0.0
/usr/lib/libnl-cli.so.2
/usr/lib/libnl-genl.so.2
/usr/lib/libnl-nf.so.2
/usr/lib/libnl-route.so.2
/usr/lib/libnl.so.2
root(a)h-desktop:~# dpkg -L libnl-3-200
/.
/usr
/usr/share
/usr/share/doc
/usr/share/doc/libnl-3-200
/usr/share/doc/libnl-3-200/copyright
/usr/share/doc/libnl-3-200/README.Debian
/usr/share/doc/libnl-3-200/changelog.Debian.gz
/lib
/lib/libnl-3.so.200.3.0
/etc
/etc/libnl-3
/etc/libnl-3/classid
/etc/libnl-3/pktloc
/lib/libnl-3.so.200
root(a)h-desktop:~# uname -a
Linux h-desktop 3.0.0-12-generic-pae #20-Ubuntu SMP Fri Oct 7 16:37:17 UTC
2011 i686 i686 i386 GNU/Linux


2012/11/1 Austin Zhang <zhang.austin(a)gmail.com>

> thanks for your reply. In case I confused people, I list it as:
>
> austin(a)austin-Studio:~$ uname -a
>
> Linux austin-Studio 3.0.0-15-generic #26-Ubuntu SMP Fri Jan 20 17:23:00
> UTC 2012 x86_64 x86_64 x86_64 GNU/Linux
> austin(a)austin-Studio:~$ dpkg -L libnl2
>
> /.
> /usr
> /usr/share
> /usr/share/doc
> /usr/share/doc/libnl2
> /usr/share/doc/libnl2/copyright
> /usr/share/doc/libnl2/changelog.Debian.gz
> /usr/lib
> /usr/lib/libnl-cli.so.2.0.0
> /usr/lib/libnl-route.so.2.0.0
> /usr/lib/libnl-genl.so.2.0.0
> /usr/lib/libnl-nf.so.2.0.0
> /usr/lib/libnl.so.2.0.0
> /usr/lib/libnl-route.so.2
> /usr/lib/libnl-cli.so.2
> /usr/lib/libnl-genl.so.2
> /usr/lib/libnl.so.2
> /usr/lib/libnl-nf.so.2
> austin(a)austin-Studio:~$ dpkg -L libnl3
>
> /.
> /usr
> /usr/share
> /usr/share/doc
> /usr/share/doc/libnl3
> /usr/share/doc/libnl3/README.Debian
> /usr/share/doc/libnl3/copyright
> /usr/share/doc/libnl3/changelog.Debian.gz
> /usr/lib
> /usr/lib/libnl-cli.so.3.0.0
> /usr/lib/libnl-genl.so.3.0.0
> /usr/lib/libnl-nf.so.3.0.0
> /usr/lib/libnl-route.so.3.0.0
> /usr/lib/libnl.so.3.0.0
> /usr/lib/libnl-cli.so.3
> /usr/lib/libnl-genl.so.3
> /usr/lib/libnl-nf.so.3
> /usr/lib/libnl-route.so.3
> /usr/lib/libnl.so.3
> austin(a)austin-Studio:~$
>
>
> 2012/10/31 Arjan van de Ven <arjan(a)linux.intel.com>
>
>> On 10/31/2012 7:11 AM, Austin Zhang wrote:
>> > Hi,
>> >
>> > I am trying to compile powertop on my box: ubuntu 12.04, X86-64.
>> >
>> > (1)compiling issue
>> >
>> > Here, my system didn=E2=80=99t install libnl-1, but I installed libnl2=
 (under
>> /usr/lib) and libnl-3 (under /lib).
>>
>>
>> on a 64 bit system, that should have been /usr/lib64 and  /lib64
>> otherwise you got 32 bit libraries ;-)
>>
>>
>

--===============1310020083451128429==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

SW4gYW5vdGhlciBib3ggd2l0aCBpNjg2IGluc3RhbGxlZCwgaXQgYWxzbyBlbmNvdW50ZWQgaW50
byBzaW1pbGFyIGlzc3VlIChjYW5ub3QgbGluayBhZ2FpbnN0IGxpYm5sMik8ZGl2Pjxicj48L2Rp
dj48ZGl2PjxkaXY+cm9vdEBoLWRlc2t0b3A6fiMgZHBrZyAtTCBsaWJubDIgoCCgIKAgoCCgIKAg
oCCgIKAgoCCgIKAgoCCgIKAgoCCgIKAgoCCgIKAgoCCgIKAgoCCgIKAgoCCgIKAgoCCgIKAgoCCg
IKAgoCCgIKAgoCCgIKAgoCCgIKAgoCCgIKAgoCCgIKAgoCCgIKAgoCCgIKAgoCCgIKCgPC9kaXY+
CjxkaXY+Ly48L2Rpdj48ZGl2Pi91c3I8L2Rpdj48ZGl2Pi91c3Ivc2hhcmU8L2Rpdj48ZGl2Pi91
c3Ivc2hhcmUvZG9jPC9kaXY+PGRpdj4vdXNyL3NoYXJlL2RvYy9saWJubDI8L2Rpdj48ZGl2Pi91
c3Ivc2hhcmUvZG9jL2xpYm5sMi9jb3B5cmlnaHQ8L2Rpdj48ZGl2Pi91c3Ivc2hhcmUvZG9jL2xp
Ym5sMi9jaGFuZ2Vsb2cuRGViaWFuLmd6PC9kaXY+PGRpdj4vdXNyL2xpYjwvZGl2PjxkaXY+Ci91
c3IvbGliL2xpYm5sLWNsaS5zby4yLjAuMDwvZGl2PjxkaXY+L3Vzci9saWIvbGlibmwtZ2VubC5z
by4yLjAuMDwvZGl2PjxkaXY+L3Vzci9saWIvbGlibmwtbmYuc28uMi4wLjA8L2Rpdj48ZGl2Pi91
c3IvbGliL2xpYm5sLXJvdXRlLnNvLjIuMC4wPC9kaXY+PGRpdj4vdXNyL2xpYi9saWJubC5zby4y
LjAuMDwvZGl2PjxkaXY+L3Vzci9saWIvbGlibmwtY2xpLnNvLjI8L2Rpdj48ZGl2PgovdXNyL2xp
Yi9saWJubC1nZW5sLnNvLjI8L2Rpdj48ZGl2Pi91c3IvbGliL2xpYm5sLW5mLnNvLjI8L2Rpdj48
ZGl2Pi91c3IvbGliL2xpYm5sLXJvdXRlLnNvLjI8L2Rpdj48ZGl2Pi91c3IvbGliL2xpYm5sLnNv
LjI8L2Rpdj48ZGl2PnJvb3RAaC1kZXNrdG9wOn4jIGRwa2cgLUwgbGlibmwtMy0yMDA8YnI+PC9k
aXY+PGRpdj4vLjwvZGl2PjxkaXY+L3VzcjwvZGl2PjxkaXY+L3Vzci9zaGFyZTwvZGl2Pgo8ZGl2
Pi91c3Ivc2hhcmUvZG9jPC9kaXY+PGRpdj4vdXNyL3NoYXJlL2RvYy9saWJubC0zLTIwMDwvZGl2
PjxkaXY+L3Vzci9zaGFyZS9kb2MvbGlibmwtMy0yMDAvY29weXJpZ2h0PC9kaXY+PGRpdj4vdXNy
L3NoYXJlL2RvYy9saWJubC0zLTIwMC9SRUFETUUuRGViaWFuPC9kaXY+PGRpdj4vdXNyL3NoYXJl
L2RvYy9saWJubC0zLTIwMC9jaGFuZ2Vsb2cuRGViaWFuLmd6PC9kaXY+PGRpdj4KL2xpYjwvZGl2
PjxkaXY+L2xpYi9saWJubC0zLnNvLjIwMC4zLjA8L2Rpdj48ZGl2Pi9ldGM8L2Rpdj48ZGl2Pi9l
dGMvbGlibmwtMzwvZGl2PjxkaXY+L2V0Yy9saWJubC0zL2NsYXNzaWQ8L2Rpdj48ZGl2Pi9ldGMv
bGlibmwtMy9wa3Rsb2M8L2Rpdj48ZGl2Pi9saWIvbGlibmwtMy5zby4yMDA8L2Rpdj48ZGl2PnJv
b3RAaC1kZXNrdG9wOn4jIHVuYW1lIC1hPC9kaXY+PGRpdj5MaW51eCBoLWRlc2t0b3AgMy4wLjAt
MTItZ2VuZXJpYy1wYWUgIzIwLVVidW50dSBTTVAgRnJpIE9jdCA3IDE2OjM3OjE3IFVUQyAyMDEx
IGk2ODYgaTY4NiBpMzg2IEdOVS9MaW51eDwvZGl2Pgo8L2Rpdj48ZGl2IGNsYXNzPSJnbWFpbF9l
eHRyYSI+PGJyPjxicj48ZGl2IGNsYXNzPSJnbWFpbF9xdW90ZSI+MjAxMi8xMS8xIEF1c3RpbiBa
aGFuZyA8c3BhbiBkaXI9Imx0ciI+Jmx0OzxhIGhyZWY9Im1haWx0bzp6aGFuZy5hdXN0aW5AZ21h
aWwuY29tIiB0YXJnZXQ9Il9ibGFuayI+emhhbmcuYXVzdGluQGdtYWlsLmNvbTwvYT4mZ3Q7PC9z
cGFuPjxicj48YmxvY2txdW90ZSBjbGFzcz0iZ21haWxfcXVvdGUiIHN0eWxlPSJtYXJnaW46MCAw
IDAgLjhleDtib3JkZXItbGVmdDoxcHggI2NjYyBzb2xpZDtwYWRkaW5nLWxlZnQ6MWV4Ij4KdGhh
bmtzIGZvciB5b3VyIHJlcGx5LiBJbiBjYXNlIEkgY29uZnVzZWQgcGVvcGxlLCBJIGxpc3QgaXQg
YXM6PGRpdj48YnI+PC9kaXY+PGRpdj48ZGl2PmF1c3RpbkBhdXN0aW4tU3R1ZGlvOn4kIHVuYW1l
IC1hIKAgoCCgIKAgoCCgIKAgoCCgIKAgoCCgIKAgoCCgIKAgoCCgIKAgoCCgIKAgoCCgIKAgoCCg
IKAgoCCgIKAgoCCgIKAgoCCgIKAgoCCgIKAgoCCgIKAgoCCgIKAgoCCgIKAgoCCgIKCgPC9kaXY+
Cgo8ZGl2PkxpbnV4IGF1c3Rpbi1TdHVkaW8gMy4wLjAtMTUtZ2VuZXJpYyAjMjYtVWJ1bnR1IFNN
UCBGcmkgSmFuIDIwIDE3OjIzOjAwIFVUQyAyMDEyIHg4Nl82NCB4ODZfNjQgeDg2XzY0IEdOVS9M
aW51eDwvZGl2PjxkaXY+YXVzdGluQGF1c3Rpbi1TdHVkaW86fiQgZHBrZyAtTCBsaWJubDIgoCCg
IKAgoCCgIKAgoCCgIKAgoCCgIKAgoCCgIKAgoCCgIKAgoCCgIKAgoCCgIKAgoCCgIKAgoCCgIKAg
oCCgIKAgoCCgIKAgoCCgIKAgoCCgIKAgoCCgIKAgoCCgIKAgoKA8L2Rpdj4KCjxkaXY+Ly48L2Rp
dj48ZGl2Pi91c3I8L2Rpdj48ZGl2Pi91c3Ivc2hhcmU8L2Rpdj48ZGl2Pi91c3Ivc2hhcmUvZG9j
PC9kaXY+PGRpdj4vdXNyL3NoYXJlL2RvYy9saWJubDI8L2Rpdj48ZGl2Pi91c3Ivc2hhcmUvZG9j
L2xpYm5sMi9jb3B5cmlnaHQ8L2Rpdj48ZGl2Pi91c3Ivc2hhcmUvZG9jL2xpYm5sMi9jaGFuZ2Vs
b2cuRGViaWFuLmd6PC9kaXY+PGRpdj4vdXNyL2xpYjwvZGl2PjxkaXY+CgovdXNyL2xpYi9saWJu
bC1jbGkuc28uMi4wLjA8L2Rpdj48ZGl2Pi91c3IvbGliL2xpYm5sLXJvdXRlLnNvLjIuMC4wPC9k
aXY+PGRpdj4vdXNyL2xpYi9saWJubC1nZW5sLnNvLjIuMC4wPC9kaXY+PGRpdj4vdXNyL2xpYi9s
aWJubC1uZi5zby4yLjAuMDwvZGl2PjxkaXY+L3Vzci9saWIvbGlibmwuc28uMi4wLjA8L2Rpdj48
ZGl2Pi91c3IvbGliL2xpYm5sLXJvdXRlLnNvLjI8L2Rpdj48ZGl2PgoKL3Vzci9saWIvbGlibmwt
Y2xpLnNvLjI8L2Rpdj48ZGl2Pi91c3IvbGliL2xpYm5sLWdlbmwuc28uMjwvZGl2PjxkaXY+L3Vz
ci9saWIvbGlibmwuc28uMjwvZGl2PjxkaXY+L3Vzci9saWIvbGlibmwtbmYuc28uMjwvZGl2Pjxk
aXY+YXVzdGluQGF1c3Rpbi1TdHVkaW86fiQgZHBrZyAtTCBsaWJubDMgoCCgIKAgoCCgIKAgoCCg
IKAgoCCgIKAgoCCgIKAgoCCgIKAgoCCgIKAgoCCgIKAgoCCgIKAgoCCgIKAgoCCgIKAgoCCgIKAg
oCCgIKAgoCCgIKAgoCCgIKAgoCCgIKAgoCCgIKAgoDwvZGl2PgoKPGRpdj4vLjwvZGl2PjxkaXY+
L3VzcjwvZGl2PjxkaXY+L3Vzci9zaGFyZTwvZGl2PjxkaXY+L3Vzci9zaGFyZS9kb2M8L2Rpdj48
ZGl2Pi91c3Ivc2hhcmUvZG9jL2xpYm5sMzwvZGl2PjxkaXY+L3Vzci9zaGFyZS9kb2MvbGlibmwz
L1JFQURNRS5EZWJpYW48L2Rpdj48ZGl2Pi91c3Ivc2hhcmUvZG9jL2xpYm5sMy9jb3B5cmlnaHQ8
L2Rpdj48ZGl2Pi91c3Ivc2hhcmUvZG9jL2xpYm5sMy9jaGFuZ2Vsb2cuRGViaWFuLmd6PC9kaXY+
Cgo8ZGl2Pi91c3IvbGliPC9kaXY+PGRpdj4vdXNyL2xpYi9saWJubC1jbGkuc28uMy4wLjA8L2Rp
dj48ZGl2Pi91c3IvbGliL2xpYm5sLWdlbmwuc28uMy4wLjA8L2Rpdj48ZGl2Pi91c3IvbGliL2xp
Ym5sLW5mLnNvLjMuMC4wPC9kaXY+PGRpdj4vdXNyL2xpYi9saWJubC1yb3V0ZS5zby4zLjAuMDwv
ZGl2PjxkaXY+L3Vzci9saWIvbGlibmwuc28uMy4wLjA8L2Rpdj48ZGl2Pi91c3IvbGliL2xpYm5s
LWNsaS5zby4zPC9kaXY+Cgo8ZGl2Pi91c3IvbGliL2xpYm5sLWdlbmwuc28uMzwvZGl2PjxkaXY+
L3Vzci9saWIvbGlibmwtbmYuc28uMzwvZGl2PjxkaXY+L3Vzci9saWIvbGlibmwtcm91dGUuc28u
MzwvZGl2PjxkaXY+L3Vzci9saWIvbGlibmwuc28uMzwvZGl2PjxkaXY+YXVzdGluQGF1c3Rpbi1T
dHVkaW86fiSgPC9kaXY+PC9kaXY+PGRpdiBjbGFzcz0iSE9FblpiIj48ZGl2IGNsYXNzPSJoNSI+
PGRpdiBjbGFzcz0iZ21haWxfZXh0cmEiPgo8YnI+PGJyPjxkaXYgY2xhc3M9ImdtYWlsX3F1b3Rl
Ij4KMjAxMi8xMC8zMSBBcmphbiB2YW4gZGUgVmVuIDxzcGFuIGRpcj0ibHRyIj4mbHQ7PGEgaHJl
Zj0ibWFpbHRvOmFyamFuQGxpbnV4LmludGVsLmNvbSIgdGFyZ2V0PSJfYmxhbmsiPmFyamFuQGxp
bnV4LmludGVsLmNvbTwvYT4mZ3Q7PC9zcGFuPjxicj48YmxvY2txdW90ZSBjbGFzcz0iZ21haWxf
cXVvdGUiIHN0eWxlPSJtYXJnaW46MCAwIDAgLjhleDtib3JkZXItbGVmdDoxcHggI2NjYyBzb2xp
ZDtwYWRkaW5nLWxlZnQ6MWV4Ij4KCjxkaXY+T24gMTAvMzEvMjAxMiA3OjExIEFNLCBBdXN0aW4g
Wmhhbmcgd3JvdGU6PGJyPgomZ3Q7IEhpLDxicj4KJmd0Ozxicj4KJmd0OyBJIGFtIHRyeWluZyB0
byBjb21waWxlIHBvd2VydG9wIG9uIG15IGJveDogdWJ1bnR1IDEyLjA0LCBYODYtNjQuPGJyPgom
Z3Q7PGJyPgomZ3Q7ICgxKWNvbXBpbGluZyBpc3N1ZTxicj4KJmd0Ozxicj4KJmd0OyBIZXJlLCBt
eSBzeXN0ZW0gZGlkbpJ0IGluc3RhbGwgbGlibmwtMSwgYnV0IEkgaW5zdGFsbGVkIGxpYm5sMiAo
dW5kZXIgL3Vzci9saWIpIGFuZCBsaWJubC0zICh1bmRlciAvbGliKS48YnI+Cjxicj4KPGJyPgo8
L2Rpdj5vbiBhIDY0IGJpdCBzeXN0ZW0sIHRoYXQgc2hvdWxkIGhhdmUgYmVlbiAvdXNyL2xpYjY0
IGFuZCCgL2xpYjY0PGJyPgpvdGhlcndpc2UgeW91IGdvdCAzMiBiaXQgbGlicmFyaWVzIDstKTxi
cj4KPGJyPgo8L2Jsb2NrcXVvdGU+PC9kaXY+PGJyPjwvZGl2Pgo8L2Rpdj48L2Rpdj48L2Jsb2Nr
cXVvdGU+PC9kaXY+PGJyPjwvZGl2Pgo=

--===============1310020083451128429==--

