Content-Type: multipart/mixed; boundary="===============7021050237250484712=="
MIME-Version: 1.0
From: sheepdestroyer <sheepdestroyer at gmail.com>
Subject: Re: [Powertop] [Announce] PowerTOP v2.8-rc4
Date: Sat, 31 Oct 2015 20:03:23 +0900
Message-ID: <CAPU6dhA4XV7gazeFAtHfvg6tnW4EjsjkZhBEqsOvHLt6cjb3Pw@mail.gmail.com>
In-Reply-To: 56340DA4.7010402@linux.intel.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============7021050237250484712==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi,

 just tested RC4 on Fedora 22.
I still get the same weird message (unknown op '{'):

[sheepdestroyer(a)sheepora powertop-2.8-rc4] $ sudo powertop --auto-tune
Loaded 750 prior measurements
RAPL device for cpu 0
RAPL Using PowerCap Sysfs : Domain Mask d
RAPL device for cpu 0
RAPL Using PowerCap Sysfs : Domain Mask d
RAPL device for cpu 0
RAPL Using PowerCap Sysfs : Domain Mask d
Devfreq not enabled
  unknown op '{'
Leaving PowerTOP
[sheepdestroyer(a)sheepora powertop-2.8-rc4] $


Best,

On Sat, Oct 31, 2015 at 9:39 AM, Alexandra Yates <
alexandra.yates(a)linux.intel.com> wrote:

> This contains the accepted patches from mailing list. Some bug fixes, and
> version string changes.  Please give it a test.
>
> --
> Thank you,
> <Alexandra>
> _______________________________________________
> PowerTop mailing list
> PowerTop(a)lists.01.org
> https://lists.01.org/mailman/listinfo/powertop
>

--===============7021050237250484712==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PGRpdiBkaXI9Imx0ciI+SGksPGRpdj48YnI+PC9kaXY+PGRpdj7CoGp1c3QgdGVzdGVkIFJDNCBv
biBGZWRvcmEgMjIuPGRpdj5JIHN0aWxsIGdldCB0aGUgc2FtZSB3ZWlyZCBtZXNzYWdlICh1bmtu
b3duIG9wICYjMzk7eyYjMzk7KTrCoDwvZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+PGRpdj5bc2hl
ZXBkZXN0cm95ZXJAc2hlZXBvcmEgcG93ZXJ0b3AtMi44LXJjNF0gJCBzdWRvIHBvd2VydG9wIC0t
YXV0by10dW5lPC9kaXY+PGRpdj5Mb2FkZWQgNzUwIHByaW9yIG1lYXN1cmVtZW50czwvZGl2Pjxk
aXY+UkFQTCBkZXZpY2UgZm9yIGNwdSAwPC9kaXY+PGRpdj5SQVBMIFVzaW5nIFBvd2VyQ2FwIFN5
c2ZzIDogRG9tYWluIE1hc2sgZDwvZGl2PjxkaXY+UkFQTCBkZXZpY2UgZm9yIGNwdSAwPC9kaXY+
PGRpdj5SQVBMIFVzaW5nIFBvd2VyQ2FwIFN5c2ZzIDogRG9tYWluIE1hc2sgZDwvZGl2PjxkaXY+
UkFQTCBkZXZpY2UgZm9yIGNwdSAwPC9kaXY+PGRpdj5SQVBMIFVzaW5nIFBvd2VyQ2FwIFN5c2Zz
IDogRG9tYWluIE1hc2sgZDwvZGl2PjxkaXY+RGV2ZnJlcSBub3QgZW5hYmxlZDwvZGl2PjxkaXY+
wqAgdW5rbm93biBvcCAmIzM5O3smIzM5OzwvZGl2PjxkaXY+TGVhdmluZyBQb3dlclRPUDwvZGl2
PjxkaXY+W3NoZWVwZGVzdHJveWVyQHNoZWVwb3JhIHBvd2VydG9wLTIuOC1yYzRdICTCoDwvZGl2
PjwvZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+QmVzdCw8L2Rpdj48L2Rp
dj48L2Rpdj48ZGl2IGNsYXNzPSJnbWFpbF9leHRyYSI+PGJyPjxkaXYgY2xhc3M9ImdtYWlsX3F1
b3RlIj5PbiBTYXQsIE9jdCAzMSwgMjAxNSBhdCA5OjM5IEFNLCBBbGV4YW5kcmEgWWF0ZXMgPHNw
YW4gZGlyPSJsdHIiPiZsdDs8YSBocmVmPSJtYWlsdG86YWxleGFuZHJhLnlhdGVzQGxpbnV4Lmlu
dGVsLmNvbSIgdGFyZ2V0PSJfYmxhbmsiPmFsZXhhbmRyYS55YXRlc0BsaW51eC5pbnRlbC5jb208
L2E+Jmd0Ozwvc3Bhbj4gd3JvdGU6PGJyPjxibG9ja3F1b3RlIGNsYXNzPSJnbWFpbF9xdW90ZSIg
c3R5bGU9Im1hcmdpbjowIDAgMCAuOGV4O2JvcmRlci1sZWZ0OjFweCAjY2NjIHNvbGlkO3BhZGRp
bmctbGVmdDoxZXgiPlRoaXMgY29udGFpbnMgdGhlIGFjY2VwdGVkIHBhdGNoZXMgZnJvbSBtYWls
aW5nIGxpc3QuIFNvbWUgYnVnIGZpeGVzLCBhbmQgdmVyc2lvbiBzdHJpbmcgY2hhbmdlcy7CoCBQ
bGVhc2UgZ2l2ZSBpdCBhIHRlc3QuPHNwYW4gY2xhc3M9IkhPRW5aYiI+PGZvbnQgY29sb3I9IiM4
ODg4ODgiPjxicj4KPGJyPgotLSA8YnI+ClRoYW5rIHlvdSw8YnI+CiZsdDtBbGV4YW5kcmEmZ3Q7
PGJyPgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXzxicj4K
UG93ZXJUb3AgbWFpbGluZyBsaXN0PGJyPgo8YSBocmVmPSJtYWlsdG86UG93ZXJUb3BAbGlzdHMu
MDEub3JnIiB0YXJnZXQ9Il9ibGFuayI+UG93ZXJUb3BAbGlzdHMuMDEub3JnPC9hPjxicj4KPGEg
aHJlZj0iaHR0cHM6Ly9saXN0cy4wMS5vcmcvbWFpbG1hbi9saXN0aW5mby9wb3dlcnRvcCIgcmVs
PSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0cHM6Ly9saXN0cy4wMS5vcmcvbWFpbG1h
bi9saXN0aW5mby9wb3dlcnRvcDwvYT48YnI+CjwvZm9udD48L3NwYW4+PC9ibG9ja3F1b3RlPjwv
ZGl2Pjxicj48L2Rpdj4K

--===============7021050237250484712==--

