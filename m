Content-Type: multipart/mixed; boundary="===============5559541135392075286=="
MIME-Version: 1.0
From: Kalowsky, Daniel <daniel.kalowsky at intel.com>
Subject: Re: [Powertop] Package C states over Haswell platform
Date: Tue, 28 Oct 2014 18:04:05 +0000
Message-ID: <4628F0C61321354285DF2950999754456E08799D@ORSMSX114.amr.corp.intel.com>
In-Reply-To: 002401cff2cb$1aeaebc0$50c0c340$@gmail.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============5559541135392075286==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Not completely true for a 1:1 comparison.

Verify that your WiFi is entering D3, as earlier testing showed Dell specif=
ic WiFi parts (on Linux) were not enabling ASPM.  On Windows this is enable=
d by the driver.

Best walk through for it: http://wireless.kernel.org/en/users/Documentation=
/ASPM



From: PowerTop [mailto:powertop-bounces(a)lists.01.org] On Behalf Of Rony R=
oss
Sent: Tuesday, October 28, 2014 9:21 AM
To: powertop(a)lists.01.org
Subject: [Powertop] Package C states over Haswell platform

Hi,

I'm working on DELL E7440 platform (Haswell based) with dual OS: Windows 8.=
1 and Ubuntu 14.04.1 (based on 3.13).
When I use Win 8.1, using BLA I get ~90% PC7 when idle. However, when I use=
 the Ubuntu, using powertop I get only as high as PC3.
Since it's the same platform, it seems to rule out a HW issue. Any idea wha=
t can be the problem? Is Haswell fully supported by powertop?

          Package   |             Core    |            CPU 0       CPU 2
                    |                     | C0 active   0.2%        0.1%
                    |                     | POLL        0.0%    0.0 ms  0.0=
%    0.0 ms
                    |                     | C1E-HSW     0.0%    0.1 ms  0.0=
%    0.0 ms
C2 (pc2)    0.1%    |                     |
C3 (pc3)    3.7%    | C3 (cc3)    0.0%    | C3-HSW      0.0%    0.4 ms  0.0=
%    0.4 ms
C6 (pc6)    0.0%    | C6 (cc6)    0.0%    | C6-HSW      0.0%    0.0 ms  0.0=
%    0.2 ms
C7 (pc7)    0.0%    | C7 (cc7)   99.0%    | C7s-HSW     0.1%    0.9 ms  0.1=
%    1.8 ms
C8 (pc8)    0.0%    |                     | C8-HSW      0.1%    1.4 ms  0.2=
%    2.5 ms
C9 (pc9)    0.0%    |                     | C9-HSW      0.4%    4.0 ms  2.3=
%    8.0 ms
C10 (pc10)  0.0%    |                     | C10-HSW    98.9%   44.5 ms 97.0=
%   36.5 ms

                    |             Core    |            CPU 1       CPU 3
                    |                     | C0 active   0.2%        0.1%
                    |                     | POLL        0.0%    0.0 ms  0.0=
%    0.0 ms
                    |                     | C1E-HSW     0.0%    0.0 ms  1.0=
%   50.1 ms
                    |                     |
                    | C3 (cc3)    0.0%    | C3-HSW      0.0%    0.7 ms  0.0=
%    0.6 ms
                    | C6 (cc6)    0.0%    | C6-HSW      0.0%    0.5 ms  0.0=
%    0.0 ms
                    | C7 (cc7)   98.0%    | C7s-HSW     0.1%    0.7 ms  0.4=
%   25.7 ms
                    |                     | C8-HSW      0.0%    4.9 ms  0.0=
%    1.5 ms
                    |                     | C9-HSW      0.6%    4.7 ms  0.7=
%   19.5 ms
                    |                     | C10-HSW    98.5%   93.5 ms 97.8=
%   78.0 ms

                    |             GPU     |
                    |                     |
                    | Powered On 12.1%    |
                    | RC6        87.9%    |
                    | RC6p        0.0%    |
                    | RC6pp       0.0%    |
Thanks

Rony

