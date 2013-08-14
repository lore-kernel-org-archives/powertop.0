Content-Type: multipart/mixed; boundary="===============4321802449529603777=="
MIME-Version: 1.0
From: Kok, Auke-jan H <auke-jan.h.kok at intel.com>
Subject: Re: [Powertop] Managing an nVidia G86 [Quadro NVS 140M]
Date: Tue, 13 Aug 2013 19:26:11 -0700
Message-ID: <CABsxX9K49fJj8w0zvRwVhScmCR+mbrJhF7jvg0L6YSa+ou3Cqg@mail.gmail.com>
In-Reply-To: 20130814013117.GC5030@dellboy.local
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============4321802449529603777==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 13, 2013 at 6:31 PM,  <sqlists(a)posteo.co.uk> wrote:
> OP here. Well, bang went my email provider.

yeah, we heard about that... sucks  o_O

> On 7 Aug 2013, at 00:25, "Kok, Auke-jan H" <auke-jan.h.kok(a)intel.com> w=
rote:
>>there is the likeliness that you are using a proprietary driver blob
>>from a vendor as well.
>
> I'm using the "nouveau" driver.  I have seen what appears to be a proprie=
tary driver, but it seems to be linked to the X11 windowing system so I was=
n't sure if it was applicable to me, seeing as I don't even have a GUI inst=
alled.  If I find it again should I install it?

so nouveau is open source (good!) but the driver is relatively
immature and hardware acceleration performance seems to be a priority
(shiny fast pixels) and not power savings (which, believe it or not,
is often more "protected" than anything else).

Your system may even have both the open source nouveau driver and the
closed source blob as well, depending on the distribution used....

I'd inquire/reasearch with the nouveau project to see if they are
working on power savings features (downclocking, shutting down cores
etc.) that they are working on. Other people on this list may know,
but this is obviously a very specific topic that the nouveau team
should know the status of.

Cheers,

Auke

--===============4321802449529603777==--

