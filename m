Content-Type: multipart/mixed; boundary="===============0309075085274762491=="
MIME-Version: 1.0
From: Yaroslav Isakov <yaroslav.isakov at gmail.com>
Subject: Re: [Powertop] [PATCH 1/2] Detect all audio cards in the system (not
 only card0)
Date: Sun, 28 Feb 2016 08:45:08 +0300
Message-ID: <CADS+iDUS_zp8yxSCCHqyUiBD8ovsj5GWZSk2qjc5W_y6_CyA6g@mail.gmail.com>
In-Reply-To: 20160225065811.GA4313@noemi
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============0309075085274762491==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Sorry for this, here it is

2016-02-25 9:58 GMT+03:00 Magnus Fromreide <magfr(a)lysator.liu.se>:

> On Mon, Feb 22, 2016 at 05:27:01PM +0300, Yaroslav Isakov wrote:
> >  src/devices/alsa.cpp | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> >
> > diff --git a/src/devices/alsa.cpp b/src/devices/alsa.cpp
> > index 425b58a..f7ba2b6 100644
> > --- a/src/devices/alsa.cpp
> > +++ b/src/devices/alsa.cpp
> > @@ -158,11 +158,11 @@ static void create_all_alsa_callback(const char
> > *d_name)
> >      if (strncmp(d_name, "hwC", 3) !=3D 0)
> >          return;
> >
> > -    snprintf(filename, sizeof(filename),
> > "/sys/class/sound/card0/%s/power_on_acct", d_name);
> > +    snprintf(filename, sizeof(filename),
> > "/sys/class/sound/%s/power_on_acct", d_name);
>
> It looks like your mailer helpfully linewraps the patch. Could you please
> resend it as an attachment?
>
> /MF
>

--===============0309075085274762491==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PGRpdiBkaXI9Imx0ciI+U29ycnkgZm9yIHRoaXMsIGhlcmUgaXQgaXM8YnI+PC9kaXY+PGRpdiBj
bGFzcz0iZ21haWxfZXh0cmEiPjxicj48ZGl2IGNsYXNzPSJnbWFpbF9xdW90ZSI+MjAxNi0wMi0y
NSA5OjU4IEdNVCswMzowMCBNYWdudXMgRnJvbXJlaWRlIDxzcGFuIGRpcj0ibHRyIj4mbHQ7PGEg
aHJlZj0ibWFpbHRvOm1hZ2ZyQGx5c2F0b3IubGl1LnNlIiB0YXJnZXQ9Il9ibGFuayI+bWFnZnJA
bHlzYXRvci5saXUuc2U8L2E+Jmd0Ozwvc3Bhbj46PGJyPjxibG9ja3F1b3RlIGNsYXNzPSJnbWFp
bF9xdW90ZSIgc3R5bGU9Im1hcmdpbjowIDAgMCAuOGV4O2JvcmRlci1sZWZ0OjFweCAjY2NjIHNv
bGlkO3BhZGRpbmctbGVmdDoxZXgiPjxzcGFuIGNsYXNzPSIiPk9uIE1vbiwgRmViIDIyLCAyMDE2
IGF0IDA1OjI3OjAxUE0gKzAzMDAsIFlhcm9zbGF2IElzYWtvdiB3cm90ZTo8YnI+CiZndDvCoCBz
cmMvZGV2aWNlcy9hbHNhLmNwcCB8IDYgKysrLS0tPGJyPgomZ3Q7wqAgMSBmaWxlIGNoYW5nZWQs
IDMgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSk8YnI+CiZndDs8YnI+CiZndDsgZGlmZiAt
LWdpdCBhL3NyYy9kZXZpY2VzL2Fsc2EuY3BwIGIvc3JjL2RldmljZXMvYWxzYS5jcHA8YnI+CiZn
dDsgaW5kZXggNDI1YjU4YS4uZjdiYTJiNiAxMDA2NDQ8YnI+CiZndDsgLS0tIGEvc3JjL2Rldmlj
ZXMvYWxzYS5jcHA8YnI+CiZndDsgKysrIGIvc3JjL2RldmljZXMvYWxzYS5jcHA8YnI+CiZndDsg
QEAgLTE1OCwxMSArMTU4LDExIEBAIHN0YXRpYyB2b2lkIGNyZWF0ZV9hbGxfYWxzYV9jYWxsYmFj
ayhjb25zdCBjaGFyPGJyPgomZ3Q7ICpkX25hbWUpPGJyPgomZ3Q7wqAgwqAgwqAgaWYgKHN0cm5j
bXAoZF9uYW1lLCAmcXVvdDtod0MmcXVvdDssIDMpICE9IDApPGJyPgomZ3Q7wqAgwqAgwqAgwqAg
wqAgcmV0dXJuOzxicj4KJmd0Ozxicj4KJmd0OyAtwqAgwqAgc25wcmludGYoZmlsZW5hbWUsIHNp
emVvZihmaWxlbmFtZSksPGJyPgomZ3Q7ICZxdW90Oy9zeXMvY2xhc3Mvc291bmQvY2FyZDAvJXMv
cG93ZXJfb25fYWNjdCZxdW90OywgZF9uYW1lKTs8YnI+CiZndDsgK8KgIMKgIHNucHJpbnRmKGZp
bGVuYW1lLCBzaXplb2YoZmlsZW5hbWUpLDxicj4KJmd0OyAmcXVvdDsvc3lzL2NsYXNzL3NvdW5k
LyVzL3Bvd2VyX29uX2FjY3QmcXVvdDssIGRfbmFtZSk7PGJyPgo8YnI+Cjwvc3Bhbj5JdCBsb29r
cyBsaWtlIHlvdXIgbWFpbGVyIGhlbHBmdWxseSBsaW5ld3JhcHMgdGhlIHBhdGNoLiBDb3VsZCB5
b3UgcGxlYXNlPGJyPgpyZXNlbmQgaXQgYXMgYW4gYXR0YWNobWVudD88YnI+CjxzcGFuIGNsYXNz
PSJIT0VuWmIiPjxmb250IGNvbG9yPSIjODg4ODg4Ij48YnI+Ci9NRjxicj4KPC9mb250Pjwvc3Bh
bj48L2Jsb2NrcXVvdGU+PC9kaXY+PGJyPjwvZGl2Pgo=

