Content-Type: multipart/mixed; boundary="===============6190498680692017858=="
MIME-Version: 1.0
From: Alexandra Yates <alexandra.yates at linux.intel.com>
Subject: Re: [Powertop] [PATCH] Powertop: remove unnecessary code
Date: Fri, 22 Aug 2014 15:20:07 -0700
Message-ID: <52019.10.7.198.163.1408746007.squirrel@linux.intel.com>
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============6190498680692017858==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


> nr_open is already initialized to NR_OPEN_DEF. Removing unnecessary
> checking
> and assignment.
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
>
>
> --
> Thanks,
> Salman Ahmed
> _______________________________________________
> PowerTop mailing list
> PowerTop(a)lists.01.org
> https://lists.01.org/mailman/listinfo/powertop
>
Salman,

I can't get your patch applied, I downloaded the message, and all
attachments and every one of them give me error: Patch format detection
failed.  Please regenerate your patch using:
    git format-patch --cover-letter --subject-prefix=3D"PATCH Vn" ..

Where n is the version number of your patch.

Thank you,
Alexandra.

--===============6190498680692017858==--

