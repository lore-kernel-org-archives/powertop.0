Content-Type: multipart/mixed; boundary="===============7648872640626663073=="
MIME-Version: 1.0
From: Chris Ferron <chris.e.ferron at linux.intel.com>
Subject: Re: [Powertop] [PATCH 1/2] Updates to support Android platform
Date: Mon, 17 Sep 2012 09:28:16 -0700
Message-ID: <50574FA0.1050102@linux.intel.com>
In-Reply-To: 1347892449-10484-1-git-send-email-rajagopal.venkat@linaro.org
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============7648872640626663073==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 09/17/2012 07:34 AM, Rajagopal Venkat wrote:
>   =

>   #include "devices/device.h"
> diff --git a/src/process/do_process.cpp b/src/process/do_process.cpp
> index eaef7f1..c9d6b0b 100644
> --- a/src/process/do_process.cpp
> +++ b/src/process/do_process.cpp
> @@ -869,7 +869,7 @@ void process_update_display(void)
>   		if (!show_power)
>   			strcpy(power, "          ");
>   		sprintf(name, "%s", all_power[i]->type());
> -		while (mbstowcs(NULL,name,0) < 14) strcat(name, " ");
> +		while (mbstowcs(NULL,name,20) < 14) strcat(name, " ");
>   =

mbstowcs(NULL,name,0) is a test. return will be count. while catches the =

error.

>   =

>   		if (all_power[i]->events() =3D=3D 0 && all_power[i]->usage() =3D=3D 0=
 && all_power[i]->Witts() =3D=3D 0)
> @@ -882,7 +882,7 @@ void process_update_display(void)
>   			else
>   				sprintf(usage, "%5i%s", (int)all_power[i]->usage(), all_power[i]->u=
sage_units());
>   		}
> -		while (mbstowcs(NULL,usage,0) < 14) strcat(usage, " ");
> +		while (mbstowcs(NULL,usage,20) < 14) strcat(usage, " ");
>   		sprintf(events, "%5.1f", all_power[i]->events());
>   		if (!all_power[i]->show_events())
>   			events[0] =3D 0;


--===============7648872640626663073==--

