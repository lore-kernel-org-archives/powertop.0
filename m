Content-Type: multipart/mixed; boundary="===============6207108658041832575=="
MIME-Version: 1.0
From: Sami Kerola <kerolasa at iki.fi>
Subject: [Powertop] [PATCH v2 11/14] squeeze all extra bits from size of
 binary and html report
Date: Sun, 09 Nov 2014 13:14:28 +0000
Message-ID: <1415538871-11411-12-git-send-email-sami.kerola@lastminute.com>
In-Reply-To: 1415538871-11411-1-git-send-email-sami.kerola@lastminute.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============6207108658041832575==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Sami Kerola <kerolasa(a)iki.fi>

This change makes the css text smaller by removing unnecessary leading
white spaces, and the logo got 'pngcrush -brute' treatment.

-rw-r--r-- 1 root root 62722 Oct 20 22:12 before.html
-rw-r--r-- 1 root root 60224 Oct 20 22:13 after.html

Signed-off-by: Sami Kerola <kerolasa(a)iki.fi>
---
 PowerTop.png                         | Bin 6975 -> 5542 bytes
 src/csstoh.sh                        |   2 +-
 src/report/report-formatter-html.cpp | 246 +++++++++++++++++--------------=
----
 3 files changed, 124 insertions(+), 124 deletions(-)

diff --git a/PowerTop.png b/PowerTop.png
index d8474107f189549d45cf854db5c801ffd935dbb9..838272b08f5a222684ec8fbc309=
781176bb445c0 100644
GIT binary patch
delta 5498
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

delta 6943
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

diff --git a/src/csstoh.sh b/src/csstoh.sh
index 4ba70e2..53c465c 100755
--- a/src/csstoh.sh
+++ b/src/csstoh.sh
@@ -37,7 +37,7 @@ cat <<HERE || exit $?
 const char css[] =3D =

 HERE
 # body
-sed -r 's/^(.*)$/\t\"\1\\n\"/' "$1" || exit $?
+sed -r 's/^[ \t]*//; s/^(.*)$/\t\"\1\\n\"/' "$1" || exit $?
 # footer
 cat <<HERE || exit $?
 ;
