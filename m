Content-Type: multipart/mixed; boundary="===============2547337491819124671=="
MIME-Version: 1.0
From: Amit Kucheria <amit.kucheria at linaro.org>
Subject: Re: [Powertop] [PATCH POWERTOP] Remove temporary file created during
 calibration
Date: Tue, 01 Jul 2014 17:53:49 +0530
Message-ID: <CAP245DWNT1zu8=0ryAN1k2RAbaxfUEsgU24G6pLQ8hv3pmN6wg@mail.gmail.com>
In-Reply-To: CAHu9=sOdFn=hdvOdYYmx29HaiKzYPbnoESigfPVrX6Fef7r=tA@mail.gmail.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============2547337491819124671==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Mohammad,

This fix should go upstream. cc'ing the powertop list.

Regards,
Amit

On Thu, Jun 26, 2014 at 12:27 PM, Mohammad Merajul Islam Molla
<meraj.enigma(a)gmail.com> wrote:
> powertop creates temporary file in /tmp folder during calibration.
> Simply closing does not remove these files.
> Instead use unlink to remove the file.
>
> diff --git a/src/calibrate/calibrate.cpp b/src/calibrate/calibrate.cpp
> index db368e0..1336c3f 100644
> --- a/src/calibrate/calibrate.cpp
> +++ b/src/calibrate/calibrate.cpp
> @@ -242,7 +242,7 @@ static void *burn_disk(void *dummy)
>                 write(fd, buffer, 64*1024);
>                 fdatasync(fd);
>         }
> -       close(fd);
> +       unlink(filename);
>         return NULL;
>  }
>
>
>
> --
> Thanks,
> -Meraj
>
> _______________________________________________
> linaro-dev mailing list
> linaro-dev(a)lists.linaro.org
> http://lists.linaro.org/mailman/listinfo/linaro-dev

--===============2547337491819124671==--

