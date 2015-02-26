Content-Type: multipart/mixed; boundary="===============0386141068225078114=="
MIME-Version: 1.0
From: sheepdestroyer <sheepdestroyer at gmail.com>
Subject: [Powertop] building powertop from github fails on fedora 21
Date: Thu, 26 Feb 2015 14:18:54 +0900
Message-ID: <CAPU6dhD9BZxgVhboCuMwGBKuFWzJTv_Cx3hYgv3T5y_gF7=QjA@mail.gmail.com>
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============0386141068225078114==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On last git from github on my fedora system:

1- README says runing ./configure but this file does not exist
2- runing ./autogen.sh gives :

[sheepdestroyer(a)sheepora powertop-PowerTOP2.0]$ ./autogen.sh
autoreconf: Entering directory `.'
autoreconf: running: autopoint
Copying file config.rpath
Creating directory m4
Copying file m4/codeset.m4
Copying file m4/fcntl-o.m4
Copying file m4/gettext.m4
Copying file m4/glibc2.m4
Copying file m4/glibc21.m4
Copying file m4/iconv.m4
Copying file m4/intdiv0.m4
Copying file m4/intl.m4
Copying file m4/intldir.m4
Copying file m4/intlmacosx.m4
Copying file m4/intmax.m4
Copying file m4/inttypes-pri.m4
Copying file m4/inttypes_h.m4
Copying file m4/lcmessage.m4
Copying file m4/lib-ld.m4
Copying file m4/lib-link.m4
Copying file m4/lib-prefix.m4
Copying file m4/lock.m4
Copying file m4/longlong.m4
Copying file m4/nls.m4
Copying file m4/po.m4
Copying file m4/printf-posix.m4
Copying file m4/progtest.m4
Copying file m4/size_max.m4
Copying file m4/stdint_h.m4
Copying file m4/threadlib.m4
Copying file m4/uintmax_t.m4
Copying file m4/visibility.m4
Copying file m4/wchar_t.m4
Copying file m4/wint_t.m4
Copying file m4/xsize.m4
autoreconf: running: aclocal -I m4
autoreconf: configure.ac: tracing
autoreconf: running: libtoolize --copy
libtoolize: putting auxiliary files in `.'.
libtoolize: copying file `./ltmain.sh'
libtoolize: putting macros in AC_CONFIG_MACRO_DIR, `m4'.
libtoolize: copying file `m4/libtool.m4'
libtoolize: copying file `m4/ltoptions.m4'
libtoolize: copying file `m4/ltsugar.m4'
libtoolize: copying file `m4/ltversion.m4'
libtoolize: copying file `m4/lt~obsolete.m4'
autoreconf: running: /usr/bin/autoconf
autoreconf: running: /usr/bin/autoheader
autoreconf: running: automake --add-missing --copy --no-force
automake: warnings are treated as errors
configure.ac:14: warning: The 'AM_PROG_MKDIR_P' macro is deprecated, and
its use is discouraged.
configure.ac:14: You should use the Autoconf-provided 'AC_PROG_MKDIR_P'
macro instead,
configure.ac:14: and use '$(MKDIR_P)' instead of '$(mkdir_p)'in your
Makefile.am files.
configure.ac:17: installing './ar-lib'
configure.ac:14: installing './compile'
configure.ac:14: installing './config.guess'
configure.ac:14: installing './config.sub'
configure.ac:7: installing './install-sh'
configure.ac:7: installing './missing'
pevent/Makefile.am: installing './depcomp'
autoreconf: automake failed with exit status: 1

--===============0386141068225078114==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PGRpdiBkaXI9Imx0ciI+PGRpdj5PbiBsYXN0IGdpdCBmcm9tIGdpdGh1YiBvbiBteSBmZWRvcmEg
c3lzdGVtOjwvZGl2PjxkaXY+PGJyPjwvZGl2PjEtIFJFQURNRSBzYXlzIHJ1bmluZyAuL2NvbmZp
Z3VyZSBidXQgdGhpcyBmaWxlIGRvZXMgbm90IGV4aXN0PGRpdj4yLSBydW5pbmcgLi9hdXRvZ2Vu
LnNoIGdpdmVzIDo8L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2PjxkaXY+W3NoZWVwZGVzdHJveWVy
QHNoZWVwb3JhIHBvd2VydG9wLVBvd2VyVE9QMi4wXSQgLi9hdXRvZ2VuLnNoPC9kaXY+PGRpdj5h
dXRvcmVjb25mOiBFbnRlcmluZyBkaXJlY3RvcnkgYC4mIzM5OzwvZGl2PjxkaXY+YXV0b3JlY29u
ZjogcnVubmluZzogYXV0b3BvaW50PC9kaXY+PGRpdj5Db3B5aW5nIGZpbGUgY29uZmlnLnJwYXRo
PC9kaXY+PGRpdj5DcmVhdGluZyBkaXJlY3RvcnkgbTQ8L2Rpdj48ZGl2PkNvcHlpbmcgZmlsZSBt
NC9jb2Rlc2V0Lm00PC9kaXY+PGRpdj5Db3B5aW5nIGZpbGUgbTQvZmNudGwtby5tNDwvZGl2Pjxk
aXY+Q29weWluZyBmaWxlIG00L2dldHRleHQubTQ8L2Rpdj48ZGl2PkNvcHlpbmcgZmlsZSBtNC9n
bGliYzIubTQ8L2Rpdj48ZGl2PkNvcHlpbmcgZmlsZSBtNC9nbGliYzIxLm00PC9kaXY+PGRpdj5D
b3B5aW5nIGZpbGUgbTQvaWNvbnYubTQ8L2Rpdj48ZGl2PkNvcHlpbmcgZmlsZSBtNC9pbnRkaXYw
Lm00PC9kaXY+PGRpdj5Db3B5aW5nIGZpbGUgbTQvaW50bC5tNDwvZGl2PjxkaXY+Q29weWluZyBm
aWxlIG00L2ludGxkaXIubTQ8L2Rpdj48ZGl2PkNvcHlpbmcgZmlsZSBtNC9pbnRsbWFjb3N4Lm00
PC9kaXY+PGRpdj5Db3B5aW5nIGZpbGUgbTQvaW50bWF4Lm00PC9kaXY+PGRpdj5Db3B5aW5nIGZp
bGUgbTQvaW50dHlwZXMtcHJpLm00PC9kaXY+PGRpdj5Db3B5aW5nIGZpbGUgbTQvaW50dHlwZXNf
aC5tNDwvZGl2PjxkaXY+Q29weWluZyBmaWxlIG00L2xjbWVzc2FnZS5tNDwvZGl2PjxkaXY+Q29w
eWluZyBmaWxlIG00L2xpYi1sZC5tNDwvZGl2PjxkaXY+Q29weWluZyBmaWxlIG00L2xpYi1saW5r
Lm00PC9kaXY+PGRpdj5Db3B5aW5nIGZpbGUgbTQvbGliLXByZWZpeC5tNDwvZGl2PjxkaXY+Q29w
eWluZyBmaWxlIG00L2xvY2subTQ8L2Rpdj48ZGl2PkNvcHlpbmcgZmlsZSBtNC9sb25nbG9uZy5t
NDwvZGl2PjxkaXY+Q29weWluZyBmaWxlIG00L25scy5tNDwvZGl2PjxkaXY+Q29weWluZyBmaWxl
IG00L3BvLm00PC9kaXY+PGRpdj5Db3B5aW5nIGZpbGUgbTQvcHJpbnRmLXBvc2l4Lm00PC9kaXY+
PGRpdj5Db3B5aW5nIGZpbGUgbTQvcHJvZ3Rlc3QubTQ8L2Rpdj48ZGl2PkNvcHlpbmcgZmlsZSBt
NC9zaXplX21heC5tNDwvZGl2PjxkaXY+Q29weWluZyBmaWxlIG00L3N0ZGludF9oLm00PC9kaXY+
PGRpdj5Db3B5aW5nIGZpbGUgbTQvdGhyZWFkbGliLm00PC9kaXY+PGRpdj5Db3B5aW5nIGZpbGUg
bTQvdWludG1heF90Lm00PC9kaXY+PGRpdj5Db3B5aW5nIGZpbGUgbTQvdmlzaWJpbGl0eS5tNDwv
ZGl2PjxkaXY+Q29weWluZyBmaWxlIG00L3djaGFyX3QubTQ8L2Rpdj48ZGl2PkNvcHlpbmcgZmls
ZSBtNC93aW50X3QubTQ8L2Rpdj48ZGl2PkNvcHlpbmcgZmlsZSBtNC94c2l6ZS5tNDwvZGl2Pjxk
aXY+YXV0b3JlY29uZjogcnVubmluZzogYWNsb2NhbCAtSSBtNDwvZGl2PjxkaXY+YXV0b3JlY29u
ZjogPGEgaHJlZj0iaHR0cDovL2NvbmZpZ3VyZS5hYyI+Y29uZmlndXJlLmFjPC9hPjogdHJhY2lu
ZzwvZGl2PjxkaXY+YXV0b3JlY29uZjogcnVubmluZzogbGlidG9vbGl6ZSAtLWNvcHk8L2Rpdj48
ZGl2PmxpYnRvb2xpemU6IHB1dHRpbmcgYXV4aWxpYXJ5IGZpbGVzIGluIGAuJiMzOTsuPC9kaXY+
PGRpdj5saWJ0b29saXplOiBjb3B5aW5nIGZpbGUgYC4vbHRtYWluLnNoJiMzOTs8L2Rpdj48ZGl2
PmxpYnRvb2xpemU6IHB1dHRpbmcgbWFjcm9zIGluIEFDX0NPTkZJR19NQUNST19ESVIsIGBtNCYj
Mzk7LjwvZGl2PjxkaXY+bGlidG9vbGl6ZTogY29weWluZyBmaWxlIGBtNC9saWJ0b29sLm00JiMz
OTs8L2Rpdj48ZGl2PmxpYnRvb2xpemU6IGNvcHlpbmcgZmlsZSBgbTQvbHRvcHRpb25zLm00JiMz
OTs8L2Rpdj48ZGl2PmxpYnRvb2xpemU6IGNvcHlpbmcgZmlsZSBgbTQvbHRzdWdhci5tNCYjMzk7
PC9kaXY+PGRpdj5saWJ0b29saXplOiBjb3B5aW5nIGZpbGUgYG00L2x0dmVyc2lvbi5tNCYjMzk7
PC9kaXY+PGRpdj5saWJ0b29saXplOiBjb3B5aW5nIGZpbGUgYG00L2x0fm9ic29sZXRlLm00JiMz
OTs8L2Rpdj48ZGl2PmF1dG9yZWNvbmY6IHJ1bm5pbmc6IC91c3IvYmluL2F1dG9jb25mPC9kaXY+
PGRpdj5hdXRvcmVjb25mOiBydW5uaW5nOiAvdXNyL2Jpbi9hdXRvaGVhZGVyPC9kaXY+PGRpdj5h
dXRvcmVjb25mOiBydW5uaW5nOiBhdXRvbWFrZSAtLWFkZC1taXNzaW5nIC0tY29weSAtLW5vLWZv
cmNlPC9kaXY+PGRpdj5hdXRvbWFrZTogd2FybmluZ3MgYXJlIHRyZWF0ZWQgYXMgZXJyb3JzPC9k
aXY+PGRpdj48YSBocmVmPSJodHRwOi8vY29uZmlndXJlLmFjOjE0Ij5jb25maWd1cmUuYWM6MTQ8
L2E+OiB3YXJuaW5nOiBUaGUgJiMzOTtBTV9QUk9HX01LRElSX1AmIzM5OyBtYWNybyBpcyBkZXBy
ZWNhdGVkLCBhbmQgaXRzIHVzZSBpcyBkaXNjb3VyYWdlZC48L2Rpdj48ZGl2PjxhIGhyZWY9Imh0
dHA6Ly9jb25maWd1cmUuYWM6MTQiPmNvbmZpZ3VyZS5hYzoxNDwvYT46IFlvdSBzaG91bGQgdXNl
IHRoZSBBdXRvY29uZi1wcm92aWRlZCAmIzM5O0FDX1BST0dfTUtESVJfUCYjMzk7IG1hY3JvIGlu
c3RlYWQsPC9kaXY+PGRpdj48YSBocmVmPSJodHRwOi8vY29uZmlndXJlLmFjOjE0Ij5jb25maWd1
cmUuYWM6MTQ8L2E+OiBhbmQgdXNlICYjMzk7JChNS0RJUl9QKSYjMzk7IGluc3RlYWQgb2YgJiMz
OTskKG1rZGlyX3ApJiMzOTtpbiB5b3VyIE1ha2VmaWxlLmFtIGZpbGVzLjwvZGl2PjxkaXY+PGEg
aHJlZj0iaHR0cDovL2NvbmZpZ3VyZS5hYzoxNyI+Y29uZmlndXJlLmFjOjE3PC9hPjogaW5zdGFs
bGluZyAmIzM5Oy4vYXItbGliJiMzOTs8L2Rpdj48ZGl2PjxhIGhyZWY9Imh0dHA6Ly9jb25maWd1
cmUuYWM6MTQiPmNvbmZpZ3VyZS5hYzoxNDwvYT46IGluc3RhbGxpbmcgJiMzOTsuL2NvbXBpbGUm
IzM5OzwvZGl2PjxkaXY+PGEgaHJlZj0iaHR0cDovL2NvbmZpZ3VyZS5hYzoxNCI+Y29uZmlndXJl
LmFjOjE0PC9hPjogaW5zdGFsbGluZyAmIzM5Oy4vY29uZmlnLmd1ZXNzJiMzOTs8L2Rpdj48ZGl2
PjxhIGhyZWY9Imh0dHA6Ly9jb25maWd1cmUuYWM6MTQiPmNvbmZpZ3VyZS5hYzoxNDwvYT46IGlu
c3RhbGxpbmcgJiMzOTsuL2NvbmZpZy5zdWImIzM5OzwvZGl2PjxkaXY+PGEgaHJlZj0iaHR0cDov
L2NvbmZpZ3VyZS5hYzo3Ij5jb25maWd1cmUuYWM6NzwvYT46IGluc3RhbGxpbmcgJiMzOTsuL2lu
c3RhbGwtc2gmIzM5OzwvZGl2PjxkaXY+PGEgaHJlZj0iaHR0cDovL2NvbmZpZ3VyZS5hYzo3Ij5j
b25maWd1cmUuYWM6NzwvYT46IGluc3RhbGxpbmcgJiMzOTsuL21pc3NpbmcmIzM5OzwvZGl2Pjxk
aXY+cGV2ZW50L01ha2VmaWxlLmFtOiBpbnN0YWxsaW5nICYjMzk7Li9kZXBjb21wJiMzOTs8L2Rp
dj48ZGl2PmF1dG9yZWNvbmY6IGF1dG9tYWtlIGZhaWxlZCB3aXRoIGV4aXQgc3RhdHVzOiAxPC9k
aXY+PC9kaXY+PGRpdj48YnI+PC9kaXY+PC9kaXY+Cg==

--===============0386141068225078114==--

