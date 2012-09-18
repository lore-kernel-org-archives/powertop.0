Content-Type: multipart/mixed; boundary="===============6666960611205198936=="
MIME-Version: 1.0
From: Sergey Senozhatsky <sergey.senozhatsky at gmail.com>
Subject: Re: [Powertop] [PATCH 2/2] devlist: NULL terminate struct devuser
 fields
Date: Tue, 18 Sep 2012 18:16:58 +0300
Message-ID: <20120918151658.GB3046@swordfish.minsk.epam.com>
In-Reply-To: 1347981198-10438-2-git-send-email-namhyung@gmail.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============6666960611205198936==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On (09/19/12 00:13), Namhyung Kim wrote:
> Date: Wed, 19 Sep 2012 00:13:18 +0900
> From: Namhyung Kim <namhyung(a)gmail.com>
> To: powertop(a)lists.01.org
> Subject: [Powertop] [PATCH 2/2] devlist: NULL terminate struct devuser
>  fields
> X-Mailer: git-send-email 1.7.9.2
> =

> As strncpy doesn't guarantee the destination buffer is NULL-
> terminated, do it explicitly.
> =


looks good.

	-ss

> Signed-off-by: Namhyung Kim <namhyung(a)gmail.com>
> ---
>  src/devlist.cpp |    2 ++
>  1 file changed, 2 insertions(+)
> =

> diff --git a/src/devlist.cpp b/src/devlist.cpp
> index 828f47f..71898af 100644
> --- a/src/devlist.cpp
> +++ b/src/devlist.cpp
> @@ -147,7 +147,9 @@ void collect_open_devices(void)
>  					continue;
>  				dev->pid =3D strtoull(entry->d_name, NULL, 10);
>  				strncpy(dev->device, link, 251);
> +				dev->device[251] =3D '\0';
>  				strncpy(dev->comm, read_sysfs_string("/proc/%s/comm", entry->d_name)=
.c_str(), 31);
> +				dev->comm[31] =3D '\0';
>  				target->push_back(dev);
>  =

>  			}
> -- =

> 1.7.9.2
> =

> _______________________________________________
> PowerTop mailing list
> PowerTop(a)lists.01.org
> https://lists.01.org/mailman/listinfo/powertop
>=20

--===============6666960611205198936==--

