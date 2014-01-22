Content-Type: multipart/mixed; boundary="===============7739255479182267021=="
MIME-Version: 1.0
From: Eduard Gotwig <gotwig at ubuntu.com>
Subject: Re: [Powertop] Settings modified from Powertop are not persistent
Date: Wed, 22 Jan 2014 18:28:08 +0100
Message-ID: <CAE3uxtuMtqESdS0Pgq46064UVTfgf6VGKpeH-HiBR9cncWA95Q@mail.gmail.com>
In-Reply-To: E351AD52FA1E154C8FFF4F9FCD2CA84336E92D39@ORSMSX101.amr.corp.intel.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============7739255479182267021==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hey, I'd like to know if Powertop could at least work on making powertop
systemd ready, so you can start it easily at bootup as a service, with the
auto tune option. Currently it doesnt work, as it enters the ncurse
interface (or similiar), and than exists quickly.

Powertop has to be executed with just the tweak options, and a string as a
result of the auto tune operation should be the *only* output it does on
the system to the user, and shouldnt enter a menu. With this, I think the
systemd integration could work.




2014/1/22 Ferron, Chris E <chris.e.ferron(a)intel.com>

>
> Hi,
>   Power top is not intended to be used as a tuner, it is used as a
> analysis tools.
> If you find that the tunings are desired, you should work with the
> distribution to have them included, or make the necessary changes locally
> yourself.
>
>
> -----Original Message-----
> From: PowerTop [mailto:powertop-bounces(a)lists.01.org<powertop-bounces(a=
)lists.01.org>]
> On Behalf Of thibaut bethune
> Sent: Wednesday, January 22, 2014 3:16 AM
> To: powertop
> Subject: [Powertop] Settings modified from Powertop are not persistent
>
> Hi,
>
> I'm using Powertop with root privilege on Debian GNU/Linux 64 bits with my
> Core i3-3225.
>
> Although I modify settings to follow advices given by Powertop, each time
> I restart my computer these settings are restored !
>
> Thes settings are :
>
> Bad VM writeback timeout
> Bad NMI watchdog should be turned off
> Bad Enable Audio codec power management
> Bad Enable SATA link power Managmenet for host4 Bad Enable SATA link power
> Managmenet for host5 Bad Enable SATA link power Managmenet for host2 Bad
> Enable SATA link power Managmenet for host3 Bad Enable SATA link power
> Managmenet for host0 Bad Enable SATA link power Managmenet for host1 Bad
> Autosuspend for USB device USB Keyboard [CHESEN] Bad Runtime PM for PCI
> Device Intel Corporation Xeon E3-1200 v2/3rd Bad Runtime PM for PCI Device
> Intel Corporation 7 Series/C210 Serie Bad Runtime PM for PCI Device Intel
> Corporation 7 Series/C210 Serie Bad Runtime PM for PCI Device Intel
> Corporation 7 Series/C210 Serie Bad Runtime PM for PCI Device ASMedia
> Technology Inc. ASM1083/1085 Bad Runtime PM for PCI Device Realtek
> Semiconductor Co., Ltd. RTL81 Bad Runtime PM for PCI Device Intel
> Corporation 7 Series/C210 Serie Bad Runtime PM for PCI Device Intel
> Corporation 7 Series/C210 Serie Bad Runtime PM for PCI Device Intel
> Corporation 82801 PCI Bridge Bad Runtime PM for PCI Device Intel
> Corporation H77 Express Chipset Bad Runtime PM for PCI Device Intel
> Corporation 7 Series/C210 Serie Bad Runtime PM for PCI Device Intel
> Corporation 7 Series/C210 Serie Bad Runtime PM for PCI Device Intel
> Corporation 7 Series/C210 Serie Bad Runtime PM for PCI Device Intel
> Corporation Xeon E3-1200 v2/3rd Bad Runtime PM for PCI Device Intel
> Corporation 7 Series/C210 Serie Bad Wake-on-lan status for device eth0
>
> Thanks !
> _______________________________________________
> PowerTop mailing list
> PowerTop(a)lists.01.org
> https://lists.01.org/mailman/listinfo/powertop
>
>
> _______________________________________________
> PowerTop mailing list
> PowerTop(a)lists.01.org
> https://lists.01.org/mailman/listinfo/powertop
>
>


