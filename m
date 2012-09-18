Content-Type: multipart/mixed; boundary="===============4002389912713280149=="
MIME-Version: 1.0
From: Chris Ferron <chris.e.ferron at linux.intel.com>
Subject: Re: [Powertop] [PATCH 1/2] devlist: Remove an unnecessary sprintf
Date: Tue, 18 Sep 2012 08:42:42 -0700
Message-ID: <50589672.7090006@linux.intel.com>
In-Reply-To: 1347981198-10438-1-git-send-email-namhyung@gmail.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============4002389912713280149==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 09/18/2012 08:13 AM, Namhyung Kim wrote:
> The 'filename' is not used in the loop anymore.
>
> Signed-off-by: Namhyung Kim <namhyung(a)gmail.com>
> ---
>   src/devlist.cpp |    1 -
>   1 file changed, 1 deletion(-)
>
> diff --git a/src/devlist.cpp b/src/devlist.cpp
> index 5ec0a8b..828f47f 100644
> --- a/src/devlist.cpp
> +++ b/src/devlist.cpp
> @@ -147,7 +147,6 @@ void collect_open_devices(void)
>   					continue;
>   				dev->pid =3D strtoull(entry->d_name, NULL, 10);
>   				strncpy(dev->device, link, 251);
> -				sprintf(filename, "/proc/%s/comm", entry->d_name);
>   				strncpy(dev->comm, read_sysfs_string("/proc/%s/comm", entry->d_name=
).c_str(), 31);
>   				target->push_back(dev);
>   =

Your patch has been merged
Thank You
-C


--===============4002389912713280149==--

