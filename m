Content-Type: multipart/mixed; boundary="===============4352407583736868632=="
MIME-Version: 1.0
From: Zhaoyang Huang <zhaoyang.huang at linaro.org>
Subject: Re: [Powertop] [PATCH 2/2] comment process_cpu_data in the
 one_measurement() for it clears all pstat data
Date: Tue, 07 Jul 2015 10:09:46 +0800
Message-ID: <CAN2waFuo5vw6AwzeawEsUu47_KpUxvnhOW0oDU9xma2ZQbyfnQ@mail.gmail.com>
In-Reply-To: 20150706144633.449afe72d66e578d91e85a0d@linux.intel.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============4352407583736868632==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Daniel,
Thank  you for your feedback. The problem I mentioned is produced under
Android environment. You can compile the latest powertop on android5.0 and
run them by 'powertop --csv'. You will find all pstat shows 100% on idle.
Besides, I also find bellowing inquiry on 01.org which ask the same
question.

https://lists.01.org/pipermail/powertop/2015-June/001801.html

BRs
zhaoyang

On 7 July 2015 at 05:46, Daniel Leung <daniel.leung(a)linux.intel.com> wrot=
e:

> On Wed,  1 Jul 2015 19:34:40 +0800
> Zhaoyang Huang <zhaoyang.huang(a)linaro.org> wrote:
>
> > all children cpu's pstat data will be cleared in process_cpu_data,which
> > cause the pstat shows abnormal, we have to comment this line of code.
> However,
> > it looks too rough.
> >
> > Signed-off-by: Zhaoyang Huang <zhaoyang.huang(a)linaro.org>
> > ---
> >  src/main.cpp |    7 +++++++
> >  1 file changed, 7 insertions(+)
> >
> > diff --git a/src/main.cpp b/src/main.cpp
> > index 1e56af1..9526084 100644
> > --- a/src/main.cpp
> > +++ b/src/main.cpp
> > @@ -221,7 +221,14 @@ void one_measurement(int seconds, char *workload)
> >       devices_end_measurement();
> >       end_power_measurement();
> >
> > +     /*
> > +     FIX ME:all children cpu's pstat data will be cleared in
> process_cpu_data,which
> > +     cause the pstat shows abnormal, we have to comment this line of
> code. However,
> > +     it looks to rough
> > +     */
> > +     /*
> >       process_cpu_data();
> > +     */
> >       process_process_data();
> >
> >       /* output stats */
> > --
> > 1.7.9.5
> >
>
> Did you see the issue on Android? Could you give me more details? Maybe I
> can try to re-produce it on my end.
>
> --
> Daniel Leung <daniel.leung(a)linux.intel.com>
>

