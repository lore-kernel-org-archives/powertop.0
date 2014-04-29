Content-Type: multipart/mixed; boundary="===============6834163263259638712=="
MIME-Version: 1.0
From: Sergey Senozhatsky <sergey.senozhatsky at gmail.com>
Subject: Re: [Powertop] [PATCH] PowerTop logo is not displayed in the html
 report if you generate it outside the source folder. To fix this,
 I converted PowerTop.png to base64 data.
Date: Tue, 29 Apr 2014 17:08:49 +0300
Message-ID: <20140429140849.GA1005@swordfish>
In-Reply-To: 578342671-7484-1-git-send-email-christophe.prigent@intel.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============6834163263259638712==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On (04/29/88 20:44), Christophe Prigent wrote:
> Subject: [Powertop] [PATCH] PowerTop logo is not displayed in the html
>  report if you generate it outside the source folder. To fix this, I
>  converted PowerTop.png to base64 data.

subject usually is a very short summary, e.g.
	[PATCH] html report: fix powertop logo display

and commit message then describes in more details:
	if HTML report was generated outside ... and so on....

---

anyway, looks like this will not brake any modern browser
https://en.wikipedia.org/wiki/Data_URI_scheme#Web_browser_support

so, generally looks good.


a side question is: do we really need this logo after all?

	-ss

> ---
>  src/report/report-formatter-html.cpp |  125 ++++++++++++++++++++++++++++=
+++++-
>  1 file changed, 124 insertions(+), 1 deletion(-)
> =

