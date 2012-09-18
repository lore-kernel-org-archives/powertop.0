Content-Type: multipart/mixed; boundary="===============1591494588604019411=="
MIME-Version: 1.0
From: Chris Ferron <chris.e.ferron at linux.intel.com>
Subject: Re: [Powertop] [PATCH 2/2] devlist: NULL terminate struct devuser
 fields
Date: Tue, 18 Sep 2012 08:42:52 -0700
Message-ID: <5058967C.7040104@linux.intel.com>
In-Reply-To: 1347981198-10438-2-git-send-email-namhyung@gmail.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============1591494588604019411==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 09/18/2012 08:13 AM, Namhyung Kim wrote:
> As strncpy doesn't guarantee the destination buffer is NULL-
> terminated, do it explicitly.
>
> Signed-off-by: Namhyung Kim <namhyung(a)gmail.com>
> ---
>   src/devlist.cpp |    2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/src/devlist.cpp b/src/devlist.cpp
> index 828f47f..71898af 100644
> --- a/src/devlist.cpp
> +++ b/src/devlist.cpp
> @@ -147,7 +147,9 @@ void collect_open_devices(void)
>   					continue;
>   				dev->pid =3D strtoull(entry->d_name, NULL, 10);
>   				strncpy(dev->device, link, 251);
> +				dev->device[251] =3D '\0';
>   				strncpy(dev->comm, read_sysfs_string("/proc/%s/comm", entry->d_name=
).c_str(), 31);
> +				dev->comm[31] =3D '\0';
>   				target->push_back(dev);
>   =

>   			}
Your patch has been merged
Thank You
-C


--===============1591494588604019411==--

