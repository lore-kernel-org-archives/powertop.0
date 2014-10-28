Content-Type: multipart/mixed; boundary="===============0076867985346130682=="
MIME-Version: 1.0
From: Rony Ross <rony.ross at gmail.com>
Subject: [Powertop] Package C states over Haswell platform
Date: Tue, 28 Oct 2014 18:20:31 +0200
Message-ID: <002401cff2cb$1aeaebc0$50c0c340$@gmail.com>
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============0076867985346130682==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi,

I'm working on DELL E7440 platform (Haswell based) with dual OS: Windows 8.1
and Ubuntu 14.04.1 (based on 3.13).
When I use Win 8.1, using BLA I get ~90% PC7 when idle. However, when I use
the Ubuntu, using powertop I get only as high as PC3.
Since it's the same platform, it seems to rule out a HW issue. Any idea what
can be the problem? Is Haswell fully supported by powertop?

          Package   |             Core    |            CPU 0       CPU 2
                    |                     | C0 active   0.2%        0.1%
                    |                     | POLL        0.0%    0.0 ms  0.0%
0.0 ms
                    |                     | C1E-HSW     0.0%    0.1 ms  0.0%
0.0 ms
C2 (pc2)    0.1%    |                     |
C3 (pc3)    3.7%    | C3 (cc3)    0.0%    | C3-HSW      0.0%    0.4 ms  0.0%
0.4 ms
C6 (pc6)    0.0%    | C6 (cc6)    0.0%    | C6-HSW      0.0%    0.0 ms  0.0%
0.2 ms
C7 (pc7)    0.0%    | C7 (cc7)   99.0%    | C7s-HSW     0.1%    0.9 ms  0.1%
1.8 ms
C8 (pc8)    0.0%    |                     | C8-HSW      0.1%    1.4 ms  0.2%
2.5 ms
C9 (pc9)    0.0%    |                     | C9-HSW      0.4%    4.0 ms  2.3%
8.0 ms
C10 (pc10)  0.0%    |                     | C10-HSW    98.9%   44.5 ms 97.0%
36.5 ms

                    |             Core    |            CPU 1       CPU 3
                    |                     | C0 active   0.2%        0.1%
                    |                     | POLL        0.0%    0.0 ms  0.0%
0.0 ms
                    |                     | C1E-HSW     0.0%    0.0 ms  1.0%
50.1 ms
                    |                     |
                    | C3 (cc3)    0.0%    | C3-HSW      0.0%    0.7 ms  0.0%
0.6 ms
                    | C6 (cc6)    0.0%    | C6-HSW      0.0%    0.5 ms  0.0%
0.0 ms
                    | C7 (cc7)   98.0%    | C7s-HSW     0.1%    0.7 ms  0.4%
25.7 ms
                    |                     | C8-HSW      0.0%    4.9 ms  0.0%
1.5 ms
                    |                     | C9-HSW      0.6%    4.7 ms  0.7%
19.5 ms
                    |                     | C10-HSW    98.5%   93.5 ms 97.8%
78.0 ms

                    |             GPU     |
                    |                     |
                    | Powered On 12.1%    |
                    | RC6        87.9%    |
                    | RC6p        0.0%    |
                    | RC6pp       0.0%    |

Thanks

 =


Rony


