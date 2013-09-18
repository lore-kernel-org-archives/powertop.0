Content-Type: multipart/mixed; boundary="===============1398413712150471317=="
MIME-Version: 1.0
From: Srinivas Pandruvada <srinivas.pandruvada at linux.intel.com>
Subject: [Powertop] Fwd: powertop 2.4 questions
Date: Wed, 18 Sep 2013 08:46:33 -0700
Message-ID: <5239CAD9.7090200@linux.intel.com>
In-Reply-To: 20130917171449.GB26492@merlins.org
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============1398413712150471317==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


Did anybody observed this issue?


-------- Original Message --------
Subject: 	powertop 2.4 questions
Date: 	Tue, 17 Sep 2013 10:14:49 -0700
From: 	Marc MERLIN <marc(a)merlins.org>
To: 	srinivas.pandruvada(a)linux.intel.com



Hi Srinivas,

As discussed, I have a couple of powertop questions, thanks for passing
them on.
I did try the mailing list:
Date: Fri, 2 Aug 2013 10:27:38 -0700
From: Marc MERLIN <marc_powertop(a)merlins.org>
To: powertop(a)ml01.01.org

but I never heard anything back. Is the list mostly dead, or is there
another list?

So, I got powertop 2.4 from
https://01.org/powertop/downloads/2013/powertop-v2.4

Like I showed you on my laptop, when I go left and right with my arrows,
I'm on the Overview screen, and I can't move to Idle stats or Freq stats
like I could in older powertops:

----------------------------------------------------------------------------
PowerTOP 2.4      Overview   Idle stats   Frequency stats   Device stats   =
Tunables

Summary: 1862.8 wakeups/second,  5.9 GPU ops/seconds, 0.0 VFS ops/sec and 2=
6.5% CPU use

Power est.              Usage       Events/s    Category       Description
   3.30 W      9.8%                      Device         Display backlight
   2.67 W      0.0 pkts/s                Device         Network interface: =
wlan0 (iwlwifi)
   1.34 W    100.0%                      Device         USB device: Integra=
