Content-Type: multipart/mixed; boundary="===============6340335952896623630=="
MIME-Version: 1.0
From: Zhaoyang Huang <zhaoyang.huang at linaro.org>
Subject: Re: [Powertop] [PATCH 1/2] prevent segment fault for android built 2
Date: Tue, 07 Jul 2015 10:16:57 +0800
Message-ID: <CAN2waFs38gP+34_0hnidXW0TPA29hDT=jropbkZO+NHrVYq5bw@mail.gmail.com>
In-Reply-To: 20150706144405.0eb51c6a9bb96c3835f60a84@linux.intel.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============6340335952896623630==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Daniel,
Thank you for your feedback.
I have noticed the patch you mentioned. However, under the android(use
bionic libc) environment, the bellowing condition maybe true which will
cause a NULL pointer access to buffer. I add another one more condition to
prevent it. This problem can also be reproduced by android.

diff --git a/src/lib.cpp b/src/lib.cpp
index 88fe5f3..8d1ca9f 100644
--- a/src/lib.cpp
+++ b/src/lib.cpp
@@ -285,7 +285,7 @@ void align_string(char *buffer, size_t min_sz, size_t
max_sz)
        /* start with mbsrtowcs() local mbstate_t * and
         * NULL dst pointer*/
        sz =3D mbsrtowcs(NULL, (const char **)&buffer, max_sz, NULL);
