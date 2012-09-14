Content-Type: multipart/mixed; boundary="===============1117637964343004000=="
MIME-Version: 1.0
From: Paul Menzel <paulepanter at users.sourceforge.net>
Subject: Re: [Powertop] [PATCH] Remove unneded escaping backslashes from CSS
Date: Fri, 14 Sep 2012 12:02:44 +0200
Message-ID: <1347616964.6783.13.camel@mattotaupa>
In-Reply-To: 1347616012-26879-1-git-send-email-i.zhbanov@samsung.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============1117637964343004000==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Dear Igor,


Am Freitag, den 14.09.2012, 13:46 +0400 schrieb Igor Zhbanov:
> Remove unneded escaping backslashes from CSS.

copying the summary into the body is not useful, because it adds no
further information.

Please also add why the escaping was added beforehand and why it is
unneeded.

> ---
>  src/powertop.css |   16 ++++++++--------
>  1 files changed, 8 insertions(+), 8 deletions(-)
> =

> diff --git a/src/powertop.css b/src/powertop.css
> index 087e384..5d303dc 100644
> --- a/src/powertop.css
> +++ b/src/powertop.css
> @@ -21,14 +21,14 @@ $(document).ready(function(){
>  	$('#tuning h2').addClass('hide');
>  	$('#tuning table').addClass('hide');
>  =

> -	$('#top').append('<div class=3D\"SystemButton\"   onclick=3D\"toggleSys=
tem()\">System Info<\\/div>');
> -	$('#top').append('<div class=3D\"SummaryButton\"  onclick=3D\"toggleSum=
mary()\">Summary<\\/div>');
> -	$('#top').append('<div class=3D\"CpuidleButton\"  onclick=3D\"toggleCpu=
idle()\">CPU Idle<\\/div>');
> -	$('#top').append('<div class=3D\"CpufreqButton\"  onclick=3D\"toggleCpu=
freq()\">CPU Frequency<\\/div>');
> -	$('#top').append('<div class=3D\"SoftwareButton\" onclick=3D\"toggleSof=
tware()\">Software info<\\/div>');
> -	$('#top').append('<div class=3D\"DeviceButton\"   onclick=3D\"toggleDev=
ice()\">Device Info<\\/div>');
> -	$('#top').append('<div class=3D\"TuningButton\"   onclick=3D\"toggleTun=
ing()\">Tuning<\\/div>');
> -	$('#top').append('<div class=3D\"AllButton\"      onclick=3D\"toggleAll=
()\">All<\\/div>');
> +	$('#top').append('<div class=3D\"SystemButton\"   onclick=3D\"toggleSys=
tem()\">System Info</div>');
> +	$('#top').append('<div class=3D\"SummaryButton\"  onclick=3D\"toggleSum=
mary()\">Summary</div>');
> +	$('#top').append('<div class=3D\"CpuidleButton\"  onclick=3D\"toggleCpu=
idle()\">CPU Idle</div>');
> +	$('#top').append('<div class=3D\"CpufreqButton\"  onclick=3D\"toggleCpu=
freq()\">CPU Frequency</div>');
> +	$('#top').append('<div class=3D\"SoftwareButton\" onclick=3D\"toggleSof=
tware()\">Software info</div>');
> +	$('#top').append('<div class=3D\"DeviceButton\"   onclick=3D\"toggleDev=
ice()\">Device Info</div>');
> +	$('#top').append('<div class=3D\"TuningButton\"   onclick=3D\"toggleTun=
ing()\">Tuning</div>');
> +	$('#top').append('<div class=3D\"AllButton\"      onclick=3D\"toggleAll=
()\">All</div>');
>  	$('#top .SummaryButton').toggleClass('pressed');
>  =

>      }


Thanks,

Paul

--===============1117637964343004000==
Content-Type: application/pgp-signature
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="signature.asc"

LS0tLS1CRUdJTiBQR1AgU0lHTkFUVVJFLS0tLS0KVmVyc2lvbjogR251UEcgdjEuNC4xMiAoR05V
L0xpbnV4KQoKaUVZRUFCRUNBQVlGQWxCVEFNUUFDZ2tRUFgxYUsyd09IVmhWUkFDZU9SVkhoK0VQ
aTMyN2RFV1VHTHZ3Wng0RgpHdjhBblJyZ29XVThpZmpDUzYwUVJSa3J6QTBZNmFUUAo9anYwegot
LS0tLUVORCBQR1AgU0lHTkFUVVJFLS0tLS0K

--===============1117637964343004000==--

