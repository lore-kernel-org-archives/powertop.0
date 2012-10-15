Content-Type: multipart/mixed; boundary="===============6756844395268665496=="
MIME-Version: 1.0
From: Chris Ferron <chris.e.ferron at linux.intel.com>
Subject: Re: [Powertop] [PATCH] devices: Fix processing /proc/net/dev file
Date: Mon, 15 Oct 2012 09:22:45 -0700
Message-ID: <507C3855.5090401@linux.intel.com>
In-Reply-To: 1350311616-9770-1-git-send-email-namhyung@gmail.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============6756844395268665496==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 10/15/2012 07:33 AM, Namhyung Kim wrote:
> The do_proc_net_dev() reads the /proc/net/dev file and counts tx/rx
> packets for each interface.  However index for rx packet (1) is not
> match to the file:
>
> $ cat /proc/net/dev
> Inter-|   Receive                                                |  Trans=
mit
>   face |bytes    packets errs drop fifo frame compressed multicast|bytes =
   packets errs drop fifo colls carrier compressed
>         (1)      (2)     (3)  (4)  (5)  (6)   (7)        (8)       (9)   =
   (10)    (11) (12) (13) (14)  (15)    (16)
>
> Change the index to 2 to match to the number of receive packets.
>
> Signed-off-by: Namhyung Kim <namhyung(a)gmail.com>
> ---
>   src/devices/network.cpp |    2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/src/devices/network.cpp b/src/devices/network.cpp
> index b8a5c9c..3b67610 100644
> --- a/src/devices/network.cpp
> +++ b/src/devices/network.cpp
> @@ -114,7 +114,7 @@ static void do_proc_net_dev(void)
>   			c2 =3D c;
>   			val =3D strtoull(c, &c, 10);
>   			i++;
> -			if (i =3D=3D 1 || i =3D=3D 10)
> +			if (i =3D=3D 2 || i =3D=3D 10)
>   				pkt +=3D val;
>   =

>   		}
Your patch has been merged
Thank You
-C


--===============6756844395268665496==--

