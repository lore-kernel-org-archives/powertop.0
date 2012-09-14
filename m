Content-Type: multipart/mixed; boundary="===============4057638672945429442=="
MIME-Version: 1.0
From: Sergey Senozhatsky <sergey.senozhatsky at gmail.com>
Subject: Re: [Powertop] [PATCH] Remove unneded escaping backslashes from CSS
Date: Fri, 14 Sep 2012 13:23:56 +0300
Message-ID: <20120914102356.GB3053@swordfish.minsk.epam.com>
In-Reply-To: 1347616012-26879-1-git-send-email-i.zhbanov@samsung.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============4057638672945429442==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On (09/14/12 13:46), Igor Zhbanov wrote:
> Remove unneded escaping backslashes from CSS.
> ---
>  src/powertop.css |   16 ++++++++--------
>  1 files changed, 8 insertions(+), 8 deletions(-)
>

looks good to me, thank you Igor.

	-ss
 =

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
> -- =

> 1.7.5.4
> =

> _______________________________________________
> PowerTop mailing list
> PowerTop(a)lists.01.org
> https://lists.01.org/mailman/listinfo/powertop
>=20

--===============4057638672945429442==--

