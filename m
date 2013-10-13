Content-Type: multipart/mixed; boundary="===============7202238355853654685=="
MIME-Version: 1.0
From: David Rosca <nowrep at gmail.com>
Subject: Re: [Powertop] [PATCH] Fixed cpu_core::has_c1_res initialization.
Date: Sun, 13 Oct 2013 19:41:28 +0200
Message-ID: <CAM7PDojA73CEVeR39a6ndkXYcc1G_ypVe4+nHbOd8_EjYYkopg@mail.gmail.com>
In-Reply-To: 20131013143004.GA2563@swordfish
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============7202238355853654685==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Oops, gmail screw it ...
Hope it will be ok this time:

PS: Sorry, I sent the first reply only to Sergey.

Signed-off-by: David Rosca <nowrep(a)gmail.com>


---
 src/cpu/intel_cpus.cpp | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/src/cpu/intel_cpus.cpp b/src/cpu/intel_cpus.cpp
index 3348dba..6330b6f 100644
--- a/src/cpu/intel_cpus.cpp
+++ b/src/cpu/intel_cpus.cpp
@@ -101,8 +101,10 @@ nhm_core::nhm_core(int model)
     if (model =3D=3D 0x37) {
         has_c3_res =3D 0;
         has_c1_res =3D 1;
-    } else
+    } else {
         has_c3_res =3D 1;
+        has_c1_res =3D 0;
+    }
 }

 void nhm_core::measurement_start(
void)
--
1.8.4.rc3


2013/10/13 Sergey Senozhatsky <sergey.senozhatsky(a)gmail.com>

> On (10/13/13 12:45), David Rosca wrote:
> > Date: Sun, 13 Oct 2013 12:45:05 +0200
> > From: David Rosca <nowrep(a)gmail.com>
> > To: powertop(a)lists.01.org
> > Subject: [Powertop] [PATCH] Fixed cpu_core::has_c1_res initialization.
> >
> >    This is regression from 8d6e716
> >
> >    cpu_core::has_c1_res is left uninitialized for anything other than
> BYT-M,
> >    resulting in error at startup:
> >
> >      unknown op '{'
> >                    read_msr cpu0 0x660 : Argument list too long.
> >
> >    Signed-off-by: David Rosca <[1]nowrep(a)gmail.com>
> >
> >    ---
> >     src/cpu/intel_cpus.cpp | 4 +++-
> >     1 file changed, 3 insertions(+), 1 deletion(-)
> >
> >    diff --git a/src/cpu/intel_cpus.cpp b/src/cpu/intel_cpus.cpp
> >    index 3348dba..6330b6f 100644
> >    --- a/src/cpu/intel_cpus.cpp
> >    +++ b/src/cpu/intel_cpus.cpp
> >    @@ -101,8 +101,10 @@ nhm_core::nhm_core(int model)
> >         if (model =3D=3D 0x37) {
> >             has_c3_res =3D 0;
> >             has_c1_res =3D 1;
> >    -    } else
> >    +    } else {
> >             has_c3_res =3D 1;
> >    +                has_c1_res =3D 0;
>         ^^^^^^^^^^^^^^^^
>
> >    +        }
>         ^^^^^^
> >     }
>
> good catch.
>
> could you please use original code indentation?
>
>         -ss
>
> >
> >     void nhm_core::measurement_start(void)
> >    --
> >    1.8.4.rc3
> >
> > References
> >
> >    Visible links
> >    1. mailto:nowrep(a)gmail.com
>
> > _______________________________________________
> > PowerTop mailing list
> > PowerTop(a)lists.01.org
> > https://lists.01.org/mailman/listinfo/powertop
>
>

