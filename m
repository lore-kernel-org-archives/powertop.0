Content-Type: multipart/mixed; boundary="===============7395806753686252889=="
MIME-Version: 1.0
From: Nathan Van Ymeren <nathan.vany at gmail.com>
Subject: Re: [Powertop] Bug under Fedora 19 x86_64: Requesting Unregistered
 Parameters 63 and 58
Date: Wed, 03 Jul 2013 11:47:47 -0700
Message-ID: <CAEKyVWMGL4AqhxTKYFsaxr3K8WO3zMAXxtRTyaf8EOhgSMi_9Q@mail.gmail.com>
In-Reply-To: 20130703115526.GB2225@swordfish
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============7395806753686252889==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Sergey,

Here are the listings of those directories

http://pastebin.com/wJdxSN5B


On Wed, Jul 3, 2013 at 4:55 AM, Sergey Senozhatsky <
sergey.senozhatsky(a)gmail.com> wrote:

> On (07/02/13 23:12), Nathan Van Ymeren wrote:
> >    Hi folks,
> >    I recently upgraded to Fedora 19 and noticed my thinkpad was running=
 a
> >    little hotter than usual. =EF=BF=BDTried to open powertop and instea=
d of the
> >    familiar menu I was greeted with endless spam of the same two lines,
> >    repeated:
> >    BUG: requesting unregistered parameter 58
> >    BUG: requesting unregistered parameter 63
> >    Running with --debug had no discernible effect. =EF=BF=BDDoes powert=
op leave
> a log
> >    file anywhere for investigation?
> >    N
>
> Hello,
>
> /** sorry, broken mail headers in previous email*/
>
>
> could you please show content of
>
>         /sys/devices/platform/thinkpad_hwmon/
> and
>         /sys/devices/platform/thinkpad_acpi/leds/
>
>
>         -ss
>

--===============7395806753686252889==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PGRpdiBkaXI9Imx0ciI+SGkgU2VyZ2V5LDxkaXY+PGJyPjwvZGl2PjxkaXY+SGVyZSBhcmUgdGhl
IGxpc3RpbmdzIG9mIHRob3NlIGRpcmVjdG9yaWVzIMKgPC9kaXY+PGRpdj48YnI+PC9kaXY+PGRp
dj48YSBocmVmPSJodHRwOi8vcGFzdGViaW4uY29tL3dKZHhTTjVCIj5odHRwOi8vcGFzdGViaW4u
Y29tL3dKZHhTTjVCPC9hPjwvZGl2PjwvZGl2PjxkaXYgY2xhc3M9ImdtYWlsX2V4dHJhIj4KPGJy
Pjxicj48ZGl2IGNsYXNzPSJnbWFpbF9xdW90ZSI+T24gV2VkLCBKdWwgMywgMjAxMyBhdCA0OjU1
IEFNLCBTZXJnZXkgU2Vub3poYXRza3kgPHNwYW4gZGlyPSJsdHIiPiZsdDs8YSBocmVmPSJtYWls
dG86c2VyZ2V5LnNlbm96aGF0c2t5QGdtYWlsLmNvbSIgdGFyZ2V0PSJfYmxhbmsiPnNlcmdleS5z
ZW5vemhhdHNreUBnbWFpbC5jb208L2E+Jmd0Ozwvc3Bhbj4gd3JvdGU6PGJyPjxibG9ja3F1b3Rl
IGNsYXNzPSJnbWFpbF9xdW90ZSIgc3R5bGU9Im1hcmdpbjowIDAgMCAuOGV4O2JvcmRlci1sZWZ0
OjFweCAjY2NjIHNvbGlkO3BhZGRpbmctbGVmdDoxZXgiPgo8ZGl2IGNsYXNzPSJIT0VuWmIiPjxk
aXYgY2xhc3M9Img1Ij5PbiAoMDcvMDIvMTMgMjM6MTIpLCBOYXRoYW4gVmFuIFltZXJlbiB3cm90
ZTo8YnI+CiZndDsgwqAgwqBIaSBmb2xrcyw8YnI+CiZndDsgwqAgwqBJIHJlY2VudGx5IHVwZ3Jh
ZGVkIHRvIEZlZG9yYSAxOSBhbmQgbm90aWNlZCBteSB0aGlua3BhZCB3YXMgcnVubmluZyBhPGJy
PgomZ3Q7IMKgIMKgbGl0dGxlIGhvdHRlciB0aGFuIHVzdWFsLiDvv71UcmllZCB0byBvcGVuIHBv
d2VydG9wIGFuZCBpbnN0ZWFkIG9mIHRoZTxicj4KJmd0OyDCoCDCoGZhbWlsaWFyIG1lbnUgSSB3
YXMgZ3JlZXRlZCB3aXRoIGVuZGxlc3Mgc3BhbSBvZiB0aGUgc2FtZSB0d28gbGluZXMsPGJyPgom
Z3Q7IMKgIMKgcmVwZWF0ZWQ6PGJyPgomZ3Q7IMKgIMKgQlVHOiByZXF1ZXN0aW5nIHVucmVnaXN0
ZXJlZCBwYXJhbWV0ZXIgNTg8YnI+CiZndDsgwqAgwqBCVUc6IHJlcXVlc3RpbmcgdW5yZWdpc3Rl
cmVkIHBhcmFtZXRlciA2Mzxicj4KJmd0OyDCoCDCoFJ1bm5pbmcgd2l0aCAtLWRlYnVnIGhhZCBu
byBkaXNjZXJuaWJsZSBlZmZlY3QuIO+/vURvZXMgcG93ZXJ0b3AgbGVhdmUgYSBsb2c8YnI+CiZn
dDsgwqAgwqBmaWxlIGFueXdoZXJlIGZvciBpbnZlc3RpZ2F0aW9uPzxicj4KJmd0OyDCoCDCoE48
YnI+Cjxicj4KPC9kaXY+PC9kaXY+SGVsbG8sPGJyPgo8YnI+Ci8qKiBzb3JyeSwgYnJva2VuIG1h
aWwgaGVhZGVycyBpbiBwcmV2aW91cyBlbWFpbCovPGJyPgo8YnI+Cjxicj4KY291bGQgeW91IHBs
ZWFzZSBzaG93IGNvbnRlbnQgb2Y8YnI+Cjxicj4KwqAgwqAgwqAgwqAgL3N5cy9kZXZpY2VzL3Bs
YXRmb3JtL3RoaW5rcGFkX2h3bW9uLzxicj4KYW5kPGJyPgrCoCDCoCDCoCDCoCAvc3lzL2Rldmlj
ZXMvcGxhdGZvcm0vdGhpbmtwYWRfYWNwaS9sZWRzLzxicj4KPHNwYW4gY2xhc3M9IkhPRW5aYiI+
PGZvbnQgY29sb3I9IiM4ODg4ODgiPjxicj4KPGJyPgrCoCDCoCDCoCDCoCAtc3M8YnI+CjwvZm9u
dD48L3NwYW4+PC9ibG9ja3F1b3RlPjwvZGl2Pjxicj48L2Rpdj4K

--===============7395806753686252889==--

