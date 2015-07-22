Content-Type: multipart/mixed; boundary="===============8580027061116730212=="
MIME-Version: 1.0
From: Chetan Patil <chtpatil at gmail.com>
Subject: [Powertop] PowerTop On ARM
Date: Wed, 22 Jul 2015 18:22:40 -0500
Message-ID: <CAF0dY_tujkOi2fukNid81-YBNUS8+AueKgfBU2hWFpztsp7ivQ@mail.gmail.com>
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============8580027061116730212==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi,

I successfully compiled PowerTop 2.7 for CyanogenMod 11.0 (Android KitKat)
on Nexus 4 which has ARM running kernel version is 3.4. Perf support is
enabled with perf tool accessible via adb.

If I am correct, powertop now supports ARM, and following error tells me
that it's trying to run profiling as per x86. Also, the perf error doesn't
make sense, as I do have proper support enabled. I would appreciate any
help with this.

Also, there is a small error in patch file *update_androidmk.patch*, after
line number 417, there should be *#include <stdlib.h>, *without this the
patch doesn't work correctly.

127|root(a)mako:/ # powertop
powertop
modprobe cpufreq_stats failedmodprobe msr failedCannot load from file
/data/local/powertop/saved_results.powertop
RAPL device for cpu 0
Model-specific registers (MSR)                   not found (try enabling
CONFIG_X86_MSR).
Model-specific registers (MSR)                   not found (try enabling
CONFIG_X86_MSR).
Model-specific registers (MSR)                   not found (try enabling
CONFIG_X86_MSR).
Model-specific registers (MSR)                   not found (try enabling
CONFIG_X86_MSR).
Model-specific registers (MSR)                   not found (try enabling
CONFIG_X86_MSR).
Model-specific registers (MSR)                   not found (try enabling
CONFIG_X86_MSR).
Model-specific registers (MSR)                   not found (try enabling
CONFIG_X86_MSR).
RAPL device for cpu 0
Model-specific registers (MSR)                   not found (try enabling
CONFIG_X86_MSR).
Model-specific registers (MSR)                   not found (try enabling
CONFIG_X86_MSR).
Model-specific registers (MSR)                   not found (try enabling
CONFIG_X86_MSR).
Model-specific registers (MSR)                   not found (try enabling
CONFIG_X86_MSR).
Model-specific registers (MSR)                   not found (try enabling
CONFIG_X86_MSR).
Model-specific registers (MSR)                   not found (try enabling
CONFIG_X86_MSR).
Model-specific registers (MSR)                   not found (try enabling
CONFIG_X86_MSR).
Devfreq not enabled
trace-cmd: Not a directory
  unknown op '{'
PowerTOP v2.7 needs the kernel to support the 'perf' subsystem
as well as support for trace points in the kernel:
CONFIG_PERF_EVENTS=3Dy
CONFIG_PERF_COUNTERS=3Dy failedmodprobe msr failedCannot load from file
/data/local/powertop/sCONFIG_TRACEPOINTS=3Dyp
CONFIG_TRACING=3Dycpu 0

Thanks,
Chetan Patil