-       if (sz =3D=3D (size_t)-1) {
+       if ((sz =3D=3D (size_t)-1) && (NULL !=3D buffer)) {
                buffer[min_sz] =3D 0x00;
                return;
        }
-- =

1.7.9.5


On 7 July 2015 at 05:44, Daniel Leung <daniel.leung(a)linux.intel.com> wrot=
e:

> On Wed,  1 Jul 2015 19:52:24 +0800
> Zhaoyang Huang <zhaoyang.huang(a)linaro.org> wrote:
>
> > the buffer will be turn into NULL after invoking the mbsrtowcs function
> > of bionic libc. Add a condition judgement for that
> >
> > Signed-off-by: Zhaoyang Huang <zhaoyang.huang(a)linaro.org>
> > ---
> >  src/lib.cpp |    2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/src/lib.cpp b/src/lib.cpp
> > index 88fe5f3..8d1ca9f 100644
> > --- a/src/lib.cpp
> > +++ b/src/lib.cpp
> > @@ -285,7 +285,7 @@ void align_string(char *buffer, size_t min_sz,
> size_t max_sz)
> >       /* start with mbsrtowcs() local mbstate_t * and
> >        * NULL dst pointer*/
> >       sz =3D mbsrtowcs(NULL, (const char **)&buffer, max_sz, NULL);
> > -     if (sz =3D=3D (size_t)-1) {
> > +     if ((sz =3D=3D (size_t)-1) && (NULL !=3D buffer)) {
> >               buffer[min_sz] =3D 0x00;
> >               return;
> >       }
> > --
> > 1.7.9.5
> >
>
> If you are on master branch, there is a patch
> (patches/android/prevent_segfaults.patch) to workaround the NULL pointer.
>
> --
> Daniel Leung <daniel.leung(a)linux.intel.com>
>

--===============6340335952896623630==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PGRpdiBkaXI9Imx0ciI+PGRpdj48ZGl2PkhpIERhbmllbCw8YnI+PC9kaXY+VGhhbmsgeW91IGZv
ciB5b3VyIGZlZWRiYWNrLjxicj48L2Rpdj5JIGhhdmUgbm90aWNlZCB0aGUgcGF0Y2ggeW91IG1l
bnRpb25lZC4gSG93ZXZlciwgdW5kZXIgdGhlIGFuZHJvaWQodXNlIGJpb25pYyBsaWJjKSBlbnZp
cm9ubWVudCwgdGhlIGJlbGxvd2luZyBjb25kaXRpb24gbWF5YmUgdHJ1ZSB3aGljaCB3aWxsIGNh
dXNlIGEgTlVMTCBwb2ludGVyIGFjY2VzcyB0byBidWZmZXIuIEkgYWRkIGFub3RoZXIgb25lIG1v
cmUgY29uZGl0aW9uIHRvIHByZXZlbnQgaXQuIFRoaXMgcHJvYmxlbSBjYW4gYWxzbyBiZSByZXBy
b2R1Y2VkIGJ5IGFuZHJvaWQuPGJyPjxicj5kaWZmIC0tZ2l0IGEvc3JjL2xpYi5jcHAgYi9zcmMv
bGliLmNwcDxicj5pbmRleCA4OGZlNWYzLi44ZDFjYTlmIDEwMDY0NDxicj4tLS0gYS9zcmMvbGli
LmNwcDxicj4rKysgYi9zcmMvbGliLmNwcDxicj5AQCAtMjg1LDcgKzI4NSw3IEBAIHZvaWQgYWxp
Z25fc3RyaW5nKGNoYXIgKmJ1ZmZlciwgc2l6ZV90IG1pbl9zeiwgc2l6ZV90IG1heF9zeik8YnI+
wqDCoMKgwqDCoMKgwqAgLyogc3RhcnQgd2l0aCBtYnNydG93Y3MoKSBsb2NhbCBtYnN0YXRlX3Qg
KiBhbmQ8YnI+wqDCoMKgwqDCoMKgwqDCoCAqIE5VTEwgZHN0IHBvaW50ZXIqLzxicj7CoMKgwqDC
oMKgwqDCoCBzeiA9IG1ic3J0b3djcyhOVUxMLCAoY29uc3QgY2hhciAqKikmYW1wO2J1ZmZlciwg
bWF4X3N6LCBOVUxMKTs8YnI+LcKgwqDCoMKgwqDCoCBpZiAoc3ogPT0gKHNpemVfdCktMSkgezxi
cj4rwqDCoMKgwqDCoMKgIGlmICgoc3ogPT0gKHNpemVfdCktMSkgJmFtcDsmYW1wOyAoTlVMTCAh
PSBidWZmZXIpKSB7PGJyPsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBidWZmZXJbbWlu
X3N6XSA9IDB4MDA7PGJyPsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm47PGJy
PsKgwqDCoMKgwqDCoMKgIH08YnI+LS0gPGJyPjEuNy45LjU8YnI+PGJyPjwvZGl2PjxkaXYgY2xh
c3M9ImdtYWlsX2V4dHJhIj48YnI+PGRpdiBjbGFzcz0iZ21haWxfcXVvdGUiPk9uIDcgSnVseSAy
MDE1IGF0IDA1OjQ0LCBEYW5pZWwgTGV1bmcgPHNwYW4gZGlyPSJsdHIiPiZsdDs8YSBocmVmPSJt
YWlsdG86ZGFuaWVsLmxldW5nQGxpbnV4LmludGVsLmNvbSIgdGFyZ2V0PSJfYmxhbmsiPmRhbmll
bC5sZXVuZ0BsaW51eC5pbnRlbC5jb208L2E+Jmd0Ozwvc3Bhbj4gd3JvdGU6PGJyPjxibG9ja3F1
b3RlIGNsYXNzPSJnbWFpbF9xdW90ZSIgc3R5bGU9Im1hcmdpbjowIDAgMCAuOGV4O2JvcmRlci1s
ZWZ0OjFweCAjY2NjIHNvbGlkO3BhZGRpbmctbGVmdDoxZXgiPjxkaXYgY2xhc3M9IkhPRW5aYiI+
PGRpdiBjbGFzcz0iaDUiPk9uIFdlZCzCoCAxIEp1bCAyMDE1IDE5OjUyOjI0ICswODAwPGJyPgpa
aGFveWFuZyBIdWFuZyAmbHQ7PGEgaHJlZj0ibWFpbHRvOnpoYW95YW5nLmh1YW5nQGxpbmFyby5v
cmciPnpoYW95YW5nLmh1YW5nQGxpbmFyby5vcmc8L2E+Jmd0OyB3cm90ZTo8YnI+Cjxicj4KJmd0
OyB0aGUgYnVmZmVyIHdpbGwgYmUgdHVybiBpbnRvIE5VTEwgYWZ0ZXIgaW52b2tpbmcgdGhlIG1i
c3J0b3djcyBmdW5jdGlvbjxicj4KJmd0OyBvZiBiaW9uaWMgbGliYy4gQWRkIGEgY29uZGl0aW9u
IGp1ZGdlbWVudCBmb3IgdGhhdDxicj4KJmd0Ozxicj4KJmd0OyBTaWduZWQtb2ZmLWJ5OiBaaGFv
eWFuZyBIdWFuZyAmbHQ7PGEgaHJlZj0ibWFpbHRvOnpoYW95YW5nLmh1YW5nQGxpbmFyby5vcmci
PnpoYW95YW5nLmh1YW5nQGxpbmFyby5vcmc8L2E+Jmd0Ozxicj4KJmd0OyAtLS08YnI+CiZndDvC
oCBzcmMvbGliLmNwcCB8wqAgwqAgMiArLTxicj4KJmd0O8KgIDEgZmlsZSBjaGFuZ2VkLCAxIGlu
c2VydGlvbigrKSwgMSBkZWxldGlvbigtKTxicj4KJmd0Ozxicj4KJmd0OyBkaWZmIC0tZ2l0IGEv
c3JjL2xpYi5jcHAgYi9zcmMvbGliLmNwcDxicj4KJmd0OyBpbmRleCA4OGZlNWYzLi44ZDFjYTlm
IDEwMDY0NDxicj4KJmd0OyAtLS0gYS9zcmMvbGliLmNwcDxicj4KJmd0OyArKysgYi9zcmMvbGli
LmNwcDxicj4KJmd0OyBAQCAtMjg1LDcgKzI4NSw3IEBAIHZvaWQgYWxpZ25fc3RyaW5nKGNoYXIg
KmJ1ZmZlciwgc2l6ZV90IG1pbl9zeiwgc2l6ZV90IG1heF9zeik8YnI+CiZndDvCoCDCoCDCoCDC
oC8qIHN0YXJ0IHdpdGggbWJzcnRvd2NzKCkgbG9jYWwgbWJzdGF0ZV90ICogYW5kPGJyPgomZ3Q7
wqAgwqAgwqAgwqAgKiBOVUxMIGRzdCBwb2ludGVyKi88YnI+CiZndDvCoCDCoCDCoCDCoHN6ID0g
bWJzcnRvd2NzKE5VTEwsIChjb25zdCBjaGFyICoqKSZhbXA7YnVmZmVyLCBtYXhfc3osIE5VTEwp
Ozxicj4KJmd0OyAtwqAgwqAgwqBpZiAoc3ogPT0gKHNpemVfdCktMSkgezxicj4KJmd0OyArwqAg
wqAgwqBpZiAoKHN6ID09IChzaXplX3QpLTEpICZhbXA7JmFtcDsgKE5VTEwgIT0gYnVmZmVyKSkg
ezxicj4KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgYnVmZmVyW21pbl9zel0gPSAweDAwOzxi
cj4KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcmV0dXJuOzxicj4KJmd0O8KgIMKgIMKgIMKg
fTxicj4KJmd0OyAtLTxicj4KJmd0OyAxLjcuOS41PGJyPgomZ3Q7PGJyPgo8YnI+CjwvZGl2Pjwv
ZGl2PklmIHlvdSBhcmUgb24gbWFzdGVyIGJyYW5jaCwgdGhlcmUgaXMgYSBwYXRjaCAocGF0Y2hl
cy9hbmRyb2lkL3ByZXZlbnRfc2VnZmF1bHRzLnBhdGNoKSB0byB3b3JrYXJvdW5kIHRoZSBOVUxM
IHBvaW50ZXIuPGJyPgo8c3BhbiBjbGFzcz0iSE9FblpiIj48Zm9udCBjb2xvcj0iIzg4ODg4OCI+
PGJyPgotLTxicj4KRGFuaWVsIExldW5nICZsdDs8YSBocmVmPSJtYWlsdG86ZGFuaWVsLmxldW5n
QGxpbnV4LmludGVsLmNvbSI+ZGFuaWVsLmxldW5nQGxpbnV4LmludGVsLmNvbTwvYT4mZ3Q7PGJy
Pgo8L2ZvbnQ+PC9zcGFuPjwvYmxvY2txdW90ZT48L2Rpdj48YnI+PC9kaXY+Cg==

--===============6340335952896623630==--

