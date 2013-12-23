Content-Type: multipart/mixed; boundary="===============4969288603434989761=="
MIME-Version: 1.0
From: Alexandra Yates <alexandra.yates at linux.intel.com>
Subject: Re: [Powertop] [PATCH] bt_tunable: Translate Good, Bad, Unknown
Date: Mon, 23 Dec 2013 12:18:15 -0800
Message-ID: <60337.10.252.135.84.1387829895.squirrel@linux.intel.com>
In-Reply-To: 1387809519-16695-1-git-send-email-themineo@gmail.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============4969288603434989761==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

> Signed-off-by: Wieland Hoffmann <themineo(a)gmail.com>
> ---
>  src/tuning/bluetooth.cpp | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/src/tuning/bluetooth.cpp b/src/tuning/bluetooth.cpp
> index e0bdf12..2b34277 100644
> --- a/src/tuning/bluetooth.cpp
> +++ b/src/tuning/bluetooth.cpp
> @@ -43,7 +43,7 @@
>  #include "../lib.h"
>  #include "bluetooth.h"
>
> -bt_tunable::bt_tunable(void) : tunable("", 1.0, "Good", "Bad", "Unknown")
> +bt_tunable::bt_tunable(void) : tunable("", 1.0, _("Good"), _("Bad"),
> _("Unknown"))
>  {
>  	sprintf(desc, _("Bluetooth device interface status"));
>  	strcpy(toggle_bad, "/usr/sbin/hciconfig hci0 up &> /dev/null &");
> --
> 1.8.4.2
>
> _______________________________________________
> PowerTop mailing list
> PowerTop(a)lists.01.org
> https://lists.01.org/mailman/listinfo/powertop
>
Hi Wieland,

Thank you for your patch.  I just applied it.

Thank you,
Alexandra.

--===============4969288603434989761==--

