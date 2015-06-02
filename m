Content-Type: multipart/mixed; boundary="===============4892102620658315022=="
MIME-Version: 1.0
From: Wang, Xiaolong <xiaolong.wang at intel.com>
Subject: [Powertop]  Why on some platform or OS,
 Powertop show only "idle 100%"s in the frequency page?
Date: Tue, 02 Jun 2015 08:52:17 +0000
Message-ID: <3D803AC0BEBB604B9799C45D4E4A14B70134CCD3@SHSMSX103.ccr.corp.intel.com>
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============4892102620658315022==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi PowerTop developers,
I've been testing PowerTop on various OS and platforms, and found on some p=
latforms or OS, Powertop show only "idle 100%"s in the frequency page, no o=
ther frequencies and their percentage.
For example, currently I'm test RHEL6,
        on some new client platforms, which intel_pstate is not supported y=
et, the frequencies and their percentage could be listed below idle percent=
age.
        but on the mature platforms, where intel_pstate is governing, I cou=
ld only get "idle 100%" under each Package/Core/CPU.
        (well, the "Actual" frequency under each "CPU" looks normal)
I tried Powertop 2.3 and 2.7, and had guessed it should be intel_pstate not=
 providing some necessary info to Powertop.
But it's not the case on my i5-5300U machine, it is governed by intel_pstat=
e, but shows frequencies well.
        I tried this with Powertop 2.6.1 and 2.7.
Could you help to explain, why Powertop show only "idle 100%"s in the frequ=
ency page?
Thanks~

The following is an example, captured from a Haswell-EP server:
PowerTOP 2.7      Overview   Idle stats   Frequency stats   Device stats   =
Tunables


            Package |             Core    |            CPU 0       CPU 4
                     |                     | Actual    3.2 GHz     1.9 GHz
Idle       100.0%  | Idle       100.0%   | Idle       100.0%      100.0%

                    | s         9 Core    |            CPU 1       CPU 5
                    |                     | Actual    3.4 GHz     2.3 GHz
                    | Idle       100.0%   | Idle       100.0%      100.0%

                    |             Core    |            CPU 2       CPU 6
                    |                     | Actual    2.0 GHz     2.3 GHz
                    | Idle       100.0%   | Idle       100.0%      100.0%

                    | s           Core    |            CPU 3       CPU 7
                    | s                   | Actual    2.3 GHz     2.6 GHz
                    | Idle       100.0%   | Idle       100.0%      100.0%

-Wang, Xiaolong