--===============0076867985346130682==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PGh0bWwgeG1sbnM6dj0idXJuOnNjaGVtYXMtbWljcm9zb2Z0LWNvbTp2bWwiIHhtbG5zOm89InVy
bjpzY2hlbWFzLW1pY3Jvc29mdC1jb206b2ZmaWNlOm9mZmljZSIgeG1sbnM6dz0idXJuOnNjaGVt
YXMtbWljcm9zb2Z0LWNvbTpvZmZpY2U6d29yZCIgeG1sbnM6bT0iaHR0cDovL3NjaGVtYXMubWlj
cm9zb2Z0LmNvbS9vZmZpY2UvMjAwNC8xMi9vbW1sIiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcv
VFIvUkVDLWh0bWw0MCI+PGhlYWQ+PG1ldGEgaHR0cC1lcXVpdj1Db250ZW50LVR5cGUgY29udGVu
dD0idGV4dC9odG1sOyBjaGFyc2V0PXVzLWFzY2lpIj48bWV0YSBuYW1lPUdlbmVyYXRvciBjb250
ZW50PSJNaWNyb3NvZnQgV29yZCAxNSAoZmlsdGVyZWQgbWVkaXVtKSI+PHN0eWxlPjwhLS0KLyog
Rm9udCBEZWZpbml0aW9ucyAqLwpAZm9udC1mYWNlCgl7Zm9udC1mYW1pbHk6IkNhbWJyaWEgTWF0
aCI7CglwYW5vc2UtMToyIDQgNSAzIDUgNCA2IDMgMiA0O30KQGZvbnQtZmFjZQoJe2ZvbnQtZmFt
aWx5OkNhbGlicmk7CglwYW5vc2UtMToyIDE1IDUgMiAyIDIgNCAzIDIgNDt9Ci8qIFN0eWxlIERl
ZmluaXRpb25zICovCnAuTXNvTm9ybWFsLCBsaS5Nc29Ob3JtYWwsIGRpdi5Nc29Ob3JtYWwKCXtt
YXJnaW46MGNtOwoJbWFyZ2luLWJvdHRvbTouMDAwMXB0OwoJdGV4dC1hbGlnbjpyaWdodDsKCWRp
cmVjdGlvbjpydGw7Cgl1bmljb2RlLWJpZGk6ZW1iZWQ7Cglmb250LXNpemU6MTEuMHB0OwoJZm9u
dC1mYW1pbHk6IkNhbGlicmkiLHNhbnMtc2VyaWY7fQphOmxpbmssIHNwYW4uTXNvSHlwZXJsaW5r
Cgl7bXNvLXN0eWxlLXByaW9yaXR5Ojk5OwoJY29sb3I6IzA1NjNDMTsKCXRleHQtZGVjb3JhdGlv
bjp1bmRlcmxpbmU7fQphOnZpc2l0ZWQsIHNwYW4uTXNvSHlwZXJsaW5rRm9sbG93ZWQKCXttc28t
c3R5bGUtcHJpb3JpdHk6OTk7Cgljb2xvcjojOTU0RjcyOwoJdGV4dC1kZWNvcmF0aW9uOnVuZGVy
bGluZTt9CnAKCXttc28tc3R5bGUtcHJpb3JpdHk6OTk7Cgltc28tbWFyZ2luLXRvcC1hbHQ6YXV0
bzsKCW1hcmdpbi1yaWdodDowY207Cgltc28tbWFyZ2luLWJvdHRvbS1hbHQ6YXV0bzsKCW1hcmdp
bi1sZWZ0OjBjbTsKCWZvbnQtc2l6ZToxMi4wcHQ7Cglmb250LWZhbWlseToiVGltZXMgTmV3IFJv
bWFuIixzZXJpZjt9CnNwYW4uRW1haWxTdHlsZTE3Cgl7bXNvLXN0eWxlLXR5cGU6cGVyc29uYWwt
Y29tcG9zZTsKCWZvbnQtZmFtaWx5OiJDYWxpYnJpIixzYW5zLXNlcmlmOwoJY29sb3I6d2luZG93
dGV4dDt9Ci5Nc29DaHBEZWZhdWx0Cgl7bXNvLXN0eWxlLXR5cGU6ZXhwb3J0LW9ubHk7Cglmb250
LWZhbWlseToiQ2FsaWJyaSIsc2Fucy1zZXJpZjt9CkBwYWdlIFdvcmRTZWN0aW9uMQoJe3NpemU6
NjEyLjBwdCA3OTIuMHB0OwoJbWFyZ2luOjcyLjBwdCA5MC4wcHQgNzIuMHB0IDkwLjBwdDt9CmRp
di5Xb3JkU2VjdGlvbjEKCXtwYWdlOldvcmRTZWN0aW9uMTt9Ci0tPjwvc3R5bGU+PCEtLVtpZiBn
dGUgbXNvIDldPjx4bWw+CjxvOnNoYXBlZGVmYXVsdHMgdjpleHQ9ImVkaXQiIHNwaWRtYXg9IjEw
MjYiIC8+CjwveG1sPjwhW2VuZGlmXS0tPjwhLS1baWYgZ3RlIG1zbyA5XT48eG1sPgo8bzpzaGFw
ZWxheW91dCB2OmV4dD0iZWRpdCI+CjxvOmlkbWFwIHY6ZXh0PSJlZGl0IiBkYXRhPSIxIiAvPgo8
L286c2hhcGVsYXlvdXQ+PC94bWw+PCFbZW5kaWZdLS0+PC9oZWFkPjxib2R5IGxhbmc9RU4tVVMg
bGluaz0iIzA1NjNDMSIgdmxpbms9IiM5NTRGNzIiPjxkaXYgY2xhc3M9V29yZFNlY3Rpb24xPjxw
IGNsYXNzPU1zb05vcm1hbCBzdHlsZT0ndGV4dC1hbGlnbjpsZWZ0O2RpcmVjdGlvbjpsdHI7dW5p
Y29kZS1iaWRpOmVtYmVkJz5IaSw8bzpwPjwvbzpwPjwvcD48cD5JJ20gd29ya2luZyBvbiBERUxM
IEU3NDQwIHBsYXRmb3JtIChIYXN3ZWxsIGJhc2VkKSB3aXRoIGR1YWwgT1M6IFdpbmRvd3MgOC4x
IGFuZCBVYnVudHUgMTQuMDQuMSAoYmFzZWQgb24gMy4xMykuPGJyPldoZW4gSSB1c2UgV2luIDgu
MSwgdXNpbmcgQkxBIEkgZ2V0IH45MCUgUEM3IHdoZW4gaWRsZS4gSG93ZXZlciwgd2hlbiBJIHVz
ZSB0aGUgVWJ1bnR1LCB1c2luZyBwb3dlcnRvcCBJIGdldCBvbmx5IGFzIGhpZ2ggYXMgUEMzLjxi
cj5TaW5jZSBpdCdzIHRoZSBzYW1lIHBsYXRmb3JtLCBpdCBzZWVtcyB0byBydWxlIG91dCBhIEhX
IGlzc3VlLiBBbnkgaWRlYSB3aGF0IGNhbiBiZSB0aGUgcHJvYmxlbT8gSXMgSGFzd2VsbCBmdWxs
eSBzdXBwb3J0ZWQgYnkgcG93ZXJ0b3A/PG86cD48L286cD48L3A+PHA+Jm5ic3A7ICZuYnNwOyAm
bmJzcDsgJm5ic3A7ICZuYnNwOyBQYWNrYWdlJm5ic3A7ICZuYnNwO3wmbmJzcDsgJm5ic3A7ICZu
YnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDtDb3JlJm5ic3A7ICZuYnNwOyB8Jm5ic3A7
ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgQ1BVIDAmbmJzcDsgJm5ic3A7ICZu
YnNwOyAmbmJzcDtDUFUgMjxicj4mbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZu
YnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgfCZuYnNwOyAmbmJzcDsgJm5ic3A7ICZu
YnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDt8IEMw
IGFjdGl2ZSZuYnNwOyAmbmJzcDswLjIlJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7IDAuMSU8
YnI+Jm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNw
OyAmbmJzcDsgJm5ic3A7IHwmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNw
OyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7fCBQT0xMJm5ic3A7ICZuYnNwOyAm
bmJzcDsgJm5ic3A7IDAuMCUmbmJzcDsgJm5ic3A7IDAuMCBtcyZuYnNwOyAwLjAlJm5ic3A7ICZu
YnNwOyAwLjAgbXM8YnI+Jm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsg
Jm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7IHwmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsg
Jm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7fCBDMUUtSFNX
Jm5ic3A7ICZuYnNwOyAmbmJzcDswLjAlJm5ic3A7ICZuYnNwOyAwLjEgbXMmbmJzcDsgMC4wJSZu
YnNwOyAmbmJzcDsgMC4wIG1zPGJyPkMyIChwYzIpJm5ic3A7ICZuYnNwOyAwLjElJm5ic3A7ICZu
YnNwOyB8Jm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZu
YnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwO3w8YnI+QzMgKHBjMykmbmJzcDsgJm5ic3A7IDMuNyUm
bmJzcDsgJm5ic3A7IHwgQzMgKGNjMykmbmJzcDsgJm5ic3A7IDAuMCUmbmJzcDsgJm5ic3A7IHwg
QzMtSFNXJm5ic3A7ICZuYnNwOyAmbmJzcDsgMC4wJSZuYnNwOyAmbmJzcDsgMC40IG1zJm5ic3A7
IDAuMCUmbmJzcDsgJm5ic3A7IDAuNCBtczxicj5DNiAocGM2KSZuYnNwOyAmbmJzcDsgMC4wJSZu
YnNwOyAmbmJzcDsgfCBDNiAoY2M2KSZuYnNwOyAmbmJzcDsgMC4wJSZuYnNwOyAmbmJzcDsgfCBD
Ni1IU1cmbmJzcDsgJm5ic3A7ICZuYnNwOyAwLjAlJm5ic3A7ICZuYnNwOyAwLjAgbXMmbmJzcDsg
MC4wJSZuYnNwOyAmbmJzcDsgMC4yIG1zPGJyPkM3IChwYzcpJm5ic3A7ICZuYnNwOyAwLjAlJm5i
c3A7ICZuYnNwOyB8IEM3IChjYzcpJm5ic3A7ICZuYnNwOzk5LjAlJm5ic3A7ICZuYnNwOyB8IEM3
cy1IU1cmbmJzcDsgJm5ic3A7ICZuYnNwOzAuMSUmbmJzcDsgJm5ic3A7IDAuOSBtcyZuYnNwOyAw
LjElJm5ic3A7ICZuYnNwOyAxLjggbXM8YnI+QzggKHBjOCkmbmJzcDsgJm5ic3A7IDAuMCUmbmJz
cDsgJm5ic3A7IHwmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJz
cDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7fCBDOC1IU1cmbmJzcDsgJm5ic3A7ICZuYnNw
OyAwLjElJm5ic3A7ICZuYnNwOyAxLjQgbXMmbmJzcDsgMC4yJSZuYnNwOyAmbmJzcDsgMi41IG1z
PGJyPkM5IChwYzkpJm5ic3A7ICZuYnNwOyAwLjAlJm5ic3A7ICZuYnNwOyB8Jm5ic3A7ICZuYnNw
OyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7
ICZuYnNwO3wgQzktSFNXJm5ic3A7ICZuYnNwOyAmbmJzcDsgMC40JSZuYnNwOyAmbmJzcDsgNC4w
IG1zJm5ic3A7IDIuMyUmbmJzcDsgJm5ic3A7IDguMCBtczxicj5DMTAgKHBjMTApJm5ic3A7IDAu
MCUmbmJzcDsgJm5ic3A7IHwmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNw
OyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7fCBDMTAtSFNXJm5ic3A7ICZuYnNw
OyA5OC45JSZuYnNwOyAmbmJzcDs0NC41IG1zIDk3LjAlJm5ic3A7ICZuYnNwOzM2LjUgbXM8bzpw
PjwvbzpwPjwvcD48cD4mbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAm
bmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgfCZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAm
bmJzcDsgJm5ic3A7ICZuYnNwO0NvcmUmbmJzcDsgJm5ic3A7IHwmbmJzcDsgJm5ic3A7ICZuYnNw
OyAmbmJzcDsgJm5ic3A7ICZuYnNwOyBDUFUgMSZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwO0NQ
VSAzPGJyPiZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAm
bmJzcDsgJm5ic3A7ICZuYnNwOyB8Jm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAm
bmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwO3wgQzAgYWN0aXZlJm5ic3A7
ICZuYnNwOzAuMiUmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgMC4xJTxicj4mbmJzcDsgJm5i
c3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJz
cDsgfCZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJz
cDsgJm5ic3A7ICZuYnNwOyAmbmJzcDt8IFBPTEwmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsg
MC4wJSZuYnNwOyAmbmJzcDsgMC4wIG1zJm5ic3A7IDAuMCUmbmJzcDsgJm5ic3A7IDAuMCBtczxi
cj4mbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7
ICZuYnNwOyAmbmJzcDsgfCZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7
ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDt8IEMxRS1IU1cmbmJzcDsgJm5ic3A7
ICZuYnNwOzAuMCUmbmJzcDsgJm5ic3A7IDAuMCBtcyZuYnNwOyAxLjAlJm5ic3A7ICZuYnNwOzUw
LjEgbXM8YnI+Jm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7
ICZuYnNwOyAmbmJzcDsgJm5ic3A7IHwmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7
ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7fDxicj4mbmJzcDsgJm5i
c3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJz
cDsgfCBDMyAoY2MzKSZuYnNwOyAmbmJzcDsgMC4wJSZuYnNwOyAmbmJzcDsgfCBDMy1IU1cmbmJz
cDsgJm5ic3A7ICZuYnNwOyAwLjAlJm5ic3A7ICZuYnNwOyAwLjcgbXMmbmJzcDsgMC4wJSZuYnNw
OyAmbmJzcDsgMC42IG1zPGJyPiZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5i
c3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyB8IEM2IChjYzYpJm5ic3A7ICZuYnNwOyAw
LjAlJm5ic3A7ICZuYnNwOyB8IEM2LUhTVyZuYnNwOyAmbmJzcDsgJm5ic3A7IDAuMCUmbmJzcDsg
Jm5ic3A7IDAuNSBtcyZuYnNwOyAwLjAlJm5ic3A7ICZuYnNwOyAwLjAgbXM8YnI+Jm5ic3A7ICZu
YnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5i
c3A7IHwgQzcgKGNjNykmbmJzcDsgJm5ic3A7OTguMCUmbmJzcDsgJm5ic3A7IHwgQzdzLUhTVyZu
YnNwOyAmbmJzcDsgJm5ic3A7MC4xJSZuYnNwOyAmbmJzcDsgMC43IG1zJm5ic3A7IDAuNCUmbmJz
cDsgJm5ic3A7MjUuNyBtczxicj4mbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZu
YnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgfCZuYnNwOyAmbmJzcDsgJm5ic3A7ICZu
YnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDt8IEM4
LUhTVyZuYnNwOyAmbmJzcDsgJm5ic3A7IDAuMCUmbmJzcDsgJm5ic3A7IDQuOSBtcyZuYnNwOyAw
LjAlJm5ic3A7ICZuYnNwOyAxLjUgbXM8YnI+Jm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZu
YnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7IHwmbmJzcDsgJm5ic3A7ICZu
YnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5i
c3A7fCBDOS1IU1cmbmJzcDsgJm5ic3A7ICZuYnNwOyAwLjYlJm5ic3A7ICZuYnNwOyA0LjcgbXMm
bmJzcDsgMC43JSZuYnNwOyAmbmJzcDsxOS41IG1zPGJyPiZuYnNwOyAmbmJzcDsgJm5ic3A7ICZu
YnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyB8Jm5ic3A7ICZu
YnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5i
c3A7ICZuYnNwO3wgQzEwLUhTVyZuYnNwOyAmbmJzcDsgOTguNSUmbmJzcDsgJm5ic3A7OTMuNSBt
cyA5Ny44JSZuYnNwOyAmbmJzcDs3OC4wIG1zPG86cD48L286cD48L3A+PHA+Jm5ic3A7ICZuYnNw
OyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7
IHwmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDtHUFUmbmJz
cDsgJm5ic3A7ICZuYnNwO3w8YnI+Jm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAm
bmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7IHwmbmJzcDsgJm5ic3A7ICZuYnNwOyAm
bmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7fDxi
cj4mbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7
ICZuYnNwOyAmbmJzcDsgfCBQb3dlcmVkIE9uIDEyLjElJm5ic3A7ICZuYnNwOyB8PGJyPiZuYnNw
OyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7
ICZuYnNwOyB8IFJDNiZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyA4Ny45JSZuYnNwOyAmbmJz
cDsgfDxicj4mbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsg
Jm5ic3A7ICZuYnNwOyAmbmJzcDsgfCBSQzZwJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7IDAu
MCUmbmJzcDsgJm5ic3A7IHw8YnI+Jm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAm
bmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7IHwgUkM2cHAmbmJzcDsgJm5ic3A7ICZu
YnNwOyAmbmJzcDswLjAlJm5ic3A7ICZuYnNwOyB8PG86cD48L286cD48L3A+PHAgY2xhc3M9TXNv
Tm9ybWFsIHN0eWxlPSd0ZXh0LWFsaWduOmxlZnQ7ZGlyZWN0aW9uOmx0cjt1bmljb2RlLWJpZGk6
ZW1iZWQnPlRoYW5rczxvOnA+PC9vOnA+PC9wPjxwIGNsYXNzPU1zb05vcm1hbCBzdHlsZT0ndGV4
dC1hbGlnbjpsZWZ0O2RpcmVjdGlvbjpsdHI7dW5pY29kZS1iaWRpOmVtYmVkJz48bzpwPiZuYnNw
OzwvbzpwPjwvcD48cCBjbGFzcz1Nc29Ob3JtYWwgc3R5bGU9J3RleHQtYWxpZ246bGVmdDtkaXJl
Y3Rpb246bHRyO3VuaWNvZGUtYmlkaTplbWJlZCc+Um9ueTxvOnA+PC9vOnA+PC9wPjwvZGl2Pjwv
Ym9keT48L2h0bWw+
--===============0076867985346130682==--