diff --git a/src/report/report-formatter-html.cpp b/src/report/report-forma=
tter-html.cpp
index 41440f9..2adb4c5 100644
--- a/src/report/report-formatter-html.cpp
+++ b/src/report/report-formatter-html.cpp
@@ -139,129 +139,129 @@ void
 report_formatter_html::add_logo()
 {
 	add_exact("<img alt=3D\"PowerTop\" class=3D\"pwtop_logo\" src=3D\"data:im=
age/png;base64,"
-			"iVBORw0KGgoAAAANSUhEUgAAAbQAAABDCAYAAAD01PBTAAAACXBIWXMAAAsTAAALEwEAmp=
wYAAAAG"
-			"XRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAGsxJREFUeNrsXQt4FNXZ/nL=
hmutqV"
-			"dAKMXJHTMhiLGAuLUEfSg2xSFSUgIkkRPQ3QiHxqcRwswQrRq2EBKjhapvU3yCgtaQ+CRG=
USyABv"
-			"NDfRhArqEA2FwjksvnPN0xokpnZPWd2dnd297w851kyt3OZ+c4773e+c8aro6MDODg4ODg=
4XB3ev"
-			"Ak4ODg4ODihcXBwcHBwcELj4ODg4ODQDr68CWxCrPgbTlJwj33l4m81SSbeVBwcHBz2hRc=
PCqEGE"
-			"laCSGKYBldXV4PJZILO325MF3uN68LDwyE4OLheJLjOVM2bk4ODg4MTmqMxB4mMENa08vJ=
yKC0tF"
-			"QispqaG+gKDBw8WiA1JLiEhAUJCQk6TzXkklZJ0ijcxBwcHByc0e6qxDEyExILy8vJgx44=
dml08L"
-			"CwMMjIyBHIj6m0T2ZTDiY2Dwz3xzsEbM3tsWkV5ahVJJV3/fizyQhlvURsJzcvLaw/5iXN=
QmcrEd"
-			"P1vUsYqRzUIyQuJLKeoqCho6dKlcPr0abvlFRQUJBDbc88910lsGaStVY23kfMyGQwFcQO=
pa52Kf"
-			"IrJzwwVRVSbXwH5SdU6Hwc/0ywoIeVP1FHZe3aqNtsj6eDVPkMOvxeEQBJV1A+fVyPjc8u=
CWpIK8"
-			"V6Q8mnaN5KyO7Wvt7U+egwKievZoMSAQTQqNPYSe2Ta3t6OgR1FFRUVYcnJyXYlsk7U19c=
DkiYqw"
-			"Ozs7NmE2HCMbo6Pj0+pyoeDBaFiZwUqzlMDo4oysuZXpYY0dQa9ld8oJi3t0eAi96JWhRJ=
b5YByh"
-			"XbmQ/JEG84lRFDigs+6pK8n9bn+bKmpkyuF7eMbXTExpsMkGTUls7b2DFOd6eiC5xeETZo=
0iZrMv"
-			"G+6EXxHD4e+UydD34d+DYFD7oDFixZD9pJsiI+Ph+joaGpiW7hwIURERATVVNe8R8pTSlI=
wo7KsY"
-			"uwMbSEmR57HUk53cMfUuqA9xtnxnur+5YJ0wjNIuuggMpOzq2JUViSFgntghlinwyQx9Ru=
uGLaPF"
-			"UQjSiOdeKGtF2trayuqqamZPX36dKtE5tW/H/SOjIBe946FXqNHgJdf/277J9x4C6yceL/=
kPKL6h"
-			"ITjcMeOHVO8Pu4zjjPCxo0bpyUlJZWTss3x9fVliYisZSAO5offxhcJNfkZWBWaGxhznQv=
a4x5Ge"
-			"zS4y73QkfsUXyr+TcqT6KJqTbGvJ3VKI3WierZceWJ1ATEi1Q9Sa2trMEnVmzZtmm1NlaE=
K83smB"
-			"Qxb3gK/Z1MEUutJZohdsVNRKUkSKrUlS5bA4cOH4dChQzBr1iyLZUtJSYHk5OQwcm45KWO=
4nRSKG"
-			"nIKtfHhtHd+tW5gxHUeYI8u73IknawBFQTobyywWCYIxdVRgCrY3QkNsUp8i2fC1atXg81=
mczkhs"
-			"7CnnnpKcPnJwSfkdghYthgCl2VCn19OpLo2ua7FNGbMGFi/fj2cPHkSnnjiCcXrbNmyBUk=
t6MKFC"
-			"xWkvLSkxqJQ1JCTLQrNqOJesZSxzpHBQ5zQFEnNYEXRhLrJvdhjoz3YtV90Q1LDOlntP1y=
d0NA4m"
-			"COJUPls3rw5bO7cubL70bXY/8nHIOjVpYJrkRY/f2CSrEKTS4MGDRKI7aOPPhL+L4etW7d=
CampqI"
-			"Jb3ypUrNKRWxth2jlRoas73tPEzV1eZBgp7dHlCIx3rKh2TWVcCMIL7gKqvd4elr7CSubQ=
HNzc3F"
-			"xH1E5aWlqaoyvyfSQGfOwYxF+TurOeBdV5fVFQUHDhwABYtWiQQWE/s3LkTCPEGFRYWlpK=
yh/fr1"
-			"89kgajryBtyFaWxGcixoeQclg7UVgOJY1SRLIquyk0M19WjNDOt2KOruBvhscgLtTJkNkO=
sIyuuh"
-			"6iT61L1VySvuC42pybgBN2P40h+dW5iG1b7endYnDiUNlih+fLljGM1NbORPGTZffRwwb2=
ohswQx"
-			"1a9hqzCnIICA6GwoABW5+YqKrWVK1YMJseWUhqO5gSlIkDD0QrNHcbPwA2mHRisRD26ekA=
IK7GgP"
-			"SKpTEYioyUzkfjKOs8hCedKZNlD1bhSX29NdWqt0GqJQd6p9mRiCGonJFp987906VJ4fX3=
9a4mPP"
-			"AINDQ3ShhgxVCAztWg5eAQufvRP2Lxli8WxMUt4ev58CAwKgnnz5kn2rXz5ZbgvKiqGKLo=
cPz+/H"
-			"I069lA7HauVwjMydhz2gE3PtJPhLHu0NOewhDZiTUG10E78rSX5aHrfxHEpFjtAIsrSKn8=
kNlIGb"
-			"NdihnJkknMK7aDSbGpfGyafW+zrdaXQMOyXJPQFTtb6TZ5ctyg1NRW+/fZbyb7ekWMhcOU=
LcHF6M"
-			"lx6c6MqMmvK/ZPwfySjlStXUo+l9UyPP/44rFu3TjYfdJOaTKaXmpqaLI2n2SswRAt/vFH=
r+9pZZ"
-			"zdQNnpUi532OE6r++zi7i+WzrdESzLr0n5o34lA75o2gA5VGr7UkKR5X++tU0MqY5TXFiv=
Z2NiYs"
-			"Xfv3rDdu3dL9uGYGYbkC41x041wtXwfM6m1f3Om29+VlZWqCQ3TzJkzIT09XZIPkrFIlnk=
W2o5lg"
-			"rWjFRr1XDYc39OBOuP47zOV5ehnRU8QFQVtvdBLkmZHMhBWB2E4JZMmQtBJxKZpX6/nMTR=
NIvYaG"
-			"hqCiUHmyLnxMJoRA0A655T1eyRB+EVS06ATsCmtWrUK7rrrLsl18/PzcQJ2DKlXggZtx6K=
YtIqYi"
-			"tPiwe0Brs7sj0KtOh0XBctqKLn2VqLiWBzt8IIB9LluqaZ9va4JjVFpKL59mM3mjK1btwa=
dOXNGs"
-			"g8JrGsACM41w3lnmNS6HzvJzNp8NJq0bds2CAwMlL5uZWbi/jwLRaB1OxoY5obREFqhLff=
Khk6RK"
-			"zT722MdYwfqTuoM60M7gRrbyVErdbCoNN0uBi0qzjotni29RznaVElTXV0wscQMVDs9Iaz=
B+Bup+"
-			"xbnnWFS637s0gPYnAbdfrus63Hfvn1w/NixwaR+sRp08FaJSiQ9a51ULWW+Wis0d5lQ7Qq=
gDjhid"
-			"Bm7kzordOA4YQlDHxmn8zb2CEKzKRSbcELCrt27FdTZNIvn+o4aDv0DfFW7H63x1enT38L=
sJ5+Ah"
-			"YueB5OpXvG4zMWZcDshtp7Iz1+H+zM0ULc0HQ+NOquivF+hGpaLRY1ycKgFi7vdYc+jSJy=
0L68Gn"
-			"U+01mTajbc7P4XmDnPG9u3bZdWZpRVAmtIXQEvFfrjc2Cb83Tx7LpNSE1yOHWbF9Ld3/wb=
hY8Ph/"
-			"R0fwJ83boKhw4fA8RPHFY9fvHix1A3yl3egzlQ37cKFCyE2PiCaERolkRooA0M4oXG4IqE=
52v1dZ"
-			"ad6uCTcltDOnz8fYjKZwj788EPJPjlXYyda8wuh5cfui3FcudTO7H60FPDxcu6ybse2tbb=
Dbx+OV"
-			"zx+ypQpsmNpH3zwAe5PsNGwQjU6poohX05oHO5IaFVOmJZg7/VbOaFpCNWDy9jRY4cvqfB=
NNwqr5"
-			"cuec+kyNH18QOZa135Z3I+WCO3KlSuS4y/8VA9r89+QPR7JDEmtJ3AaAtkfa+ODbtTomCq=
GfC0aF"
-			"uWYnbPeiDk8CGJACO2z6IzVatyF0DQJJNI7oVEHBsgQSiwGT/SEEpkhWt4qgA6zdC3GXgZ=
/5uhHS"
-			"4Q2zig/T/WVV/6oeM6jjz4qOX7//v24b5oOFFrXic00BmbU6L7X8gnVurRHWZv0gDo7nNA=
YFWGoG"
-			"7RznUsSmjjOYlBbyQ6zOVyO0PDjnEq4cvQL2e39lyy6Hv3YqdQskZpAQmazYtpQ8Db06dt=
bcl5TY"
-			"zMc+Owz2XPG/+IXErcjLuF1/Phx+OHcuViZMtTRvr1ZGtMSo9UMDIasBaFRu3gcYWikDTo=
0Tv92t"
-			"V6ddS1PN3rRYFEOzqqzS0+nEINVDFq0sZ4VWpzaG3ru7Lng+vqGwd99952U0BSCQVqPHIP=
2lnYpm"
-			"YUOBJ/B/40yxFVFOkP6LRu05ZS5SH5y/Btr1yieM2H8BMnxJ46fwH3hdlRpLO5GWiK1Fhh=
C+3Dz8"
-			"TPHIVWtPXJVqhtC06tCi9OqrrokNHG17lVqK0n0UThGDfYELnOlSEAywSMCAT7TfYURnHw=
dvO4Vq"
-			"+7HDiv/5qXPIyqtl+S8z/YfVDxn9F2jJcef+e4M7gu244NOYwRlKog0VAPD4+NnLmCPHBw=
W1Jmmz"
-			"5avzgxH7QrMtT3cHcFyX6H2uflnihdo/Uaq5nz6+HZTZ3JKD5WaHFHSfBfNeM9Y2F95sNs=
2dDsqn"
-			"Ttq1CipQjtxQovAEFsVWq2KfPG6JbYQGp9QrVt79NT7wsdz6YlMk77e3oQmjDc4oX26vam=
bzeZw7"
-			"OilCk35O2ftzS2SbX1uu8lipuh+bP5rKbSfOiMhM1y6yhrGR0ZJCA3x+eefw8iRIyXbAwI=
CJNuQu"
-			"JXywg6f3A80MmsuPKMNaklupXtbIx1Zpglw6M8e3aljd6cxNCSSULkPl6p5tsi1nN7X94Q=
7zEOTL"
-			"n3Uwd7ObVdapY1z60CL53S6H/slTpNjE6vp3shI2esKwSwyx1++dElJqqh+ADRQaFUyRFp=
LYdxxC"
-			"qqANviAuxv1ixLeBBz26OvFdR/dmtByZTpU2U6+7V/Xgstw7Kvr+JfSOFjTJ0fAGGCAvuu=
2XD8H/"
-			"4/buv49sE/fbuc1trVC0rPz4fZBg4R0qOFit7/x/7gNPzYqh+J3C8F09RA8k5F0/Rz8+72=
dm2S4r"
-			"M2ae5NGyRjk1t6jXNGjViXhGBTW++MTql0bZeILDQeH3fv6nvB18QqiCiiUIzS5Lv6p8VG=
QZfwVw"
-			"KlT3XcU/QoGh4RIjn/44Yfh1WFjAda/Lb1Yl2u8lpcHXZe+P9ncBGeTHoIbSBLyPXkEoMv=
fNeI2D"
-			"CxpzF4tufT0+U1w/OJceCQTSLpB2IZ/j/9tO+z43x6kAz7WCI3lUzK1KsilzALhzLBTnpz=
QXLjTc"
-			"cE+hhbOCounjl7UyN2om77e3RRamtx8F7O5Q7aT7927t7BPLvn28pEc/58fvlE8vmvq6ND=
WleznL"
-			"39bmhqlY2UdYn2VwLBQcagC4ViEhcAMtUtg0RhnHVcBukSJ+HFeT4WBPwL26+tpJpG7skJ=
DMpP11"
-			"ROKMckFUOBEZHntBsJE57bW5m7bTn75teLxWqDtxEnZ7YOH+TBdh6KMtRTkZFBBLlVW8lR=
DojSdg"
-			"iM7TVyN5E7en1Ap5jTeDBx2IjOqcVlvFzWcyaSTKbSgGqrlQty/+OILxaWlQkJ/Ljn+4vl=
6IYqQ5"
-			"gvTatBy8Ihk288GKN+S0/+STvzGaEisrwYEYFSh0Mos3AOaCdZxKhUadzfqT5mNc9NlyFg=
8AXp3O"
-			"bqaV0Po6wmZUX8t3ZUIDRk6UTQcix10h9lsuvXWW+UJTWE5qrFh8usrrs1/0+IyVpjURFW=
afzwvC"
-			"fdHjDL2YiK0QKJEsb4aEEA38qKMNrTWgdEEhhgYSZQTmn5QJr5cJrpxHd1pDM1VXjiEvp4=
Q2TiSm"
-			"LwxenQ5VkH3sN8y1gm0dw4ZUi2nmhobGwGXw7rtttsk+57/n4WwdfM7ku2bijbD4t9lWcy=
vZ07ef"
-			"v2tlrH5rztkt4+L6QW+XkHg7dUbWsw/9SC0NsnxkZGRqIbKNVBoArl0ecvWInSe5r7F9bj=
fXKHpu"
-			"3PPFRV4rofUmUXVOHxpKfFrAPaoi1P6emth+Y4mNN2MN5ByVJDOPubgwe4Tl/+xZw/MmT1=
bcjyOu"
-			"d12+83wnzM/dtve0tIGz2akwxuvrVXMa3ZSEuwh1/3qq6/Aq38/+XlpXdD6+Veya0Giu3F=
cTG9o6"
-			"6i/zpLeXn2IjO4DZ783wen/kyq0ESNGWHU5IkkRsqoCulXuq7oQjcXOjeJFg2kOnEIYv8Q=
I+Ar72"
-			"tgjae/DQL8QdC65VpanNSAGIhDSoFmcwCmEBmwf7dSS0GpJ2+hubNltP/BJBFp5pMzE5bI=
9ZYpzn"
-			"Rc+L2+vf//gn1BcXKJ4XkBAIOwovaa4DFveAp87lFckEb65tupN2X0xv+kj2WbuuEoIrgE=
OV7TIk"
-			"hnJu2bosGEmiiZhHUcz2GocIvHUMeTJJ1Q7FolA74bKJASY6aHtRP1tQUbF5MqEpku4LaG=
ZO8zlk"
-			"yZNkmw/eOigsKAv2S9J+BHNmwfcIHu9l3KyobyiXPa8zmS1gydk1pCdCx2Xm2XV2ZRH+yq=
eu3fXV"
-			"ck2JGysp4YPcyiDodASSxmDQYZyo3SoFwPbkiUycRXlZHtPJTQaz4YzCc3tXfVuS2hEvZQ=
PHz68X"
-			"i445L333lOMVixc92d0xUjOaW83Q1paGixd/pLiuX1iJyqWB92MpnmLZANBEEkL+kP/AC/=
ZfV8ca"
-			"ZV1NyYkJGC+RRo+zCyEVqtRvqFdAkMM3CgdTmo4hsEyHlYsE8jDCU0dwdgEUQ3SEmidreN=
TnNCcb"
-			"61FD5FOvyc2b94MjQ0Nsv7DYUOHQnJKkuIl/7K9GGIIcVWUl0vO9Xs2RaoUfzwvLK2FK4L=
IKTNE9"
-			"NQ+wtiZEt5dLz2PkDWMGD789MiRI6vpmoJqgrVAaGKHZdDIyGmUXBxlZ1DHV9i3C6llAdu=
XGfZ4W"
-			"BOxuLlTHeh2nAH0kZUe4ar3dnNDzZs1a5ZkO0Y7biKkpqS0FmQsgphfjle87k8/1kH600/=
DveMjI"
-			"WPhs1BOyA2jJ3FtR3Qrohq7smsPNOW+Cab0xRY/BjoywhfmZfsp7kd19uURaXRjEqkXgzq=
jfaiNW"
-			"hML5XGhMgrRY43SSWAZTzOSl55VntIw4goVtAsuG8D6km9agWVM0yMWjHZrQhs1evQpPz+=
/imnx8"
-			"ZJ9a9euFeal4adX5NKfXi+AyPFjLV6/seES/OPvH8PT8+fD/Q88cK2nT3pGUGOX334HWg4=
etXj+4"
-			"KG9YOHqAIvHbFlzWbIN3ajx8fH1pJx5WrtOxDESo63XYTzeSElofPzMfi9/rONpGCQyw4O=
aiOVlK"
-			"tPeKk38nhjL/DOu0NzDUCEnPf1p2X0vLlli8QsvG9ZtggcT7rdLudDN+IetAeAfoBwIgq5=
GubGz9"
-			"HnpWL68u8aMMdnBKEPBtiWv1OQbqrGbk0MdqbGOpxV4SpCIuFoFyxfgC+xIZnh9FoWcS7M=
OIic0F"
-			"8CYu8eUDxw4cMe8efMk+06ePAm5q3MtLmm1IucVWJ27Gvr2661Jefr7e8GC1f7X3YxmuCr=
MM+sJd"
-			"DW+u0E6djZw4ABBnaE7VUWHRTuO5gyFRtMxcpej/UmNZTwNX0A8KUiEhexnEOLR3C1Lrol=
2sgfYV"
-			"iXxmO/TeXuEkUJHxsyZMxsIsUn2bdu2DXa8v0NY4Ffp3/0P3A+ffXoQ4hN+Db16+6gqAxL=
Z9Kf6w"
-			"RulwZIAkJ6k9tNZM6xZ1CR7neXLV2CZcu4Ou9uksjmsvWXOAO1dfzREZG08wFkTqoWvPjs=
wFevAZ"
-			"FjG0+yqRlxYpQnPNCGgPSIJaUFm6GY8DGwTuLNc+JMxzPD1hEqGhYWdqj569LVlS5e+NDc=
1VbI/O"
-			"ztbWJMxXmasrSuWZq8QEob9by/eBKe/+R5aW9oskhiS16gIX4iWmTQtR2pNjVcImTXC5Sb=
p0l2El"
-			"MEYEVFB6pNnQ3OUWVFDmkcaiiuV1FoxRGvhx55ilE53DeF4GrlfOJ5GS64zcNK1hyyHlcX=
QLp3P9"
-			"WFCRmWdL3aEYKjaSSTCTrtQo/bQZgrBg+DrKRUNHzs2hxhcbFpqakxBofQev5STI6w2Ff/=
gg1avh"
-			"fO/ErpMB0CCu9zcDLs/fh0eTu0nbAsZ6qs4r0wJP5xtJmR2SXbcbOiwIfC7hQvR1TjHxqa=
wdRyqz"
-			"IZ8Q51YbleBLogbx9MISeUCfSQdTrquVfqkkxuptBJCNCzt0pXY4kSiclSEaKKnjJ11wtu=
TKkuML"
-			"SE1NbU+NiZGdn8OITV0QdJ8LqZrQnKb+dhjkL0ukKixXkJiJTNcSf+FJ+oJmbVK9vn794c=
1f1yDe"
-			"c0ZGxFxykmEZGuHW+XkcnOFxm4vWYz3rYByPU5XJ7Us0P8LVpYnTKT2aEKLMBpNqNKys7M=
bcAK1H"
-			"F5dswYWLFx47WOgjMS2btklVeXCaMYXZtXLuhn9/PtCYcF6GDhw4FJS/lINOqk6G41R7bm=
2EJInT"
-			"ajW2xs1y3iaJwWJTNYxqWXRujU5obk4jOPGVfv7B8zOz18HQxVIraKiAh6Mj4f3398JZnM=
Hddq7+"
-			"ypTWTCSEVWZXDTjNTLrAwX5G2DIkKGbSLlzNGwGW8hFlRFTRlhqrQo5odn+AsQ6Pw3Hfdw=
+SARde"
-			"fi9LtBfBGGip5KZRxIa4p7Ie0oDAvyfXJef3xARESF7TFNTEyxbvgymTYuHXbt2wrXvuVh=
LdED3I"
-			"qq5FemNsuNlCH9/P4HMhg0buomUd47GTaCWIOrEDs7R+XpSuL7uyFvF/LQZnrIyPyGPREY=
Vay+gj"
-			"dyJY3zgwfD21IrfExlZ5O/vH5O/dm391KlTFY87e+4cIbblED9tGhSuXy/MXVNyOW4/cIP=
idS43d"
-			"ggr5i9PbxDci5bUHCrHrVu24u9SUs45dqi+M9yGtpzvSWMBuhzEVzGehkEicZ5ww5BESEL=
jd8b34"
-			"qpEVTbZk8LzleDryZWPvPfe6s8+/TT2xd//vig6Kips+YoVgjKTwzlCbBs2bBDSgAEDAJU=
djsN1u"
-			"i2HDRsGH354RfgEDCqwS01mOP+9GU6R/3+psFq+HB5JTISUlJSGgICA2aR8pfaoN7r/SGd=
D+9FCL"
-			"YnFWUTqMtD5x0tRiRxmeG5wPC2R1Mkj7p/o6ssV54uh6zXVjioeQ7XLPDHwwxK8UFl4Oj7=
dvz+Y/"
-			"OScPXv2ubzXX4fKykqHlwFJ8sUXX4SIsWNryJ8J4ydMOMUfTw4O1wchuK7uV3wZoHXH9px=
HVkUIj"
-			"K+WwwmNDvv37YslP0VHjx4dvHHjRjhaXW33PP38/SAlOQWVWT2S6oSJE/P4neDg4ODghKY=
J9n2yb"
-			"w6SCxJbcXExVH6ivWJDRZacnAzRUdHg7+//OuY38b6JJt76HBwcHJzQNMcnlZVIbBnnzp0=
L21tZK"
-			"bgiq21QbbcMuBmi74uGKVOm4NjbaVSDJOXdFxXFiYyDg4ODE5r9Ubl3bwj5QXLD9a7C0BV=
ZffQoN"
-			"DY1wddffy0c0yT+f8Att8AAcRFkorxg6JAhMIQkDB4hqgxJrJyk0qjo6FLeshwcHByc0Jy=
GvRUVG"
-			"EASTlIsSSFiQuD2MJJwLKxTxpnE/wspOibmFG9BDg4ODk5oHBwcHBwcivDmTcDBwcHB4Q7=
4fwEGA"
-"PNNNssrHc8WAAAAAElFTkSuQmCC\">");
+		"iVBORw0KGgoAAAANSUhEUgAAAbQAAABDCAYAAAD01PBTAAAACXBIWXMAAAsTAAALEwEAmpw=
YAAAA"
+		"GXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAGsxJREFUeNrsXQt4FNXZ/nL=
hmutq"
+		"VdAKMXJHTMhiLGAuLUEfSg2xSFSUgIkkRPQ3QiHxqcRwswQrRq2EBKjhapvU3yCgtaQ+CRG=
USyAB"
+		"vNDfRhArqEA2FwjksvnPN0xokpnZPWd2dnd297w851kyt3OZ+c4773e+c8aro6MDODg4ODg=
4XB3e"
+		"vAk4ODg4ODihcXBwcHBwcELj4ODg4ODQDr68CWxCrPgbTlJwj33l4m81SSbeVBwcHBz2hRc=
PCqEG"
+		"ElaCSGKYBldXV4PJZILO325MF3uN68LDwyE4OLheJLjOVM2bk4ODg4MTmqMxB4mMENa08vJ=
yKC0t"
+		"FQispqaG+gKDBw8WiA1JLiEhAUJCQk6TzXkklZJ0ijcxBwcHByc0e6qxDEyExILy8vJgx44=
dml08"
+		"LCwMMjIyBHIj6m0T2ZTDiY2Dwz3xzsEbM3tsWkV5ahVJJV3/fizyQhlvURsJzcvLaw/5iXN=
QmcrE"
+		"dP1vUsYqRzUIyQuJLKeoqCho6dKlcPr0abvlFRQUJBDbc88910lsGaStVY23kfMyGQwFcQO=
pa52K"
+		"fIrJzwwVRVSbXwH5SdU6Hwc/0ywoIeVP1FHZe3aqNtsj6eDVPkMOvxeEQBJV1A+fVyPjc8u=
CWpIK"
+		"8V6Q8mnaN5KyO7Wvt7U+egwKievZoMSAQTQqNPYSe2Ta3t6OgR1FFRUVYcnJyXYlsk7U19c=
DkiYq"
+		"wOzs7NmE2HCMbo6Pj0+pyoeDBaFiZwUqzlMDo4oysuZXpYY0dQa9ld8oJi3t0eAi96JWhRJ=
b5YBy"
+		"hXbmQ/JEG84lRFDigs+6pK8n9bn+bKmpkyuF7eMbXTExpsMkGTUls7b2DFOd6eiC5xeETZo=
0iZrM"
+		"vG+6EXxHD4e+UydD34d+DYFD7oDFixZD9pJsiI+Ph+joaGpiW7hwIURERATVVNe8R8pTSlI=
wo7Ks"
+		"YuwMbSEmR57HUk53cMfUuqA9xtnxnur+5YJ0wjNIuuggMpOzq2JUViSFgntghlinwyQx9Ru=
uGLaP"
+		"FUQjSiOdeKGtF2trayuqqamZPX36dKtE5tW/H/SOjIBe946FXqNHgJdf/277J9x4C6yceL/=
kPKL6"
+		"hITjcMeOHVO8Pu4zjjPCxo0bpyUlJZWTss3x9fVliYisZSAO5offxhcJNfkZWBWaGxhznQv=
a4x5G"
+		"ezS4y73QkfsUXyr+TcqT6KJqTbGvJ3VKI3WierZceWJ1ATEi1Q9Sa2trMEnVmzZtmm1NlaE=
K83sm"
+		"BQxb3gK/Z1MEUutJZohdsVNRKUkSKrUlS5bA4cOH4dChQzBr1iyLZUtJSYHk5OQwcm45KWO=
4nRSK"
+		"GnIKtfHhtHd+tW5gxHUeYI8u73IknawBFQTobyywWCYIxdVRgCrY3QkNsUp8i2fC1atXg81=
mczkh"
+		"s7CnnnpKcPnJwSfkdghYthgCl2VCn19OpLo2ua7FNGbMGFi/fj2cPHkSnnjiCcXrbNmyBUk=
t6MKF"
+		"CxWkvLSkxqJQ1JCTLQrNqOJesZSxzpHBQ5zQFEnNYEXRhLrJvdhjoz3YtV90Q1LDOlntP1y=
d0NA4"
+		"mCOJUPls3rw5bO7cubL70bXY/8nHIOjVpYJrkRY/f2CSrEKTS4MGDRKI7aOPPhL+L4etW7d=
Campq"
+		"IJb3ypUrNKRWxth2jlRoas73tPEzV1eZBgp7dHlCIx3rKh2TWVcCMIL7gKqvd4elr7CSubQ=
HNzc3"
+		"FxH1E5aWlqaoyvyfSQGfOwYxF+TurOeBdV5fVFQUHDhwABYtWiQQWE/s3LkTCPEGFRYWlpK=
yh/fr"
+		"189kgajryBtyFaWxGcixoeQclg7UVgOJY1SRLIquyk0M19WjNDOt2KOruBvhscgLtTJkNkO=
sIyuu"
+		"h6iT61L1VySvuC42pybgBN2P40h+dW5iG1b7endYnDiUNlih+fLljGM1NbORPGTZffRwwb2=
ohswQ"
+		"x1a9hqzCnIICA6GwoABW5+YqKrWVK1YMJseWUhqO5gSlIkDD0QrNHcbPwA2mHRisRD26ekA=
IK7Gg"
+		"PSKpTEYioyUzkfjKOs8hCedKZNlD1bhSX29NdWqt0GqJQd6p9mRiCGonJFp987906VJ4fX3=
9a4mP"
+		"PAINDQ3ShhgxVCAztWg5eAQufvRP2Lxli8WxMUt4ev58CAwKgnnz5kn2rXz5ZbgvKiqGKLo=
cPz+/"
+		"HI069lA7HauVwjMydhz2gE3PtJPhLHu0NOewhDZiTUG10E78rSX5aHrfxHEpFjtAIsrSKn8=
kNlIG"
+		"bNdihnJkknMK7aDSbGpfGyafW+zrdaXQMOyXJPQFTtb6TZ5ctyg1NRW+/fZbyb7ekWMhcOU=
LcHF6"
+		"Mlx6c6MqMmvK/ZPwfySjlStXUo+l9UyPP/44rFu3TjYfdJOaTKaXmpqaLI2n2SswRAt/vFH=
r+9pZ"
+		"ZzdQNnpUi532OE6r++zi7i+WzrdESzLr0n5o34lA75o2gA5VGr7UkKR5X++tU0MqY5TXFiv=
Z2NiY"
+		"sXfv3rDdu3dL9uGYGYbkC41x041wtXwfM6m1f3Om29+VlZWqCQ3TzJkzIT09XZIPkrFIlnk=
W2o5l"
+		"grWjFRr1XDYc39OBOuP47zOV5ehnRU8QFQVtvdBLkmZHMhBWB2E4JZMmQtBJxKZpX6/nMTR=
NIvYa"
+		"GhqCiUHmyLnxMJoRA0A655T1eyRB+EVS06ATsCmtWrUK7rrrLsl18/PzcQJ2DKlXggZtx6K=
YtIqY"
+		"itPiwe0Brs7sj0KtOh0XBctqKLn2VqLiWBzt8IIB9LluqaZ9va4JjVFpKL59mM3mjK1btwa=
dOXNG"
+		"sg8JrGsACM41w3lnmNS6HzvJzNp8NJq0bds2CAwMlL5uZWbi/jwLRaB1OxoY5obREFqhLff=
Khk6R"
+		"KzT722MdYwfqTuoM60M7gRrbyVErdbCoNN0uBi0qzjotni29RznaVElTXV0wscQMVDs9Iaz=
B+Bup"
+		"+xbnnWFS637s0gPYnAbdfrus63Hfvn1w/NixwaR+sRp08FaJSiQ9a51ULWW+Wis0d5lQ7Qq=
gDjhi"
+		"dBm7kzordOA4YQlDHxmn8zb2CEKzKRSbcELCrt27FdTZNIvn+o4aDv0DfFW7H63x1enT38L=
sJ5+A"
+		"hYueB5OpXvG4zMWZcDshtp7Iz1+H+zM0ULc0HQ+NOquivF+hGpaLRY1ycKgFi7vdYc+jSJy=
0L68G"
+		"nU+01mTajbc7P4XmDnPG9u3bZdWZpRVAmtIXQEvFfrjc2Cb83Tx7LpNSE1yOHWbF9Ld3/wb=
hY8Ph"
+		"/R0fwJ83boKhw4fA8RPHFY9fvHix1A3yl3egzlQ37cKFCyE2PiCaERolkRooA0M4oXG4IqE=
52v1d"
+		"Zad6uCTcltDOnz8fYjKZwj788EPJPjlXYyda8wuh5cfui3FcudTO7H60FPDxcu6ybse2tbb=
Dbx+O"
+		"Vzx+ypQpsmNpH3zwAe5PsNGwQjU6poohX05oHO5IaFVOmJZg7/VbOaFpCNWDy9jRY4cvqfB=
NNwqr"
+		"5cuec+kyNH18QOZa135Z3I+WCO3KlSuS4y/8VA9r89+QPR7JDEmtJ3AaAtkfa+ODbtTomCq=
GfC0a"
+		"FuWYnbPeiDk8CGJACO2z6IzVatyF0DQJJNI7oVEHBsgQSiwGT/SEEpkhWt4qgA6zdC3GXgZ=
/5uhH"
+		"S4Q2zig/T/WVV/6oeM6jjz4qOX7//v24b5oOFFrXic00BmbU6L7X8gnVurRHWZv0gDo7nNA=
YFWGo"
+		"G7RznUsSmjjOYlBbyQ6zOVyO0PDjnEq4cvQL2e39lyy6Hv3YqdQskZpAQmazYtpQ8Db06dt=
bcl5T"
+		"YzMc+Owz2XPG/+IXErcjLuF1/Phx+OHcuViZMtTRvr1ZGtMSo9UMDIasBaFRu3gcYWikDTo=
0Tv92"
+		"tV6ddS1PN3rRYFEOzqqzS0+nEINVDFq0sZ4VWpzaG3ru7Lng+vqGwd99952U0BSCQVqPHIP=
2lnYp"
+		"mYUOBJ/B/40yxFVFOkP6LRu05ZS5SH5y/Btr1yieM2H8BMnxJ46fwH3hdlRpLO5GWiK1Fhh=
C+3Dz"
+		"8TPHIVWtPXJVqhtC06tCi9OqrrokNHG17lVqK0n0UThGDfYELnOlSEAywSMCAT7TfYURnHw=
dvO4V"
+		"q+7HDiv/5qXPIyqtl+S8z/YfVDxn9F2jJcef+e4M7gu244NOYwRlKog0VAPD4+NnLmCPHBw=
W1Jmm"
+		"z5avzgxH7QrMtT3cHcFyX6H2uflnihdo/Uaq5nz6+HZTZ3JKD5WaHFHSfBfNeM9Y2F95sNs=
2dDsq"
+		"nTtq1CipQjtxQovAEFsVWq2KfPG6JbYQGp9QrVt79NT7wsdz6YlMk77e3oQmjDc4oX26vam=
bzeZw"
+		"7OilCk35O2ftzS2SbX1uu8lipuh+bP5rKbSfOiMhM1y6yhrGR0ZJCA3x+eefw8iRIyXbAwI=
CJNuQ"
+		"uJXywg6f3A80MmsuPKMNaklupXtbIx1Zpglw6M8e3aljd6cxNCSSULkPl6p5tsi1nN7X94Q=
7zEOT"
+		"Ln3Uwd7ObVdapY1z60CL53S6H/slTpNjE6vp3shI2esKwSwyx1++dElJqqh+ADRQaFUyRFp=
LYdxx"
+		"CqqANviAuxv1ixLeBBz26OvFdR/dmtByZTpU2U6+7V/Xgstw7Kvr+JfSOFjTJ0fAGGCAvuu=
2XD8H"
+		"/4/buv49sE/fbuc1trVC0rPz4fZBg4R0qOFit7/x/7gNPzYqh+J3C8F09RA8k5F0/Rz8+72=
dm2S4"
+		"rM2ae5NGyRjk1t6jXNGjViXhGBTW++MTql0bZeILDQeH3fv6nvB18QqiCiiUIzS5Lv6p8VG=
QZfwV"
+		"wKlT3XcU/QoGh4RIjn/44Yfh1WFjAda/Lb1Yl2u8lpcHXZe+P9ncBGeTHoIbSBLyPXkEoMv=
fNeI2"
+		"DCxpzF4tufT0+U1w/OJceCQTSLpB2IZ/j/9tO+z43x6kAz7WCI3lUzK1KsilzALhzLBTnpz=
QXLjT"
+		"ccE+hhbOCounjl7UyN2om77e3RRamtx8F7O5Q7aT7927t7BPLvn28pEc/58fvlE8vmvq6ND=
Wlezn"
+		"L39bmhqlY2UdYn2VwLBQcagC4ViEhcAMtUtg0RhnHVcBukSJ+HFeT4WBPwL26+tpJpG7skJ=
DMpP1"
+		"1ROKMckFUOBEZHntBsJE57bW5m7bTn75teLxWqDtxEnZ7YOH+TBdh6KMtRTkZFBBLlVW8lR=
DojSd"
+		"giM7TVyN5E7en1Ap5jTeDBx2IjOqcVlvFzWcyaSTKbSgGqrlQty/+OILxaWlQkJ/Ljn+4vl=
6IYqQ"
+		"5gvTatBy8Ihk288GKN+S0/+STvzGaEisrwYEYFSh0Mos3AOaCdZxKhUadzfqT5mNc9NlyFg=
8AXp3"
+		"ObqaV0Po6wmZUX8t3ZUIDRk6UTQcix10h9lsuvXWW+UJTWE5qrFh8usrrs1/0+IyVpjURFW=
afzwv"
+		"CfdHjDL2YiK0QKJEsb4aEEA38qKMNrTWgdEEhhgYSZQTmn5QJr5cJrpxHd1pDM1VXjiEvp4=
Q2TiS"
+		"mLwxenQ5VkH3sN8y1gm0dw4ZUi2nmhobGwGXw7rtttsk+57/n4WwdfM7ku2bijbD4t9lWcy=
vZ07e"
+		"fv2tlrH5rztkt4+L6QW+XkHg7dUbWsw/9SC0NsnxkZGRqIbKNVBoArl0ecvWInSe5r7F9bj=
fXKHp"
+		"u3PPFRV4rofUmUXVOHxpKfFrAPaoi1P6emth+Y4mNN2MN5ByVJDOPubgwe4Tl/+xZw/MmT1=
bcjyO"
+		"ud12+83wnzM/dtve0tIGz2akwxuvrVXMa3ZSEuwh1/3qq6/Aq38/+XlpXdD6+Veya0Giu3F=
cTG9o"
+		"66i/zpLeXn2IjO4DZ783wen/kyq0ESNGWHU5IkkRsqoCulXuq7oQjcXOjeJFg2kOnEIYv8Q=
I+Ar7"
+		"2tgjae/DQL8QdC65VpanNSAGIhDSoFmcwCmEBmwf7dSS0GpJ2+hubNltP/BJBFp5pMzE5bI=
9ZYpz"
+		"nRc+L2+vf//gn1BcXKJ4XkBAIOwovaa4DFveAp87lFckEb65tupN2X0xv+kj2WbuuEoIrgE=
OV7TI"
+		"khnJu2bosGEmiiZhHUcz2GocIvHUMeTJJ1Q7FolA74bKJASY6aHtRP1tQUbF5MqEpku4LaG=
ZO8zl"
+		"kyZNkmw/eOigsKAv2S9J+BHNmwfcIHu9l3KyobyiXPa8zmS1gydk1pCdCx2Xm2XV2ZRH+yq=
eu3fX"
+		"Vck2JGysp4YPcyiDodASSxmDQYZyo3SoFwPbkiUycRXlZHtPJTQaz4YzCc3tXfVuS2hEvZQ=
PHz68"
+		"Xi445L333lOMVixc92d0xUjOaW83Q1paGixd/pLiuX1iJyqWB92MpnmLZANBEEkL+kP/AC/=
ZfV8c"
+		"aZV1NyYkJGC+RRo+zCyEVqtRvqFdAkMM3CgdTmo4hsEyHlYsE8jDCU0dwdgEUQ3SEmidreN=
TnNCc"
+		"b61FD5FOvyc2b94MjQ0Nsv7DYUOHQnJKkuIl/7K9GGIIcVWUl0vO9Xs2RaoUfzwvLK2FK4L=
IKTNE"
+		"9NQ+wtiZEt5dLz2PkDWMGD789MiRI6vpmoJqgrVAaGKHZdDIyGmUXBxlZ1DHV9i3C6llAdu=
XGfZ4"
+		"WBOxuLlTHeh2nAH0kZUe4ar3dnNDzZs1a5ZkO0Y7biKkpqS0FmQsgphfjle87k8/1kH600/=
DveMj"
+		"IWPhs1BOyA2jJ3FtR3Qrohq7smsPNOW+Cab0xRY/BjoywhfmZfsp7kd19uURaXRjEqkXgzq=
jfaiN"
+		"WhML5XGhMgrRY43SSWAZTzOSl55VntIw4goVtAsuG8D6km9agWVM0yMWjHZrQhs1evQpPz+=
/imnx"
+		"8ZJ9a9euFeal4adX5NKfXi+AyPFjLV6/seES/OPvH8PT8+fD/Q88cK2nT3pGUGOX334HWg4=
etXj+"
+		"4KG9YOHqAIvHbFlzWbIN3ajx8fH1pJx5WrtOxDESo63XYTzeSElofPzMfi9/rONpGCQyw4O=
aiOVl"
+		"KtPeKk38nhjL/DOu0NzDUCEnPf1p2X0vLlli8QsvG9ZtggcT7rdLudDN+IetAeAfoBwIgq5=
GubGz"
+		"9HnpWL68u8aMMdnBKEPBtiWv1OQbqrGbk0MdqbGOpxV4SpCIuFoFyxfgC+xIZnh9FoWcS7M=
OIic0"
+		"F8CYu8eUDxw4cMe8efMk+06ePAm5q3MtLmm1IucVWJ27Gvr2661Jefr7e8GC1f7X3YxmuCr=
MM+sJ"
+		"dDW+u0E6djZw4ABBnaE7VUWHRTuO5gyFRtMxcpej/UmNZTwNX0A8KUiEhexnEOLR3C1Lrol=
2sgfY"
+		"ViXxmO/TeXuEkUJHxsyZMxsIsUn2bdu2DXa8v0NY4Ffp3/0P3A+ffXoQ4hN+Db16+6gqAxL=
Z9Kf6"
+		"wRulwZIAkJ6k9tNZM6xZ1CR7neXLV2CZcu4Ou9uksjmsvWXOAO1dfzREZG08wFkTqoWvPjs=
wFevA"
+		"ZFjG0+yqRlxYpQnPNCGgPSIJaUFm6GY8DGwTuLNc+JMxzPD1hEqGhYWdqj569LVlS5e+NDc=
1VbI/"
+		"OztbWJMxXmasrSuWZq8QEob9by/eBKe/+R5aW9oskhiS16gIX4iWmTQtR2pNjVcImTXC5Sb=
p0l2E"
+		"lMEYEVFB6pNnQ3OUWVFDmkcaiiuV1FoxRGvhx55ilE53DeF4GrlfOJ5GS64zcNK1hyyHlcX=
QLp3P"
+		"9WFCRmWdL3aEYKjaSSTCTrtQo/bQZgrBg+DrKRUNHzs2hxhcbFpqakxBofQev5STI6w2Ff/=
gg1av"
+		"hfO/ErpMB0CCu9zcDLs/fh0eTu0nbAsZ6qs4r0wJP5xtJmR2SXbcbOiwIfC7hQvR1TjHxqa=
wdRyq"
+		"zIZ8Q51YbleBLogbx9MISeUCfSQdTrquVfqkkxuptBJCNCzt0pXY4kSiclSEaKKnjJ11wtu=
TKkuM"
+		"LSE1NbU+NiZGdn8OITV0QdJ8LqZrQnKb+dhjkL0ukKixXkJiJTNcSf+FJ+oJmbVK9vn794c=
1f1yD"
+		"ec0ZGxFxykmEZGuHW+XkcnOFxm4vWYz3rYByPU5XJ7Us0P8LVpYnTKT2aEKLMBpNqNKys7M=
bcAK1"
+		"HF5dswYWLFx47WOgjMS2btklVeXCaMYXZtXLuhn9/PtCYcF6GDhw4FJS/lINOqk6G41R7bm=
2EJIn"
+		"TajW2xs1y3iaJwWJTNYxqWXRujU5obk4jOPGVfv7B8zOz18HQxVIraKiAh6Mj4f3398JZnM=
Hddq7"
+		"+ypTWTCSEVWZXDTjNTLrAwX5G2DIkKGbSLlzNGwGW8hFlRFTRlhqrQo5odn+AsQ6Pw3Hfdw=
+SARd"
+		"efi9LtBfBGGip5KZRxIa4p7Ie0oDAvyfXJef3xARESF7TFNTEyxbvgymTYuHXbt2wrXvuVh=
LdED3"
+		"Iqq5FemNsuNlCH9/P4HMhg0buomUd47GTaCWIOrEDs7R+XpSuL7uyFvF/LQZnrIyPyGPREY=
Vay+g"
+		"jdyJY3zgwfD21IrfExlZ5O/vH5O/dm391KlTFY87e+4cIbblED9tGhSuXy/MXVNyOW4/cIP=
idS43"
+		"dggr5i9PbxDci5bUHCrHrVu24u9SUs45dqi+M9yGtpzvSWMBuhzEVzGehkEicZ5ww5BESEL=
jd8b3"
+		"4qpEVTbZk8LzleDryZWPvPfe6s8+/TT2xd//vig6Kips+YoVgjKTwzlCbBs2bBDSgAEDAJU=
djsN1"
+		"ui2HDRsGH354RfgEDCqwS01mOP+9GU6R/3+psFq+HB5JTISUlJSGgICA2aR8pfaoN7r/SGd=
D+9FC"
+		"LYnFWUTqMtD5x0tRiRxmeG5wPC2R1Mkj7p/o6ssV54uh6zXVjioeQ7XLPDHwwxK8UFl4Oj7=
dvz+Y"
+		"/OScPXv2ubzXX4fKykqHlwFJ8sUXX4SIsWNryJ8J4ydMOMUfTw4O1wchuK7uV3wZoHXH9px=
HVkUI"
+		"jK+WwwmNDvv37YslP0VHjx4dvHHjRjhaXW33PP38/SAlOQWVWT2S6oSJE/P4neDg4ODghKY=
J9n2y"
+		"bw6SCxJbcXExVH6ivWJDRZacnAzRUdHg7+//OuY38b6JJt76HBwcHJzQNMcnlZVIbBnnzp0=
L21tZ"
+		"Kbgiq21QbbcMuBmi74uGKVOm4NjbaVSDJOXdFxXFiYyDg4ODE5r9Ubl3bwj5QXLD9a7C0BV=
ZffQo"
+		"NDY1wddffy0c0yT+f8Att8AAcRFkorxg6JAhMIQkDB4hqgxJrJyk0qjo6FLeshwcHByc0Jy=
GvRUV"
+		"GEASTlIsSSFiQuD2MJJwLKxTxpnE/wspOibmFG9BDg4ODk5oHBwcHBwcivDmTcDBwcHB4Q7=
4fwEG"
+		"APNNNssrHc8WAAAAAElFTkSuQmCC\">");
 }
 =

 void
-- =

2.1.3


--===============6207108658041832575==--

