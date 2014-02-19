Content-Type: multipart/mixed; boundary="===============7289257516183026751=="
MIME-Version: 1.0
From: Kok, Auke-jan H <auke-jan.h.kok at intel.com>
Subject: Re: [Powertop] HIgh power concumption on network interface
Date: Wed, 19 Feb 2014 10:53:56 -0800
Message-ID: <CABsxX9JF6W7tQ4HanzyuR6an8Ji5OEgedYavx3X+qMfNNbBH6Q@mail.gmail.com>
In-Reply-To: CAO3V83KaAWbeeDyW6vOMFihmpk2JNGa-6XQuChUGPW2fpDYqqg@mail.gmail.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============7289257516183026751==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 19, 2014 at 1:13 AM, Wout Mertens <wout.mertens(a)gmail.com>wro=
te:

> kingma at bluewin.ch wrote on Wed Feb 12 23:32:27 PST 2014:
>
> > I observe a sustained high power consumption of 5- 10 W on the ehternet
> adaptor e1000e on a lenovo thinkgpad t430s. Such I high power drain cannot
> be correct can it? the total power consumption is around 25 W which is a
> concern for battery life.
>
> I'm noticing the same thing on my Dell Latitude E6540. It also has an
> e1000 and powertop reports it as being the highest consumer, at around 15=
W.
> When I unplug the system, the battery reports a drain of about 20W while
> idle which is pretty bad IMHO. With the 68Wh battery it translates to abo=
ut
> 2.5 hours battery life.
>
> Lowest I've seen for battery drain is 14W, with the screen at lowest
> brightness, Google Chrome turned off, disk spun down. I'm using the
> built-in Intel graphics and the system has 16GB of ram and a quad-core i7.
>
> I never ran windows on this laptop so I don't know what to expect but
> reviews are claiming 7+ hours on the 90Wh battery. That would mean an
> average of 13W, while doing actual work.
>
> So I'm really wondering: Is the e1000 really eating up 15W or is powertop
> misreporting?
>


