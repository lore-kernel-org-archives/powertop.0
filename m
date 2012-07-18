Content-Type: multipart/mixed; boundary="===============0260039976010823307=="
MIME-Version: 1.0
From: Chris Ferron <chris.e.ferron at linux.intel.com>
Subject: Re: [Powertop] [PATCH] Add support to store boardname in /data
 directory
Date: Wed, 18 Jul 2012 15:06:47 -0700
Message-ID: <50073377.8060200@linux.intel.com>
In-Reply-To: 1342623204-30480-1-git-send-email-i.zhbanov@samsung.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============0260039976010823307==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 07/18/2012 07:53 AM, Igor Zhbanov wrote:
> Add support to store boardname in /data directory.
> This patch is based on Linaro's changes.
> ---
>   src/main.cpp |   15 +++++++++++----
>   1 files changed, 11 insertions(+), 4 deletions(-)
>
> diff --git a/src/main.cpp b/src/main.cpp
> index 7a1b976..8a68533 100644
> --- a/src/main.cpp
> +++ b/src/main.cpp
> @@ -240,12 +240,19 @@ static void load_board_params()
>   	string boardname;
>   	char filename[4096];
>   =

> -	boardname =3D read_sysfs_string("/etc/boardname");
> +	if (access("/etc/boardname", R_OK) =3D=3D 0) {
> +		boardname =3D read_sysfs_string("/etc/boardname");
>   =

> -	if (boardname.length() < 2)
> -		return;
> +		if (boardname.length() < 2)
> +			return;
>   =

> -	sprintf(filename, "/var/cache/powertop/saved_parameters.powertop.%s", b=
oardname.c_str());
> +		sprintf(filename,
> +			"/var/cache/powertop/saved_parameters.powertop.%s",
> +			boardname.c_str());
> +	} else if (access("/data", R_OK) =3D=3D 0)
> +		sprintf(filename,"saved_parameters.powertop");
> +	else
> +		return;
>   =

>   	if (access(filename, R_OK))
>   		return;
Thank you for this patch, but 'we' consider boardname now deprecated. As =

such there is a future commit that will remove this code upcoming. As =

such your patch will not be needed.
-Chris



--===============0260039976010823307==--

