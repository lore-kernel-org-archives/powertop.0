Content-Type: multipart/mixed; boundary="===============4618907583311795278=="
MIME-Version: 1.0
From: Sergey Senozhatsky <sergey.senozhatsky at gmail.com>
Subject: Re: [Powertop] Fix for some 'requesting unregistered parameter'
Date: Tue, 29 Oct 2013 14:27:02 +0300
Message-ID: <20131029112701.GA2180@swordfish.minsk.epam.com>
In-Reply-To: 435649119.17204207.1383038286562.JavaMail.root@redhat.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============4618907583311795278==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On (10/29/13 05:18), Jaroslav Skarvada wrote:
> Hi,
> =

> the attached patch may fix 'requesting unregistered parameter' for cases
> if e.g NIC was added after calibration
> =


added to -next. thanks.

	-ss

> regards
> =

> Jaroslav

> From d1daec6fd9c1d6534d81df1c3c73de9d714b7196 Mon Sep 17 00:00:00 2001
> From: =3D?UTF-8?q?Jaroslav=3D20=3DC5=3DA0karvada?=3D <jskarvad(a)redhat.c=
om>
> Date: Tue, 29 Oct 2013 10:12:12 +0100
> Subject: [PATCH] network: fixed 'requesting unregistered parameter' if NI=
C is
>  added
> MIME-Version: 1.0
> Content-Type: text/plain; charset=3DUTF-8
> Content-Transfer-Encoding: 8bit
> =

> Signed-off-by: Jaroslav ??karvada <jskarvad(a)redhat.com>
> ---
>  src/devices/network.cpp | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
> =

> diff --git a/src/devices/network.cpp b/src/devices/network.cpp
> index d0827ef..002600b 100644
> --- a/src/devices/network.cpp
> +++ b/src/devices/network.cpp
> @@ -345,11 +345,32 @@ const char * network::device_name(void)
>  =

>  static void netdev_callback(const char *d_name)
>  {
> +	char devname[128];
> +
>  	std::string f_name("/sys/class/net/");
>  	if (strcmp(d_name, "lo") =3D=3D 0)
>  		return;
>  =

>  	f_name.append(d_name);
> +
> +	sprintf(devname, "%s-up", d_name);
> +	register_parameter(devname);
> +
> +	sprintf(devname, "%s-powerunsave", d_name);
> +	register_parameter(devname);
> +
> +	sprintf(devname, "%s-link-100", d_name);
> +	register_parameter(devname);
> +
> +	sprintf(devname, "%s-link-1000", d_name);
> +	register_parameter(devname);
> +
> +	sprintf(devname, "%s-link-high", d_name);
> +	register_parameter(devname);
> +
> +	sprintf(devname, "%s-packets", d_name);
> +	register_parameter(devname);
> +
>  	network *bl =3D new(std::nothrow) class network(d_name, f_name.c_str());
>  	if (bl) {
>  		all_devices.push_back(bl);
> -- =

> 1.8.3.1
> =


> _______________________________________________
> PowerTop mailing list
> PowerTop(a)lists.01.org
> https://lists.01.org/mailman/listinfo/powertop


--===============4618907583311795278==--

