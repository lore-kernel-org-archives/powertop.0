Content-Type: multipart/mixed; boundary="===============2013667250589660019=="
MIME-Version: 1.0
From: Salman Ahmed <salman0yam at gmail.com>
Subject: [Powertop] [PATCH] Powertop: remove unnecessary code
Date: Thu, 17 Jul 2014 13:48:01 +0600
Message-ID: <CAH0joKFt+JyWXrOR5Bz4Z0ZqEJWqtKJHO_gP1KzDzwzPF-HCqw@mail.gmail.com>
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============2013667250589660019==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

nr_open is already initialized to NR_OPEN_DEF. Removing unnecessary checking
and assignment.

Signed-off-by: Salman Ahmed <salman0yam(a)gmail.com>
---
 src/main.cpp | 2 --
 1 file changed, 2 deletions(-)

diff --git a/src/main.cpp b/src/main.cpp
index cf4e547..990bc1f 100644
--- a/src/main.cpp
+++ b/src/main.cpp
@@ -293,8 +293,6 @@ static int get_nr_open(void) {
        file.open("/proc/sys/fs/nr_open", ios::in);
        if (file) {
                file >> nr_open;
-               if (!file)
-                       nr_open =3D NR_OPEN_DEF;
                file.close();
        }
        return nr_open;
--
1.8.1.2


-- =

Thanks,
Salman Ahmed

--===============2013667250589660019==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PGRpdiBkaXI9Imx0ciI+PGRpdiBjbGFzcz0iZ21haWxfZGVmYXVsdCIgc3R5bGU+PGRpdiBjbGFz
cz0iZ21haWxfZGVmYXVsdCIgc3R5bGU+PGZvbnQgZmFjZT0idmVyZGFuYSwgc2Fucy1zZXJpZiI+
bnJfb3BlbiBpcyBhbHJlYWR5IGluaXRpYWxpemVkIHRvIE5SX09QRU5fREVGLiBSZW1vdmluZyB1
bm5lY2Vzc2FyeSBjaGVja2luZzwvZm9udD48L2Rpdj48ZGl2IGNsYXNzPSJnbWFpbF9kZWZhdWx0
IiBzdHlsZT4KPGZvbnQgZmFjZT0idmVyZGFuYSwgc2Fucy1zZXJpZiI+YW5kIGFzc2lnbm1lbnQu
PC9mb250PjwvZGl2PjxkaXYgY2xhc3M9ImdtYWlsX2RlZmF1bHQiIHN0eWxlPjxmb250IGZhY2U9
InZlcmRhbmEsIHNhbnMtc2VyaWYiPjxicj48L2ZvbnQ+PC9kaXY+PGRpdiBjbGFzcz0iZ21haWxf
ZGVmYXVsdCIgc3R5bGU+PGZvbnQgZmFjZT0idmVyZGFuYSwgc2Fucy1zZXJpZiI+U2lnbmVkLW9m
Zi1ieTogU2FsbWFuIEFobWVkICZsdDs8YSBocmVmPSJtYWlsdG86c2FsbWFuMHlhbUBnbWFpbC5j
b20iPnNhbG1hbjB5YW1AZ21haWwuY29tPC9hPiZndDs8L2ZvbnQ+PC9kaXY+CjxkaXYgY2xhc3M9
ImdtYWlsX2RlZmF1bHQiIHN0eWxlPjxmb250IGZhY2U9InZlcmRhbmEsIHNhbnMtc2VyaWYiPi0t
LTwvZm9udD48L2Rpdj48ZGl2IGNsYXNzPSJnbWFpbF9kZWZhdWx0IiBzdHlsZT48Zm9udCBmYWNl
PSJ2ZXJkYW5hLCBzYW5zLXNlcmlmIj7CoHNyYy9tYWluLmNwcCB8IDIgLS08L2ZvbnQ+PC9kaXY+
PGRpdiBjbGFzcz0iZ21haWxfZGVmYXVsdCIgc3R5bGU+PGZvbnQgZmFjZT0idmVyZGFuYSwgc2Fu
cy1zZXJpZiI+wqAxIGZpbGUgY2hhbmdlZCwgMiBkZWxldGlvbnMoLSk8L2ZvbnQ+PC9kaXY+Cjxk
aXYgY2xhc3M9ImdtYWlsX2RlZmF1bHQiIHN0eWxlPjxmb250IGZhY2U9InZlcmRhbmEsIHNhbnMt
c2VyaWYiPjxicj48L2ZvbnQ+PC9kaXY+PGRpdiBjbGFzcz0iZ21haWxfZGVmYXVsdCIgc3R5bGU+
PGZvbnQgZmFjZT0idmVyZGFuYSwgc2Fucy1zZXJpZiI+ZGlmZiAtLWdpdCBhL3NyYy9tYWluLmNw
cCBiL3NyYy9tYWluLmNwcDwvZm9udD48L2Rpdj48ZGl2IGNsYXNzPSJnbWFpbF9kZWZhdWx0IiBz
dHlsZT4KPGZvbnQgZmFjZT0idmVyZGFuYSwgc2Fucy1zZXJpZiI+aW5kZXggY2Y0ZTU0Ny4uOTkw
YmMxZiAxMDA2NDQ8L2ZvbnQ+PC9kaXY+PGRpdiBjbGFzcz0iZ21haWxfZGVmYXVsdCIgc3R5bGU+
PGZvbnQgZmFjZT0idmVyZGFuYSwgc2Fucy1zZXJpZiI+LS0tIGEvc3JjL21haW4uY3BwPC9mb250
PjwvZGl2PjxkaXYgY2xhc3M9ImdtYWlsX2RlZmF1bHQiIHN0eWxlPjxmb250IGZhY2U9InZlcmRh
bmEsIHNhbnMtc2VyaWYiPisrKyBiL3NyYy9tYWluLmNwcDwvZm9udD48L2Rpdj4KPGRpdiBjbGFz
cz0iZ21haWxfZGVmYXVsdCIgc3R5bGU+PGZvbnQgZmFjZT0idmVyZGFuYSwgc2Fucy1zZXJpZiI+
QEAgLTI5Myw4ICsyOTMsNiBAQCBzdGF0aWMgaW50IGdldF9ucl9vcGVuKHZvaWQpIHs8L2ZvbnQ+
PC9kaXY+PGRpdiBjbGFzcz0iZ21haWxfZGVmYXVsdCIgc3R5bGU+PGZvbnQgZmFjZT0idmVyZGFu
YSwgc2Fucy1zZXJpZiI+wqAgwqAgwqAgwqAgZmlsZS5vcGVuKCZxdW90Oy9wcm9jL3N5cy9mcy9u
cl9vcGVuJnF1b3Q7LCBpb3M6OmluKTs8L2ZvbnQ+PC9kaXY+CjxkaXYgY2xhc3M9ImdtYWlsX2Rl
ZmF1bHQiIHN0eWxlPjxmb250IGZhY2U9InZlcmRhbmEsIHNhbnMtc2VyaWYiPsKgIMKgIMKgIMKg
IGlmIChmaWxlKSB7PC9mb250PjwvZGl2PjxkaXYgY2xhc3M9ImdtYWlsX2RlZmF1bHQiIHN0eWxl
Pjxmb250IGZhY2U9InZlcmRhbmEsIHNhbnMtc2VyaWYiPsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IGZpbGUgJmd0OyZndDsgbnJfb3Blbjs8L2ZvbnQ+PC9kaXY+PGRpdiBjbGFzcz0iZ21haWxfZGVm
YXVsdCIgc3R5bGU+Cjxmb250IGZhY2U9InZlcmRhbmEsIHNhbnMtc2VyaWYiPi0gwqAgwqAgwqAg
wqAgwqAgwqAgwqAgaWYgKCFmaWxlKTwvZm9udD48L2Rpdj48ZGl2IGNsYXNzPSJnbWFpbF9kZWZh
dWx0IiBzdHlsZT48Zm9udCBmYWNlPSJ2ZXJkYW5hLCBzYW5zLXNlcmlmIj4tIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIG5yX29wZW4gPSBOUl9PUEVOX0RFRjs8L2ZvbnQ+PC9kaXY+
PGRpdiBjbGFzcz0iZ21haWxfZGVmYXVsdCIgc3R5bGU+Cjxmb250IGZhY2U9InZlcmRhbmEsIHNh
bnMtc2VyaWYiPsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIGZpbGUuY2xvc2UoKTs8L2ZvbnQ+PC9k
aXY+PGRpdiBjbGFzcz0iZ21haWxfZGVmYXVsdCIgc3R5bGU+PGZvbnQgZmFjZT0idmVyZGFuYSwg
c2Fucy1zZXJpZiI+wqAgwqAgwqAgwqAgfTwvZm9udD48L2Rpdj48ZGl2IGNsYXNzPSJnbWFpbF9k
ZWZhdWx0IiBzdHlsZT48Zm9udCBmYWNlPSJ2ZXJkYW5hLCBzYW5zLXNlcmlmIj7CoCDCoCDCoCDC
oCByZXR1cm4gbnJfb3Blbjs8L2ZvbnQ+PC9kaXY+CjxkaXYgY2xhc3M9ImdtYWlsX2RlZmF1bHQi
IHN0eWxlPjxmb250IGZhY2U9InZlcmRhbmEsIHNhbnMtc2VyaWYiPi0tPC9mb250PjwvZGl2Pjxk
aXYgY2xhc3M9ImdtYWlsX2RlZmF1bHQiIHN0eWxlPjxmb250IGZhY2U9InZlcmRhbmEsIHNhbnMt
c2VyaWYiPjEuOC4xLjI8L2ZvbnQ+PC9kaXY+PGRpdiBzdHlsZT0iZm9udC1mYW1pbHk6dmVyZGFu
YSxzYW5zLXNlcmlmIj48YnI+PC9kaXY+CjwvZGl2PjxkaXY+PGJyPjwvZGl2Pi0tIDxicj5UaGFu
a3MsPGJyPlNhbG1hbiBBaG1lZAo8L2Rpdj4K

--===============2013667250589660019==--

