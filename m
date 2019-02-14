Content-Type: multipart/mixed; boundary="===============1703284134353827027=="
MIME-Version: 1.0
From: Sparr <sparr0 at gmail.com>
Subject: [Powertop] SIGSEGV (Address boundary error) on Ubuntu 19.04 with
 kernel 5.0
Date: Wed, 13 Feb 2019 16:12:39 -0800
Message-ID: <CANp3UNCPernYzpHvH=L6Zk_327GdN=AYOJ94Nt3EFUbLMKeqGg@mail.gmail.com>
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============1703284134353827027==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

The last time I ran powertop, a few days ago, it worked fine. Since then
I've updated my kernel. Then today I get what looks like the usual initial
behavior, output to the console like this:

modprobe cpufreq_stats failedLoaded 391 prior measurements
RAPL device for cpu 0
RAPL Using PowerCap Sysfs : Domain Mask f
RAPL device for cpu 0
RAPL Using PowerCap Sysfs : Domain Mask f
Devfreq not enabled
glob returned GLOB_ABORTED

then the console clears and there is an approx two second delay, which is
also normal. Then when I would expect the first screen of data to appear,
instead powertop crashes with SIGSEGV (Address boundary error). I'm putting
further details of the segfault in this gist, which I can update as I learn
more about using gdb and slowly bisect the kernel commit history to find
the change that triggers the misbehavior.

https://gist.github.com/sparr/fc97f4a265971bf720aedeaeb6874fd6

I would appreciate help in narrowing down the cause of the problem, or even
someone confirming that they do or do not have this problem on kernel 5.
Thank you.

--===============1703284134353827027==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PGRpdiBkaXI9Imx0ciI+PGRpdiBkaXI9Imx0ciI+VGhlIGxhc3QgdGltZSBJIHJhbiBwb3dlcnRv
cCwgYSBmZXcgZGF5cyBhZ28sIGl0IHdvcmtlZCBmaW5lLiBTaW5jZSB0aGVuIEkmIzM5O3ZlIHVw
ZGF0ZWQgbXkga2VybmVsLiBUaGVuIHRvZGF5IEkgZ2V0IHdoYXQgbG9va3MgbGlrZSB0aGUgdXN1
YWwgaW5pdGlhbCBiZWhhdmlvciwgb3V0cHV0IHRvIHRoZSBjb25zb2xlIGxpa2UgdGhpczo8YnI+
PGJyPm1vZHByb2JlIGNwdWZyZXFfc3RhdHMgZmFpbGVkTG9hZGVkIDM5MSBwcmlvciBtZWFzdXJl
bWVudHM8YnI+UkFQTCBkZXZpY2UgZm9yIGNwdSAwPGJyPlJBUEwgVXNpbmcgUG93ZXJDYXAgU3lz
ZnMgOiBEb21haW4gTWFzayBmPGJyPlJBUEwgZGV2aWNlIGZvciBjcHUgMDxicj5SQVBMIFVzaW5n
IFBvd2VyQ2FwIFN5c2ZzIDogRG9tYWluIE1hc2sgZjxicj5EZXZmcmVxIG5vdCBlbmFibGVkPGJy
Pmdsb2IgcmV0dXJuZWQgR0xPQl9BQk9SVEVEPGJyPjxicj50aGVuIHRoZSBjb25zb2xlIGNsZWFy
cyBhbmQgdGhlcmUgaXMgYW4gYXBwcm94IHR3byBzZWNvbmQgZGVsYXksIHdoaWNoIGlzIGFsc28g
bm9ybWFsLiBUaGVuIHdoZW4gSSB3b3VsZCBleHBlY3QgdGhlIGZpcnN0IHNjcmVlbiBvZiBkYXRh
IHRvIGFwcGVhciwgaW5zdGVhZCBwb3dlcnRvcCBjcmFzaGVzIHdpdGggU0lHU0VHViAoQWRkcmVz
cyBib3VuZGFyeSBlcnJvcikuIEkmIzM5O20gcHV0dGluZyBmdXJ0aGVyIGRldGFpbHMgb2YgdGhl
IHNlZ2ZhdWx0IGluIHRoaXMgZ2lzdCwgd2hpY2ggSSBjYW4gdXBkYXRlIGFzIEkgbGVhcm4gbW9y
ZSBhYm91dCB1c2luZyBnZGIgYW5kIHNsb3dseSBiaXNlY3QgdGhlIGtlcm5lbCBjb21taXQgaGlz
dG9yeSB0byBmaW5kIHRoZSBjaGFuZ2UgdGhhdCB0cmlnZ2VycyB0aGUgbWlzYmVoYXZpb3IuPGJy
Pjxicj48YSBocmVmPSJodHRwczovL2dpc3QuZ2l0aHViLmNvbS9zcGFyci9mYzk3ZjRhMjY1OTcx
YmY3MjBhZWRlYWViNjg3NGZkNiI+aHR0cHM6Ly9naXN0LmdpdGh1Yi5jb20vc3BhcnIvZmM5N2Y0
YTI2NTk3MWJmNzIwYWVkZWFlYjY4NzRmZDY8L2E+PGJyPjxicj5JIHdvdWxkIGFwcHJlY2lhdGUg
aGVscCBpbiBuYXJyb3dpbmcgZG93biB0aGUgY2F1c2Ugb2YgdGhlIHByb2JsZW0sIG9yIGV2ZW4g
c29tZW9uZSBjb25maXJtaW5nIHRoYXQgdGhleSBkbyBvciBkbyBub3QgaGF2ZSB0aGlzIHByb2Js
ZW0gb24ga2VybmVsIDUuIFRoYW5rIHlvdS48L2Rpdj48L2Rpdj4K

--===============1703284134353827027==--

