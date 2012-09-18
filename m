Content-Type: multipart/mixed; boundary="===============5765637247420182082=="
MIME-Version: 1.0
From: Sergey Senozhatsky <sergey.senozhatsky at gmail.com>
Subject: Re: [Powertop] [PATCH 1/2] devlist: Remove an unnecessary sprintf
Date: Tue, 18 Sep 2012 18:16:43 +0300
Message-ID: <20120918151643.GA3046@swordfish.minsk.epam.com>
In-Reply-To: 1347981198-10438-1-git-send-email-namhyung@gmail.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============5765637247420182082==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On (09/19/12 00:13), Namhyung Kim wrote:
> Date: Wed, 19 Sep 2012 00:13:17 +0900
> From: Namhyung Kim <namhyung(a)gmail.com>
> To: powertop(a)lists.01.org
> Subject: [Powertop] [PATCH 1/2] devlist: Remove an unnecessary sprintf
> X-Mailer: git-send-email 1.7.9.2
> =

> The 'filename' is not used in the loop anymore.
> =

> Signed-off-by: Namhyung Kim <namhyung(a)gmail.com>
> ---
>  src/devlist.cpp |    1 -
>  1 file changed, 1 deletion(-)
>

looks good.

	-ss
 =

> diff --git a/src/devlist.cpp b/src/devlist.cpp
> index 5ec0a8b..828f47f 100644
> --- a/src/devlist.cpp
> +++ b/src/devlist.cpp
> @@ -147,7 +147,6 @@ void collect_open_devices(void)
>  					continue;
>  				dev->pid =3D strtoull(entry->d_name, NULL, 10);
>  				strncpy(dev->device, link, 251);
> -				sprintf(filename, "/proc/%s/comm", entry->d_name);
>  				strncpy(dev->comm, read_sysfs_string("/proc/%s/comm", entry->d_name)=
.c_str(), 31);
>  				target->push_back(dev);
>  =

> -- =

> 1.7.9.2
> =

> _______________________________________________
> PowerTop mailing list
> PowerTop(a)lists.01.org
> https://lists.01.org/mailman/listinfo/powertop
>=20

--===============5765637247420182082==--

