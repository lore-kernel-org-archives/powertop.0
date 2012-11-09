Content-Type: multipart/mixed; boundary="===============2360052636323227778=="
MIME-Version: 1.0
From: Thomas Spura <thomas.spura at gmail.com>
Subject: Re: [Powertop] Strange Behavior - PowerTOP 2.0 Seg Fault
Date: Fri, 09 Nov 2012 08:20:59 +0100
Message-ID: <CAE4GLste6Aha0VcB4z7KQWkqw3H=3PCVow=QbPPUOEj4U+coVA@mail.gmail.com>
In-Reply-To: 623577575.1331973.1352425038628.JavaMail.root@sz0055a.westchester.pa.mail.comcast.net
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============2360052636323227778==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 9, 2012 at 2:37 AM, <cshanahan(a)comcast.net> wrote:

> >> I was reading PowerTOP documentation and was curious whether it could
> help me
> >> better manage power on my HP EliteBook 6930p laptop. I am running
> PowerTOP
> >> v.2.0 on openSUSE 12.2 64-bit. After looking at some of my options from
> the
> >> Overview and Stats tabs, I elected to run 'powertop --calibrate' as the
> docs
> >> suggest. PowerTOP did not complete the calibration process; it exited
> with a
> >> seg fault. Now the hardware button for WiFi (small button along the top
> of
> >> the laptop near the screen) flashes constantly. I'm concerned that
> PowerTOP
> >> caused some sort of hardware problem and damaged my laptop.
> >>
> >> Is there a way for me to check what PowerTOP did to my machine?
> >>
> >> Is there a way for me to completely revert any changes made by PowerTO=
P?
> >>
> >> uname -a
> >> Linux 6930p.site 3.4.11-2.16-desktop #1 SMP PREEMPT Wed Sep 26 17:05:00
> UTC 2012 (259fc87) x86_64 x86_64 x86_64 GNU/Linux
> >>
> >> 6930p:~ # powertop --calibrate
> >> Starting PowerTOP power estimate calibration
> >> Calibrating idle
> >> Segmentation fault
> >
> >
> > can you please do the following one (may be it'll work out w/o powertop
> > re-compile)
> >
> > gdb PATH_TO_POWERTOP_BINARY
> > $ run --calibrate
> > $ bt
>
>
> Sure can.
>
> 6930p:~ # gdb /usr/sbin/powertop
> GNU gdb (GDB) SUSE (7.4.50.20120603-2.1.2)
> Copyright (C) 2012 Free Software Foundation, Inc.
> License GPLv3+: GNU GPL version 3 or later <
> http://gnu.org/licenses/gpl.html>
> This is free software: you are free to change and redistribute it.
> There is NO WARRANTY, to the extent permitted by law.  Type "show copying"
> and "show warranty" for details.
> This GDB was configured as "x86_64-suse-linux".
> For bug reporting instructions, please see:
> <http://www.gnu.org/software/gdb/bugs/>...
> Reading symbols from /usr/sbin/powertop...(no debugging symbols
> found)...done.
> Missing separate debuginfos, use: zypper install
> powertop-debuginfo-2.0-2.1.2.x86_64
> (gdb) run --calibrate
> Starting program: /usr/sbin/powertop --calibrate
> [Thread debugging using libthread_db enabled]
> Using host libthread_db library "/lib64/libthread_db.so.1".
> Starting PowerTOP power estimate calibration
> Calibrating idle
> Detaching after fork from child process 17369.
>
> Program received signal SIGSEGV, Segmentation fault.
> 0x000000000042885c in ?? ()
> (gdb) bt
> #0  0x000000000042885c in ?? ()
> #1  0x000000000040ff30 in ?? ()
> #2  0x0000000000442f15 in ?? ()
> #3  0x000000000043fd7a in ?? ()
> #4  0x0000000000406f98 in ?? ()
> #5  0x00007ffff6597455 in __libc_start_main () from /lib64/libc.so.6
> #6  0x000000000040748d in ?? ()
> #7  0x00007fffffffe378 in ?? ()
> #8  0x0000000000000000 in ?? ()
> (gdb)
>
>
> I hope this helps. The WiFi hardware light continues to blink, though WiFi
> seems to work as expected.
>

The "??" will turn into real functions, when you install powertop-debuginfo
from above:
Missing separate debuginfos, use: zypper install
powertop-debuginfo-2.0-2.1.2.x86_64

Could you install that package and try it again please?

Greetings,
     Tom

