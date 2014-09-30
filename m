Content-Type: multipart/mixed; boundary="===============4141733843106565893=="
MIME-Version: 1.0
From: Nanley Chery <nanleychery at gmail.com>
Subject: Re: [Powertop] [PATCH v2 1/1] tunables: check usb autosuspend support
 before add
Date: Tue, 30 Sep 2014 11:14:39 -0400
Message-ID: <CAJDL4uLy16aBevteugeCEaMp0xiywiGhk=BVnqxgci4pKoLsXA@mail.gmail.com>
In-Reply-To: 55425.10.24.5.188.1412038367.squirrel@linux.intel.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============4141733843106565893==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello Alexandra,

Thank you for accepting this patch.

Nanley

On Mon, Sep 29, 2014 at 8:52 PM, Alexandra Yates <
alexandra.yates(a)linux.intel.com> wrote:

>
> > Some usb devices do not have drivers that support autosuspend.
> > These drivers should not be added to the list of tunables, because
> > toggling their good/bad value does nothing.
> >
> > Signed-off-by: Nanley Chery <nanleychery(a)gmail.com>
> > ---
> >
> > Fixed the issue in the previous patch that allowed returning between
> > opendir and closedir (thanks Sergey). Also improve detection of interfa=
ce
> > folders.
> >
> >  src/tuning/tuningusb.cpp | 19 +++++++++++++++++++
> >  1 file changed, 19 insertions(+)
> >
> > diff --git a/src/tuning/tuningusb.cpp b/src/tuning/tuningusb.cpp
> > index 27a6dca..d2a0c11 100644
> > --- a/src/tuning/tuningusb.cpp
> > +++ b/src/tuning/tuningusb.cpp
> > @@ -28,6 +28,7 @@
> >  #include "unistd.h"
> >  #include "tuningusb.h"
> >  #include <string.h>
> > +#include <dirent.h>
> >  #include <utility>
> >  #include <iostream>
> >  #include <fstream>
> > @@ -117,6 +118,7 @@ static void add_usb_callback(const char *d_name)
> >  {
> >       class usb_tunable *usb;
> >       char filename[4096];
> > +     DIR *dir;
> >
> >       sprintf(filename, "/sys/bus/usb/devices/%s/power/control", d_name=
);
> >       if (access(filename, R_OK) !=3D 0)
> > @@ -126,6 +128,23 @@ static void add_usb_callback(const char *d_name)
> >       if (access(filename, R_OK)!=3D0)
> >               return;
> >
> > +     /* every interface of this device should support autosuspend */
> > +     sprintf(filename, "/sys/bus/usb/devices/%s", d_name);
> > +     if ((dir =3D opendir(filename))) {
> > +             struct dirent *entry;
> > +             while ((entry =3D readdir(dir))) {
> > +                     /* dirname: <busnum>-<devnum>...:<config
> num>-<interface num> */
> > +                     if (!isdigit(entry->d_name[0]))
> > +                             continue;
> > +                     sprintf(filename,
> "/sys/bus/usb/devices/%s/%s/supports_autosuspend",
> > d_name, entry->d_name);
> > +                     if (access(filename, R_OK) =3D=3D 0 &&
> read_sysfs(filename) =3D=3D 0)
> > +                             break;
> > +             }
> > +             closedir(dir);
> > +             if (entry)
> > +                     return;
> > +     }
> > +
> >       sprintf(filename, "/sys/bus/usb/devices/%s", d_name);
> >       usb =3D new class usb_tunable(filename, d_name);
> >       all_tunables.push_back(usb);
> > --
> > 2.0.4
> >
> > _______________________________________________
> > PowerTop mailing list
> > PowerTop(a)lists.01.org
> > https://lists.01.org/mailman/listinfo/powertop
> >
>
> Nanley,
>
> Thank you very much for sending you patch. It was up-streamed today.
>
> Alexandra.
>

--===============4141733843106565893==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PGRpdiBkaXI9Imx0ciI+SGVsbG8gQWxleGFuZHJhLDxkaXY+PGJyPjxkaXY+VGhhbmsgeW91IGZv
ciBhY2NlcHRpbmcgdGhpcyBwYXRjaC48L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2Pk5hbmxleTwv
ZGl2PjwvZGl2PjwvZGl2PjxkaXYgY2xhc3M9ImdtYWlsX2V4dHJhIj48YnI+PGRpdiBjbGFzcz0i
Z21haWxfcXVvdGUiPk9uIE1vbiwgU2VwIDI5LCAyMDE0IGF0IDg6NTIgUE0sIEFsZXhhbmRyYSBZ
YXRlcyA8c3BhbiBkaXI9Imx0ciI+Jmx0OzxhIGhyZWY9Im1haWx0bzphbGV4YW5kcmEueWF0ZXNA
bGludXguaW50ZWwuY29tIiB0YXJnZXQ9Il9ibGFuayI+YWxleGFuZHJhLnlhdGVzQGxpbnV4Lmlu
dGVsLmNvbTwvYT4mZ3Q7PC9zcGFuPiB3cm90ZTo8YnI+PGJsb2NrcXVvdGUgY2xhc3M9ImdtYWls
X3F1b3RlIiBzdHlsZT0ibWFyZ2luOjAgMCAwIC44ZXg7Ym9yZGVyLWxlZnQ6MXB4ICNjY2Mgc29s
aWQ7cGFkZGluZy1sZWZ0OjFleCI+PGRpdiBjbGFzcz0iSE9FblpiIj48ZGl2IGNsYXNzPSJoNSI+
PGJyPgomZ3Q7IFNvbWUgdXNiIGRldmljZXMgZG8gbm90IGhhdmUgZHJpdmVycyB0aGF0IHN1cHBv
cnQgYXV0b3N1c3BlbmQuPGJyPgomZ3Q7IFRoZXNlIGRyaXZlcnMgc2hvdWxkIG5vdCBiZSBhZGRl
ZCB0byB0aGUgbGlzdCBvZiB0dW5hYmxlcywgYmVjYXVzZTxicj4KJmd0OyB0b2dnbGluZyB0aGVp
ciBnb29kL2JhZCB2YWx1ZSBkb2VzIG5vdGhpbmcuPGJyPgomZ3Q7PGJyPgomZ3Q7IFNpZ25lZC1v
ZmYtYnk6IE5hbmxleSBDaGVyeSAmbHQ7PGEgaHJlZj0ibWFpbHRvOm5hbmxleWNoZXJ5QGdtYWls
LmNvbSI+bmFubGV5Y2hlcnlAZ21haWwuY29tPC9hPiZndDs8YnI+CiZndDsgLS0tPGJyPgomZ3Q7
PGJyPgomZ3Q7IEZpeGVkIHRoZSBpc3N1ZSBpbiB0aGUgcHJldmlvdXMgcGF0Y2ggdGhhdCBhbGxv
d2VkIHJldHVybmluZyBiZXR3ZWVuPGJyPgomZ3Q7IG9wZW5kaXIgYW5kIGNsb3NlZGlyICh0aGFu
a3MgU2VyZ2V5KS4gQWxzbyBpbXByb3ZlIGRldGVjdGlvbiBvZiBpbnRlcmZhY2U8YnI+CiZndDsg
Zm9sZGVycy48YnI+CiZndDs8YnI+CiZndDvCoCBzcmMvdHVuaW5nL3R1bmluZ3VzYi5jcHAgfCAx
OSArKysrKysrKysrKysrKysrKysrPGJyPgomZ3Q7wqAgMSBmaWxlIGNoYW5nZWQsIDE5IGluc2Vy
dGlvbnMoKyk8YnI+CiZndDs8YnI+CiZndDsgZGlmZiAtLWdpdCBhL3NyYy90dW5pbmcvdHVuaW5n
dXNiLmNwcCBiL3NyYy90dW5pbmcvdHVuaW5ndXNiLmNwcDxicj4KJmd0OyBpbmRleCAyN2E2ZGNh
Li5kMmEwYzExIDEwMDY0NDxicj4KJmd0OyAtLS0gYS9zcmMvdHVuaW5nL3R1bmluZ3VzYi5jcHA8
YnI+CiZndDsgKysrIGIvc3JjL3R1bmluZy90dW5pbmd1c2IuY3BwPGJyPgomZ3Q7IEBAIC0yOCw2
ICsyOCw3IEBAPGJyPgomZ3Q7wqAgI2luY2x1ZGUgJnF1b3Q7dW5pc3RkLmgmcXVvdDs8YnI+CiZn
dDvCoCAjaW5jbHVkZSAmcXVvdDt0dW5pbmd1c2IuaCZxdW90Ozxicj4KJmd0O8KgICNpbmNsdWRl
ICZsdDtzdHJpbmcuaCZndDs8YnI+CiZndDsgKyNpbmNsdWRlICZsdDtkaXJlbnQuaCZndDs8YnI+
CiZndDvCoCAjaW5jbHVkZSAmbHQ7dXRpbGl0eSZndDs8YnI+CiZndDvCoCAjaW5jbHVkZSAmbHQ7
aW9zdHJlYW0mZ3Q7PGJyPgomZ3Q7wqAgI2luY2x1ZGUgJmx0O2ZzdHJlYW0mZ3Q7PGJyPgomZ3Q7
IEBAIC0xMTcsNiArMTE4LDcgQEAgc3RhdGljIHZvaWQgYWRkX3VzYl9jYWxsYmFjayhjb25zdCBj
aGFyICpkX25hbWUpPGJyPgomZ3Q7wqAgezxicj4KJmd0O8KgIMKgIMKgIMKgY2xhc3MgdXNiX3R1
bmFibGUgKnVzYjs8YnI+CiZndDvCoCDCoCDCoCDCoGNoYXIgZmlsZW5hbWVbNDA5Nl07PGJyPgom
Z3Q7ICvCoCDCoCDCoERJUiAqZGlyOzxicj4KJmd0Ozxicj4KJmd0O8KgIMKgIMKgIMKgc3ByaW50
ZihmaWxlbmFtZSwgJnF1b3Q7L3N5cy9idXMvdXNiL2RldmljZXMvJXMvcG93ZXIvY29udHJvbCZx
dW90OywgZF9uYW1lKTs8YnI+CiZndDvCoCDCoCDCoCDCoGlmIChhY2Nlc3MoZmlsZW5hbWUsIFJf
T0spICE9IDApPGJyPgomZ3Q7IEBAIC0xMjYsNiArMTI4LDIzIEBAIHN0YXRpYyB2b2lkIGFkZF91
c2JfY2FsbGJhY2soY29uc3QgY2hhciAqZF9uYW1lKTxicj4KJmd0O8KgIMKgIMKgIMKgaWYgKGFj
Y2VzcyhmaWxlbmFtZSwgUl9PSykhPTApPGJyPgomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBy
ZXR1cm47PGJyPgomZ3Q7PGJyPgomZ3Q7ICvCoCDCoCDCoC8qIGV2ZXJ5IGludGVyZmFjZSBvZiB0
aGlzIGRldmljZSBzaG91bGQgc3VwcG9ydCBhdXRvc3VzcGVuZCAqLzxicj4KJmd0OyArwqAgwqAg
wqBzcHJpbnRmKGZpbGVuYW1lLCAmcXVvdDsvc3lzL2J1cy91c2IvZGV2aWNlcy8lcyZxdW90Oywg
ZF9uYW1lKTs8YnI+CiZndDsgK8KgIMKgIMKgaWYgKChkaXIgPSBvcGVuZGlyKGZpbGVuYW1lKSkp
IHs8YnI+CiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgc3RydWN0IGRpcmVudCAqZW50cnk7PGJy
PgomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoHdoaWxlICgoZW50cnkgPSByZWFkZGlyKGRpcikp
KSB7PGJyPgomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoC8qIGRpcm5hbWU6
ICZsdDtidXNudW0mZ3Q7LSZsdDtkZXZudW0mZ3Q7Li4uOiZsdDtjb25maWcgbnVtJmd0Oy0mbHQ7
aW50ZXJmYWNlIG51bSZndDsgKi88YnI+CiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgaWYgKCFpc2RpZ2l0KGVudHJ5LSZndDtkX25hbWVbMF0pKTxicj4KJmd0OyArwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBjb250aW51ZTs8YnI+CiZndDsg
K8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgc3ByaW50ZihmaWxlbmFtZSwgJnF1b3Q7
L3N5cy9idXMvdXNiL2RldmljZXMvJXMvJXMvc3VwcG9ydHNfYXV0b3N1c3BlbmQmcXVvdDssPGJy
PgomZ3Q7IGRfbmFtZSwgZW50cnktJmd0O2RfbmFtZSk7PGJyPgomZ3Q7ICvCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoGlmIChhY2Nlc3MoZmlsZW5hbWUsIFJfT0spID09IDAgJmFtcDsm
YW1wOyByZWFkX3N5c2ZzKGZpbGVuYW1lKSA9PSAwKTxicj4KJmd0OyArwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBicmVhazs8YnI+CiZndDsgK8KgIMKgIMKgIMKg
IMKgIMKgIMKgfTxicj4KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqBjbG9zZWRpcihkaXIpOzxi
cj4KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqBpZiAoZW50cnkpPGJyPgomZ3Q7ICvCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHJldHVybjs8YnI+CiZndDsgK8KgIMKgIMKgfTxicj4K
Jmd0OyArPGJyPgomZ3Q7wqAgwqAgwqAgwqBzcHJpbnRmKGZpbGVuYW1lLCAmcXVvdDsvc3lzL2J1
cy91c2IvZGV2aWNlcy8lcyZxdW90OywgZF9uYW1lKTs8YnI+CiZndDvCoCDCoCDCoCDCoHVzYiA9
IG5ldyBjbGFzcyB1c2JfdHVuYWJsZShmaWxlbmFtZSwgZF9uYW1lKTs8YnI+CiZndDvCoCDCoCDC
oCDCoGFsbF90dW5hYmxlcy5wdXNoX2JhY2sodXNiKTs8YnI+CiZndDsgLS08YnI+CiZndDsgMi4w
LjQ8YnI+CiZndDs8YnI+CjwvZGl2PjwvZGl2PiZndDsgX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX188YnI+CiZndDsgUG93ZXJUb3AgbWFpbGluZyBsaXN0PGJy
PgomZ3Q7IDxhIGhyZWY9Im1haWx0bzpQb3dlclRvcEBsaXN0cy4wMS5vcmciPlBvd2VyVG9wQGxp
c3RzLjAxLm9yZzwvYT48YnI+CiZndDsgPGEgaHJlZj0iaHR0cHM6Ly9saXN0cy4wMS5vcmcvbWFp
bG1hbi9saXN0aW5mby9wb3dlcnRvcCIgdGFyZ2V0PSJfYmxhbmsiPmh0dHBzOi8vbGlzdHMuMDEu
b3JnL21haWxtYW4vbGlzdGluZm8vcG93ZXJ0b3A8L2E+PGJyPgomZ3Q7PGJyPgo8YnI+Ck5hbmxl
eSw8YnI+Cjxicj4KVGhhbmsgeW91IHZlcnkgbXVjaCBmb3Igc2VuZGluZyB5b3UgcGF0Y2guIEl0
IHdhcyB1cC1zdHJlYW1lZCB0b2RheS48YnI+CjxzcGFuIGNsYXNzPSJIT0VuWmIiPjxmb250IGNv
bG9yPSIjODg4ODg4Ij48YnI+CkFsZXhhbmRyYS48YnI+CjwvZm9udD48L3NwYW4+PC9ibG9ja3F1
b3RlPjwvZGl2Pjxicj48L2Rpdj4K

--===============4141733843106565893==--