--===============8580027061116730212==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PGRpdiBkaXI9Imx0ciI+SGksPGRpdj48YnI+PC9kaXY+PGRpdj5JIHN1Y2Nlc3NmdWxseSBjb21w
aWxlZCBQb3dlclRvcCAyLjcgZm9yIEN5YW5vZ2VuTW9kIDExLjAgKEFuZHJvaWQgS2l0S2F0KSBv
biBOZXh1cyA0IHdoaWNoIGhhcyBBUk0gcnVubmluZyBrZXJuZWwgdmVyc2lvbiBpcyAzLjQuIFBl
cmYgc3VwcG9ydCBpcyBlbmFibGVkIHdpdGggcGVyZiB0b29sIGFjY2Vzc2libGUgdmlhIGFkYi48
L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2PklmIEkgYW0gY29ycmVjdCwgcG93ZXJ0b3Agbm93IHN1
cHBvcnRzIEFSTSwgYW5kIGZvbGxvd2luZyBlcnJvciB0ZWxscyBtZSB0aGF0IGl0JiMzOTtzIHRy
eWluZyB0byBydW4gcHJvZmlsaW5nIGFzIHBlciB4ODYuIEFsc28sIHRoZSBwZXJmIGVycm9yIGRv
ZXNuJiMzOTt0IG1ha2Ugc2Vuc2UsIGFzIEkgZG8gaGF2ZSBwcm9wZXIgc3VwcG9ydCBlbmFibGVk
LiBJIHdvdWxkIGFwcHJlY2lhdGUgYW55IGhlbHAgd2l0aCB0aGlzLjwvZGl2PjxkaXY+PGJyPjwv
ZGl2PjxkaXY+QWxzbywgdGhlcmUgaXMgYSBzbWFsbCBlcnJvciBpbiBwYXRjaCBmaWxlIDxiPnVw
ZGF0ZV9hbmRyb2lkbWsucGF0Y2g8L2I+LCBhZnRlciBsaW5lIG51bWJlciA0MTcsIHRoZXJlIHNo
b3VsZCBiZcKgPGI+I2luY2x1ZGUgJmx0O3N0ZGxpYi5oJmd0OywgPC9iPndpdGhvdXQgdGhpcyB0
aGUgcGF0Y2ggZG9lc24mIzM5O3Qgd29yayBjb3JyZWN0bHkuPC9kaXY+PGRpdj48YnI+PC9kaXY+
PGRpdj48ZGl2PjxkaXY+MTI3fHJvb3RAbWFrbzovICMgcG93ZXJ0b3A8L2Rpdj48ZGl2PnBvd2Vy
dG9wPC9kaXY+PGRpdj5tb2Rwcm9iZSBjcHVmcmVxX3N0YXRzIGZhaWxlZG1vZHByb2JlIG1zciBm
YWlsZWRDYW5ub3QgbG9hZCBmcm9tIGZpbGUgL2RhdGEvbG9jYWwvcG93ZXJ0b3Avc2F2ZWRfcmVz
dWx0cy5wb3dlcnRvcDwvZGl2PjxkaXY+UkFQTCBkZXZpY2UgZm9yIGNwdSAwPC9kaXY+PGRpdj5N
b2RlbC1zcGVjaWZpYyByZWdpc3RlcnMgKE1TUikgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
bm90IGZvdW5kICh0cnkgZW5hYmxpbmcgQ09ORklHX1g4Nl9NU1IpLjwvZGl2PjxkaXY+TW9kZWwt
c3BlY2lmaWMgcmVnaXN0ZXJzIChNU1IpIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIG5vdCBm
b3VuZCAodHJ5IGVuYWJsaW5nIENPTkZJR19YODZfTVNSKS48L2Rpdj48ZGl2Pk1vZGVsLXNwZWNp
ZmljIHJlZ2lzdGVycyAoTVNSKSDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBub3QgZm91bmQg
KHRyeSBlbmFibGluZyBDT05GSUdfWDg2X01TUikuPC9kaXY+PGRpdj5Nb2RlbC1zcGVjaWZpYyBy
ZWdpc3RlcnMgKE1TUikgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgbm90IGZvdW5kICh0cnkg
ZW5hYmxpbmcgQ09ORklHX1g4Nl9NU1IpLjwvZGl2PjxkaXY+TW9kZWwtc3BlY2lmaWMgcmVnaXN0
ZXJzIChNU1IpIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIG5vdCBmb3VuZCAodHJ5IGVuYWJs
aW5nIENPTkZJR19YODZfTVNSKS48L2Rpdj48ZGl2Pk1vZGVsLXNwZWNpZmljIHJlZ2lzdGVycyAo
TVNSKSDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBub3QgZm91bmQgKHRyeSBlbmFibGluZyBD
T05GSUdfWDg2X01TUikuPC9kaXY+PGRpdj5Nb2RlbC1zcGVjaWZpYyByZWdpc3RlcnMgKE1TUikg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgbm90IGZvdW5kICh0cnkgZW5hYmxpbmcgQ09ORklH
X1g4Nl9NU1IpLjwvZGl2PjxkaXY+UkFQTCBkZXZpY2UgZm9yIGNwdSAwPC9kaXY+PGRpdj5Nb2Rl
bC1zcGVjaWZpYyByZWdpc3RlcnMgKE1TUikgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgbm90
IGZvdW5kICh0cnkgZW5hYmxpbmcgQ09ORklHX1g4Nl9NU1IpLjwvZGl2PjxkaXY+TW9kZWwtc3Bl
Y2lmaWMgcmVnaXN0ZXJzIChNU1IpIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIG5vdCBmb3Vu
ZCAodHJ5IGVuYWJsaW5nIENPTkZJR19YODZfTVNSKS48L2Rpdj48ZGl2Pk1vZGVsLXNwZWNpZmlj
IHJlZ2lzdGVycyAoTVNSKSDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBub3QgZm91bmQgKHRy
eSBlbmFibGluZyBDT05GSUdfWDg2X01TUikuPC9kaXY+PGRpdj5Nb2RlbC1zcGVjaWZpYyByZWdp
c3RlcnMgKE1TUikgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgbm90IGZvdW5kICh0cnkgZW5h
YmxpbmcgQ09ORklHX1g4Nl9NU1IpLjwvZGl2PjxkaXY+TW9kZWwtc3BlY2lmaWMgcmVnaXN0ZXJz
IChNU1IpIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIG5vdCBmb3VuZCAodHJ5IGVuYWJsaW5n
IENPTkZJR19YODZfTVNSKS48L2Rpdj48ZGl2Pk1vZGVsLXNwZWNpZmljIHJlZ2lzdGVycyAoTVNS
KSDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBub3QgZm91bmQgKHRyeSBlbmFibGluZyBDT05G
SUdfWDg2X01TUikuPC9kaXY+PGRpdj5Nb2RlbC1zcGVjaWZpYyByZWdpc3RlcnMgKE1TUikgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgbm90IGZvdW5kICh0cnkgZW5hYmxpbmcgQ09ORklHX1g4
Nl9NU1IpLjwvZGl2PjxkaXY+RGV2ZnJlcSBub3QgZW5hYmxlZDwvZGl2PjxkaXY+dHJhY2UtY21k
OiBOb3QgYSBkaXJlY3Rvcnk8L2Rpdj48ZGl2PsKgIHVua25vd24gb3AgJiMzOTt7JiMzOTs8L2Rp
dj48L2Rpdj48L2Rpdj48ZGl2PjxkaXY+UG93ZXJUT1AgdjIuNyBuZWVkcyB0aGUga2VybmVsIHRv
IHN1cHBvcnQgdGhlICYjMzk7cGVyZiYjMzk7IHN1YnN5c3RlbTwvZGl2PjxkaXY+YXMgd2VsbCBh
cyBzdXBwb3J0IGZvciB0cmFjZSBwb2ludHMgaW4gdGhlIGtlcm5lbDo8L2Rpdj48ZGl2PkNPTkZJ
R19QRVJGX0VWRU5UUz15PC9kaXY+PGRpdj5DT05GSUdfUEVSRl9DT1VOVEVSUz15IGZhaWxlZG1v
ZHByb2JlIG1zciBmYWlsZWRDYW5ub3QgbG9hZCBmcm9tIGZpbGUgL2RhdGEvbG9jYWwvcG93ZXJ0
b3Avc0NPTkZJR19UUkFDRVBPSU5UUz15cDwvZGl2PjxkaXY+Q09ORklHX1RSQUNJTkc9eWNwdSAw
PC9kaXY+PC9kaXY+PGRpdj48YnIgY2xlYXI9ImFsbCI+PGRpdj48ZGl2IGNsYXNzPSJnbWFpbF9z
aWduYXR1cmUiPjxkaXYgZGlyPSJsdHIiPjxkaXY+VGhhbmtzLDwvZGl2PjxkaXY+Q2hldGFuIFBh
dGlsPC9kaXY+PC9kaXY+PC9kaXY+PC9kaXY+CjwvZGl2PjwvZGl2Pgo=

--===============8580027061116730212==--