--===============7202238355853654685==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PGRpdiBkaXI9Imx0ciI+PGRpdj48ZGl2Pk9vcHMsIGdtYWlsIHNjcmV3IGl0IC4uLjxicj48L2Rp
dj5Ib3BlIGl0IHdpbGwgYmUgb2sgdGhpcyB0aW1lOjxicj48YnI+PC9kaXY+UFM6IFNvcnJ5LCBJ
IHNlbnQgdGhlIGZpcnN0IHJlcGx5IG9ubHkgdG8gU2VyZ2V5Ljxicj48ZGl2Pjxicj5TaWduZWQt
b2ZmLWJ5OiBEYXZpZCBSb3NjYSAmbHQ7PGEgaHJlZj0ibWFpbHRvOm5vd3JlcEBnbWFpbC5jb20i
IHRhcmdldD0iX2JsYW5rIj5ub3dyZXBAZ21haWwuY29tPC9hPiZndDs8ZGl2IGNsYXNzPSJpbSI+
Cjxicj48YnI+LS0tPGJyPsKgc3JjL2NwdS9pbnRlbF9jcHVzLmNwcCB8IDQgKysrLTxicj4KwqAx
IGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pPGJyPjxicj5kaWZm
IC0tZ2l0IGEvc3JjL2NwdS9pbnRlbF9jcHVzLmNwcCBiL3NyYy9jcHUvaW50ZWxfY3B1cy5jcHA8
YnI+CmluZGV4IDMzNDhkYmEuLjYzMzBiNmYgMTAwNjQ0PGJyPi0tLSBhL3NyYy9jcHUvaW50ZWxf
Y3B1cy5jcHA8YnI+KysrIGIvc3JjL2NwdS9pbnRlbF9jcHVzLmNwcDxicj5AQCAtMTAxLDggKzEw
MSwxMCBAQCBuaG1fY29yZTo6bmhtX2NvcmUoaW50IG1vZGVsKTxicj7CoCDCoCDCoGlmIChtb2Rl
bCA9PSAweDM3KSB7PGJyPsKgIMKgIMKgIMKgIMKgaGFzX2MzX3JlcyA9IDA7PGJyPsKgIMKgIMKg
IMKgIMKgaGFzX2MxX3JlcyA9IDE7PGJyPgoKCi0gwqAgwqB9IGVsc2U8YnI+KyDCoCDCoH0gZWxz
ZSB7PGJyPsKgIMKgIMKgIMKgIMKgaGFzX2MzX3JlcyA9IDE7PGJyPisgwqAgwqAgwqDCoCBoYXNf
YzFfcmVzID0gMDs8YnI+PC9kaXY+KyDCoMKgIH08YnI+wqB9PGJyPsKgPGJyPsKgdm9pZCBuaG1f
Y29yZTo6bWVhc3VyZW1lbnRfc3RhcnQoPGRpdiBkaXI9Imx0ciI+dm9pZCk8YnI+LS08YnI+MS44
LjQucmMzPC9kaXY+PC9kaXY+PC9kaXY+PGRpdiBjbGFzcz0iZ21haWxfZXh0cmEiPgo8YnI+PGJy
PjxkaXYgY2xhc3M9ImdtYWlsX3F1b3RlIj4yMDEzLzEwLzEzIFNlcmdleSBTZW5vemhhdHNreSA8
c3BhbiBkaXI9Imx0ciI+Jmx0OzxhIGhyZWY9Im1haWx0bzpzZXJnZXkuc2Vub3poYXRza3lAZ21h
aWwuY29tIiB0YXJnZXQ9Il9ibGFuayI+c2VyZ2V5LnNlbm96aGF0c2t5QGdtYWlsLmNvbTwvYT4m
Z3Q7PC9zcGFuPjxicj48YmxvY2txdW90ZSBjbGFzcz0iZ21haWxfcXVvdGUiIHN0eWxlPSJtYXJn
aW46MCAwIDAgLjhleDtib3JkZXItbGVmdDoxcHggI2NjYyBzb2xpZDtwYWRkaW5nLWxlZnQ6MWV4
Ij4KT24gKDEwLzEzLzEzIDEyOjQ1KSwgRGF2aWQgUm9zY2Egd3JvdGU6PGJyPgomZ3Q7IERhdGU6
IFN1biwgMTMgT2N0IDIwMTMgMTI6NDU6MDUgKzAyMDA8YnI+CiZndDsgRnJvbTogRGF2aWQgUm9z
Y2EgJmx0OzxhIGhyZWY9Im1haWx0bzpub3dyZXBAZ21haWwuY29tIj5ub3dyZXBAZ21haWwuY29t
PC9hPiZndDs8YnI+CiZndDsgVG86IDxhIGhyZWY9Im1haWx0bzpwb3dlcnRvcEBsaXN0cy4wMS5v
cmciPnBvd2VydG9wQGxpc3RzLjAxLm9yZzwvYT48YnI+CiZndDsgU3ViamVjdDogW1Bvd2VydG9w
XSBbUEFUQ0hdIEZpeGVkIGNwdV9jb3JlOjpoYXNfYzFfcmVzIGluaXRpYWxpemF0aW9uLjxicj4K
PGRpdiBjbGFzcz0iaW0iPiZndDs8YnI+CiZndDsgwqAgwqBUaGlzIGlzIHJlZ3Jlc3Npb24gZnJv
bSA4ZDZlNzE2PGJyPgomZ3Q7PGJyPgomZ3Q7IMKgIMKgY3B1X2NvcmU6Omhhc19jMV9yZXMgaXMg
bGVmdCB1bmluaXRpYWxpemVkIGZvciBhbnl0aGluZyBvdGhlciB0aGFuIEJZVC1NLDxicj4KJmd0
OyDCoCDCoHJlc3VsdGluZyBpbiBlcnJvciBhdCBzdGFydHVwOjxicj4KJmd0Ozxicj4KJmd0OyDC
oCDCoMKgIHVua25vd24gb3AgJiMzOTt7JiMzOTs8YnI+CiZndDsgwqAgwqDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCByZWFkX21zciBjcHUwIDB4NjYwIDogQXJndW1lbnQgbGlzdCB0b28gbG9uZy48
YnI+CiZndDs8YnI+CjwvZGl2PiZndDsgwqAgwqBTaWduZWQtb2ZmLWJ5OiBEYXZpZCBSb3NjYSAm
bHQ7WzFdPGEgaHJlZj0ibWFpbHRvOm5vd3JlcEBnbWFpbC5jb20iPm5vd3JlcEBnbWFpbC5jb208
L2E+Jmd0Ozxicj4KPGRpdiBjbGFzcz0iaW0iPiZndDs8YnI+CiZndDsgwqAgwqAtLS08YnI+CiZn
dDsgwqAgwqDCoHNyYy9jcHUvaW50ZWxfY3B1cy5jcHAgfCA0ICsrKy08YnI+CiZndDsgwqAgwqDC
oDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSk8YnI+CiZndDs8
YnI+CiZndDsgwqAgwqBkaWZmIC0tZ2l0IGEvc3JjL2NwdS9pbnRlbF9jcHVzLmNwcCBiL3NyYy9j
cHUvaW50ZWxfY3B1cy5jcHA8YnI+CiZndDsgwqAgwqBpbmRleCAzMzQ4ZGJhLi42MzMwYjZmIDEw
MDY0NDxicj4KJmd0OyDCoCDCoC0tLSBhL3NyYy9jcHUvaW50ZWxfY3B1cy5jcHA8YnI+CiZndDsg
wqAgwqArKysgYi9zcmMvY3B1L2ludGVsX2NwdXMuY3BwPGJyPgomZ3Q7IMKgIMKgQEAgLTEwMSw4
ICsxMDEsMTAgQEAgbmhtX2NvcmU6Om5obV9jb3JlKGludCBtb2RlbCk8YnI+CiZndDsgwqAgwqDC
oCDCoCDCoGlmIChtb2RlbCA9PSAweDM3KSB7PGJyPgomZ3Q7IMKgIMKgwqAgwqAgwqAgwqAgwqBo
YXNfYzNfcmVzID0gMDs8YnI+CiZndDsgwqAgwqDCoCDCoCDCoCDCoCDCoGhhc19jMV9yZXMgPSAx
Ozxicj4KJmd0OyDCoCDCoC0gwqAgwqB9IGVsc2U8YnI+CiZndDsgwqAgwqArIMKgIMKgfSBlbHNl
IHs8YnI+CiZndDsgwqAgwqDCoCDCoCDCoCDCoCDCoGhhc19jM19yZXMgPSAxOzxicj4KJmd0OyDC
oCDCoCsgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBoYXNfYzFfcmVzID0gMDs8YnI+CjwvZGl2PsKg
IMKgIMKgIMKgIF5eXl5eXl5eXl5eXl5eXl48YnI+Cjxicj4KJmd0OyDCoCDCoCsgwqAgwqAgwqAg
wqB9PGJyPgrCoCDCoCDCoCDCoCBeXl5eXl48YnI+CiZndDsgwqAgwqDCoH08YnI+Cjxicj4KZ29v
ZCBjYXRjaC48YnI+Cjxicj4KY291bGQgeW91IHBsZWFzZSB1c2Ugb3JpZ2luYWwgY29kZSBpbmRl
bnRhdGlvbj88YnI+Cjxicj4KwqAgwqAgwqAgwqAgLXNzPGJyPgo8ZGl2IGNsYXNzPSJpbSI+PGJy
PgomZ3Q7IMKgIMKgwqA8YnI+CiZndDsgwqAgwqDCoHZvaWQgbmhtX2NvcmU6Om1lYXN1cmVtZW50
X3N0YXJ0KHZvaWQpPGJyPgomZ3Q7IMKgIMKgLS08YnI+CiZndDsgwqAgwqAxLjguNC5yYzM8YnI+
CiZndDs8YnI+CjwvZGl2PiZndDsgUmVmZXJlbmNlczxicj4KJmd0Ozxicj4KJmd0OyDCoCDCoFZp
c2libGUgbGlua3M8YnI+CiZndDsgwqAgwqAxLiBtYWlsdG86PGEgaHJlZj0ibWFpbHRvOm5vd3Jl
cEBnbWFpbC5jb20iPm5vd3JlcEBnbWFpbC5jb208L2E+PGJyPgo8YnI+CiZndDsgX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX188YnI+CiZndDsgUG93ZXJUb3Ag
bWFpbGluZyBsaXN0PGJyPgomZ3Q7IDxhIGhyZWY9Im1haWx0bzpQb3dlclRvcEBsaXN0cy4wMS5v
cmciPlBvd2VyVG9wQGxpc3RzLjAxLm9yZzwvYT48YnI+CiZndDsgPGEgaHJlZj0iaHR0cHM6Ly9s
aXN0cy4wMS5vcmcvbWFpbG1hbi9saXN0aW5mby9wb3dlcnRvcCIgdGFyZ2V0PSJfYmxhbmsiPmh0
dHBzOi8vbGlzdHMuMDEub3JnL21haWxtYW4vbGlzdGluZm8vcG93ZXJ0b3A8L2E+PGJyPgo8YnI+
CjwvYmxvY2txdW90ZT48L2Rpdj48YnI+PC9kaXY+Cg==

--===============7202238355853654685==--

