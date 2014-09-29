Content-Type: multipart/mixed; boundary="===============4070184015801813277=="
MIME-Version: 1.0
From: Alexandra Yates <alexandra.yates at linux.intel.com>
Subject: Re: [Powertop] [PATCH RESEND] Powertop: remove unnecessary code
Date: Mon, 29 Sep 2014 12:00:30 -0700
Message-ID: <51773.10.24.5.188.1412017230.squirrel@linux.intel.com>
In-Reply-To: CAH0joKF07+1mC4dvqvVXjaWoeTdYc=4SjBX1SFvQABhO=gUHuw@mail.gmail.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============4070184015801813277==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


> nr_open is already initialized by NR_OPEN_DEF. Removing unnecessary
> checking and
> assignment.
>
> Signed-off-by: Salman Ahmed <salman0yam(a)gmail.com>
> ---
>  src/main.cpp | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/src/main.cpp b/src/main.cpp
> index cf4e547..990bc1f 100644
> --- a/src/main.cpp
> +++ b/src/main.cpp
> @@ -293,8 +293,6 @@ static int get_nr_open(void) {
>         file.open("/proc/sys/fs/nr_open", ios::in);
>         if (file) {
>                 file >> nr_open;
> -               if (!file)
> -                       nr_open =3D NR_OPEN_DEF;
>                 file.close();
>         }
>         return nr_open;
> --
> 1.8.1.2
> _______________________________________________
> PowerTop mailing list
> PowerTop(a)lists.01.org
> https://lists.01.org/mailman/listinfo/powertop
>

Hi Ahmed,

Did you use the tip of the tree to format/send your patch?

Your current patch is seeking to remove lines 293 an 294.   You are off by
one line.

Thank you,
Alexandra.

--===============4070184015801813277==--