There have been plenty of reports that point to the calibration being
incomplete (Let's just call it that).

Obviously e1000 won't eat 15W of power - 15W could power a 10gig Fiber
Optic transceiver (a high-powered laser, basically). Power consumption is
more in the order of a few watts max, with idle power much, much lower.

Calibration could fail if during the calibration phase powertop is unable
to toggle power to components or enable/disable devices. As a fallback, you
can run the calibration multiple times and vary the enabled devices in the
system. You could for instance go into the BIOS and disable the ethernet
device entirely, calibrate, reboot and enable the ethernet device, then
calibrate again. The extra data points should improve the power estimates
for devices.

Cheers,

Auke

--===============7289257516183026751==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PGRpdiBkaXI9Imx0ciI+PGRpdj48YnI+PC9kaXY+PGRpdiBjbGFzcz0iZ21haWxfZXh0cmEiPjxi
cj48YnI+PGRpdiBjbGFzcz0iZ21haWxfcXVvdGUiPk9uIFdlZCwgRmViIDE5LCAyMDE0IGF0IDE6
MTMgQU0sIFdvdXQgTWVydGVucyA8c3BhbiBkaXI9Imx0ciI+Jmx0OzxhIGhyZWY9Im1haWx0bzp3
b3V0Lm1lcnRlbnNAZ21haWwuY29tIiB0YXJnZXQ9Il9ibGFuayI+d291dC5tZXJ0ZW5zQGdtYWls
LmNvbTwvYT4mZ3Q7PC9zcGFuPiB3cm90ZTo8YnI+CjxibG9ja3F1b3RlIGNsYXNzPSJnbWFpbF9x
dW90ZSIgc3R5bGU9Im1hcmdpbjowcHggMHB4IDBweCAwLjhleDtib3JkZXItbGVmdC13aWR0aDox
cHg7Ym9yZGVyLWxlZnQtY29sb3I6cmdiKDIwNCwyMDQsMjA0KTtib3JkZXItbGVmdC1zdHlsZTpz
b2xpZDtwYWRkaW5nLWxlZnQ6MWV4Ij48ZGl2IGRpcj0ibHRyIj5raW5nbWEgYXQgPGEgaHJlZj0i
aHR0cDovL2JsdWV3aW4uY2giIHRhcmdldD0iX2JsYW5rIj5ibHVld2luLmNoPC9hPiB3cm90ZSBv
biBXZWQgRmViIDEyIDIzOjMyOjI3IFBTVCAyMDE0OjxkaXYgY2xhc3M9IiI+CjxkaXY+PGJyPjwv
ZGl2PjxkaXY+Jmd0OyBJIG9ic2VydmUgYSBzdXN0YWluZWQgaGlnaCBwb3dlciBjb25zdW1wdGlv
biBvZiA1LSAxMCBXIG9uIHRoZSBlaHRlcm5ldCBhZGFwdG9yIGUxMDAwZSBvbiBhIGxlbm92byB0
aGlua2dwYWQgdDQzMHMuIFN1Y2ggSSBoaWdoIHBvd2VyIGRyYWluIGNhbm5vdCBiZSBjb3JyZWN0
IGNhbiBpdD8gdGhlIHRvdGFsIHBvd2VyIGNvbnN1bXB0aW9uIGlzIGFyb3VuZCAyNSBXIHdoaWNo
IGlzIGEgY29uY2VybiBmb3IgYmF0dGVyeSBsaWZlLjwvZGl2PgoKCjxkaXY+PGJyPjwvZGl2Pjwv
ZGl2PjxkaXY+SSYjMzk7bSBub3RpY2luZyB0aGUgc2FtZSB0aGluZyBvbiBteSBEZWxsIExhdGl0
dWRlIEU2NTQwLiBJdCBhbHNvIGhhcyBhbiBlMTAwMCBhbmQgcG93ZXJ0b3AgcmVwb3J0cyBpdCBh
cyBiZWluZyB0aGUgaGlnaGVzdCBjb25zdW1lciwgYXQgYXJvdW5kIDE1Vy4gV2hlbiBJIHVucGx1
ZyB0aGUgc3lzdGVtLCB0aGUgYmF0dGVyeSByZXBvcnRzIGEgZHJhaW4gb2YgYWJvdXQgMjBXIHdo
aWxlIGlkbGUgd2hpY2ggaXMgcHJldHR5IGJhZCBJTUhPLiBXaXRoIHRoZSA2OFdoIGJhdHRlcnkg
aXQgdHJhbnNsYXRlcyB0byBhYm91dCAyLjUgaG91cnMgYmF0dGVyeSBsaWZlLjwvZGl2PgoKPGRp
dj48YnI+PC9kaXY+PGRpdj5Mb3dlc3QgSSYjMzk7dmUgc2VlbiBmb3IgYmF0dGVyeSBkcmFpbiBp
cyAxNFcsIHdpdGggdGhlIHNjcmVlbiBhdCBsb3dlc3QgYnJpZ2h0bmVzcywgR29vZ2xlIENocm9t
ZSB0dXJuZWQgb2ZmLCBkaXNrIHNwdW4gZG93bi4gSSYjMzk7bSB1c2luZyB0aGUgYnVpbHQtaW4g
SW50ZWwgZ3JhcGhpY3MgYW5kIHRoZSBzeXN0ZW0gaGFzIDE2R0Igb2YgcmFtIGFuZCBhIHF1YWQt
Y29yZSBpNy48L2Rpdj4KCgo8ZGl2Pjxicj48L2Rpdj48ZGl2PkkgbmV2ZXIgcmFuIHdpbmRvd3Mg
b24gdGhpcyBsYXB0b3Agc28gSSBkb24mIzM5O3Qga25vdyB3aGF0IHRvIGV4cGVjdCBidXQgcmV2
aWV3cyBhcmUgY2xhaW1pbmcgNysgaG91cnMgb24gdGhlIDkwV2ggYmF0dGVyeS4gVGhhdCB3b3Vs
ZCBtZWFuIGFuIGF2ZXJhZ2Ugb2YgMTNXLCB3aGlsZSBkb2luZyBhY3R1YWwgd29yay48L2Rpdj48
ZGl2Pjxicj48L2Rpdj4KCgo8ZGl2PlNvIEkmIzM5O20gcmVhbGx5IHdvbmRlcmluZzogSXMgdGhl
IGUxMDAwIHJlYWxseSBlYXRpbmcgdXAgMTVXIG9yIGlzIHBvd2VydG9wIG1pc3JlcG9ydGluZz88
L2Rpdj48L2Rpdj48L2Jsb2NrcXVvdGU+PC9kaXY+PC9kaXY+PGRpdiBjbGFzcz0iZ21haWxfZXh0
cmEiPjxkaXY+PGJyPjwvZGl2PjxkaXY+PGJyIGNsYXNzPSIiPlRoZXJlIGhhdmUgYmVlbiBwbGVu
dHkgb2YgcmVwb3J0cyB0aGF0IHBvaW50IHRvIHRoZSBjYWxpYnJhdGlvbiBiZWluZyBpbmNvbXBs
ZXRlIChMZXQmIzM5O3MganVzdCBjYWxsIGl0IHRoYXQpLjwvZGl2Pgo8ZGl2Pjxicj48L2Rpdj48
ZGl2Pk9idmlvdXNseSBlMTAwMCB3b24mIzM5O3QgZWF0IDE1VyBvZiBwb3dlciAtIDE1VyBjb3Vs
ZCBwb3dlciBhIDEwZ2lnIEZpYmVyIE9wdGljIHRyYW5zY2VpdmVyIChhIGhpZ2gtcG93ZXJlZCBs
YXNlciwgYmFzaWNhbGx5KS4gUG93ZXIgY29uc3VtcHRpb24gaXMgbW9yZSBpbiB0aGUgb3JkZXIg
b2YgYSBmZXcgd2F0dHMgbWF4LCB3aXRoIGlkbGUgcG93ZXIgbXVjaCwgbXVjaCBsb3dlci48L2Rp
dj4KPGRpdj48YnI+PC9kaXY+PGRpdj5DYWxpYnJhdGlvbiBjb3VsZCBmYWlsIGlmIGR1cmluZyB0
aGUgY2FsaWJyYXRpb24gcGhhc2UgcG93ZXJ0b3AgaXMgdW5hYmxlIHRvIHRvZ2dsZSBwb3dlciB0
byBjb21wb25lbnRzIG9yIGVuYWJsZS9kaXNhYmxlIGRldmljZXMuIEFzIGEgZmFsbGJhY2ssIHlv
dSBjYW4gcnVuIHRoZSBjYWxpYnJhdGlvbiBtdWx0aXBsZSB0aW1lcyBhbmQgdmFyeSB0aGUgZW5h
YmxlZCBkZXZpY2VzIGluIHRoZSBzeXN0ZW0uIFlvdSBjb3VsZCBmb3IgaW5zdGFuY2UgZ28gaW50
byB0aGUgQklPUyBhbmQgZGlzYWJsZSB0aGUgZXRoZXJuZXQgZGV2aWNlIGVudGlyZWx5LCBjYWxp
YnJhdGUsIHJlYm9vdCBhbmQgZW5hYmxlIHRoZSBldGhlcm5ldCBkZXZpY2UsIHRoZW4gY2FsaWJy
YXRlIGFnYWluLiBUaGUgZXh0cmEgZGF0YSBwb2ludHMgc2hvdWxkIGltcHJvdmUgdGhlIHBvd2Vy
IGVzdGltYXRlcyBmb3IgZGV2aWNlcy48L2Rpdj4KPGRpdj48YnI+PC9kaXY+PGRpdj5DaGVlcnMs
PC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj5BdWtlPC9kaXY+PGRpdj48YnI+PC9kaXY+PC9kaXY+
PC9kaXY+Cg==

--===============7289257516183026751==--

