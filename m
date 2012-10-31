Content-Type: multipart/mixed; boundary="===============2708105551823045612=="
MIME-Version: 1.0
From: Austin Zhang <zhang.austin at gmail.com>
Subject: Re: [Powertop] [Powertop ]compiling issue and running issue
Date: Thu, 01 Nov 2012 00:31:14 +0800
Message-ID: <CAGLu0vNEhARzERKxyhQ83sz6LiKs4ME=7JgRcxAZZGDHg70W8g@mail.gmail.com>
In-Reply-To: CAGLu0vNHMPJaZj+e-P9Hw8JjhGXvfR=zh7ybgWO3R-c4o1VLRA@mail.gmail.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============2708105551823045612==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

>In another box with i686 installed, it also encounted into similar issue
(cannot link against libnl2)
Sorry for above mistake, what I means is : 'cannot finish ./configure when
I just have nl2', not 'cannot link against  libnl2', if have manually hack
to get that Makefile, it can compile and link against nl2 as the 1st
message description.

thanks.


2012/11/1 Austin Zhang <zhang.austin(a)gmail.com>

> In another box with i686 installed, it also encounted into similar issue
> (cannot link against libnl2)
>
> root(a)h-desktop:~# dpkg -L libnl2
>
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
> /usr/lib/libnl-genl.so.2.0.0
> /usr/lib/libnl-nf.so.2.0.0
> /usr/lib/libnl-route.so.2.0.0
> /usr/lib/libnl.so.2.0.0
> /usr/lib/libnl-cli.so.2
> /usr/lib/libnl-genl.so.2
> /usr/lib/libnl-nf.so.2
> /usr/lib/libnl-route.so.2
> /usr/lib/libnl.so.2
> root(a)h-desktop:~# dpkg -L libnl-3-200
> /.
> /usr
> /usr/share
> /usr/share/doc
> /usr/share/doc/libnl-3-200
> /usr/share/doc/libnl-3-200/copyright
> /usr/share/doc/libnl-3-200/README.Debian
> /usr/share/doc/libnl-3-200/changelog.Debian.gz
> /lib
> /lib/libnl-3.so.200.3.0
> /etc
> /etc/libnl-3
> /etc/libnl-3/classid
> /etc/libnl-3/pktloc
> /lib/libnl-3.so.200
> root(a)h-desktop:~# uname -a
> Linux h-desktop 3.0.0-12-generic-pae #20-Ubuntu SMP Fri Oct 7 16:37:17 UTC
> 2011 i686 i686 i386 GNU/Linux
>
>
> 2012/11/1 Austin Zhang <zhang.austin(a)gmail.com>
>
>> thanks for your reply. In case I confused people, I list it as:
>>
>> austin(a)austin-Studio:~$ uname -a
>>
>> Linux austin-Studio 3.0.0-15-generic #26-Ubuntu SMP Fri Jan 20 17:23:00
>> UTC 2012 x86_64 x86_64 x86_64 GNU/Linux
>> austin(a)austin-Studio:~$ dpkg -L libnl2
>>
>> /.
>> /usr
>> /usr/share
>> /usr/share/doc
>> /usr/share/doc/libnl2
>> /usr/share/doc/libnl2/copyright
>> /usr/share/doc/libnl2/changelog.Debian.gz
>> /usr/lib
>> /usr/lib/libnl-cli.so.2.0.0
>> /usr/lib/libnl-route.so.2.0.0
>> /usr/lib/libnl-genl.so.2.0.0
>> /usr/lib/libnl-nf.so.2.0.0
>> /usr/lib/libnl.so.2.0.0
>> /usr/lib/libnl-route.so.2
>> /usr/lib/libnl-cli.so.2
>> /usr/lib/libnl-genl.so.2
>> /usr/lib/libnl.so.2
>> /usr/lib/libnl-nf.so.2
>> austin(a)austin-Studio:~$ dpkg -L libnl3
>>
>> /.
>> /usr
>> /usr/share
>> /usr/share/doc
>> /usr/share/doc/libnl3
>> /usr/share/doc/libnl3/README.Debian
>> /usr/share/doc/libnl3/copyright
>> /usr/share/doc/libnl3/changelog.Debian.gz
>> /usr/lib
>> /usr/lib/libnl-cli.so.3.0.0
>> /usr/lib/libnl-genl.so.3.0.0
>> /usr/lib/libnl-nf.so.3.0.0
>> /usr/lib/libnl-route.so.3.0.0
>> /usr/lib/libnl.so.3.0.0
>> /usr/lib/libnl-cli.so.3
>> /usr/lib/libnl-genl.so.3
>> /usr/lib/libnl-nf.so.3
>> /usr/lib/libnl-route.so.3
>> /usr/lib/libnl.so.3
>> austin(a)austin-Studio:~$
>>
>>
>> 2012/10/31 Arjan van de Ven <arjan(a)linux.intel.com>
>>
>>> On 10/31/2012 7:11 AM, Austin Zhang wrote:
>>> > Hi,
>>> >
>>> > I am trying to compile powertop on my box: ubuntu 12.04, X86-64.
>>> >
>>> > (1)compiling issue
>>> >
>>> > Here, my system didn=E2=80=99t install libnl-1, but I installed libnl=
2 (under
>>> /usr/lib) and libnl-3 (under /lib).
>>>
>>>
>>> on a 64 bit system, that should have been /usr/lib64 and  /lib64
>>> otherwise you got 32 bit libraries ;-)
>>>
>>>
>>
>