--===============5559541135392075286==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PGh0bWwgeG1sbnM6dj0idXJuOnNjaGVtYXMtbWljcm9zb2Z0LWNvbTp2bWwiIHhtbG5zOm89InVy
bjpzY2hlbWFzLW1pY3Jvc29mdC1jb206b2ZmaWNlOm9mZmljZSIgeG1sbnM6dz0idXJuOnNjaGVt
YXMtbWljcm9zb2Z0LWNvbTpvZmZpY2U6d29yZCIgeG1sbnM6bT0iaHR0cDovL3NjaGVtYXMubWlj
cm9zb2Z0LmNvbS9vZmZpY2UvMjAwNC8xMi9vbW1sIiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcv
VFIvUkVDLWh0bWw0MCI+CjxoZWFkPgo8bWV0YSBodHRwLWVxdWl2PSJDb250ZW50LVR5cGUiIGNv
bnRlbnQ9InRleHQvaHRtbDsgY2hhcnNldD11cy1hc2NpaSI+CjxtZXRhIG5hbWU9IkdlbmVyYXRv
ciIgY29udGVudD0iTWljcm9zb2Z0IFdvcmQgMTUgKGZpbHRlcmVkIG1lZGl1bSkiPgo8c3R5bGU+
PCEtLQovKiBGb250IERlZmluaXRpb25zICovCkBmb250LWZhY2UKCXtmb250LWZhbWlseToiQ2Ft
YnJpYSBNYXRoIjsKCXBhbm9zZS0xOjIgNCA1IDMgNSA0IDYgMyAyIDQ7fQpAZm9udC1mYWNlCgl7
Zm9udC1mYW1pbHk6Q2FsaWJyaTsKCXBhbm9zZS0xOjIgMTUgNSAyIDIgMiA0IDMgMiA0O30KLyog
U3R5bGUgRGVmaW5pdGlvbnMgKi8KcC5Nc29Ob3JtYWwsIGxpLk1zb05vcm1hbCwgZGl2Lk1zb05v
cm1hbAoJe21hcmdpbjowaW47CgltYXJnaW4tYm90dG9tOi4wMDAxcHQ7Cgl0ZXh0LWFsaWduOnJp
Z2h0OwoJZGlyZWN0aW9uOnJ0bDsKCXVuaWNvZGUtYmlkaTplbWJlZDsKCWZvbnQtc2l6ZToxMS4w
cHQ7Cglmb250LWZhbWlseToiQ2FsaWJyaSIsInNhbnMtc2VyaWYiO30KYTpsaW5rLCBzcGFuLk1z
b0h5cGVybGluawoJe21zby1zdHlsZS1wcmlvcml0eTo5OTsKCWNvbG9yOiMwNTYzQzE7Cgl0ZXh0
LWRlY29yYXRpb246dW5kZXJsaW5lO30KYTp2aXNpdGVkLCBzcGFuLk1zb0h5cGVybGlua0ZvbGxv
d2VkCgl7bXNvLXN0eWxlLXByaW9yaXR5Ojk5OwoJY29sb3I6Izk1NEY3MjsKCXRleHQtZGVjb3Jh
dGlvbjp1bmRlcmxpbmU7fQpwCgl7bXNvLXN0eWxlLXByaW9yaXR5Ojk5OwoJbXNvLW1hcmdpbi10
b3AtYWx0OmF1dG87CgltYXJnaW4tcmlnaHQ6MGluOwoJbXNvLW1hcmdpbi1ib3R0b20tYWx0OmF1
dG87CgltYXJnaW4tbGVmdDowaW47Cglmb250LXNpemU6MTIuMHB0OwoJZm9udC1mYW1pbHk6IlRp
bWVzIE5ldyBSb21hbiIsInNlcmlmIjt9CnNwYW4uRW1haWxTdHlsZTE4Cgl7bXNvLXN0eWxlLXR5
cGU6cGVyc29uYWw7Cglmb250LWZhbWlseToiQ2FsaWJyaSIsInNhbnMtc2VyaWYiOwoJY29sb3I6
d2luZG93dGV4dDt9CnNwYW4uRW1haWxTdHlsZTE5Cgl7bXNvLXN0eWxlLXR5cGU6cGVyc29uYWwt
cmVwbHk7Cglmb250LWZhbWlseToiQ2FsaWJyaSIsInNhbnMtc2VyaWYiOwoJY29sb3I6IzFGNDk3
RDt9Ci5Nc29DaHBEZWZhdWx0Cgl7bXNvLXN0eWxlLXR5cGU6ZXhwb3J0LW9ubHk7Cglmb250LXNp
emU6MTAuMHB0O30KQHBhZ2UgV29yZFNlY3Rpb24xCgl7c2l6ZTo4LjVpbiAxMS4waW47CgltYXJn
aW46MS4waW4gMS4yNWluIDEuMGluIDEuMjVpbjt9CmRpdi5Xb3JkU2VjdGlvbjEKCXtwYWdlOldv
cmRTZWN0aW9uMTt9Ci0tPjwvc3R5bGU+PCEtLVtpZiBndGUgbXNvIDldPjx4bWw+CjxvOnNoYXBl
ZGVmYXVsdHMgdjpleHQ9ImVkaXQiIHNwaWRtYXg9IjEwMjYiIC8+CjwveG1sPjwhW2VuZGlmXS0t
PjwhLS1baWYgZ3RlIG1zbyA5XT48eG1sPgo8bzpzaGFwZWxheW91dCB2OmV4dD0iZWRpdCI+Cjxv
OmlkbWFwIHY6ZXh0PSJlZGl0IiBkYXRhPSIxIiAvPgo8L286c2hhcGVsYXlvdXQ+PC94bWw+PCFb
ZW5kaWZdLS0+CjwvaGVhZD4KPGJvZHkgbGFuZz0iRU4tVVMiIGxpbms9IiMwNTYzQzEiIHZsaW5r
PSIjOTU0RjcyIj4KPGRpdiBjbGFzcz0iV29yZFNlY3Rpb24xIj4KPHAgY2xhc3M9Ik1zb05vcm1h
bCIgc3R5bGU9InRleHQtYWxpZ246bGVmdDtkaXJlY3Rpb246bHRyO3VuaWNvZGUtYmlkaTplbWJl
ZCI+PHNwYW4gc3R5bGU9ImNvbG9yOiMxRjQ5N0QiPk5vdCBjb21wbGV0ZWx5IHRydWUgZm9yIGEg
MToxIGNvbXBhcmlzb24uJm5ic3A7CjxvOnA+PC9vOnA+PC9zcGFuPjwvcD4KPHAgY2xhc3M9Ik1z
b05vcm1hbCIgc3R5bGU9InRleHQtYWxpZ246bGVmdDtkaXJlY3Rpb246bHRyO3VuaWNvZGUtYmlk
aTplbWJlZCI+PHNwYW4gc3R5bGU9ImNvbG9yOiMxRjQ5N0QiPjxvOnA+Jm5ic3A7PC9vOnA+PC9z
cGFuPjwvcD4KPHAgY2xhc3M9Ik1zb05vcm1hbCIgc3R5bGU9InRleHQtYWxpZ246bGVmdDtkaXJl
Y3Rpb246bHRyO3VuaWNvZGUtYmlkaTplbWJlZCI+PHNwYW4gc3R5bGU9ImNvbG9yOiMxRjQ5N0Qi
PlZlcmlmeSB0aGF0IHlvdXIgV2lGaSBpcyBlbnRlcmluZyBEMywgYXMgZWFybGllciB0ZXN0aW5n
IHNob3dlZCBEZWxsIHNwZWNpZmljIFdpRmkgcGFydHMgKG9uIExpbnV4KSB3ZXJlIG5vdCBlbmFi
bGluZyBBU1BNLiZuYnNwOyBPbiBXaW5kb3dzIHRoaXMgaXMgZW5hYmxlZAogYnkgdGhlIGRyaXZl
ci4mbmJzcDsgPG86cD48L286cD48L3NwYW4+PC9wPgo8cCBjbGFzcz0iTXNvTm9ybWFsIiBzdHls
ZT0idGV4dC1hbGlnbjpsZWZ0O2RpcmVjdGlvbjpsdHI7dW5pY29kZS1iaWRpOmVtYmVkIj48c3Bh
biBzdHlsZT0iY29sb3I6IzFGNDk3RCI+PG86cD4mbmJzcDs8L286cD48L3NwYW4+PC9wPgo8cCBj
bGFzcz0iTXNvTm9ybWFsIiBzdHlsZT0idGV4dC1hbGlnbjpsZWZ0O2RpcmVjdGlvbjpsdHI7dW5p
Y29kZS1iaWRpOmVtYmVkIj48c3BhbiBzdHlsZT0iY29sb3I6IzFGNDk3RCI+QmVzdCB3YWxrIHRo
cm91Z2ggZm9yIGl0Ogo8YSBocmVmPSJodHRwOi8vd2lyZWxlc3Mua2VybmVsLm9yZy9lbi91c2Vy
cy9Eb2N1bWVudGF0aW9uL0FTUE0iPmh0dHA6Ly93aXJlbGVzcy5rZXJuZWwub3JnL2VuL3VzZXJz
L0RvY3VtZW50YXRpb24vQVNQTTwvYT48bzpwPjwvbzpwPjwvc3Bhbj48L3A+CjxwIGNsYXNzPSJN
c29Ob3JtYWwiIHN0eWxlPSJ0ZXh0LWFsaWduOmxlZnQ7ZGlyZWN0aW9uOmx0cjt1bmljb2RlLWJp
ZGk6ZW1iZWQiPjxzcGFuIHN0eWxlPSJjb2xvcjojMUY0OTdEIj48bzpwPiZuYnNwOzwvbzpwPjwv
c3Bhbj48L3A+CjxwIGNsYXNzPSJNc29Ob3JtYWwiIHN0eWxlPSJ0ZXh0LWFsaWduOmxlZnQ7ZGly
ZWN0aW9uOmx0cjt1bmljb2RlLWJpZGk6ZW1iZWQiPjxzcGFuIHN0eWxlPSJjb2xvcjojMUY0OTdE
Ij48bzpwPiZuYnNwOzwvbzpwPjwvc3Bhbj48L3A+CjxwIGNsYXNzPSJNc29Ob3JtYWwiIHN0eWxl
PSJ0ZXh0LWFsaWduOmxlZnQ7ZGlyZWN0aW9uOmx0cjt1bmljb2RlLWJpZGk6ZW1iZWQiPjxzcGFu
IHN0eWxlPSJjb2xvcjojMUY0OTdEIj48bzpwPiZuYnNwOzwvbzpwPjwvc3Bhbj48L3A+CjxkaXY+
CjxkaXYgc3R5bGU9ImJvcmRlcjpub25lO2JvcmRlci10b3A6c29saWQgI0UxRTFFMSAxLjBwdDtw
YWRkaW5nOjMuMHB0IDBpbiAwaW4gMGluIj4KPHAgY2xhc3M9Ik1zb05vcm1hbCIgc3R5bGU9InRl
eHQtYWxpZ246bGVmdDtkaXJlY3Rpb246bHRyO3VuaWNvZGUtYmlkaTplbWJlZCI+PGI+RnJvbTo8
L2I+IFBvd2VyVG9wIFttYWlsdG86cG93ZXJ0b3AtYm91bmNlc0BsaXN0cy4wMS5vcmddCjxiPk9u
IEJlaGFsZiBPZiA8L2I+Um9ueSBSb3NzPGJyPgo8Yj5TZW50OjwvYj4gVHVlc2RheSwgT2N0b2Jl
ciAyOCwgMjAxNCA5OjIxIEFNPGJyPgo8Yj5Ubzo8L2I+IHBvd2VydG9wQGxpc3RzLjAxLm9yZzxi
cj4KPGI+U3ViamVjdDo8L2I+IFtQb3dlcnRvcF0gUGFja2FnZSBDIHN0YXRlcyBvdmVyIEhhc3dl
bGwgcGxhdGZvcm08bzpwPjwvbzpwPjwvcD4KPC9kaXY+CjwvZGl2Pgo8cCBjbGFzcz0iTXNvTm9y
bWFsIiBzdHlsZT0idGV4dC1hbGlnbjpsZWZ0O2RpcmVjdGlvbjpsdHI7dW5pY29kZS1iaWRpOmVt
YmVkIj48bzpwPiZuYnNwOzwvbzpwPjwvcD4KPHAgY2xhc3M9Ik1zb05vcm1hbCIgc3R5bGU9InRl
eHQtYWxpZ246bGVmdDtkaXJlY3Rpb246bHRyO3VuaWNvZGUtYmlkaTplbWJlZCI+SGksPG86cD48
L286cD48L3A+CjxwPkknbSB3b3JraW5nIG9uIERFTEwgRTc0NDAgcGxhdGZvcm0gKEhhc3dlbGwg
YmFzZWQpIHdpdGggZHVhbCBPUzogV2luZG93cyA4LjEgYW5kIFVidW50dSAxNC4wNC4xIChiYXNl
ZCBvbiAzLjEzKS48YnI+CldoZW4gSSB1c2UgV2luIDguMSwgdXNpbmcgQkxBIEkgZ2V0IH45MCUg
UEM3IHdoZW4gaWRsZS4gSG93ZXZlciwgd2hlbiBJIHVzZSB0aGUgVWJ1bnR1LCB1c2luZyBwb3dl
cnRvcCBJIGdldCBvbmx5IGFzIGhpZ2ggYXMgUEMzLjxicj4KU2luY2UgaXQncyB0aGUgc2FtZSBw
bGF0Zm9ybSwgaXQgc2VlbXMgdG8gcnVsZSBvdXQgYSBIVyBpc3N1ZS4gQW55IGlkZWEgd2hhdCBj
YW4gYmUgdGhlIHByb2JsZW0/IElzIEhhc3dlbGwgZnVsbHkgc3VwcG9ydGVkIGJ5IHBvd2VydG9w
PzxvOnA+PC9vOnA+PC9wPgo8cD4mbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7IFBh
Y2thZ2UmbmJzcDsgJm5ic3A7fCZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5i
c3A7ICZuYnNwO0NvcmUmbmJzcDsgJm5ic3A7IHwmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsg
Jm5ic3A7ICZuYnNwOyBDUFUgMCZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwO0NQVSAyPGJyPgom
bmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZu
YnNwOyAmbmJzcDsgfCZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZu
YnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDt8IEMwIGFjdGl2ZSZuYnNwOyAmbmJzcDsw
LjIlJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7IDAuMSU8YnI+CiZuYnNwOyAmbmJzcDsgJm5i
c3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyB8Jm5i
c3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJz
cDsgJm5ic3A7ICZuYnNwO3wgUE9MTCZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAwLjAlJm5i
c3A7ICZuYnNwOyAwLjAgbXMmbmJzcDsgMC4wJSZuYnNwOyAmbmJzcDsgMC4wIG1zPGJyPgombmJz
cDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNw
OyAmbmJzcDsgfCZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNw
OyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDt8IEMxRS1IU1cmbmJzcDsgJm5ic3A7ICZuYnNw
OzAuMCUmbmJzcDsgJm5ic3A7IDAuMSBtcyZuYnNwOyAwLjAlJm5ic3A7ICZuYnNwOyAwLjAgbXM8
YnI+CkMyIChwYzIpJm5ic3A7ICZuYnNwOyAwLjElJm5ic3A7ICZuYnNwOyB8Jm5ic3A7ICZuYnNw
OyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7
ICZuYnNwO3w8YnI+CkMzIChwYzMpJm5ic3A7ICZuYnNwOyAzLjclJm5ic3A7ICZuYnNwOyB8IEMz
IChjYzMpJm5ic3A7ICZuYnNwOyAwLjAlJm5ic3A7ICZuYnNwOyB8IEMzLUhTVyZuYnNwOyAmbmJz
cDsgJm5ic3A7IDAuMCUmbmJzcDsgJm5ic3A7IDAuNCBtcyZuYnNwOyAwLjAlJm5ic3A7ICZuYnNw
OyAwLjQgbXM8YnI+CkM2IChwYzYpJm5ic3A7ICZuYnNwOyAwLjAlJm5ic3A7ICZuYnNwOyB8IEM2
IChjYzYpJm5ic3A7ICZuYnNwOyAwLjAlJm5ic3A7ICZuYnNwOyB8IEM2LUhTVyZuYnNwOyAmbmJz
cDsgJm5ic3A7IDAuMCUmbmJzcDsgJm5ic3A7IDAuMCBtcyZuYnNwOyAwLjAlJm5ic3A7ICZuYnNw
OyAwLjIgbXM8YnI+CkM3IChwYzcpJm5ic3A7ICZuYnNwOyAwLjAlJm5ic3A7ICZuYnNwOyB8IEM3
IChjYzcpJm5ic3A7ICZuYnNwOzk5LjAlJm5ic3A7ICZuYnNwOyB8IEM3cy1IU1cmbmJzcDsgJm5i
c3A7ICZuYnNwOzAuMSUmbmJzcDsgJm5ic3A7IDAuOSBtcyZuYnNwOyAwLjElJm5ic3A7ICZuYnNw
OyAxLjggbXM8YnI+CkM4IChwYzgpJm5ic3A7ICZuYnNwOyAwLjAlJm5ic3A7ICZuYnNwOyB8Jm5i
c3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJz
cDsgJm5ic3A7ICZuYnNwO3wgQzgtSFNXJm5ic3A7ICZuYnNwOyAmbmJzcDsgMC4xJSZuYnNwOyAm
bmJzcDsgMS40IG1zJm5ic3A7IDAuMiUmbmJzcDsgJm5ic3A7IDIuNSBtczxicj4KQzkgKHBjOSkm
bmJzcDsgJm5ic3A7IDAuMCUmbmJzcDsgJm5ic3A7IHwmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJz
cDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7fCBDOS1I
U1cmbmJzcDsgJm5ic3A7ICZuYnNwOyAwLjQlJm5ic3A7ICZuYnNwOyA0LjAgbXMmbmJzcDsgMi4z
JSZuYnNwOyAmbmJzcDsgOC4wIG1zPGJyPgpDMTAgKHBjMTApJm5ic3A7IDAuMCUmbmJzcDsgJm5i
c3A7IHwmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5i
c3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7fCBDMTAtSFNXJm5ic3A7ICZuYnNwOyA5OC45JSZuYnNw
OyAmbmJzcDs0NC41IG1zIDk3LjAlJm5ic3A7ICZuYnNwOzM2LjUgbXM8bzpwPjwvbzpwPjwvcD4K
PHA+Jm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNw
OyAmbmJzcDsgJm5ic3A7IHwmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNw
OyAmbmJzcDtDb3JlJm5ic3A7ICZuYnNwOyB8Jm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZu
YnNwOyAmbmJzcDsgQ1BVIDEmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDtDUFUgMzxicj4KJm5i
c3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJz
cDsgJm5ic3A7IHwmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJz
cDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7fCBDMCBhY3RpdmUmbmJzcDsgJm5ic3A7MC4y
JSZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAwLjElPGJyPgombmJzcDsgJm5ic3A7ICZuYnNw
OyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgfCZuYnNw
OyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7
ICZuYnNwOyAmbmJzcDt8IFBPTEwmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgMC4wJSZuYnNw
OyAmbmJzcDsgMC4wIG1zJm5ic3A7IDAuMCUmbmJzcDsgJm5ic3A7IDAuMCBtczxicj4KJm5ic3A7
ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsg
Jm5ic3A7IHwmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsg
Jm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7fCBDMUUtSFNXJm5ic3A7ICZuYnNwOyAmbmJzcDsw
LjAlJm5ic3A7ICZuYnNwOyAwLjAgbXMmbmJzcDsgMS4wJSZuYnNwOyAmbmJzcDs1MC4xIG1zPGJy
PgombmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7
ICZuYnNwOyAmbmJzcDsgfCZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7
ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDt8PGJyPgombmJzcDsgJm5ic3A7ICZu
YnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgfCBD
MyAoY2MzKSZuYnNwOyAmbmJzcDsgMC4wJSZuYnNwOyAmbmJzcDsgfCBDMy1IU1cmbmJzcDsgJm5i
c3A7ICZuYnNwOyAwLjAlJm5ic3A7ICZuYnNwOyAwLjcgbXMmbmJzcDsgMC4wJSZuYnNwOyAmbmJz
cDsgMC42IG1zPGJyPgombmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAm
bmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgfCBDNiAoY2M2KSZuYnNwOyAmbmJzcDsgMC4wJSZu
YnNwOyAmbmJzcDsgfCBDNi1IU1cmbmJzcDsgJm5ic3A7ICZuYnNwOyAwLjAlJm5ic3A7ICZuYnNw
OyAwLjUgbXMmbmJzcDsgMC4wJSZuYnNwOyAmbmJzcDsgMC4wIG1zPGJyPgombmJzcDsgJm5ic3A7
ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsg
fCBDNyAoY2M3KSZuYnNwOyAmbmJzcDs5OC4wJSZuYnNwOyAmbmJzcDsgfCBDN3MtSFNXJm5ic3A7
ICZuYnNwOyAmbmJzcDswLjElJm5ic3A7ICZuYnNwOyAwLjcgbXMmbmJzcDsgMC40JSZuYnNwOyAm
bmJzcDsyNS43IG1zPGJyPgombmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNw
OyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgfCZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNw
OyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDt8IEM4LUhT
VyZuYnNwOyAmbmJzcDsgJm5ic3A7IDAuMCUmbmJzcDsgJm5ic3A7IDQuOSBtcyZuYnNwOyAwLjAl
Jm5ic3A7ICZuYnNwOyAxLjUgbXM8YnI+CiZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJz
cDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyB8Jm5ic3A7ICZuYnNwOyAmbmJz
cDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNw
O3wgQzktSFNXJm5ic3A7ICZuYnNwOyAmbmJzcDsgMC42JSZuYnNwOyAmbmJzcDsgNC43IG1zJm5i
c3A7IDAuNyUmbmJzcDsgJm5ic3A7MTkuNSBtczxicj4KJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5i
c3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7IHwmbmJzcDsgJm5i
c3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJz
cDsgJm5ic3A7fCBDMTAtSFNXJm5ic3A7ICZuYnNwOyA5OC41JSZuYnNwOyAmbmJzcDs5My41IG1z
IDk3LjglJm5ic3A7ICZuYnNwOzc4LjAgbXM8bzpwPjwvbzpwPjwvcD4KPHA+Jm5ic3A7ICZuYnNw
OyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7
IHwmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDtHUFUmbmJz
cDsgJm5ic3A7ICZuYnNwO3w8YnI+CiZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsg
Jm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyB8Jm5ic3A7ICZuYnNwOyAmbmJzcDsg
Jm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwO3w8
YnI+CiZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJz
cDsgJm5ic3A7ICZuYnNwOyB8IFBvd2VyZWQgT24gMTIuMSUmbmJzcDsgJm5ic3A7IHw8YnI+CiZu
YnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5i
c3A7ICZuYnNwOyB8IFJDNiZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyA4Ny45JSZuYnNwOyAm
bmJzcDsgfDxicj4KJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5i
c3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7IHwgUkM2cCZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNw
OyAwLjAlJm5ic3A7ICZuYnNwOyB8PGJyPgombmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5i
c3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgfCBSQzZwcCZuYnNwOyAmbmJz
cDsgJm5ic3A7ICZuYnNwOzAuMCUmbmJzcDsgJm5ic3A7IHw8bzpwPjwvbzpwPjwvcD4KPHAgY2xh
c3M9Ik1zb05vcm1hbCIgc3R5bGU9InRleHQtYWxpZ246bGVmdDtkaXJlY3Rpb246bHRyO3VuaWNv
ZGUtYmlkaTplbWJlZCI+VGhhbmtzPG86cD48L286cD48L3A+CjxwIGNsYXNzPSJNc29Ob3JtYWwi
IHN0eWxlPSJ0ZXh0LWFsaWduOmxlZnQ7ZGlyZWN0aW9uOmx0cjt1bmljb2RlLWJpZGk6ZW1iZWQi
PjxvOnA+Jm5ic3A7PC9vOnA+PC9wPgo8cCBjbGFzcz0iTXNvTm9ybWFsIiBzdHlsZT0idGV4dC1h
bGlnbjpsZWZ0O2RpcmVjdGlvbjpsdHI7dW5pY29kZS1iaWRpOmVtYmVkIj5Sb255PG86cD48L286
cD48L3A+CjwvZGl2Pgo8L2JvZHk+CjwvaHRtbD4K

--===============5559541135392075286==--