ted Camera (Chicony Ele
   957 mW      4.2 ms/s      43.4        Process        /usr/bin/pulseaudio=
 --start
   635 mW    154.3 ms/s     1229.7       Process        /usr/bin/enlightenm=
ent
----------------------------------------------------------------------------

Separately, it reports this:
   1.25 W    100.0%    Device   USB device: Integrated Camera (Chicony Elec=
tronics Co., Ltd.)

It's on a thinkpad T530. I haven't found a way to stop that.
I've unloaded the uvcvideo driver, but generally haven't found
anything else I can do.

If you have any ideas, it would be greatly appreciated.

Thanks,
Marc
-- =

"A mouse is a device used to point at the xterm you want to type in" - A.S.=
R.
Microsoft is to operating systems ....
                                       .... what McDonalds is to gourmet co=
oking
Home page: http://marc.merlins.org/                         | PGP 1024R/763=
BE901




--===============1398413712150471317==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PGh0bWw+CiAgPGhlYWQ+CgogICAgPG1ldGEgaHR0cC1lcXVpdj0iY29udGVudC10eXBlIiBjb250
ZW50PSJ0ZXh0L2h0bWw7IGNoYXJzZXQ9SVNPLTg4NTktMSI+CiAgPC9oZWFkPgogIDxib2R5IGJn
Y29sb3I9IiNGRkZGRkYiIHRleHQ9IiMwMDAwMDAiPgogICAgPGJyPgogICAgRGlkIGFueWJvZHkg
b2JzZXJ2ZWQgdGhpcyBpc3N1ZT88YnI+CiAgICA8ZGl2IGNsYXNzPSJtb3otZm9yd2FyZC1jb250
YWluZXIiPjxicj4KICAgICAgPGJyPgogICAgICAtLS0tLS0tLSBPcmlnaW5hbCBNZXNzYWdlIC0t
LS0tLS0tCiAgICAgIDx0YWJsZSBjbGFzcz0ibW96LWVtYWlsLWhlYWRlcnMtdGFibGUiIGJvcmRl
cj0iMCIgY2VsbHBhZGRpbmc9IjAiCiAgICAgICAgY2VsbHNwYWNpbmc9IjAiPgogICAgICAgIDx0
Ym9keT4KICAgICAgICAgIDx0cj4KICAgICAgICAgICAgPHRoIG5vd3JhcD0ibm93cmFwIiB2YWxp
Z249IkJBU0VMSU5FIiBhbGlnbj0iUklHSFQiPlN1YmplY3Q6CiAgICAgICAgICAgIDwvdGg+CiAg
ICAgICAgICAgIDx0ZD5wb3dlcnRvcCAyLjQgcXVlc3Rpb25zPC90ZD4KICAgICAgICAgIDwvdHI+
CiAgICAgICAgICA8dHI+CiAgICAgICAgICAgIDx0aCBub3dyYXA9Im5vd3JhcCIgdmFsaWduPSJC
QVNFTElORSIgYWxpZ249IlJJR0hUIj5EYXRlOiA8L3RoPgogICAgICAgICAgICA8dGQ+VHVlLCAx
NyBTZXAgMjAxMyAxMDoxNDo0OSAtMDcwMDwvdGQ+CiAgICAgICAgICA8L3RyPgogICAgICAgICAg
PHRyPgogICAgICAgICAgICA8dGggbm93cmFwPSJub3dyYXAiIHZhbGlnbj0iQkFTRUxJTkUiIGFs
aWduPSJSSUdIVCI+RnJvbTogPC90aD4KICAgICAgICAgICAgPHRkPk1hcmMgTUVSTElOIDxhIGNs
YXNzPSJtb3otdHh0LWxpbmstcmZjMjM5NkUiIGhyZWY9Im1haWx0bzptYXJjQG1lcmxpbnMub3Jn
Ij4mbHQ7bWFyY0BtZXJsaW5zLm9yZyZndDs8L2E+PC90ZD4KICAgICAgICAgIDwvdHI+CiAgICAg
ICAgICA8dHI+CiAgICAgICAgICAgIDx0aCBub3dyYXA9Im5vd3JhcCIgdmFsaWduPSJCQVNFTElO
RSIgYWxpZ249IlJJR0hUIj5UbzogPC90aD4KICAgICAgICAgICAgPHRkPjxhIGNsYXNzPSJtb3ot
dHh0LWxpbmstYWJicmV2aWF0ZWQiIGhyZWY9Im1haWx0bzpzcmluaXZhcy5wYW5kcnV2YWRhQGxp
bnV4LmludGVsLmNvbSI+c3Jpbml2YXMucGFuZHJ1dmFkYUBsaW51eC5pbnRlbC5jb208L2E+PC90
ZD4KICAgICAgICAgIDwvdHI+CiAgICAgICAgPC90Ym9keT4KICAgICAgPC90YWJsZT4KICAgICAg
PGJyPgogICAgICA8YnI+CiAgICAgIDxwcmU+SGkgU3Jpbml2YXMsCgpBcyBkaXNjdXNzZWQsIEkg
aGF2ZSBhIGNvdXBsZSBvZiBwb3dlcnRvcCBxdWVzdGlvbnMsIHRoYW5rcyBmb3IgcGFzc2luZwp0
aGVtIG9uLgpJIGRpZCB0cnkgdGhlIG1haWxpbmcgbGlzdDoKRGF0ZTogRnJpLCAyIEF1ZyAyMDEz
IDEwOjI3OjM4IC0wNzAwCkZyb206IE1hcmMgTUVSTElOIDxhIGNsYXNzPSJtb3otdHh0LWxpbmst
cmZjMjM5NkUiIGhyZWY9Im1haWx0bzptYXJjX3Bvd2VydG9wQG1lcmxpbnMub3JnIj4mbHQ7bWFy
Y19wb3dlcnRvcEBtZXJsaW5zLm9yZyZndDs8L2E+ClRvOiA8YSBjbGFzcz0ibW96LXR4dC1saW5r
LWFiYnJldmlhdGVkIiBocmVmPSJtYWlsdG86cG93ZXJ0b3BAbWwwMS4wMS5vcmciPnBvd2VydG9w
QG1sMDEuMDEub3JnPC9hPgoKYnV0IEkgbmV2ZXIgaGVhcmQgYW55dGhpbmcgYmFjay4gSXMgdGhl
IGxpc3QgbW9zdGx5IGRlYWQsIG9yIGlzIHRoZXJlCmFub3RoZXIgbGlzdD8KClNvLCBJIGdvdCBw
b3dlcnRvcCAyLjQgZnJvbQo8YSBjbGFzcz0ibW96LXR4dC1saW5rLWZyZWV0ZXh0IiBocmVmPSJo
dHRwczovLzAxLm9yZy9wb3dlcnRvcC9kb3dubG9hZHMvMjAxMy9wb3dlcnRvcC12Mi40Ij5odHRw
czovLzAxLm9yZy9wb3dlcnRvcC9kb3dubG9hZHMvMjAxMy9wb3dlcnRvcC12Mi40PC9hPgoKTGlr
ZSBJIHNob3dlZCB5b3Ugb24gbXkgbGFwdG9wLCB3aGVuIEkgZ28gbGVmdCBhbmQgcmlnaHQgd2l0
aCBteSBhcnJvd3MsIApJJ20gb24gdGhlIE92ZXJ2aWV3IHNjcmVlbiwgYW5kIEkgY2FuJ3QgbW92
ZSB0byBJZGxlIHN0YXRzIG9yIEZyZXEgc3RhdHMKbGlrZSBJIGNvdWxkIGluIG9sZGVyIHBvd2Vy
dG9wczoKCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KUG93ZXJUT1AgMi40ICAgICAgT3ZlcnZpZXcgICBJ
ZGxlIHN0YXRzICAgRnJlcXVlbmN5IHN0YXRzICAgRGV2aWNlIHN0YXRzICAgVHVuYWJsZXMgICAg
ICAgICAgICAgIAoKU3VtbWFyeTogMTg2Mi44IHdha2V1cHMvc2Vjb25kLCAgNS45IEdQVSBvcHMv
c2Vjb25kcywgMC4wIFZGUyBvcHMvc2VjIGFuZCAyNi41JSBDUFUgdXNlCgpQb3dlciBlc3QuICAg
ICAgICAgICAgICBVc2FnZSAgICAgICBFdmVudHMvcyAgICBDYXRlZ29yeSAgICAgICBEZXNjcmlw
dGlvbgogIDMuMzAgVyAgICAgIDkuOCUgICAgICAgICAgICAgICAgICAgICAgRGV2aWNlICAgICAg
ICAgRGlzcGxheSBiYWNrbGlnaHQKICAyLjY3IFcgICAgICAwLjAgcGt0cy9zICAgICAgICAgICAg
ICAgIERldmljZSAgICAgICAgIE5ldHdvcmsgaW50ZXJmYWNlOiB3bGFuMCAoaXdsd2lmaSkKICAx
LjM0IFcgICAgMTAwLjAlICAgICAgICAgICAgICAgICAgICAgIERldmljZSAgICAgICAgIFVTQiBk
ZXZpY2U6IEludGVncmF0ZWQgQ2FtZXJhIChDaGljb255IEVsZQogIDk1NyBtVyAgICAgIDQuMiBt
cy9zICAgICAgNDMuNCAgICAgICAgUHJvY2VzcyAgICAgICAgL3Vzci9iaW4vcHVsc2VhdWRpbyAt
LXN0YXJ0CiAgNjM1IG1XICAgIDE1NC4zIG1zL3MgICAgIDEyMjkuNyAgICAgICBQcm9jZXNzICAg
ICAgICAvdXNyL2Jpbi9lbmxpZ2h0ZW5tZW50Ci0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KClNlcGFyYXRl
bHksIGl0IHJlcG9ydHMgdGhpczoKICAxLjI1IFcgICAgMTAwLjAlICAgIERldmljZSAgIFVTQiBk
ZXZpY2U6IEludGVncmF0ZWQgQ2FtZXJhIChDaGljb255IEVsZWN0cm9uaWNzIENvLiwgTHRkLikK
Ckl0J3Mgb24gYSB0aGlua3BhZCBUNTMwLiBJIGhhdmVuJ3QgZm91bmQgYSB3YXkgdG8gc3RvcCB0
aGF0LgpJJ3ZlIHVubG9hZGVkIHRoZSB1dmN2aWRlbyBkcml2ZXIsIGJ1dCBnZW5lcmFsbHkgaGF2
ZW4ndCBmb3VuZCAKYW55dGhpbmcgZWxzZSBJIGNhbiBkby4KCklmIHlvdSBoYXZlIGFueSBpZGVh
cywgaXQgd291bGQgYmUgZ3JlYXRseSBhcHByZWNpYXRlZC4KClRoYW5rcywKTWFyYwotLSAKIkEg
bW91c2UgaXMgYSBkZXZpY2UgdXNlZCB0byBwb2ludCBhdCB0aGUgeHRlcm0geW91IHdhbnQgdG8g
dHlwZSBpbiIgLSBBLlMuUi4KTWljcm9zb2Z0IGlzIHRvIG9wZXJhdGluZyBzeXN0ZW1zIC4uLi4K
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAuLi4uIHdoYXQgTWNEb25hbGRz
IGlzIHRvIGdvdXJtZXQgY29va2luZwpIb21lIHBhZ2U6IDxhIGNsYXNzPSJtb3otdHh0LWxpbmst
ZnJlZXRleHQiIGhyZWY9Imh0dHA6Ly9tYXJjLm1lcmxpbnMub3JnLyI+aHR0cDovL21hcmMubWVy
bGlucy5vcmcvPC9hPiAgICAgICAgICAgICAgICAgICAgICAgICB8IFBHUCAxMDI0Ui83NjNCRTkw
MQoKPC9wcmU+CiAgICAgIDxicj4KICAgIDwvZGl2PgogICAgPGJyPgogIDwvYm9keT4KPC9odG1s
Pgo=

--===============1398413712150471317==--