-- =

Eduard Gotwig

*Tiu persono estas oni Esperantiston
<http://en.wikipedia.org/wiki/Esperantist>. *

*Ubuntu <http://www.ubuntu.com/> & TZM
<http://koeln.zeitgeist-movement.de/> Member*
*FLOSS <http://en.wikipedia.org/wiki/Free_and_open-source_software> Dev
@ Launchpad <https://launchpad.net/~gotwig>*

--===============7739255479182267021==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PGRpdiBkaXI9Imx0ciI+PGRpdj5IZXksIEkmIzM5O2QgbGlrZSB0byBrbm93IGlmIFBvd2VydG9w
IGNvdWxkIGF0IGxlYXN0IHdvcmsgb24gbWFraW5nIHBvd2VydG9wIHN5c3RlbWQgcmVhZHksIHNv
IHlvdSBjYW4gc3RhcnQgaXQgZWFzaWx5IGF0IGJvb3R1cCBhcyBhIHNlcnZpY2UsIHdpdGggdGhl
IGF1dG8gdHVuZSBvcHRpb24uIEN1cnJlbnRseSBpdCBkb2VzbnQgd29yaywgYXMgaXQgZW50ZXJz
IHRoZSBuY3Vyc2UgaW50ZXJmYWNlIChvciBzaW1pbGlhciksIGFuZCB0aGFuIGV4aXN0cyBxdWlj
a2x5LiA8YnI+Cgo8YnI+PC9kaXY+UG93ZXJ0b3AgaGFzIHRvIGJlIGV4ZWN1dGVkIHdpdGgganVz
dCB0aGUgdHdlYWsgb3B0aW9ucywgYW5kIGEgc3RyaW5nIGFzIGEgcmVzdWx0IG9mIHRoZSBhdXRv
IHR1bmUgb3BlcmF0aW9uIHNob3VsZCBiZSB0aGUgKm9ubHkqIG91dHB1dCBpdCBkb2VzIG9uIHRo
ZSBzeXN0ZW0gdG8gdGhlIHVzZXIsIGFuZCBzaG91bGRudCBlbnRlciBhIG1lbnUuIFdpdGggdGhp
cywgSSB0aGluayB0aGUgc3lzdGVtZCBpbnRlZ3JhdGlvbiBjb3VsZCB3b3JrLjxicj4KCjxicj48
YnI+PC9kaXY+PGRpdiBjbGFzcz0iZ21haWxfZXh0cmEiPjxicj48YnI+PGRpdiBjbGFzcz0iZ21h
aWxfcXVvdGUiPjIwMTQvMS8yMiBGZXJyb24sIENocmlzIEUgPHNwYW4gZGlyPSJsdHIiPiZsdDs8
YSBocmVmPSJtYWlsdG86Y2hyaXMuZS5mZXJyb25AaW50ZWwuY29tIiB0YXJnZXQ9Il9ibGFuayI+
Y2hyaXMuZS5mZXJyb25AaW50ZWwuY29tPC9hPiZndDs8L3NwYW4+PGJyPjxibG9ja3F1b3RlIGNs
YXNzPSJnbWFpbF9xdW90ZSIgc3R5bGU9Im1hcmdpbjowIDAgMCAuOGV4O2JvcmRlci1sZWZ0OjFw
eCAjY2NjIHNvbGlkO3BhZGRpbmctbGVmdDoxZXgiPgoKCgoKCgoKCjxkaXY+Cjxmb250IGZhY2U9
IkNhbGlicmkiPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTFwdCI+CjxkaXY+oDwvZGl2Pgo8ZGl2
PkhpLKAgPC9kaXY+CjxkaXY+oCBQb3dlciB0b3AgaXMgbm90IGludGVuZGVkIHRvIGJlIHVzZWQg
YXMgYSB0dW5lciwgaXQgaXMgdXNlZCBhcyBhIGFuYWx5c2lzIHRvb2xzLiA8L2Rpdj4KPGRpdj5J
ZiB5b3UgZmluZCB0aGF0IHRoZSB0dW5pbmdzIGFyZSBkZXNpcmVkLCB5b3Ugc2hvdWxkIHdvcmsg
d2l0aCB0aGUgZGlzdHJpYnV0aW9uIHRvIGhhdmUgdGhlbSBpbmNsdWRlZCwgb3IgbWFrZSB0aGUg
bmVjZXNzYXJ5IGNoYW5nZXMgbG9jYWxseSB5b3Vyc2VsZi4gPC9kaXY+PGRpdj48ZGl2IGNsYXNz
PSJoNSI+CjxkaXY+oDwvZGl2Pgo8ZGl2PqA8L2Rpdj4KPGRpdj4tLS0tLU9yaWdpbmFsIE1lc3Nh
Z2UtLS0tLTxicj4KCkZyb206IFBvd2VyVG9wIFs8YSBocmVmPSJtYWlsdG86cG93ZXJ0b3AtYm91
bmNlc0BsaXN0cy4wMS5vcmciIHRhcmdldD0iX2JsYW5rIj5tYWlsdG86cG93ZXJ0b3AtYm91bmNl
c0BsaXN0cy4wMS5vcmc8L2E+XSBPbiBCZWhhbGYgT2YgdGhpYmF1dCBiZXRodW5lPGJyPgoKU2Vu
dDogV2VkbmVzZGF5LCBKYW51YXJ5IDIyLCAyMDE0IDM6MTYgQU08YnI+CgpUbzogcG93ZXJ0b3A8
YnI+CgpTdWJqZWN0OiBbUG93ZXJ0b3BdIFNldHRpbmdzIG1vZGlmaWVkIGZyb20gUG93ZXJ0b3Ag
YXJlIG5vdCBwZXJzaXN0ZW50PC9kaXY+CjxkaXY+oDwvZGl2Pgo8ZGl2PkhpLDwvZGl2Pgo8ZGl2
PqA8L2Rpdj4KPGRpdj5JJiMzOTttIHVzaW5nIFBvd2VydG9wIHdpdGggcm9vdCBwcml2aWxlZ2Ug
b24gRGViaWFuIEdOVS9MaW51eCA2NCBiaXRzIHdpdGggbXkgQ29yZSBpMy0zMjI1LjwvZGl2Pgo8
ZGl2PqA8L2Rpdj4KPGRpdj5BbHRob3VnaCBJIG1vZGlmeSBzZXR0aW5ncyB0byBmb2xsb3cgYWR2
aWNlcyBnaXZlbiBieSBQb3dlcnRvcCwgZWFjaCB0aW1lIEkgcmVzdGFydCBteSBjb21wdXRlciB0
aGVzZSBzZXR0aW5ncyBhcmUgcmVzdG9yZWQgITwvZGl2Pgo8ZGl2PqA8L2Rpdj4KPGRpdj5UaGVz
IHNldHRpbmdzIGFyZSA6PC9kaXY+CjxkaXY+oDwvZGl2Pgo8ZGl2PkJhZCBWTSB3cml0ZWJhY2sg
dGltZW91dDwvZGl2Pgo8ZGl2PkJhZCBOTUkgd2F0Y2hkb2cgc2hvdWxkIGJlIHR1cm5lZCBvZmY8
L2Rpdj4KPGRpdj5CYWQgRW5hYmxlIEF1ZGlvIGNvZGVjIHBvd2VyIG1hbmFnZW1lbnQ8L2Rpdj4K
PGRpdj5CYWQgRW5hYmxlIFNBVEEgbGluayBwb3dlciBNYW5hZ21lbmV0IGZvciBob3N0NCBCYWQg
RW5hYmxlIFNBVEEgbGluayBwb3dlciBNYW5hZ21lbmV0IGZvciBob3N0NSBCYWQgRW5hYmxlIFNB
VEEgbGluayBwb3dlciBNYW5hZ21lbmV0IGZvciBob3N0MiBCYWQgRW5hYmxlIFNBVEEgbGluayBw
b3dlciBNYW5hZ21lbmV0IGZvciBob3N0MyBCYWQgRW5hYmxlIFNBVEEgbGluayBwb3dlciBNYW5h
Z21lbmV0IGZvciBob3N0MCBCYWQgRW5hYmxlIFNBVEEKbGluayBwb3dlciBNYW5hZ21lbmV0IGZv
ciBob3N0MSBCYWQgQXV0b3N1c3BlbmQgZm9yIFVTQiBkZXZpY2UgVVNCIEtleWJvYXJkIFtDSEVT
RU5dIEJhZCBSdW50aW1lIFBNIGZvciBQQ0kgRGV2aWNlIEludGVsIENvcnBvcmF0aW9uIFhlb24g
RTMtMTIwMCB2Mi8zcmQgQmFkIFJ1bnRpbWUgUE0gZm9yIFBDSSBEZXZpY2UgSW50ZWwgQ29ycG9y
YXRpb24gNyBTZXJpZXMvQzIxMCBTZXJpZSBCYWQgUnVudGltZSBQTSBmb3IgUENJIERldmljZSBJ
bnRlbApDb3Jwb3JhdGlvbiA3IFNlcmllcy9DMjEwIFNlcmllIEJhZCBSdW50aW1lIFBNIGZvciBQ
Q0kgRGV2aWNlIEludGVsIENvcnBvcmF0aW9uIDcgU2VyaWVzL0MyMTAgU2VyaWUgQmFkIFJ1bnRp
bWUgUE0gZm9yIFBDSSBEZXZpY2UgQVNNZWRpYSBUZWNobm9sb2d5IEluYy4gQVNNMTA4My8xMDg1
IEJhZCBSdW50aW1lIFBNIGZvciBQQ0kgRGV2aWNlIFJlYWx0ZWsgU2VtaWNvbmR1Y3RvciBDby4s
IEx0ZC4gUlRMODEgQmFkIFJ1bnRpbWUgUE0gZm9yIFBDSQpEZXZpY2UgSW50ZWwgQ29ycG9yYXRp
b24gNyBTZXJpZXMvQzIxMCBTZXJpZSBCYWQgUnVudGltZSBQTSBmb3IgUENJIERldmljZSBJbnRl
bCBDb3Jwb3JhdGlvbiA3IFNlcmllcy9DMjEwIFNlcmllIEJhZCBSdW50aW1lIFBNIGZvciBQQ0kg
RGV2aWNlIEludGVsIENvcnBvcmF0aW9uIDgyODAxIFBDSSBCcmlkZ2UgQmFkIFJ1bnRpbWUgUE0g
Zm9yIFBDSSBEZXZpY2UgSW50ZWwgQ29ycG9yYXRpb24gSDc3IEV4cHJlc3MgQ2hpcHNldCBCYWQg
UnVudGltZQpQTSBmb3IgUENJIERldmljZSBJbnRlbCBDb3Jwb3JhdGlvbiA3IFNlcmllcy9DMjEw
IFNlcmllIEJhZCBSdW50aW1lIFBNIGZvciBQQ0kgRGV2aWNlIEludGVsIENvcnBvcmF0aW9uIDcg
U2VyaWVzL0MyMTAgU2VyaWUgQmFkIFJ1bnRpbWUgUE0gZm9yIFBDSSBEZXZpY2UgSW50ZWwgQ29y
cG9yYXRpb24gNyBTZXJpZXMvQzIxMCBTZXJpZSBCYWQgUnVudGltZSBQTSBmb3IgUENJIERldmlj
ZSBJbnRlbCBDb3Jwb3JhdGlvbiBYZW9uIEUzLTEyMDAgdjIvM3JkCkJhZCBSdW50aW1lIFBNIGZv
ciBQQ0kgRGV2aWNlIEludGVsIENvcnBvcmF0aW9uIDcgU2VyaWVzL0MyMTAgU2VyaWUgQmFkIFdh
a2Utb24tbGFuIHN0YXR1cyBmb3IgZGV2aWNlIGV0aDA8L2Rpdj4KPGRpdj6gPC9kaXY+CjxkaXY+
VGhhbmtzICE8L2Rpdj4KPGRpdj5fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXzwvZGl2Pgo8ZGl2PlBvd2VyVG9wIG1haWxpbmcgbGlzdDwvZGl2Pgo8ZGl2Pjxh
IGhyZWY9Im1haWx0bzpQb3dlclRvcEBsaXN0cy4wMS5vcmciIHRhcmdldD0iX2JsYW5rIj5Qb3dl
clRvcEBsaXN0cy4wMS5vcmc8L2E+PC9kaXY+CjxkaXY+PGEgaHJlZj0iaHR0cHM6Ly9saXN0cy4w
MS5vcmcvbWFpbG1hbi9saXN0aW5mby9wb3dlcnRvcCIgdGFyZ2V0PSJfYmxhbmsiPmh0dHBzOi8v
bGlzdHMuMDEub3JnL21haWxtYW4vbGlzdGluZm8vcG93ZXJ0b3A8L2E+PC9kaXY+CjxkaXY+oDwv
ZGl2Pgo8L2Rpdj48L2Rpdj48L3NwYW4+PC9mb250Pgo8L2Rpdj4KCjxicj5fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXzxicj4KUG93ZXJUb3AgbWFpbGluZyBs
aXN0PGJyPgo8YSBocmVmPSJtYWlsdG86UG93ZXJUb3BAbGlzdHMuMDEub3JnIj5Qb3dlclRvcEBs
aXN0cy4wMS5vcmc8L2E+PGJyPgo8YSBocmVmPSJodHRwczovL2xpc3RzLjAxLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3Bvd2VydG9wIiB0YXJnZXQ9Il9ibGFuayI+aHR0cHM6Ly9saXN0cy4wMS5vcmcv
bWFpbG1hbi9saXN0aW5mby9wb3dlcnRvcDwvYT48YnI+Cjxicj48L2Jsb2NrcXVvdGU+PC9kaXY+
PGJyPjxiciBjbGVhcj0iYWxsIj48YnI+LS0gPGJyPjxkaXY+PGZvbnQgZmFjZT0idmVyZGFuYSwg
c2Fucy1zZXJpZiIgc2l6ZT0iNCI+PHNwYW4gc3R5bGU9ImNvbG9yOnJnYig2OCw2OCw2OCkiPkVk
dWFyZCBHb3R3aWc8L3NwYW4+PC9mb250PjwvZGl2PjxkaXY+PGZvbnQgY29sb3I9IiNjY2NjY2Mi
IHNpemU9IjEiPjxiPlRpdSBwZXJzb25vIGVzdGFzIG9uaaA8YSBocmVmPSJodHRwOi8vZW4ud2lr
aXBlZGlhLm9yZy93aWtpL0VzcGVyYW50aXN0IiB0YXJnZXQ9Il9ibGFuayI+RXNwZXJhbnRpc3Rv
bjwvYT4uPGJyPgoKPC9iPjwvZm9udD48L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2Pjxmb250IGNv
bG9yPSIjNjY2NjY2Ij48aT48YSBocmVmPSJodHRwOi8vd3d3LnVidW50dS5jb20vIiB0YXJnZXQ9
Il9ibGFuayI+VWJ1bnR1PC9hPqAmYW1wO6A8YSBocmVmPSJodHRwOi8va29lbG4uemVpdGdlaXN0
LW1vdmVtZW50LmRlLyIgdGFyZ2V0PSJfYmxhbmsiPlRaTTwvYT6gTWVtYmVyPC9pPjwvZm9udD48
L2Rpdj4KCjxkaXY+PGZvbnQgY29sb3I9IiM2NjY2NjYiPjxpPjxhIGhyZWY9Imh0dHA6Ly9lbi53
aWtpcGVkaWEub3JnL3dpa2kvRnJlZV9hbmRfb3Blbi1zb3VyY2Vfc29mdHdhcmUiIHRhcmdldD0i
X2JsYW5rIj5GTE9TUzwvYT6gRGV2IECgPGEgaHJlZj0iaHR0cHM6Ly9sYXVuY2hwYWQubmV0L35n
b3R3aWciIHRhcmdldD0iX2JsYW5rIj5MYXVuY2hwYWQ8L2E+PC9pPjwvZm9udD48L2Rpdj4KPC9k
aXY+Cg==

--===============7739255479182267021==--