--===============2708105551823045612==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PHNwYW4gc3R5bGU9ImZvbnQtZmFtaWx5OmFyaWFsLHNhbnMtc2VyaWY7Zm9udC1zaXplOjE0cHgi
PiZndDtJbiBhbm90aGVyIGJveCB3aXRoIGk2ODYgaW5zdGFsbGVkLCBpdCBhbHNvIGVuY291bnRl
ZCBpbnRvIHNpbWlsYXIgaXNzdWUgKGNhbm5vdCBsaW5rIGFnYWluc3QgbGlibmwyKTwvc3Bhbj48
YnI+PGRpdj48c3BhbiBzdHlsZT0iZm9udC1mYW1pbHk6YXJpYWwsc2Fucy1zZXJpZjtmb250LXNp
emU6MTRweCI+U29ycnkgZm9yIGFib3ZlIG1pc3Rha2UsIHdoYXQgSSBtZWFucyBpcyA6ICYjMzk7
Y2Fubm90IGZpbmlzaCAuL2NvbmZpZ3VyZSB3aGVuIEkganVzdCBoYXZlIG5sMiYjMzk7LCBub3Qg
JiMzOTtjYW5ub3QgbGluayBhZ2FpbnN0IKBsaWJubDImIzM5OywgaWYgaGF2ZSBtYW51YWxseSBo
YWNrIHRvIGdldCB0aGF0IE1ha2VmaWxlLCBpdCBjYW4gY29tcGlsZSBhbmQgbGluayBhZ2FpbnN0
IG5sMiBhcyB0aGUgMXN0IG1lc3NhZ2UgZGVzY3JpcHRpb24uoDwvc3Bhbj48L2Rpdj4KPGRpdj48
c3BhbiBzdHlsZT0iZm9udC1mYW1pbHk6YXJpYWwsc2Fucy1zZXJpZjtmb250LXNpemU6MTRweCI+
PGJyPjwvc3Bhbj48L2Rpdj48ZGl2Pjxmb250IGZhY2U9ImFyaWFsLCBzYW5zLXNlcmlmIj48c3Bh
biBzdHlsZT0iZm9udC1zaXplOjE0cHgiPnRoYW5rcy6gPC9zcGFuPjwvZm9udD48L2Rpdj48ZGl2
IGNsYXNzPSJnbWFpbF9leHRyYSI+PGJyPjxicj48ZGl2IGNsYXNzPSJnbWFpbF9xdW90ZSI+CjIw
MTIvMTEvMSBBdXN0aW4gWmhhbmcgPHNwYW4gZGlyPSJsdHIiPiZsdDs8YSBocmVmPSJtYWlsdG86
emhhbmcuYXVzdGluQGdtYWlsLmNvbSIgdGFyZ2V0PSJfYmxhbmsiPnpoYW5nLmF1c3RpbkBnbWFp
bC5jb208L2E+Jmd0Ozwvc3Bhbj48YnI+PGJsb2NrcXVvdGUgY2xhc3M9ImdtYWlsX3F1b3RlIiBz
dHlsZT0ibWFyZ2luOjAgMCAwIC44ZXg7Ym9yZGVyLWxlZnQ6MXB4ICNjY2Mgc29saWQ7cGFkZGlu
Zy1sZWZ0OjFleCI+CkluIGFub3RoZXIgYm94IHdpdGggaTY4NiBpbnN0YWxsZWQsIGl0IGFsc28g
ZW5jb3VudGVkIGludG8gc2ltaWxhciBpc3N1ZSAoY2Fubm90IGxpbmsgYWdhaW5zdCBsaWJubDIp
PGRpdj48YnI+PC9kaXY+PGRpdj48ZGl2PnJvb3RAaC1kZXNrdG9wOn4jIGRwa2cgLUwgbGlibmwy
IKAgoCCgIKAgoCCgIKAgoCCgIKAgoCCgIKAgoCCgIKAgoCCgIKAgoCCgIKAgoCCgIKAgoCCgIKAg
oCCgIKAgoCCgIKAgoCCgIKAgoCCgIKAgoCCgIKAgoCCgIKAgoCCgIKAgoCCgIKAgoCCgIKAgoCCg
IKAgoCCgoDwvZGl2Pgo8ZGl2IGNsYXNzPSJpbSI+CjxkaXY+Ly48L2Rpdj48ZGl2Pi91c3I8L2Rp
dj48ZGl2Pi91c3Ivc2hhcmU8L2Rpdj48ZGl2Pi91c3Ivc2hhcmUvZG9jPC9kaXY+PGRpdj4vdXNy
L3NoYXJlL2RvYy9saWJubDI8L2Rpdj48ZGl2Pi91c3Ivc2hhcmUvZG9jL2xpYm5sMi9jb3B5cmln
aHQ8L2Rpdj48ZGl2Pi91c3Ivc2hhcmUvZG9jL2xpYm5sMi9jaGFuZ2Vsb2cuRGViaWFuLmd6PC9k
aXY+PGRpdj4vdXNyL2xpYjwvZGl2PjxkaXY+CgovdXNyL2xpYi9saWJubC1jbGkuc28uMi4wLjA8
L2Rpdj48L2Rpdj48ZGl2Pi91c3IvbGliL2xpYm5sLWdlbmwuc28uMi4wLjA8L2Rpdj48ZGl2Pi91
c3IvbGliL2xpYm5sLW5mLnNvLjIuMC4wPC9kaXY+PGRpdj4vdXNyL2xpYi9saWJubC1yb3V0ZS5z
by4yLjAuMDwvZGl2PjxkaXY+L3Vzci9saWIvbGlibmwuc28uMi4wLjA8L2Rpdj48ZGl2Pi91c3Iv
bGliL2xpYm5sLWNsaS5zby4yPC9kaXY+CjxkaXY+Ci91c3IvbGliL2xpYm5sLWdlbmwuc28uMjwv
ZGl2PjxkaXY+L3Vzci9saWIvbGlibmwtbmYuc28uMjwvZGl2PjxkaXY+L3Vzci9saWIvbGlibmwt
cm91dGUuc28uMjwvZGl2PjxkaXY+L3Vzci9saWIvbGlibmwuc28uMjwvZGl2PjxkaXY+cm9vdEBo
LWRlc2t0b3A6fiMgZHBrZyAtTCBsaWJubC0zLTIwMDxicj48L2Rpdj48ZGl2Pi8uPC9kaXY+PGRp
dj4vdXNyPC9kaXY+PGRpdj4vdXNyL3NoYXJlPC9kaXY+Cgo8ZGl2Pi91c3Ivc2hhcmUvZG9jPC9k
aXY+PGRpdj4vdXNyL3NoYXJlL2RvYy9saWJubC0zLTIwMDwvZGl2PjxkaXY+L3Vzci9zaGFyZS9k
b2MvbGlibmwtMy0yMDAvY29weXJpZ2h0PC9kaXY+PGRpdj4vdXNyL3NoYXJlL2RvYy9saWJubC0z
LTIwMC9SRUFETUUuRGViaWFuPC9kaXY+PGRpdj4vdXNyL3NoYXJlL2RvYy9saWJubC0zLTIwMC9j
aGFuZ2Vsb2cuRGViaWFuLmd6PC9kaXY+PGRpdj4KCi9saWI8L2Rpdj48ZGl2Pi9saWIvbGlibmwt
My5zby4yMDAuMy4wPC9kaXY+PGRpdj4vZXRjPC9kaXY+PGRpdj4vZXRjL2xpYm5sLTM8L2Rpdj48
ZGl2Pi9ldGMvbGlibmwtMy9jbGFzc2lkPC9kaXY+PGRpdj4vZXRjL2xpYm5sLTMvcGt0bG9jPC9k
aXY+PGRpdj4vbGliL2xpYm5sLTMuc28uMjAwPC9kaXY+PGRpdj5yb290QGgtZGVza3RvcDp+IyB1
bmFtZSAtYTwvZGl2PjxkaXY+TGludXggaC1kZXNrdG9wIDMuMC4wLTEyLWdlbmVyaWMtcGFlICMy
MC1VYnVudHUgU01QIEZyaSBPY3QgNyAxNjozNzoxNyBVVEMgMjAxMSBpNjg2IGk2ODYgaTM4NiBH
TlUvTGludXg8L2Rpdj4KCjwvZGl2PjxkaXYgY2xhc3M9IkhPRW5aYiI+PGRpdiBjbGFzcz0iaDUi
PjxkaXYgY2xhc3M9ImdtYWlsX2V4dHJhIj48YnI+PGJyPjxkaXYgY2xhc3M9ImdtYWlsX3F1b3Rl
Ij4yMDEyLzExLzEgQXVzdGluIFpoYW5nIDxzcGFuIGRpcj0ibHRyIj4mbHQ7PGEgaHJlZj0ibWFp
bHRvOnpoYW5nLmF1c3RpbkBnbWFpbC5jb20iIHRhcmdldD0iX2JsYW5rIj56aGFuZy5hdXN0aW5A
Z21haWwuY29tPC9hPiZndDs8L3NwYW4+PGJyPgo8YmxvY2txdW90ZSBjbGFzcz0iZ21haWxfcXVv
dGUiIHN0eWxlPSJtYXJnaW46MCAwIDAgLjhleDtib3JkZXItbGVmdDoxcHggI2NjYyBzb2xpZDtw
YWRkaW5nLWxlZnQ6MWV4Ij4KdGhhbmtzIGZvciB5b3VyIHJlcGx5LiBJbiBjYXNlIEkgY29uZnVz
ZWQgcGVvcGxlLCBJIGxpc3QgaXQgYXM6PGRpdj48YnI+PC9kaXY+PGRpdj48ZGl2PmF1c3RpbkBh
dXN0aW4tU3R1ZGlvOn4kIHVuYW1lIC1hIKAgoCCgIKAgoCCgIKAgoCCgIKAgoCCgIKAgoCCgIKAg
oCCgIKAgoCCgIKAgoCCgIKAgoCCgIKAgoCCgIKAgoCCgIKAgoCCgIKAgoCCgIKAgoCCgIKAgoCCg
IKAgoCCgIKAgoCCgIKCgPC9kaXY+CgoKPGRpdj5MaW51eCBhdXN0aW4tU3R1ZGlvIDMuMC4wLTE1
LWdlbmVyaWMgIzI2LVVidW50dSBTTVAgRnJpIEphbiAyMCAxNzoyMzowMCBVVEMgMjAxMiB4ODZf
NjQgeDg2XzY0IHg4Nl82NCBHTlUvTGludXg8L2Rpdj48ZGl2PmF1c3RpbkBhdXN0aW4tU3R1ZGlv
On4kIGRwa2cgLUwgbGlibmwyIKAgoCCgIKAgoCCgIKAgoCCgIKAgoCCgIKAgoCCgIKAgoCCgIKAg
oCCgIKAgoCCgIKAgoCCgIKAgoCCgIKAgoCCgIKAgoCCgIKAgoCCgIKAgoCCgIKAgoCCgIKAgoCCg
IKCgPC9kaXY+CgoKPGRpdj4vLjwvZGl2PjxkaXY+L3VzcjwvZGl2PjxkaXY+L3Vzci9zaGFyZTwv
ZGl2PjxkaXY+L3Vzci9zaGFyZS9kb2M8L2Rpdj48ZGl2Pi91c3Ivc2hhcmUvZG9jL2xpYm5sMjwv
ZGl2PjxkaXY+L3Vzci9zaGFyZS9kb2MvbGlibmwyL2NvcHlyaWdodDwvZGl2PjxkaXY+L3Vzci9z
aGFyZS9kb2MvbGlibmwyL2NoYW5nZWxvZy5EZWJpYW4uZ3o8L2Rpdj48ZGl2Pi91c3IvbGliPC9k
aXY+PGRpdj4KCgovdXNyL2xpYi9saWJubC1jbGkuc28uMi4wLjA8L2Rpdj48ZGl2Pi91c3IvbGli
L2xpYm5sLXJvdXRlLnNvLjIuMC4wPC9kaXY+PGRpdj4vdXNyL2xpYi9saWJubC1nZW5sLnNvLjIu
MC4wPC9kaXY+PGRpdj4vdXNyL2xpYi9saWJubC1uZi5zby4yLjAuMDwvZGl2PjxkaXY+L3Vzci9s
aWIvbGlibmwuc28uMi4wLjA8L2Rpdj48ZGl2Pi91c3IvbGliL2xpYm5sLXJvdXRlLnNvLjI8L2Rp
dj48ZGl2PgoKCi91c3IvbGliL2xpYm5sLWNsaS5zby4yPC9kaXY+PGRpdj4vdXNyL2xpYi9saWJu
bC1nZW5sLnNvLjI8L2Rpdj48ZGl2Pi91c3IvbGliL2xpYm5sLnNvLjI8L2Rpdj48ZGl2Pi91c3Iv
bGliL2xpYm5sLW5mLnNvLjI8L2Rpdj48ZGl2PmF1c3RpbkBhdXN0aW4tU3R1ZGlvOn4kIGRwa2cg
LUwgbGlibmwzIKAgoCCgIKAgoCCgIKAgoCCgIKAgoCCgIKAgoCCgIKAgoCCgIKAgoCCgIKAgoCCg
IKAgoCCgIKAgoCCgIKAgoCCgIKAgoCCgIKAgoCCgIKAgoCCgIKAgoCCgIKAgoCCgIKAgoCCgIKA8
L2Rpdj4KCgo8ZGl2Pi8uPC9kaXY+PGRpdj4vdXNyPC9kaXY+PGRpdj4vdXNyL3NoYXJlPC9kaXY+
PGRpdj4vdXNyL3NoYXJlL2RvYzwvZGl2PjxkaXY+L3Vzci9zaGFyZS9kb2MvbGlibmwzPC9kaXY+
PGRpdj4vdXNyL3NoYXJlL2RvYy9saWJubDMvUkVBRE1FLkRlYmlhbjwvZGl2PjxkaXY+L3Vzci9z
aGFyZS9kb2MvbGlibmwzL2NvcHlyaWdodDwvZGl2PjxkaXY+L3Vzci9zaGFyZS9kb2MvbGlibmwz
L2NoYW5nZWxvZy5EZWJpYW4uZ3o8L2Rpdj4KCgo8ZGl2Pi91c3IvbGliPC9kaXY+PGRpdj4vdXNy
L2xpYi9saWJubC1jbGkuc28uMy4wLjA8L2Rpdj48ZGl2Pi91c3IvbGliL2xpYm5sLWdlbmwuc28u
My4wLjA8L2Rpdj48ZGl2Pi91c3IvbGliL2xpYm5sLW5mLnNvLjMuMC4wPC9kaXY+PGRpdj4vdXNy
L2xpYi9saWJubC1yb3V0ZS5zby4zLjAuMDwvZGl2PjxkaXY+L3Vzci9saWIvbGlibmwuc28uMy4w
LjA8L2Rpdj48ZGl2Pi91c3IvbGliL2xpYm5sLWNsaS5zby4zPC9kaXY+CgoKPGRpdj4vdXNyL2xp
Yi9saWJubC1nZW5sLnNvLjM8L2Rpdj48ZGl2Pi91c3IvbGliL2xpYm5sLW5mLnNvLjM8L2Rpdj48
ZGl2Pi91c3IvbGliL2xpYm5sLXJvdXRlLnNvLjM8L2Rpdj48ZGl2Pi91c3IvbGliL2xpYm5sLnNv
LjM8L2Rpdj48ZGl2PmF1c3RpbkBhdXN0aW4tU3R1ZGlvOn4koDwvZGl2PjwvZGl2PjxkaXY+PGRp
dj48ZGl2IGNsYXNzPSJnbWFpbF9leHRyYSI+Cjxicj48YnI+PGRpdiBjbGFzcz0iZ21haWxfcXVv
dGUiPgoyMDEyLzEwLzMxIEFyamFuIHZhbiBkZSBWZW4gPHNwYW4gZGlyPSJsdHIiPiZsdDs8YSBo
cmVmPSJtYWlsdG86YXJqYW5AbGludXguaW50ZWwuY29tIiB0YXJnZXQ9Il9ibGFuayI+YXJqYW5A
bGludXguaW50ZWwuY29tPC9hPiZndDs8L3NwYW4+PGJyPjxibG9ja3F1b3RlIGNsYXNzPSJnbWFp
bF9xdW90ZSIgc3R5bGU9Im1hcmdpbjowIDAgMCAuOGV4O2JvcmRlci1sZWZ0OjFweCAjY2NjIHNv
bGlkO3BhZGRpbmctbGVmdDoxZXgiPgoKCjxkaXY+T24gMTAvMzEvMjAxMiA3OjExIEFNLCBBdXN0
aW4gWmhhbmcgd3JvdGU6PGJyPgomZ3Q7IEhpLDxicj4KJmd0Ozxicj4KJmd0OyBJIGFtIHRyeWlu
ZyB0byBjb21waWxlIHBvd2VydG9wIG9uIG15IGJveDogdWJ1bnR1IDEyLjA0LCBYODYtNjQuPGJy
PgomZ3Q7PGJyPgomZ3Q7ICgxKWNvbXBpbGluZyBpc3N1ZTxicj4KJmd0Ozxicj4KJmd0OyBIZXJl
LCBteSBzeXN0ZW0gZGlkbpJ0IGluc3RhbGwgbGlibmwtMSwgYnV0IEkgaW5zdGFsbGVkIGxpYm5s
MiAodW5kZXIgL3Vzci9saWIpIGFuZCBsaWJubC0zICh1bmRlciAvbGliKS48YnI+Cjxicj4KPGJy
Pgo8L2Rpdj5vbiBhIDY0IGJpdCBzeXN0ZW0sIHRoYXQgc2hvdWxkIGhhdmUgYmVlbiAvdXNyL2xp
YjY0IGFuZCCgL2xpYjY0PGJyPgpvdGhlcndpc2UgeW91IGdvdCAzMiBiaXQgbGlicmFyaWVzIDst
KTxicj4KPGJyPgo8L2Jsb2NrcXVvdGU+PC9kaXY+PGJyPjwvZGl2Pgo8L2Rpdj48L2Rpdj48L2Js
b2NrcXVvdGU+PC9kaXY+PGJyPjwvZGl2Pgo8L2Rpdj48L2Rpdj48L2Jsb2NrcXVvdGU+PC9kaXY+
PGJyPjwvZGl2Pgo=

--===============2708105551823045612==--

