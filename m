Content-Type: multipart/mixed; boundary="===============3810126042403218802=="
MIME-Version: 1.0
From: Chris Ferron <chris.e.ferron at linux.intel.com>
Subject: Re: [Powertop] Wrong common field name in GFX Wakeups event
Date: Tue, 17 Jul 2012 15:10:12 -0700
Message-ID: <5005E2C4.1050204@linux.intel.com>
In-Reply-To: 4FFD1A0C.90704@samsung.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============3810126042403218802==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 07/10/2012 11:15 PM, Igor Zhbanov wrote:
> Hello!
>
> I have found that PowerTOP doesn't displays values in "GFX Wakeups/s" =

> column.
> It is because of wrong event field name the handle_trace_point() method
> expects to find in a trace event.
>
> Here is the patch:
> --8<--Cut-here-----------------------------------------------------------=
----- =

>
> diff -purN powertop/src/process/do_process.cpp =

> powertop-new/src/process/do_process.cpp
> --- powertop/src/process/do_process.cpp    2012-07-05 =

> 13:06:16.080258858 +0400
> +++ powertop-new/src/process/do_process.cpp    2012-07-06 =

> 13:31:14.382651388 +0400
> @@ -340,7 +340,7 @@ void perf_process_bundle::handle_trace_p
>          int flags;
>          int pid;
>
> -        ret =3D pevent_get_common_field_val(NULL, event, =

> "flags",&rec,&val, 0);
> +        ret =3D pevent_get_common_field_val(NULL, event, =

> "common_flags",&rec,&val, 0);
>          if (ret<  0)
>              return;
>          flags =3D (int)val;
> @@ -625,7 +625,7 @@ void perf_process_bundle::handle_trace_p
>          class power_consumer *consumer =3D NULL;
>          int flags;
>
> -        ret =3D pevent_get_common_field_val(NULL, event, =

> "flags",&rec,&val, 0);
> +        ret =3D pevent_get_common_field_val(NULL, event, =

> "common_flags",&rec,&val, 0);
>          if (ret<  0)
>              return;
>          flags =3D (int)val;
> --8<---------------------------------------------------------------------=
----- =

>
>
> Thank you.
>
>
>
> _______________________________________________
> PowerTop mailing list
> PowerTop(a)lists.01.org
> https://lists.01.org/mailman/listinfo/powertop
Your patch has been merged.
Thank you,


--===============3810126042403218802==--