--===============4352407583736868632==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PGRpdiBkaXI9Imx0ciI+PGRpdj48ZGl2PjxkaXY+SGkgRGFuaWVsLDxicj48L2Rpdj5UaGFua8Kg
IHlvdSBmb3IgeW91ciBmZWVkYmFjay4gVGhlIHByb2JsZW0gSSBtZW50aW9uZWQgaXMgcHJvZHVj
ZWQgdW5kZXIgQW5kcm9pZCBlbnZpcm9ubWVudC4gWW91IGNhbiBjb21waWxlIHRoZSBsYXRlc3Qg
cG93ZXJ0b3Agb24gYW5kcm9pZDUuMCBhbmQgcnVuIHRoZW0gYnkgJiMzOTtwb3dlcnRvcCAtLWNz
diYjMzk7LiBZb3Ugd2lsbCBmaW5kIGFsbCBwc3RhdCBzaG93cyAxMDAlIG9uIGlkbGUuIDxicj48
L2Rpdj5CZXNpZGVzLCBJIGFsc28gZmluZCBiZWxsb3dpbmcgaW5xdWlyeSBvbiA8YSBocmVmPSJo
dHRwOi8vMDEub3JnIj4wMS5vcmc8L2E+IHdoaWNoIGFzayB0aGUgc2FtZSBxdWVzdGlvbi48YnI+
PGJyPjxhIGhyZWY9Imh0dHBzOi8vbGlzdHMuMDEub3JnL3BpcGVybWFpbC9wb3dlcnRvcC8yMDE1
LUp1bmUvMDAxODAxLmh0bWwiPmh0dHBzOi8vbGlzdHMuMDEub3JnL3BpcGVybWFpbC9wb3dlcnRv
cC8yMDE1LUp1bmUvMDAxODAxLmh0bWw8L2E+PGJyPjxicj48L2Rpdj5CUnM8YnI+emhhb3lhbmc8
YnI+PC9kaXY+PGRpdiBjbGFzcz0iZ21haWxfZXh0cmEiPjxicj48ZGl2IGNsYXNzPSJnbWFpbF9x
dW90ZSI+T24gNyBKdWx5IDIwMTUgYXQgMDU6NDYsIERhbmllbCBMZXVuZyA8c3BhbiBkaXI9Imx0
ciI+Jmx0OzxhIGhyZWY9Im1haWx0bzpkYW5pZWwubGV1bmdAbGludXguaW50ZWwuY29tIiB0YXJn
ZXQ9Il9ibGFuayI+ZGFuaWVsLmxldW5nQGxpbnV4LmludGVsLmNvbTwvYT4mZ3Q7PC9zcGFuPiB3
cm90ZTo8YnI+PGJsb2NrcXVvdGUgY2xhc3M9ImdtYWlsX3F1b3RlIiBzdHlsZT0ibWFyZ2luOjAg
MCAwIC44ZXg7Ym9yZGVyLWxlZnQ6MXB4ICNjY2Mgc29saWQ7cGFkZGluZy1sZWZ0OjFleCI+PGRp
diBjbGFzcz0iSE9FblpiIj48ZGl2IGNsYXNzPSJoNSI+T24gV2VkLMKgIDEgSnVsIDIwMTUgMTk6
MzQ6NDAgKzA4MDA8YnI+ClpoYW95YW5nIEh1YW5nICZsdDs8YSBocmVmPSJtYWlsdG86emhhb3lh
bmcuaHVhbmdAbGluYXJvLm9yZyI+emhhb3lhbmcuaHVhbmdAbGluYXJvLm9yZzwvYT4mZ3Q7IHdy
b3RlOjxicj4KPGJyPgomZ3Q7IGFsbCBjaGlsZHJlbiBjcHUmIzM5O3MgcHN0YXQgZGF0YSB3aWxs
IGJlIGNsZWFyZWQgaW4gcHJvY2Vzc19jcHVfZGF0YSx3aGljaDxicj4KJmd0OyBjYXVzZSB0aGUg
cHN0YXQgc2hvd3MgYWJub3JtYWwsIHdlIGhhdmUgdG8gY29tbWVudCB0aGlzIGxpbmUgb2YgY29k
ZS4gSG93ZXZlciw8YnI+CiZndDsgaXQgbG9va3MgdG9vIHJvdWdoLjxicj4KJmd0Ozxicj4KJmd0
OyBTaWduZWQtb2ZmLWJ5OiBaaGFveWFuZyBIdWFuZyAmbHQ7PGEgaHJlZj0ibWFpbHRvOnpoYW95
YW5nLmh1YW5nQGxpbmFyby5vcmciPnpoYW95YW5nLmh1YW5nQGxpbmFyby5vcmc8L2E+Jmd0Ozxi
cj4KJmd0OyAtLS08YnI+CiZndDvCoCBzcmMvbWFpbi5jcHAgfMKgIMKgIDcgKysrKysrKzxicj4K
Jmd0O8KgIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyk8YnI+CiZndDs8YnI+CiZndDsg
ZGlmZiAtLWdpdCBhL3NyYy9tYWluLmNwcCBiL3NyYy9tYWluLmNwcDxicj4KJmd0OyBpbmRleCAx
ZTU2YWYxLi45NTI2MDg0IDEwMDY0NDxicj4KJmd0OyAtLS0gYS9zcmMvbWFpbi5jcHA8YnI+CiZn
dDsgKysrIGIvc3JjL21haW4uY3BwPGJyPgomZ3Q7IEBAIC0yMjEsNyArMjIxLDE0IEBAIHZvaWQg
b25lX21lYXN1cmVtZW50KGludCBzZWNvbmRzLCBjaGFyICp3b3JrbG9hZCk8YnI+CiZndDvCoCDC
oCDCoCDCoGRldmljZXNfZW5kX21lYXN1cmVtZW50KCk7PGJyPgomZ3Q7wqAgwqAgwqAgwqBlbmRf
cG93ZXJfbWVhc3VyZW1lbnQoKTs8YnI+CiZndDs8YnI+CiZndDsgK8KgIMKgIMKgLyo8YnI+CiZn
dDsgK8KgIMKgIMKgRklYIE1FOmFsbCBjaGlsZHJlbiBjcHUmIzM5O3MgcHN0YXQgZGF0YSB3aWxs
IGJlIGNsZWFyZWQgaW4gcHJvY2Vzc19jcHVfZGF0YSx3aGljaDxicj4KJmd0OyArwqAgwqAgwqBj
YXVzZSB0aGUgcHN0YXQgc2hvd3MgYWJub3JtYWwsIHdlIGhhdmUgdG8gY29tbWVudCB0aGlzIGxp
bmUgb2YgY29kZS4gSG93ZXZlciw8YnI+CiZndDsgK8KgIMKgIMKgaXQgbG9va3MgdG8gcm91Z2g8
YnI+CiZndDsgK8KgIMKgIMKgKi88YnI+CiZndDsgK8KgIMKgIMKgLyo8YnI+CiZndDvCoCDCoCDC
oCDCoHByb2Nlc3NfY3B1X2RhdGEoKTs8YnI+CiZndDsgK8KgIMKgIMKgKi88YnI+CiZndDvCoCDC
oCDCoCDCoHByb2Nlc3NfcHJvY2Vzc19kYXRhKCk7PGJyPgomZ3Q7PGJyPgomZ3Q7wqAgwqAgwqAg
wqAvKiBvdXRwdXQgc3RhdHMgKi88YnI+CiZndDsgLS08YnI+CiZndDsgMS43LjkuNTxicj4KJmd0
Ozxicj4KPGJyPgo8L2Rpdj48L2Rpdj5EaWQgeW91IHNlZSB0aGUgaXNzdWUgb24gQW5kcm9pZD8g
Q291bGQgeW91IGdpdmUgbWUgbW9yZSBkZXRhaWxzPyBNYXliZSBJIGNhbiB0cnkgdG8gcmUtcHJv
ZHVjZSBpdCBvbiBteSBlbmQuPGJyPgo8c3BhbiBjbGFzcz0iSE9FblpiIj48Zm9udCBjb2xvcj0i
Izg4ODg4OCI+PGJyPgotLTxicj4KRGFuaWVsIExldW5nICZsdDs8YSBocmVmPSJtYWlsdG86ZGFu
aWVsLmxldW5nQGxpbnV4LmludGVsLmNvbSI+ZGFuaWVsLmxldW5nQGxpbnV4LmludGVsLmNvbTwv
YT4mZ3Q7PGJyPgo8L2ZvbnQ+PC9zcGFuPjwvYmxvY2txdW90ZT48L2Rpdj48YnI+PC9kaXY+Cg==

--===============4352407583736868632==--

