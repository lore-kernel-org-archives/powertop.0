Content-Type: multipart/mixed; boundary="===============3877258634134516596=="
MIME-Version: 1.0
From: Kok, Auke-jan H <auke-jan.h.kok at intel.com>
Subject: Re: [Powertop] Managing an nVidia G86 [Quadro NVS 140M]
Date: Tue, 06 Aug 2013 16:25:42 -0700
Message-ID: <CABsxX9KiZ3bAu3ac+Nt8PhSXOexDDUaqbeQdc4Ewo9A1Gkvx4A@mail.gmail.com>
In-Reply-To: 44693.82.44.24.160.1375775951.squirrel@lavabit.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============3877258634134516596==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 6, 2013 at 12:59 AM,  <sirquijote(a)lavabit.com> wrote:
> Hi,
>
> Dell Latitude D830; Debian 7 "Wheezy" 64-bit running as a CLI; PowerTOP
> 2.0 (latest version available for Debian's Stable branch)
>
> I use this laptop for some basic home server duties, and the screen is off
> most of the time through the use of the "vbetool dpms off" command.
> However, my GPU still displays as 100% usage at all times in PowerTOP's
> Device Stats tab, even with all Tunables set to "Good".
>
> I occasionally need to directly access the laptop using its built-in
> keyboard, say if I screw up my SSH connection somehow, and during boot
> when I need to enter some LUKS passwords, so the display needs to be
> accessible at those times.  Other than that, the display is largely
> superfluous, and is switched off 47 out of 48 hours.
>
> Is there anything I can do to minimise the GPU's power draw during its 47
> idle hours?

Other than "purchase full hardware specs" and "learn how to kernel program"=
? :^)

Joking aside, you could attempt to juggle the tunables in powertop, or
consulting the video adapter driver hardware configuration options,
but I have the suspicion that this model is too old to support most of
the features that will make it actually save significant power. Then
there is the likeliness that you are using a proprietary driver blob
from a vendor as well.

At least you can turn the panel off, which is a ton of power (watts,
several of them, like 7-10W for most panels), so you at least are
making a difference there.

Cheers,

Auke

--===============3877258634134516596==--