--===============2360052636323227778==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PGRpdiBjbGFzcz0iZ21haWxfZXh0cmEiPjxkaXYgY2xhc3M9ImdtYWlsX3F1b3RlIj5PbiBGcmks
IE5vdiA5LCAyMDEyIGF0IDI6MzcgQU0sICA8c3BhbiBkaXI9Imx0ciI+Jmx0OzxhIGhyZWY9Im1h
aWx0bzpjc2hhbmFoYW5AY29tY2FzdC5uZXQiIHRhcmdldD0iX2JsYW5rIj5jc2hhbmFoYW5AY29t
Y2FzdC5uZXQ8L2E+Jmd0Ozwvc3Bhbj4gd3JvdGU6PGJyPjxibG9ja3F1b3RlIGNsYXNzPSJnbWFp
bF9xdW90ZSIgc3R5bGU9Im1hcmdpbjowcHggMHB4IDBweCAwLjhleDtib3JkZXItbGVmdDoxcHgg
c29saWQgcmdiKDIwNCwyMDQsMjA0KTtwYWRkaW5nLWxlZnQ6MWV4Ij4KPGRpdiBjbGFzcz0iaW0i
PiZndDsmZ3Q7IEkgd2FzIHJlYWRpbmcgUG93ZXJUT1AgZG9jdW1lbnRhdGlvbiBhbmQgd2FzIGN1
cmlvdXMgd2hldGhlciBpdCBjb3VsZCBoZWxwIG1lPGJyPgomZ3Q7Jmd0OyBiZXR0ZXIgbWFuYWdl
IHBvd2VyIG9uIG15IEhQIEVsaXRlQm9vayA2OTMwcCBsYXB0b3AuIEkgYW0gcnVubmluZyBQb3dl
clRPUDxicj4KJmd0OyZndDsgdi4yLjAgb24gb3BlblNVU0UgMTIuMiA2NC1iaXQuIEFmdGVyIGxv
b2tpbmcgYXQgc29tZSBvZiBteSBvcHRpb25zIGZyb20gdGhlPGJyPgomZ3Q7Jmd0OyBPdmVydmll
dyBhbmQgU3RhdHMgdGFicywgSSBlbGVjdGVkIHRvIHJ1biAmIzM5O3Bvd2VydG9wIC0tY2FsaWJy
YXRlJiMzOTsgYXMgdGhlIGRvY3M8YnI+CiZndDsmZ3Q7IHN1Z2dlc3QuIFBvd2VyVE9QIGRpZCBu
b3QgY29tcGxldGUgdGhlIGNhbGlicmF0aW9uIHByb2Nlc3M7IGl0IGV4aXRlZCB3aXRoIGE8YnI+
CiZndDsmZ3Q7IHNlZyBmYXVsdC4gTm93IHRoZSBoYXJkd2FyZSBidXR0b24gZm9yIFdpRmkgKHNt
YWxsIGJ1dHRvbiBhbG9uZyB0aGUgdG9wIG9mPGJyPgomZ3Q7Jmd0OyB0aGUgbGFwdG9wIG5lYXIg
dGhlIHNjcmVlbikgZmxhc2hlcyBjb25zdGFudGx5LiBJJiMzOTttIGNvbmNlcm5lZCB0aGF0IFBv
d2VyVE9QPGJyPgomZ3Q7Jmd0OyBjYXVzZWQgc29tZSBzb3J0IG9mIGhhcmR3YXJlIHByb2JsZW0g
YW5kIGRhbWFnZWQgbXkgbGFwdG9wLjxicj4KJmd0OyZndDs8YnI+CiZndDsmZ3Q7IElzIHRoZXJl
IGEgd2F5IGZvciBtZSB0byBjaGVjayB3aGF0IFBvd2VyVE9QIGRpZCB0byBteSBtYWNoaW5lPzxi
cj4KJmd0OyZndDs8YnI+CjwvZGl2PjxkaXYgY2xhc3M9ImltIj4mZ3Q7Jmd0OyBJcyB0aGVyZSBh
IHdheSBmb3IgbWUgdG8gY29tcGxldGVseSByZXZlcnQgYW55IGNoYW5nZXMgbWFkZSBieSBQb3dl
clRPUD88YnI+CiZndDsmZ3Q7PGJyPgo8L2Rpdj48ZGl2IGNsYXNzPSJpbSI+Jmd0OyZndDsgdW5h
bWUgLWE8YnI+CiZndDsmZ3Q7IExpbnV4IDY5MzBwLnNpdGUgMy40LjExLTIuMTYtZGVza3RvcCAj
MSBTTVAgUFJFRU1QVCBXZWQgU2VwIDI2IDE3OjA1OjAwIFVUQyAyMDEyICgyNTlmYzg3KSB4ODZf
NjQgeDg2XzY0IHg4Nl82NCBHTlUvTGludXg8YnI+CiZndDsmZ3Q7PGJyPgomZ3Q7Jmd0OyA2OTMw
cDp+ICMgcG93ZXJ0b3AgLS1jYWxpYnJhdGU8YnI+CiZndDsmZ3Q7IFN0YXJ0aW5nIFBvd2VyVE9Q
IHBvd2VyIGVzdGltYXRlIGNhbGlicmF0aW9uPGJyPgomZ3Q7Jmd0OyBDYWxpYnJhdGluZyBpZGxl
PGJyPgomZ3Q7Jmd0OyBTZWdtZW50YXRpb24gZmF1bHQ8YnI+CiZndDs8YnI+CiZndDs8YnI+Cjwv
ZGl2PjxkaXYgY2xhc3M9ImltIj4mZ3Q7IGNhbiB5b3UgcGxlYXNlIGRvIHRoZSBmb2xsb3dpbmcg
b25lIChtYXkgYmUgaXQmIzM5O2xsIHdvcmsgb3V0IHcvbyBwb3dlcnRvcDxicj4KJmd0OyByZS1j
b21waWxlKTxicj4KJmd0Ozxicj4KJmd0OyBnZGIgUEFUSF9UT19QT1dFUlRPUF9CSU5BUlk8YnI+
CiZndDsgJCBydW4gLS1jYWxpYnJhdGU8YnI+CiZndDsgJCBidDxicj4KPGJyPgo8YnI+CjwvZGl2
PlN1cmUgY2FuLjxicj4KPGJyPgo2OTMwcDp+ICMgZ2RiIC91c3Ivc2Jpbi9wb3dlcnRvcDxicj4K
R05VIGdkYiAoR0RCKSBTVVNFICg3LjQuNTAuMjAxMjA2MDMtMi4xLjIpPGJyPgpDb3B5cmlnaHQg
KEMpIDIwMTIgRnJlZSBTb2Z0d2FyZSBGb3VuZGF0aW9uLCBJbmMuPGJyPgpMaWNlbnNlIEdQTHYz
KzogR05VIEdQTCB2ZXJzaW9uIDMgb3IgbGF0ZXIgJmx0OzxhIGhyZWY9Imh0dHA6Ly9nbnUub3Jn
L2xpY2Vuc2VzL2dwbC5odG1sIiB0YXJnZXQ9Il9ibGFuayI+aHR0cDovL2dudS5vcmcvbGljZW5z
ZXMvZ3BsLmh0bWw8L2E+Jmd0Ozxicj4KVGhpcyBpcyBmcmVlIHNvZnR3YXJlOiB5b3UgYXJlIGZy
ZWUgdG8gY2hhbmdlIGFuZCByZWRpc3RyaWJ1dGUgaXQuPGJyPgpUaGVyZSBpcyBOTyBXQVJSQU5U
WSwgdG8gdGhlIGV4dGVudCBwZXJtaXR0ZWQgYnkgbGF3LiDCoFR5cGUgJnF1b3Q7c2hvdyBjb3B5
aW5nJnF1b3Q7PGJyPgphbmQgJnF1b3Q7c2hvdyB3YXJyYW50eSZxdW90OyBmb3IgZGV0YWlscy48
YnI+ClRoaXMgR0RCIHdhcyBjb25maWd1cmVkIGFzICZxdW90O3g4Nl82NC1zdXNlLWxpbnV4JnF1
b3Q7Ljxicj4KRm9yIGJ1ZyByZXBvcnRpbmcgaW5zdHJ1Y3Rpb25zLCBwbGVhc2Ugc2VlOjxicj4K
Jmx0OzxhIGhyZWY9Imh0dHA6Ly93d3cuZ251Lm9yZy9zb2Z0d2FyZS9nZGIvYnVncy8iIHRhcmdl
dD0iX2JsYW5rIj5odHRwOi8vd3d3LmdudS5vcmcvc29mdHdhcmUvZ2RiL2J1Z3MvPC9hPiZndDsu
Li48YnI+ClJlYWRpbmcgc3ltYm9scyBmcm9tIC91c3Ivc2Jpbi9wb3dlcnRvcC4uLihubyBkZWJ1
Z2dpbmcgc3ltYm9scyBmb3VuZCkuLi5kb25lLjxicj4KTWlzc2luZyBzZXBhcmF0ZSBkZWJ1Z2lu
Zm9zLCB1c2U6IHp5cHBlciBpbnN0YWxsIHBvd2VydG9wLWRlYnVnaW5mby0yLjAtMi4xLjIueDg2
XzY0PGJyPgooZ2RiKSBydW4gLS1jYWxpYnJhdGU8YnI+ClN0YXJ0aW5nIHByb2dyYW06IC91c3Iv
c2Jpbi9wb3dlcnRvcCAtLWNhbGlicmF0ZTxicj4KW1RocmVhZCBkZWJ1Z2dpbmcgdXNpbmcgbGli
dGhyZWFkX2RiIGVuYWJsZWRdPGJyPgpVc2luZyBob3N0IGxpYnRocmVhZF9kYiBsaWJyYXJ5ICZx
dW90Oy9saWI2NC9saWJ0aHJlYWRfZGIuc28uMSZxdW90Oy48YnI+CjxkaXYgY2xhc3M9ImltIj5T
dGFydGluZyBQb3dlclRPUCBwb3dlciBlc3RpbWF0ZSBjYWxpYnJhdGlvbjxicj4KQ2FsaWJyYXRp
bmcgaWRsZTxicj4KPC9kaXY+RGV0YWNoaW5nIGFmdGVyIGZvcmsgZnJvbSBjaGlsZCBwcm9jZXNz
IDE3MzY5Ljxicj4KPGJyPgpQcm9ncmFtIHJlY2VpdmVkIHNpZ25hbCBTSUdTRUdWLCBTZWdtZW50
YXRpb24gZmF1bHQuPGJyPgoweDAwMDAwMDAwMDA0Mjg4NWMgaW4gPz8gKCk8YnI+CihnZGIpIGJ0
PGJyPgojMCDCoDB4MDAwMDAwMDAwMDQyODg1YyBpbiA/PyAoKTxicj4KIzEgwqAweDAwMDAwMDAw
MDA0MGZmMzAgaW4gPz8gKCk8YnI+CiMyIMKgMHgwMDAwMDAwMDAwNDQyZjE1IGluID8/ICgpPGJy
PgojMyDCoDB4MDAwMDAwMDAwMDQzZmQ3YSBpbiA/PyAoKTxicj4KIzQgwqAweDAwMDAwMDAwMDA0
MDZmOTggaW4gPz8gKCk8YnI+CiM1IMKgMHgwMDAwN2ZmZmY2NTk3NDU1IGluIF9fbGliY19zdGFy
dF9tYWluICgpIGZyb20gL2xpYjY0L2xpYmMuc28uNjxicj4KIzYgwqAweDAwMDAwMDAwMDA0MDc0
OGQgaW4gPz8gKCk8YnI+CiM3IMKgMHgwMDAwN2ZmZmZmZmZlMzc4IGluID8/ICgpPGJyPgojOCDC
oDB4MDAwMDAwMDAwMDAwMDAwMCBpbiA/PyAoKTxicj4KKGdkYik8YnI+Cjxicj4KPGJyPgpJIGhv
cGUgdGhpcyBoZWxwcy4gVGhlIFdpRmkgaGFyZHdhcmUgbGlnaHQgY29udGludWVzIHRvIGJsaW5r
LCB0aG91Z2ggV2lGaTxicj4Kc2VlbXMgdG8gd29yayBhcyBleHBlY3RlZC48YnI+PC9ibG9ja3F1
b3RlPjwvZGl2Pjxicj5UaGUgJnF1b3Q7Pz8mcXVvdDsgd2lsbCB0dXJuIGludG8gcmVhbCBmdW5j
dGlvbnMsIHdoZW4geW91IGluc3RhbGwgcG93ZXJ0b3AtZGVidWdpbmZvIGZyb20gYWJvdmU6PGJy
Pk1pc3Npbmcgc2VwYXJhdGUgZGVidWdpbmZvcywgdXNlOiB6eXBwZXIgaW5zdGFsbCBwb3dlcnRv
cC1kZWJ1Z2luZm8tMi4wLTIuMS4yLng4Nl82NDxicj4KPGJyPkNvdWxkIHlvdSBpbnN0YWxsIHRo
YXQgcGFja2FnZSBhbmQgdHJ5IGl0IGFnYWluIHBsZWFzZT88YnI+PGJyPkdyZWV0aW5ncyw8YnI+
wqDCoMKgwqAgVG9tPGJyPjwvZGl2Pgo=

--===============2360052636323227778==--

