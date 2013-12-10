Content-Type: multipart/mixed; boundary="===============5029869331024863146=="
MIME-Version: 1.0
From: Sergey Senozhatsky <sergey.senozhatsky at gmail.com>
Subject: Re: [Powertop] Fwd: [BUG] powertop does not correctly checks for
 audio codec power management
Date: Tue, 10 Dec 2013 23:29:25 +0300
Message-ID: <20131210202925.GF2422@swordfish>
In-Reply-To: CAFJOydwZoTv_DcD5z7BzroAP5EY9+bA8TpVH9dxpepL4ZZv4Ew@mail.gmail.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============5029869331024863146==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On (11/27/13 11:41), Ot=C3=A1vio Cipriani wrote:
> Hi.
> =

> I noticed that powertop 2.4 does not correctly checks if the audio
> codec power management is already enabled.
> =

> The module responsible for audio in my sistem is "snd_hda_intel", and
> powertop requires that
> "/sys/module/snd_hda_intel/parameters/power_save" is set to 1 to
> consider that power save is enabled.
> =

> Since that parameter is the power save timeout in seconds (0 disables
> power save), it should check if it is greater than 0.
> =

> In my setup, "power_save" is set to 10 seconds and
> "power_save_controller" is set to "Y", but powertop still thinks that
> power save is not enabled for my audio codec.

Hello,

good catch, thank you.
need to think how to handle this.

	-ss

> Thank you.
> _______________________________________________
> PowerTop mailing list
> PowerTop(a)lists.01.org
> https://lists.01.org/mailman/listinfo/powertop
>=20

--===============5029869331024863146==--