--===============0309075085274762491==
Content-Type: text/x-patch
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-Detect-all-audio-cards-in-the-system-not-only-card0.patch"

RnJvbSA1OWRjZmEzYjlmNGE3MjI1MmI0ZDI0NWE1YjRhZjEzN2NiZTdkZmE4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBZYXJvc2xhdiBJc2Frb3YgPHlhcm9zbGF2LmlzYWtvdkBnbWFp
bC5jb20+CkRhdGU6IE1vbiwgMjIgRmViIDIwMTYgMTc6MTE6MTEgKzAzMDAKU3ViamVjdDogW1BB
VENIIDEvMl0gRGV0ZWN0IGFsbCBhdWRpbyBjYXJkcyBpbiB0aGUgc3lzdGVtIChub3Qgb25seSBj
YXJkMCkKCi0tLQogc3JjL2RldmljZXMvYWxzYS5jcHAgfCA2ICsrKy0tLQogMSBmaWxlIGNoYW5n
ZWQsIDMgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9zcmMvZGV2
aWNlcy9hbHNhLmNwcCBiL3NyYy9kZXZpY2VzL2Fsc2EuY3BwCmluZGV4IDQyNWI1OGEuLmY3YmEy
YjYgMTAwNjQ0Ci0tLSBhL3NyYy9kZXZpY2VzL2Fsc2EuY3BwCisrKyBiL3NyYy9kZXZpY2VzL2Fs
c2EuY3BwCkBAIC0xNTgsMTEgKzE1OCwxMSBAQCBzdGF0aWMgdm9pZCBjcmVhdGVfYWxsX2Fsc2Ff
Y2FsbGJhY2soY29uc3QgY2hhciAqZF9uYW1lKQogCWlmIChzdHJuY21wKGRfbmFtZSwgImh3QyIs
IDMpICE9IDApCiAJCXJldHVybjsKIAotCXNucHJpbnRmKGZpbGVuYW1lLCBzaXplb2YoZmlsZW5h
bWUpLCAiL3N5cy9jbGFzcy9zb3VuZC9jYXJkMC8lcy9wb3dlcl9vbl9hY2N0IiwgZF9uYW1lKTsK
KwlzbnByaW50ZihmaWxlbmFtZSwgc2l6ZW9mKGZpbGVuYW1lKSwgIi9zeXMvY2xhc3Mvc291bmQv
JXMvcG93ZXJfb25fYWNjdCIsIGRfbmFtZSk7CiAJaWYgKGFjY2VzcyhmaWxlbmFtZSwgUl9PSykg
IT0gMCkKIAkJcmV0dXJuOwogCi0Jc25wcmludGYoZmlsZW5hbWUsIHNpemVvZihmaWxlbmFtZSks
ICIvc3lzL2NsYXNzL3NvdW5kL2NhcmQwLyVzIiwgZF9uYW1lKTsKKwlzbnByaW50ZihmaWxlbmFt
ZSwgc2l6ZW9mKGZpbGVuYW1lKSwgIi9zeXMvY2xhc3Mvc291bmQvJXMiLCBkX25hbWUpOwogCWJs
ID0gbmV3IGNsYXNzIGFsc2EoZF9uYW1lLCBmaWxlbmFtZSk7CiAJYWxsX2RldmljZXMucHVzaF9i
YWNrKGJsKTsKIAlyZWdpc3Rlcl9wYXJhbWV0ZXIoImFsc2EtY29kZWMtcG93ZXIiLCAwLjUpOwpA
QCAtMTcwLDcgKzE3MCw3IEBAIHN0YXRpYyB2b2lkIGNyZWF0ZV9hbGxfYWxzYV9jYWxsYmFjayhj
b25zdCBjaGFyICpkX25hbWUpCiAKIHZvaWQgY3JlYXRlX2FsbF9hbHNhKHZvaWQpCiB7Ci0JcHJv
Y2Vzc19kaXJlY3RvcnkoIi9zeXMvY2xhc3Mvc291bmQvY2FyZDAvIiwgY3JlYXRlX2FsbF9hbHNh
X2NhbGxiYWNrKTsKKwlwcm9jZXNzX2RpcmVjdG9yeSgiL3N5cy9jbGFzcy9zb3VuZC8iLCBjcmVh
dGVfYWxsX2Fsc2FfY2FsbGJhY2spOwogfQogCiBkb3VibGUgYWxzYTo6cG93ZXJfdXNhZ2Uoc3Ry
dWN0IHJlc3VsdF9idW5kbGUgKnJlc3VsdCwgc3RydWN0IHBhcmFtZXRlcl9idW5kbGUgKmJ1bmRs
ZSkKLS0gCjIuNC4xMAoK

--===============0309075085274762491==--

