Content-Type: multipart/mixed; boundary="===============0742334815993748031=="
MIME-Version: 1.0
From: Dennis Jenkins <dennis.jenkins.75 at gmail.com>
Subject: [Powertop] (BUG) powertop-1.13 fails to kernel-3.10.7
Date: Sat, 24 Aug 2013 09:35:09 -0500
Message-ID: <CAAEzAp-9iZSPDkntiguA9mez+xk+n0ZLbDV-N79P0s8Lx7eUgg@mail.gmail.com>
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============0742334815993748031==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello,

   I recently updated my Gentoo linux kernel from 3.8.18 to 3.10.7.
powertop now hangs while starting up.  "strace" shows that powertop is
reading the contents of "/proc/timer_list" over and over (but with no
"seek" call, which is weird to me).

ostara ~ # powertop --version
powertop version 1.13

ostara ~ # uname -r
3.10.7-gentoo

ostara ~ # zgrep TIMER /proc/config.gz
CONFIG_HIGH_RES_TIMERS=3Dy
CONFIG_TIMERFD=3Dy
CONFIG_OPROFILE_NMI_TIMER=3Dy
CONFIG_HPET_TIMER=3Dy
# CONFIG_X86_PM_TIMER is not set
CONFIG_NETFILTER_XT_TARGET_IDLETIMER=3Dm
# CONFIG_HW_RANDOM_TIMERIOMEM is not set
# CONFIG_HANGCHECK_TIMER is not set
# CONFIG_PPS_CLIENT_KTIMER is not set
CONFIG_SND_TIMER=3Dm
# CONFIG_SND_HRTIMER is not set
CONFIG_TIMER_STATS=3Dy

ostara ~ # wc /proc/timer_list
387 1569 16282 /proc/timer_list


ostara ~ # strace -e\!read powertop
(tailing...)
open("/proc/interrupts", O_RDONLY)      =3D 3
fstat(3, {st_mode=3DS_IFREG|0444, st_size=3D0, ...}) =3D 0
mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) =
=3D
0x7fcfdd7c3000
open("/proc/timer_list", O_RDONLY)      =3D 4
fstat(4, {st_mode=3DS_IFREG|0444, st_size=3D0, ...}) =3D 0
mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) =
=3D
0x7fcfdd7c2000
^CProcess 22238 detached

Now run "strace" again, but without the "-e\!read" and watch it read fd #4
over and over and over again.

If you need any additional info, please let me know.

