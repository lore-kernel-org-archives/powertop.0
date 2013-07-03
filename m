Content-Type: multipart/mixed; boundary="===============6767671271851981886=="
MIME-Version: 1.0
From: Sergey Senozhatsky <sergey.senozhatsky at gmail.com>
Subject: Re: [Powertop] Bug under Fedora 19 x86_64: Requesting Unregistered
 Parameters 63 and 58
Date: Wed, 03 Jul 2013 14:55:26 +0300
Message-ID: <20130703115526.GB2225@swordfish>
In-Reply-To: CAEKyVWMcFA+LS3iODk3sAGDUthYFPFc_pyr35XKx=LfU8Dh_Ng@mail.gmail.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============6767671271851981886==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On (07/02/13 23:12), Nathan Van Ymeren wrote:
>    Hi folks,
>    I recently upgraded to Fedora 19 and noticed my thinkpad was running a
>    little hotter than usual. =EF=BF=BDTried to open powertop and instead =
of the
>    familiar menu I was greeted with endless spam of the same two lines,
>    repeated:
>    BUG: requesting unregistered parameter 58
>    BUG: requesting unregistered parameter 63
>    Running with --debug had no discernible effect. =EF=BF=BDDoes powertop=
 leave a log
>    file anywhere for investigation?
>    N

Hello,

/** sorry, broken mail headers in previous email*/


could you please show content of

	/sys/devices/platform/thinkpad_hwmon/
and
	/sys/devices/platform/thinkpad_acpi/leds/


	-ss

--===============6767671271851981886==--