--===============4892102620658315022==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PGh0bWw+CjxoZWFkPgo8bWV0YSBodHRwLWVxdWl2PSJDb250ZW50LVR5cGUiIGNvbnRlbnQ9InRl
eHQvaHRtbDsgY2hhcnNldD11cy1hc2NpaSI+CjxtZXRhIG5hbWU9IkdlbmVyYXRvciIgY29udGVu
dD0iTWljcm9zb2Z0IEV4Y2hhbmdlIFNlcnZlciI+CjwhLS0gY29udmVydGVkIGZyb20gcnRmIC0t
Pgo8c3R5bGU+PCEtLSAuRW1haWxRdW90ZSB7IG1hcmdpbi1sZWZ0OiAxcHQ7IHBhZGRpbmctbGVm
dDogNHB0OyBib3JkZXItbGVmdDogIzgwMDAwMCAycHggc29saWQ7IH0gLS0+PC9zdHlsZT4KPC9o
ZWFkPgo8Ym9keT4KPGZvbnQgZmFjZT0iQ29uc29sYXMiIHNpemU9IjIiPjxzcGFuIHN0eWxlPSJm
b250LXNpemU6MTAuNXB0OyI+CjxkaXYgYWxpZ249ImxlZnQiIHN0eWxlPSJ0ZXh0LWFsaWduOmp1
c3RpZnk7Ij5IaSBQb3dlclRvcCBkZXZlbG9wZXJzLDwvZGl2Pgo8ZGl2IGFsaWduPSJsZWZ0IiBz
dHlsZT0idGV4dC1hbGlnbjpqdXN0aWZ5OyI+SSYjODIxNzt2ZSBiZWVuIHRlc3RpbmcgUG93ZXJU
b3Agb24gdmFyaW91cyBPUyBhbmQgcGxhdGZvcm1zLCBhbmQgZm91bmQgb24gc29tZSBwbGF0Zm9y
bXMgb3IgT1MsIFBvd2VydG9wIHNob3cgb25seSAmcXVvdDtpZGxlIDEwMCUmcXVvdDtzIGluIHRo
ZSBmcmVxdWVuY3kgcGFnZSwgbm8gb3RoZXIgZnJlcXVlbmNpZXMgYW5kIHRoZWlyIHBlcmNlbnRh
Z2UuPC9kaXY+CjxkaXYgYWxpZ249ImxlZnQiIHN0eWxlPSJ0ZXh0LWFsaWduOmp1c3RpZnk7Ij5G
b3IgZXhhbXBsZSwgY3VycmVudGx5IEkmIzgyMTc7bSB0ZXN0IFJIRUw2LDwvZGl2Pgo8ZGl2IGFs
aWduPSJsZWZ0IiBzdHlsZT0idGV4dC1hbGlnbjpqdXN0aWZ5OyI+PGZvbnQgZmFjZT0iVGltZXMg
TmV3IFJvbWFuIj4mbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsgPGZv
bnQgZmFjZT0iQ29uc29sYXMiPm9uIHNvbWUgbmV3IGNsaWVudCBwbGF0Zm9ybXMsIDwvZm9udD48
Zm9udCBmYWNlPSJDb25zb2xhcyI+d2hpY2ggaW50ZWxfcHN0YXRlIGlzIG5vdCBzdXBwb3J0ZWQg
eWV0LCB0aGUgZnJlcXVlbmNpZXMgYW5kIHRoZWlyIHBlcmNlbnRhZ2UgY291bGQgYmUgbGlzdGVk
CmJlbG93IGlkbGUgcGVyY2VudGFnZS48L2ZvbnQ+PC9mb250PjwvZGl2Pgo8ZGl2IGFsaWduPSJs
ZWZ0IiBzdHlsZT0idGV4dC1hbGlnbjpqdXN0aWZ5OyI+PGZvbnQgZmFjZT0iVGltZXMgTmV3IFJv
bWFuIj4mbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsgPGZvbnQgZmFj
ZT0iQ29uc29sYXMiPmJ1dCBvbiA8L2ZvbnQ+PGZvbnQgZmFjZT0iQ29uc29sYXMiPnRoZSA8L2Zv
bnQ+PGZvbnQgZmFjZT0iQ29uc29sYXMiPm1hdHVyZSBwbGF0Zm9ybXMsIHdoZXJlIGludGVsX3Bz
dGF0ZSBpcyBnb3Zlcm5pbmcsIEkgY291bGQgb25seSBnZXQgJiM4MjIwO2lkbGUgMTAwJSYjODIy
MTsgPC9mb250Pjxmb250IGZhY2U9IkNvbnNvbGFzIj51bmRlcjwvZm9udD48Zm9udCBmYWNlPSJD
b25zb2xhcyI+CmVhY2ggUGFja2FnZS9Db3JlL0NQVS48L2ZvbnQ+PC9mb250PjwvZGl2Pgo8ZGl2
IGFsaWduPSJsZWZ0IiBzdHlsZT0idGV4dC1hbGlnbjpqdXN0aWZ5OyI+PGZvbnQgZmFjZT0iVGlt
ZXMgTmV3IFJvbWFuIj4mbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsg
PGZvbnQgZmFjZT0iQ29uc29sYXMiPih3ZWxsLCB0aGUgJiM4MjIwO0FjdHVhbCYjODIyMTsgZnJl
cXVlbmN5IHVuZGVyIGVhY2ggJiM4MjIwO0NQVSYjODIyMTsgbG9va3Mgbm9ybWFsKTwvZm9udD48
L2ZvbnQ+PC9kaXY+CjxkaXYgYWxpZ249ImxlZnQiIHN0eWxlPSJ0ZXh0LWFsaWduOmp1c3RpZnk7
Ij5JIHRyaWVkIFBvd2VydG9wIDIuMyBhbmQgMi43LCBhbmQgaGFkIGd1ZXNzZWQgaXQgc2hvdWxk
IGJlIGludGVsX3BzdGF0ZSBub3QgcHJvdmlkaW5nIHNvbWUgbmVjZXNzYXJ5IGluZm8gdG8gUG93
ZXJ0b3AuPC9kaXY+CjxkaXYgYWxpZ249ImxlZnQiIHN0eWxlPSJ0ZXh0LWFsaWduOmp1c3RpZnk7
Ij5CdXQgaXQmIzgyMTc7cyBub3QgdGhlIGNhc2Ugb24gbXkgaTUtNTMwMFUgbWFjaGluZSwgaXQg
aXMgZ292ZXJuZWQgYnkgaW50ZWxfcHN0YXRlLCBidXQgc2hvd3MgZnJlcXVlbmNpZXMgd2VsbC48
L2Rpdj4KPGRpdiBhbGlnbj0ibGVmdCIgc3R5bGU9InRleHQtYWxpZ246anVzdGlmeTsiPjxmb250
IGZhY2U9IlRpbWVzIE5ldyBSb21hbiI+Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5i
c3A7Jm5ic3A7IDxmb250IGZhY2U9IkNvbnNvbGFzIj5JIHRyaWVkIHRoaXMgd2l0aCBQb3dlcnRv
cCAyLjYuMSBhbmQgMi43LjwvZm9udD48L2ZvbnQ+PC9kaXY+CjxkaXYgYWxpZ249ImxlZnQiIHN0
eWxlPSJ0ZXh0LWFsaWduOmp1c3RpZnk7Ij5Db3VsZCB5b3UgaGVscCB0byBleHBsYWluLCB3aHkg
UG93ZXJ0b3Agc2hvdyBvbmx5ICZxdW90O2lkbGUgMTAwJSZxdW90O3MgaW4gdGhlIGZyZXF1ZW5j
eSBwYWdlPzwvZGl2Pgo8ZGl2IGFsaWduPSJsZWZ0IiBzdHlsZT0idGV4dC1hbGlnbjpqdXN0aWZ5
OyI+VGhhbmtzfjwvZGl2Pgo8ZGl2IGFsaWduPSJsZWZ0IiBzdHlsZT0idGV4dC1hbGlnbjpqdXN0
aWZ5OyI+Jm5ic3A7PC9kaXY+CjxkaXYgYWxpZ249ImxlZnQiIHN0eWxlPSJ0ZXh0LWFsaWduOmp1
c3RpZnk7Ij5UaGUgZm9sbG93aW5nIGlzIGFuIGV4YW1wbGUsIGNhcHR1cmVkIGZyb20gYSBIYXN3
ZWxsLUVQIHNlcnZlcjo8L2Rpdj4KPGRpdiBhbGlnbj0ibGVmdCIgc3R5bGU9InRleHQtYWxpZ246
anVzdGlmeTsiPlBvd2VyVE9QIDIuNyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyBPdmVy
dmlldyZuYnNwOyZuYnNwOyBJZGxlIHN0YXRzJm5ic3A7Jm5ic3A7IEZyZXF1ZW5jeSBzdGF0cyZu
YnNwOyZuYnNwOyBEZXZpY2Ugc3RhdHMmbmJzcDsmbmJzcDsgVHVuYWJsZXMmbmJzcDsmbmJzcDsm
bmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJz
cDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsm
bmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJz
cDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsgPC9kaXY+CjxkaXYgYWxpZ249ImxlZnQi
IHN0eWxlPSJ0ZXh0LWFsaWduOmp1c3RpZnk7Ij4mbmJzcDs8L2Rpdj4KPGRpdiBhbGlnbj0ibGVm
dCIgc3R5bGU9InRleHQtYWxpZ246anVzdGlmeTsiPiZuYnNwOzwvZGl2Pgo8ZGl2IGFsaWduPSJs
ZWZ0IiBzdHlsZT0idGV4dC1hbGlnbjpqdXN0aWZ5OyI+Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7
Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7IFBhY2thZ2UgfCZuYnNw
OyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZu
YnNwOyZuYnNwOyBDb3JlJm5ic3A7Jm5ic3A7Jm5ic3A7IHwmbmJzcDsmbmJzcDsmbmJzcDsmbmJz
cDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsgQ1BVIDAmbmJzcDsm
bmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsgQ1BVIDQ8L2Rpdj4KPGRpdiBhbGlnbj0ibGVm
dCIgc3R5bGU9InRleHQtYWxpZ246anVzdGlmeTsiPiAgJm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7
Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5i
c3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7IHwmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJz
cDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsm
bmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsgfCBBY3R1YWwmbmJzcDsmbmJzcDsm
bmJzcDsgMy4yIEdIeiZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyAxLjkgR0h6PC9kaXY+CjxkaXYg
YWxpZ249ImxlZnQiIHN0eWxlPSJ0ZXh0LWFsaWduOmp1c3RpZnk7Ij5JZGxlJm5ic3A7Jm5ic3A7
Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7IDEwMC4wJSZuYnNwOyB8IElkbGUmbmJzcDsmbmJzcDsm
bmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsgMTAwLjAlJm5ic3A7Jm5ic3A7IHwgSWRsZSZuYnNwOyZu
YnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyAxMDAuMCUmbmJzcDsmbmJzcDsmbmJzcDsmbmJz
cDsmbmJzcDsgMTAwLjAlPC9kaXY+CjxkaXYgYWxpZ249ImxlZnQiIHN0eWxlPSJ0ZXh0LWFsaWdu
Omp1c3RpZnk7Ij4mbmJzcDs8L2Rpdj4KPGRpdiBhbGlnbj0ibGVmdCIgc3R5bGU9InRleHQtYWxp
Z246anVzdGlmeTsiPiZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZu
YnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNw
OyZuYnNwOyZuYnNwOyB8IHMmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJz
cDsmbmJzcDsgOSBDb3JlJm5ic3A7Jm5ic3A7Jm5ic3A7IHwmbmJzcDsmbmJzcDsmbmJzcDsmbmJz
cDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsgQ1BVIDEmbmJzcDsm
bmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsgQ1BVIDU8L2Rpdj4KPGRpdiBhbGlnbj0ibGVm
dCIgc3R5bGU9InRleHQtYWxpZ246anVzdGlmeTsiPiZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZu
YnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNw
OyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyB8Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7
Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5i
c3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7IHwgQWN0dWFsJm5ic3A7Jm5i
c3A7Jm5ic3A7IDMuNCBHSHombmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsgMi4zIEdIejwvZGl2Pgo8
ZGl2IGFsaWduPSJsZWZ0IiBzdHlsZT0idGV4dC1hbGlnbjpqdXN0aWZ5OyI+Jm5ic3A7Jm5ic3A7
Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5i
c3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7IHwgSWRsZSZuYnNw
OyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyAxMDAuMCUmbmJzcDsmbmJzcDsgfCBJZGxl
Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7IDEwMC4wJSZuYnNwOyZuYnNwOyZu
YnNwOyZuYnNwOyZuYnNwOyAxMDAuMCU8L2Rpdj4KPGRpdiBhbGlnbj0ibGVmdCIgc3R5bGU9InRl
eHQtYWxpZ246anVzdGlmeTsiPiZuYnNwOzwvZGl2Pgo8ZGl2IGFsaWduPSJsZWZ0IiBzdHlsZT0i
dGV4dC1hbGlnbjpqdXN0aWZ5OyI+Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7
Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5i
c3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7IHwmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJz
cDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsgQ29yZSZuYnNwOyZuYnNwOyZu
YnNwOyB8Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5i
c3A7Jm5ic3A7Jm5ic3A7IENQVSAyJm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7
IENQVSA2PC9kaXY+CjxkaXYgYWxpZ249ImxlZnQiIHN0eWxlPSJ0ZXh0LWFsaWduOmp1c3RpZnk7
Ij4mbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsm
bmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJz
cDsgfCZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNw
OyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZu
YnNwOyZuYnNwOyB8IEFjdHVhbCZuYnNwOyZuYnNwOyZuYnNwOyAyLjAgR0h6Jm5ic3A7Jm5ic3A7
Jm5ic3A7Jm5ic3A7IDIuMyBHSHo8L2Rpdj4KPGRpdiBhbGlnbj0ibGVmdCIgc3R5bGU9InRleHQt
YWxpZ246anVzdGlmeTsiPiZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNw
OyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZu
YnNwOyZuYnNwOyZuYnNwOyB8IElkbGUmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJz
cDsgMTAwLjAlJm5ic3A7Jm5ic3A7IHwgSWRsZSZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNw
OyZuYnNwOyAxMDAuMCUmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsgMTAwLjAlPC9kaXY+
CjxkaXYgYWxpZ249ImxlZnQiIHN0eWxlPSJ0ZXh0LWFsaWduOmp1c3RpZnk7Ij4mbmJzcDs8L2Rp
dj4KPGRpdiBhbGlnbj0ibGVmdCIgc3R5bGU9InRleHQtYWxpZ246anVzdGlmeTsiPiZuYnNwOyZu
YnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNw
OyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyB8IHMmbmJz
cDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsg
Q29yZSZuYnNwOyZuYnNwOyZuYnNwOyB8Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5i
c3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7IENQVSAzJm5ic3A7Jm5ic3A7Jm5ic3A7
Jm5ic3A7Jm5ic3A7Jm5ic3A7IENQVSA3PC9kaXY+CjxkaXYgYWxpZ249ImxlZnQiIHN0eWxlPSJ0
ZXh0LWFsaWduOmp1c3RpZnk7Ij4mbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsm
bmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJz
cDsmbmJzcDsmbmJzcDsmbmJzcDsgfCBzJm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5i
c3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7
Jm5ic3A7Jm5ic3A7Jm5ic3A7IHwgQWN0dWFsJm5ic3A7Jm5ic3A7Jm5ic3A7IDIuMyBHSHombmJz
cDsmbmJzcDsmbmJzcDsmbmJzcDsgMi42IEdIejwvZGl2Pgo8ZGl2IGFsaWduPSJsZWZ0IiBzdHls
ZT0idGV4dC1hbGlnbjpqdXN0aWZ5OyI+Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5i
c3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7
Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7IHwgSWRsZSZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZu
YnNwOyZuYnNwOyAxMDAuMCUmbmJzcDsmbmJzcDsgfCBJZGxlJm5ic3A7Jm5ic3A7Jm5ic3A7Jm5i
c3A7Jm5ic3A7Jm5ic3A7IDEwMC4wJSZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyAxMDAu
MCU8L2Rpdj4KPGRpdiBhbGlnbj0ibGVmdCIgc3R5bGU9InRleHQtYWxpZ246anVzdGlmeTsiPjxm
b250IGZhY2U9IlRpbWVzIE5ldyBSb21hbiI+Jm5ic3A7PC9mb250PjwvZGl2Pgo8ZGl2IGFsaWdu
PSJsZWZ0IiBzdHlsZT0idGV4dC1hbGlnbjpqdXN0aWZ5OyI+LVdhbmcsIFhpYW9sb25nPC9kaXY+
CjxkaXYgYWxpZ249ImxlZnQiIHN0eWxlPSJ0ZXh0LWFsaWduOmp1c3RpZnk7Ij48Zm9udCBmYWNl
PSJUaW1lcyBOZXcgUm9tYW4iPiZuYnNwOzwvZm9udD48L2Rpdj4KPC9zcGFuPjwvZm9udD4KPC9i
b2R5Pgo8L2h0bWw+Cg==

--===============4892102620658315022==--

