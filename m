Content-Type: multipart/mixed; boundary="===============1377233211374222821=="
MIME-Version: 1.0
From: Joe Konno <joe.konno at linux.intel.com>
Subject: Re: [Powertop] [bug] Commas used as decimal mark in CSV output
Date: Tue, 26 Apr 2016 13:19:14 -0700
Message-ID: <20160426201914.GB19746@jbkonno-anise.jf.intel.com>
In-Reply-To: 570CD83A.8010707@ens-lyon.fr
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============1377233211374222821==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Valentin,

Thanks for the bug report. If you'd like to post it on our Bugzilla
(that helps us and the greater community), feel free to do so here:

https://app.devzing.com/powertopbugs/bugzilla

Cheers, hth

On Tue, Apr 12, 2016 at 01:12:58PM +0200, Valentin Lorentz wrote:
> Hi,
> =

> =

> Some locales use a comma instead of a dot as a decimal mark (ie.
> separator between integer and fractional parts of a number).
> =

> When powertop is run with such a locale, numbers in the CSV output will
> contain a comma; which breaks CSV parsing, because commas are also
> separators for the CSV fields.
> =

> =

> You can reproduce this with the following command (assuming French
> locales are installed on your system):
> =

> # LANG=3Dfr_FR.UTF-8 powertop --time=3D1 --csv=3D/tmp/powertop.csv
> =

> =

> Example of what one gets when running this command:
> =

> Usage,Device Name
>  26,7%,CPU misc
>  26,7%,DRAM
>  26,7%,CPU core
>  90,2 ops/s,GPU misc
> =

> =

> Regards,
> Valentin
> =




> _______________________________________________
> PowerTop mailing list
> PowerTop(a)lists.01.org
> https://lists.01.org/mailman/listinfo/powertop


--===============1377233211374222821==
Content-Type: application/pgp-signature
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="signature.asc"

LS0tLS1CRUdJTiBQR1AgU0lHTkFUVVJFLS0tLS0KVmVyc2lvbjogR251UEcgdjIKCmlRSWNCQUVC
Q0FBR0JRSlhIODFDQUFvSkVJMklSOVV2U3FwbUE0Y1FBTW91N3Jta3ZaRTFrd3JUOC9BcFBRaW8K
N1d0VytoMUhwZU1QRjhob293MEUvK1NlUFFrODhlQmFLeGJERkZST2hETVZxL2tUWUlvZ2l6cldQ
Y3lEZWpYSApSYjQ3M0dqLzN6dDJmdWlYL3JUbDBocUNoQzVObTBkRU95TzE0RWhFY2oySUFTQkpj
emJ0Ri8vay9KQnUrUStFCmwzNGswWGViQjVkSHAwYUZDTHNYMlh4Z3FuQmpBc3JPdnNSQnY2SGp2
RGpnbC9GME1VaUc3a3QxeWdUbXp1b0EKdWFjdHoxWndseElpUnB5ZmpQOEx4K2lkZ1hPbFhtMjJn
czdlS1FpL0xLTmFHWjNoQTYydko0cnFUQ2pXcURtMQoyOTNDdlNpSW1rYW9RT1FBRkFwSXVMT1BU
K3RiUXBRY3E1ZWJPelZEdVV5aWhsK0xxRGtZa3p6OGpTSldtZmh4Cnp2SlJBZGtGb3JPdG5LaWN6
QXUwVjUwNXVpZitkNHNDSk14czcwK2ttMTZNWFdBeTdHOTBEM0E2RUdpdDNLR2cKWjdsN01NRUJj
b2x4NVpZc3BSVk91cVJUbmZNb25XSEwvMUYzNHdOcFNINUp4Zld5NHNDNlFPR0hmYlQ0ZVNqRwoy
RVJTeFBUdHpXY0FPT0pGYkcwQ2c5SVNZRFE2YUE2dCtWbzRJeUlWdEVVSHZFc296cEQwN0R4ZDVD
Slp6eXhUCnNqVElEMXJSVmRQa3dCbkZBNTQ3bUxkQ1U0MlJJcnV6ekg1MElTY0Z3NElwTlZic20r
cXEzeEYzeFFFZVJRanEKRGEzODhSaldRTklpYnl6L3QwOTBGamhwenVnYThoL0tlREhFNGJmSi9W
VXcrNXRRZ1hreTFuaGQ3dmo4U2RWNgpZSktlV2huQU85aTU2MkdMK0pMcwo9RHEwSwotLS0tLUVO
RCBQR1AgU0lHTkFUVVJFLS0tLS0K

--===============1377233211374222821==--