--===============0742334815993748031==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PGRpdiBkaXI9Imx0ciI+PGRpdj48ZGl2PjxkaXY+PGRpdj5IZWxsbyw8YnI+PGJyPjwvZGl2PqCg
IEkgcmVjZW50bHkgdXBkYXRlZCBteSBHZW50b28gbGludXgga2VybmVsIGZyb20gMy44LjE4IHRv
IDMuMTAuNy6gIHBvd2VydG9wIG5vdyBoYW5ncyB3aGlsZSBzdGFydGluZyB1cC6gICZxdW90O3N0
cmFjZSZxdW90OyBzaG93cyB0aGF0IHBvd2VydG9wIGlzIHJlYWRpbmcgdGhlIGNvbnRlbnRzIG9m
ICZxdW90Oy9wcm9jL3RpbWVyX2xpc3QmcXVvdDsgb3ZlciBhbmQgb3ZlciAoYnV0IHdpdGggbm+g
ICZxdW90O3NlZWsmcXVvdDsgY2FsbCwgd2hpY2ggaXMgd2VpcmQgdG8gbWUpLjxicj4KPGJyPm9z
dGFyYSB+ICMgcG93ZXJ0b3AgLS12ZXJzaW9uPGJyPnBvd2VydG9wIHZlcnNpb24gMS4xMzxicj48
YnI+b3N0YXJhIH4gIyB1bmFtZSAtcjxicj4zLjEwLjctZ2VudG9vPGJyPjxicj5vc3RhcmEgfiAj
IHpncmVwIFRJTUVSIC9wcm9jL2NvbmZpZy5nejxicj5DT05GSUdfSElHSF9SRVNfVElNRVJTPXk8
YnI+Q09ORklHX1RJTUVSRkQ9eTxicj5DT05GSUdfT1BST0ZJTEVfTk1JX1RJTUVSPXk8YnI+CkNP
TkZJR19IUEVUX1RJTUVSPXk8YnI+IyBDT05GSUdfWDg2X1BNX1RJTUVSIGlzIG5vdCBzZXQ8YnI+
Q09ORklHX05FVEZJTFRFUl9YVF9UQVJHRVRfSURMRVRJTUVSPW08YnI+IyBDT05GSUdfSFdfUkFO
RE9NX1RJTUVSSU9NRU0gaXMgbm90IHNldDxicj4jIENPTkZJR19IQU5HQ0hFQ0tfVElNRVIgaXMg
bm90IHNldDxicj4jIENPTkZJR19QUFNfQ0xJRU5UX0tUSU1FUiBpcyBub3Qgc2V0PGJyPgpDT05G
SUdfU05EX1RJTUVSPW08YnI+IyBDT05GSUdfU05EX0hSVElNRVIgaXMgbm90IHNldDxicj5DT05G
SUdfVElNRVJfU1RBVFM9eTxicj48YnI+b3N0YXJhIH4gIyB3YyAvcHJvYy90aW1lcl9saXN0PGJy
PjM4NyAxNTY5IDE2MjgyIC9wcm9jL3RpbWVyX2xpc3Q8YnI+PGJyPjxicj5vc3RhcmEgfiAjIHN0
cmFjZSAtZVwhcmVhZCBwb3dlcnRvcDxicj48L2Rpdj4odGFpbGluZy4uLik8YnI+Cm9wZW4oJnF1
b3Q7L3Byb2MvaW50ZXJydXB0cyZxdW90OywgT19SRE9OTFkpoKCgoKAgPSAzPGJyPmZzdGF0KDMs
IHtzdF9tb2RlPVNfSUZSRUd8MDQ0NCwgc3Rfc2l6ZT0wLCAuLi59KSA9IDA8YnI+bW1hcChOVUxM
LCA0MDk2LCBQUk9UX1JFQUR8UFJPVF9XUklURSwgTUFQX1BSSVZBVEV8TUFQX0FOT05ZTU9VUywg
LTEsIDApID0gMHg3ZmNmZGQ3YzMwMDA8YnI+b3BlbigmcXVvdDsvcHJvYy90aW1lcl9saXN0JnF1
b3Q7LCBPX1JET05MWSmgoKCgoCA9IDQ8YnI+CmZzdGF0KDQsIHtzdF9tb2RlPVNfSUZSRUd8MDQ0
NCwgc3Rfc2l6ZT0wLCAuLi59KSA9IDA8YnI+bW1hcChOVUxMLCA0MDk2LCBQUk9UX1JFQUR8UFJP
VF9XUklURSwgTUFQX1BSSVZBVEV8TUFQX0FOT05ZTU9VUywgLTEsIDApID0gMHg3ZmNmZGQ3YzIw
MDA8YnI+XkNQcm9jZXNzIDIyMjM4IGRldGFjaGVkPGJyPjxicj48L2Rpdj5Ob3cgcnVuICZxdW90
O3N0cmFjZSZxdW90OyBhZ2FpbiwgYnV0IHdpdGhvdXQgdGhlICZxdW90Oy1lXCFyZWFkJnF1b3Q7
IGFuZCB3YXRjaCBpdCByZWFkIGZkICM0IG92ZXIgYW5kIG92ZXIgYW5kIG92ZXIgYWdhaW4uPGJy
Pgo8YnI+PC9kaXY+SWYgeW91IG5lZWQgYW55IGFkZGl0aW9uYWwgaW5mbywgcGxlYXNlIGxldCBt
ZSBrbm93Ljxicj48L2Rpdj4K

--===============0742334815993748031==--

