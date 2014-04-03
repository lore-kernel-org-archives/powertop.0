Content-Type: multipart/mixed; boundary="===============0834220202419117392=="
MIME-Version: 1.0
From: Tom Sherpen <tomsherpen at mail.com>
Subject: [Powertop] PowerTOP displays backlight twice
Date: Thu, 03 Apr 2014 10:59:22 -0400
Message-ID: <20140403145922.138350@gmx.com>
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============0834220202419117392==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello,

On my laptop, the display backlight is reported this:

See this screenshot: http://i.imgur.com/mP0H6hX.png =


Now I am confused. Does this mean that my actual display brightness is 4W o=
r 2W and this is only a displaying error of PowerTOP?

If the latter applies, can this be fixed so that PowerTOP only recognises o=
ne display?

I think it is related to the fact that I have two entries in  */sys/class/b=
acklight*
lrwxrwxrwx 1 root root 0 2014-04-03 07:15:06.796659660 +0200 intel_backligh=
t -> ../../devices/pci0000:00/0000:00:02.0/drm/card0/card0-LVDS-1/intel_bac=
klight lrwxrwxrwx 1 root root 0 2014-04-03 07:15:06.796659660 +0200 acpi_vi=
deo0 -> ../../devices/pci0000:00/0000:00:02.0/backlight/acpi_video0
Any help would be appreciated!

Tom

--===============0834220202419117392==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PHNwYW4gc3R5bGU9J2ZvbnQtZmFtaWx5OlZlcmRhbmEnPjxzcGFuIHN0eWxlPSdmb250LXNpemU6
MTJweCc+SGVsbG8sPGJyIC8+PGJyIC8+T24gbXkgbGFwdG9wLCB0aGUgZGlzcGxheSBiYWNrbGln
aHQgaXMgcmVwb3J0ZWQgdGhpczo8YnIgLz48YnIgLz5TZWUgdGhpcyBzY3JlZW5zaG90OiA8YSBo
cmVmPSJodHRwOi8vaS5pbWd1ci5jb20vbVAwSDZoWC5wbmciIHRhcmdldD0iX2JsYW5rIj5odHRw
Oi8vaS5pbWd1ci5jb20vbVAwSDZoWC5wbmc8L2E+PGJyIC8+PGJyIC8+Tm93IEkgYW0gY29uZnVz
ZWQuIERvZXMgdGhpcyBtZWFuIHRoYXQgbXkgYWN0dWFsIGRpc3BsYXkgYnJpZ2h0bmVzcyBpcyA0
VyBvciAyVyBhbmQgdGhpcyBpcyBvbmx5IGEgZGlzcGxheWluZyBlcnJvciBvZiBQb3dlclRPUD88
YnIgLz48YnIgLz5JZiB0aGUgbGF0dGVyIGFwcGxpZXMsIGNhbiB0aGlzIGJlIGZpeGVkIHNvIHRo
YXQgUG93ZXJUT1Agb25seSByZWNvZ25pc2VzIG9uZSBkaXNwbGF5PzxiciAvPjxiciAvPkkgdGhp
bmsgaXQgaXMgcmVsYXRlZCB0byB0aGUgZmFjdCB0aGF0IEkgaGF2ZSB0d28gZW50cmllcyBpbiA8
Yj4vc3lzL2NsYXNzL2JhY2tsaWdodDwvYj48YnIgLz7CoDxwcmU+PGNvZGU+bHJ3eHJ3eHJ3eCAx
IHJvb3Qgcm9vdCAwIDIwMTQtMDQtMDMgMDc6MTU6MDYuNzk2NjU5NjYwICswMjAwIGludGVsX2Jh
Y2tsaWdodCAtJmd0OyAuLi8uLi9kZXZpY2VzL3BjaTAwMDA6MDAvMDAwMDowMDowMi4wL2RybS9j
YXJkMC9jYXJkMC1MVkRTLTEvaW50ZWxfYmFja2xpZ2h0IApscnd4cnd4cnd4IDEgcm9vdCByb290
IDAgMjAxNC0wNC0wMyAwNzoxNTowNi43OTY2NTk2NjAgKzAyMDAgYWNwaV92aWRlbzAgLSZndDsg
Li4vLi4vZGV2aWNlcy9wY2kwMDAwOjAwLzAwMDA6MDA6MDIuMC9iYWNrbGlnaHQvYWNwaV92aWRl
bzA8L2NvZGU+PC9wcmU+PGJyIC8+QW55IGhlbHAgd291bGQgYmUgYXBwcmVjaWF0ZWQhPGJyIC8+
PGJyIC8+VG9tPC9zcGFuPjwvc3Bhbj4K

--===============0834220202419117392==--