> diff --git a/src/report/report-formatter-html.cpp b/src/report/report-for=
matter-html.cpp
> index 8ecc869..3803962 100644
> --- a/src/report/report-formatter-html.cpp
> +++ b/src/report/report-formatter-html.cpp
> @@ -140,7 +140,130 @@ report_formatter_html::escape_string(const char *st=
r)
>  void
>  report_formatter_html::add_logo()
>  {
> -	add_exact("<img alt=3D\"PowerTop\" class=3D\"pwtop_logo\" src=3D\"./Pow=
erTop.png\">");
> +	add_exact("<img alt=3D\"PowerTop\" class=3D\"pwtop_logo\" src=3D\"data:=
image/png;base64,"
> +			"iVBORw0KGgoAAAANSUhEUgAAAbQAAABDCAYAAAD01PBTAAAACXBIWXMAAAsTAAALEwEA=
mpwYAAAAG"
> +			"XRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAGsxJREFUeNrsXQt4FNXZ/=
nLhmutqV"
> +			"dAKMXJHTMhiLGAuLUEfSg2xSFSUgIkkRPQ3QiHxqcRwswQrRq2EBKjhapvU3yCgtaQ+C=
RGUSyABv"
> +			"NDfRhArqEA2FwjksvnPN0xokpnZPWd2dnd297w851kyt3OZ+c4773e+c8aro6MDODg4O=
Dg4XB3ev"
> +			"Ak4ODg4ODihcXBwcHBwcELj4ODg4ODQDr68CWxCrPgbTlJwj33l4m81SSbeVBwcHBz2h=
RcPCqEGE"
> +			"laCSGKYBldXV4PJZILO325MF3uN68LDwyE4OLheJLjOVM2bk4ODg4MTmqMxB4mMENa08=
vJyKC0tF"
> +			"QispqaG+gKDBw8WiA1JLiEhAUJCQk6TzXkklZJ0ijcxBwcHByc0e6qxDEyExILy8vJgx=
44dml08L"
> +			"CwMMjIyBHIj6m0T2ZTDiY2Dwz3xzsEbM3tsWkV5ahVJJV3/fizyQhlvURsJzcvLaw/5i=
XNQmcrEd"
> +			"P1vUsYqRzUIyQuJLKeoqCho6dKlcPr0abvlFRQUJBDbc88910lsGaStVY23kfMyGQwFc=
QOpa52Kf"
> +			"IrJzwwVRVSbXwH5SdU6Hwc/0ywoIeVP1FHZe3aqNtsj6eDVPkMOvxeEQBJV1A+fVyPjc=
8uCWpIK8"
> +			"V6Q8mnaN5KyO7Wvt7U+egwKievZoMSAQTQqNPYSe2Ta3t6OgR1FFRUVYcnJyXYlsk7U1=
9cDkiYqw"
> +			"Ozs7NmE2HCMbo6Pj0+pyoeDBaFiZwUqzlMDo4oysuZXpYY0dQa9ld8oJi3t0eAi96JWh=
RJb5YByh"
> +			"XbmQ/JEG84lRFDigs+6pK8n9bn+bKmpkyuF7eMbXTExpsMkGTUls7b2DFOd6eiC5xeET=
Zo0iZrMv"
> +			"G+6EXxHD4e+UydD34d+DYFD7oDFixZD9pJsiI+Ph+joaGpiW7hwIURERATVVNe8R8pTS=
lIwo7KsY"
> +			"uwMbSEmR57HUk53cMfUuqA9xtnxnur+5YJ0wjNIuuggMpOzq2JUViSFgntghlinwyQx9=
RuuGLaPF"
> +			"UQjSiOdeKGtF2trayuqqamZPX36dKtE5tW/H/SOjIBe946FXqNHgJdf/277J9x4C6yce=
L/kPKL6h"
> +			"ITjcMeOHVO8Pu4zjjPCxo0bpyUlJZWTss3x9fVliYisZSAO5offxhcJNfkZWBWaGxhzn=
Qva4x5Ge"
> +			"zS4y73QkfsUXyr+TcqT6KJqTbGvJ3VKI3WierZceWJ1ATEi1Q9Sa2trMEnVmzZtmm1Nl=
aEK83smB"
> +			"Qxb3gK/Z1MEUutJZohdsVNRKUkSKrUlS5bA4cOH4dChQzBr1iyLZUtJSYHk5OQwcm45K=
WO4nRSKG"
> +			"nIKtfHhtHd+tW5gxHUeYI8u73IknawBFQTobyywWCYIxdVRgCrY3QkNsUp8i2fC1atXg=
81mczkhs"
> +			"7CnnnpKcPnJwSfkdghYthgCl2VCn19OpLo2ua7FNGbMGFi/fj2cPHkSnnjiCcXrbNmyB=
Ukt6MKFC"
> +			"xWkvLSkxqJQ1JCTLQrNqOJesZSxzpHBQ5zQFEnNYEXRhLrJvdhjoz3YtV90Q1LDOlntP=
1yd0NA4m"
> +			"COJUPls3rw5bO7cubL70bXY/8nHIOjVpYJrkRY/f2CSrEKTS4MGDRKI7aOPPhL+L4etW=
7dCampqI"
> +			"Jb3ypUrNKRWxth2jlRoas73tPEzV1eZBgp7dHlCIx3rKh2TWVcCMIL7gKqvd4elr7CSu=
bQHNzc3F"
> +			"xH1E5aWlqaoyvyfSQGfOwYxF+TurOeBdV5fVFQUHDhwABYtWiQQWE/s3LkTCPEGFRYWl=
pKyh/fr1"
> +			"89kgajryBtyFaWxGcixoeQclg7UVgOJY1SRLIquyk0M19WjNDOt2KOruBvhscgLtTJkN=
kOsIyuuh"
> +			"6iT61L1VySvuC42pybgBN2P40h+dW5iG1b7endYnDiUNlih+fLljGM1NbORPGTZffRww=
b2ohswQx"
> +			"1a9hqzCnIICA6GwoABW5+YqKrWVK1YMJseWUhqO5gSlIkDD0QrNHcbPwA2mHRisRD26e=
kAIK7GgP"
> +			"SKpTEYioyUzkfjKOs8hCedKZNlD1bhSX29NdWqt0GqJQd6p9mRiCGonJFp987906VJ4f=
X39a4mPP"
> +			"AINDQ3ShhgxVCAztWg5eAQufvRP2Lxli8WxMUt4ev58CAwKgnnz5kn2rXz5ZbgvKiqGK=
LocPz+/H"
> +			"I069lA7HauVwjMydhz2gE3PtJPhLHu0NOewhDZiTUG10E78rSX5aHrfxHEpFjtAIsrSK=
n8kNlIGb"
> +			"NdihnJkknMK7aDSbGpfGyafW+zrdaXQMOyXJPQFTtb6TZ5ctyg1NRW+/fZbyb7ekWMhc=
OULcHF6M"
> +			"lx6c6MqMmvK/ZPwfySjlStXUo+l9UyPP/44rFu3TjYfdJOaTKaXmpqaLI2n2SswRAt/v=
FHr+9pZZ"
> +			"zdQNnpUi532OE6r++zi7i+WzrdESzLr0n5o34lA75o2gA5VGr7UkKR5X++tU0MqY5TXF=
ivZ2NiYs"
> +			"Xfv3rDdu3dL9uGYGYbkC41x041wtXwfM6m1f3Om29+VlZWqCQ3TzJkzIT09XZIPkrFIl=
nkW2o5lg"
> +			"rWjFRr1XDYc39OBOuP47zOV5ehnRU8QFQVtvdBLkmZHMhBWB2E4JZMmQtBJxKZpX6/nM=
TRNIvYaG"
> +			"hqCiUHmyLnxMJoRA0A655T1eyRB+EVS06ATsCmtWrUK7rrrLsl18/PzcQJ2DKlXggZtx=
6KYtIqYi"
> +			"tPiwe0Brs7sj0KtOh0XBctqKLn2VqLiWBzt8IIB9LluqaZ9va4JjVFpKL59mM3mjK1bt=
wadOXNGs"
> +			"g8JrGsACM41w3lnmNS6HzvJzNp8NJq0bds2CAwMlL5uZWbi/jwLRaB1OxoY5obREFqhL=
ffKhk6RK"
> +			"zT722MdYwfqTuoM60M7gRrbyVErdbCoNN0uBi0qzjotni29RznaVElTXV0wscQMVDs9I=
azB+Bup+"
> +			"xbnnWFS637s0gPYnAbdfrus63Hfvn1w/NixwaR+sRp08FaJSiQ9a51ULWW+Wis0d5lQ7=
QqgDjhid"
> +			"Bm7kzordOA4YQlDHxmn8zb2CEKzKRSbcELCrt27FdTZNIvn+o4aDv0DfFW7H63x1enT3=
8LsJ5+Ah"
> +			"YueB5OpXvG4zMWZcDshtp7Iz1+H+zM0ULc0HQ+NOquivF+hGpaLRY1ycKgFi7vdYc+jS=
Jy0L68Gn"
> +			"U+01mTajbc7P4XmDnPG9u3bZdWZpRVAmtIXQEvFfrjc2Cb83Tx7LpNSE1yOHWbF9Ld3/=
wbhY8Ph/"
> +			"R0fwJ83boKhw4fA8RPHFY9fvHix1A3yl3egzlQ37cKFCyE2PiCaERolkRooA0M4oXG4I=
qE52v1dZ"
> +			"ad6uCTcltDOnz8fYjKZwj788EPJPjlXYyda8wuh5cfui3FcudTO7H60FPDxcu6ybse2t=
bbDbx+OV"
> +			"zx+ypQpsmNpH3zwAe5PsNGwQjU6poohX05oHO5IaFVOmJZg7/VbOaFpCNWDy9jRY4cvq=
fBNNwqr5"
> +			"cuec+kyNH18QOZa135Z3I+WCO3KlSuS4y/8VA9r89+QPR7JDEmtJ3AaAtkfa+ODbtTom=
CqGfC0aF"
> +			"uWYnbPeiDk8CGJACO2z6IzVatyF0DQJJNI7oVEHBsgQSiwGT/SEEpkhWt4qgA6zdC3GX=
gZ/5uhHS"
> +			"4Q2zig/T/WVV/6oeM6jjz4qOX7//v24b5oOFFrXic00BmbU6L7X8gnVurRHWZv0gDo7n=
NAYFWGoG"
> +			"7RznUsSmjjOYlBbyQ6zOVyO0PDjnEq4cvQL2e39lyy6Hv3YqdQskZpAQmazYtpQ8Db06=
dtbcl5TY"
> +			"zMc+Owz2XPG/+IXErcjLuF1/Phx+OHcuViZMtTRvr1ZGtMSo9UMDIasBaFRu3gcYWikD=
To0Tv92t"
> +			"V6ddS1PN3rRYFEOzqqzS0+nEINVDFq0sZ4VWpzaG3ru7Lng+vqGwd99952U0BSCQVqPH=
IP2lnYpm"
> +			"YUOBJ/B/40yxFVFOkP6LRu05ZS5SH5y/Btr1yieM2H8BMnxJ46fwH3hdlRpLO5GWiK1F=
hhC+3Dz8"
> +			"TPHIVWtPXJVqhtC06tCi9OqrrokNHG17lVqK0n0UThGDfYELnOlSEAywSMCAT7TfYURn=
HwdvO4Vq"
> +			"+7HDiv/5qXPIyqtl+S8z/YfVDxn9F2jJcef+e4M7gu244NOYwRlKog0VAPD4+NnLmCPH=
BwW1Jmmz"
> +			"5avzgxH7QrMtT3cHcFyX6H2uflnihdo/Uaq5nz6+HZTZ3JKD5WaHFHSfBfNeM9Y2F95s=
Ns2dDsqn"
> +			"Ttq1CipQjtxQovAEFsVWq2KfPG6JbYQGp9QrVt79NT7wsdz6YlMk77e3oQmjDc4oX26v=
ambzeZw7"
> +			"OilCk35O2ftzS2SbX1uu8lipuh+bP5rKbSfOiMhM1y6yhrGR0ZJCA3x+eefw8iRIyXbA=
wICJNuQu"
> +			"JXywg6f3A80MmsuPKMNaklupXtbIx1Zpglw6M8e3aljd6cxNCSSULkPl6p5tsi1nN7X9=
4Q7zEOTL"
> +			"n3Uwd7ObVdapY1z60CL53S6H/slTpNjE6vp3shI2esKwSwyx1++dElJqqh+ADRQaFUyR=
FpLYdxxC"
> +			"qqANviAuxv1ixLeBBz26OvFdR/dmtByZTpU2U6+7V/Xgstw7Kvr+JfSOFjTJ0fAGGCAv=
uu2XD8H/"
> +			"4/buv49sE/fbuc1trVC0rPz4fZBg4R0qOFit7/x/7gNPzYqh+J3C8F09RA8k5F0/Rz8+=
72dm2S4r"
> +			"M2ae5NGyRjk1t6jXNGjViXhGBTW++MTql0bZeILDQeH3fv6nvB18QqiCiiUIzS5Lv6p8=
VGQZfwVw"
> +			"KlT3XcU/QoGh4RIjn/44Yfh1WFjAda/Lb1Yl2u8lpcHXZe+P9ncBGeTHoIbSBLyPXkEo=
MvfNeI2D"
> +			"CxpzF4tufT0+U1w/OJceCQTSLpB2IZ/j/9tO+z43x6kAz7WCI3lUzK1KsilzALhzLBTn=
pzQXLjTc"
> +			"cE+hhbOCounjl7UyN2om77e3RRamtx8F7O5Q7aT7927t7BPLvn28pEc/58fvlE8vmvq6=
NDWleznL"
> +			"39bmhqlY2UdYn2VwLBQcagC4ViEhcAMtUtg0RhnHVcBukSJ+HFeT4WBPwL26+tpJpG7s=
kJDMpP11"
> +			"ROKMckFUOBEZHntBsJE57bW5m7bTn75teLxWqDtxEnZ7YOH+TBdh6KMtRTkZFBBLlVW8=
lRDojSdg"
> +			"iM7TVyN5E7en1Ap5jTeDBx2IjOqcVlvFzWcyaSTKbSgGqrlQty/+OILxaWlQkJ/Ljn+4=
vl6IYqQ5"
> +			"gvTatBy8Ihk288GKN+S0/+STvzGaEisrwYEYFSh0Mos3AOaCdZxKhUadzfqT5mNc9Nly=
Fg8AXp3O"
> +			"bqaV0Po6wmZUX8t3ZUIDRk6UTQcix10h9lsuvXWW+UJTWE5qrFh8usrrs1/0+IyVpjUR=
FWafzwvC"
> +			"fdHjDL2YiK0QKJEsb4aEEA38qKMNrTWgdEEhhgYSZQTmn5QJr5cJrpxHd1pDM1VXjiEv=
p4Q2TiSm"
> +			"LwxenQ5VkH3sN8y1gm0dw4ZUi2nmhobGwGXw7rtttsk+57/n4WwdfM7ku2bijbD4t9lW=
cyvZ07ef"
> +			"v2tlrH5rztkt4+L6QW+XkHg7dUbWsw/9SC0NsnxkZGRqIbKNVBoArl0ecvWInSe5r7F9=
bjfXKHpu"
> +			"3PPFRV4rofUmUXVOHxpKfFrAPaoi1P6emth+Y4mNN2MN5ByVJDOPubgwe4Tl/+xZw/Mm=
T1bcjyOu"
> +			"d12+83wnzM/dtve0tIGz2akwxuvrVXMa3ZSEuwh1/3qq6/Aq38/+XlpXdD6+Veya0Giu=
3FcTG9o6"
> +			"6i/zpLeXn2IjO4DZ783wen/kyq0ESNGWHU5IkkRsqoCulXuq7oQjcXOjeJFg2kOnEIYv=
8QI+Ar72"
> +			"tgjae/DQL8QdC65VpanNSAGIhDSoFmcwCmEBmwf7dSS0GpJ2+hubNltP/BJBFp5pMzE5=
bI9ZYpzn"
> +			"Rc+L2+vf//gn1BcXKJ4XkBAIOwovaa4DFveAp87lFckEb65tupN2X0xv+kj2WbuuEoIr=
gEOV7TIk"
> +			"hnJu2bosGEmiiZhHUcz2GocIvHUMeTJJ1Q7FolA74bKJASY6aHtRP1tQUbF5MqEpku4L=
aGZO8zlk"
> +			"yZNkmw/eOigsKAv2S9J+BHNmwfcIHu9l3KyobyiXPa8zmS1gydk1pCdCx2Xm2XV2ZRH+=
yqeu3fXV"
> +			"ck2JGysp4YPcyiDodASSxmDQYZyo3SoFwPbkiUycRXlZHtPJTQaz4YzCc3tXfVuS2hEv=
ZQPHz68X"
> +			"i445L333lOMVixc92d0xUjOaW83Q1paGixd/pLiuX1iJyqWB92MpnmLZANBEEkL+kP/A=
C/ZfV8ca"
> +			"ZV1NyYkJGC+RRo+zCyEVqtRvqFdAkMM3CgdTmo4hsEyHlYsE8jDCU0dwdgEUQ3SEmidr=
eNTnNCcb"
> +			"61FD5FOvyc2b94MjQ0Nsv7DYUOHQnJKkuIl/7K9GGIIcVWUl0vO9Xs2RaoUfzwvLK2FK=
4LIKTNE9"
> +			"NQ+wtiZEt5dLz2PkDWMGD789MiRI6vpmoJqgrVAaGKHZdDIyGmUXBxlZ1DHV9i3C6llA=
duXGfZ4W"
> +			"BOxuLlTHeh2nAH0kZUe4ar3dnNDzZs1a5ZkO0Y7biKkpqS0FmQsgphfjle87k8/1kH60=
0/DveMjI"
> +			"WPhs1BOyA2jJ3FtR3Qrohq7smsPNOW+Cab0xRY/BjoywhfmZfsp7kd19uURaXRjEqkXg=
zqjfaiNW"
> +			"hML5XGhMgrRY43SSWAZTzOSl55VntIw4goVtAsuG8D6km9agWVM0yMWjHZrQhs1evQpP=
z+/imnx8"
> +			"ZJ9a9euFeal4adX5NKfXi+AyPFjLV6/seES/OPvH8PT8+fD/Q88cK2nT3pGUGOX334HW=
g4etXj+4"
> +			"KG9YOHqAIvHbFlzWbIN3ajx8fH1pJx5WrtOxDESo63XYTzeSElofPzMfi9/rONpGCQyw=
4OaiOVlK"
> +			"tPeKk38nhjL/DOu0NzDUCEnPf1p2X0vLlli8QsvG9ZtggcT7rdLudDN+IetAeAfoBwIg=
q5GubGz9"
> +			"HnpWL68u8aMMdnBKEPBtiWv1OQbqrGbk0MdqbGOpxV4SpCIuFoFyxfgC+xIZnh9FoWcS=
7MOIic0F"
> +			"8CYu8eUDxw4cMe8efMk+06ePAm5q3MtLmm1IucVWJ27Gvr2661Jefr7e8GC1f7X3Yxmu=
CrMM+sJd"
> +			"DW+u0E6djZw4ABBnaE7VUWHRTuO5gyFRtMxcpej/UmNZTwNX0A8KUiEhexnEOLR3C1Lr=
ol2sgfYV"
> +			"iXxmO/TeXuEkUJHxsyZMxsIsUn2bdu2DXa8v0NY4Ffp3/0P3A+ffXoQ4hN+Db16+6gqA=
xLZ9Kf6w"
> +			"RulwZIAkJ6k9tNZM6xZ1CR7neXLV2CZcu4Ou9uksjmsvWXOAO1dfzREZG08wFkTqoWvP=
jswFevAZ"
> +			"FjG0+yqRlxYpQnPNCGgPSIJaUFm6GY8DGwTuLNc+JMxzPD1hEqGhYWdqj569LVlS5e+N=
Dc1VbI/O"
> +			"ztbWJMxXmasrSuWZq8QEob9by/eBKe/+R5aW9oskhiS16gIX4iWmTQtR2pNjVcImTXC5=
Sbp0l2El"
> +			"MEYEVFB6pNnQ3OUWVFDmkcaiiuV1FoxRGvhx55ilE53DeF4GrlfOJ5GS64zcNK1hyyHl=
cXQLp3P9"
> +			"WFCRmWdL3aEYKjaSSTCTrtQo/bQZgrBg+DrKRUNHzs2hxhcbFpqakxBofQev5STI6w2F=
f/gg1avh"
> +			"fO/ErpMB0CCu9zcDLs/fh0eTu0nbAsZ6qs4r0wJP5xtJmR2SXbcbOiwIfC7hQvR1TjHx=
qawdRyqz"
> +			"IZ8Q51YbleBLogbx9MISeUCfSQdTrquVfqkkxuptBJCNCzt0pXY4kSiclSEaKKnjJ11w=
tuTKkuML"
> +			"SE1NbU+NiZGdn8OITV0QdJ8LqZrQnKb+dhjkL0ukKixXkJiJTNcSf+FJ+oJmbVK9vn79=
4c1f1yDe"
> +			"c0ZGxFxykmEZGuHW+XkcnOFxm4vWYz3rYByPU5XJ7Us0P8LVpYnTKT2aEKLMBpNqNKys=
7MbcAK1H"
> +			"F5dswYWLFx47WOgjMS2btklVeXCaMYXZtXLuhn9/PtCYcF6GDhw4FJS/lINOqk6G41R7=
bm2EJInT"
> +			"ajW2xs1y3iaJwWJTNYxqWXRujU5obk4jOPGVfv7B8zOz18HQxVIraKiAh6Mj4f3398JZ=
nMHddq7+"
> +			"ypTWTCSEVWZXDTjNTLrAwX5G2DIkKGbSLlzNGwGW8hFlRFTRlhqrQo5odn+AsQ6Pw3Hf=
dw+SARde"
> +			"fi9LtBfBGGip5KZRxIa4p7Ie0oDAvyfXJef3xARESF7TFNTEyxbvgymTYuHXbt2wrXvu=
VhLdED3I"
> +			"qq5FemNsuNlCH9/P4HMhg0buomUd47GTaCWIOrEDs7R+XpSuL7uyFvF/LQZnrIyPyGPR=
EYVay+gj"
> +			"dyJY3zgwfD21IrfExlZ5O/vH5O/dm391KlTFY87e+4cIbblED9tGhSuXy/MXVNyOW4/c=
IPidS43d"
> +			"ggr5i9PbxDci5bUHCrHrVu24u9SUs45dqi+M9yGtpzvSWMBuhzEVzGehkEicZ5ww5BES=
ELjd8b34"
> +			"qpEVTbZk8LzleDryZWPvPfe6s8+/TT2xd//vig6Kips+YoVgjKTwzlCbBs2bBDSgAEDA=
JUdjsN1u"
> +			"i2HDRsGH354RfgEDCqwS01mOP+9GU6R/3+psFq+HB5JTISUlJSGgICA2aR8pfaoN7r/S=
GdD+9FCL"
> +			"YnFWUTqMtD5x0tRiRxmeG5wPC2R1Mkj7p/o6ssV54uh6zXVjioeQ7XLPDHwwxK8UFl4O=
j7dvz+Y/"
> +			"OScPXv2ubzXX4fKykqHlwFJ8sUXX4SIsWNryJ8J4ydMOMUfTw4O1wchuK7uV3wZoHXH9=
pxHVkUIj"
> +			"K+WwwmNDvv37YslP0VHjx4dvHHjRjhaXW33PP38/SAlOQWVWT2S6oSJE/P4neDg4ODgh=
KYJ9n2yb"
> +			"w6SCxJbcXExVH6ivWJDRZacnAzRUdHg7+//OuY38b6JJt76HBwcHJzQNMcnlZVIbBnnz=
p0L21tZK"
> +			"bgiq21QbbcMuBmi74uGKVOm4NjbaVSDJOXdFxXFiYyDg4ODE5r9Ubl3bwj5QXLD9a7C0=
BVZffQoN"
> +			"DY1wddffy0c0yT+f8Att8AAcRFkorxg6JAhMIQkDB4hqgxJrJyk0qjo6FLeshwcHByc0=
JyGvRUVG"
> +			"EASTlIsSSFiQuD2MJJwLKxTxpnE/wspOibmFG9BDg4ODk5oHBwcHBwcivDmTcDBwcHB4=
Q74fwEGA"
> +"PNNNssrHc8WAAAAAElFTkSuQmCC\">");
>  }
>  =

>  void
> -- =

> 1.7.10.4
> =

> ---------------------------------------------------------------------
> Intel Corporation SAS (French simplified joint stock company)
> Registered headquarters: "Les Montalets"- 2, rue de Paris, =

> 92196 Meudon Cedex, France
> Registration Number:  302 456 199 R.C.S. NANTERRE
> Capital: 4,572,000 Euros
> =

> This e-mail and any attachments may contain confidential material for
> the sole use of the intended recipient(s). Any review or distribution
> by others is strictly prohibited. If you are not the intended
> recipient, please contact the sender and delete all copies.
> =

> _______________________________________________
> PowerTop mailing list
> PowerTop(a)lists.01.org
> https://lists.01.org/mailman/listinfo/powertop
>=20

--===============6834163263259638712==--

