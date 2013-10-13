Content-Type: multipart/mixed; boundary="===============8479692026481911610=="
MIME-Version: 1.0
From: Marc MERLIN <marc_powertop at merlins.org>
Subject: Re: [Powertop] USB devices get wrong power use values
Date: Sun, 13 Oct 2013 15:10:48 -0700
Message-ID: <20131013221048.GI30504@merlins.org>
In-Reply-To: 525AEAF9.5080709@linux.intel.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============8479692026481911610==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 13, 2013 at 11:48:25AM -0700, Arjan van de Ven wrote:
> On 10/13/2013 9:22 AM, Marc MERLIN wrote:
> =

> >>having a USB device active also generally makes the CPU/etc use much mo=
re power,
> >>which Powertop "charges" to the USB device in question.
> >>
> >>8 Watts sounds entirely reasonable for that to me...
> >
> >Aah, if the CPU gets involved, then yes, it's a bit more possible.
> >So, a simple USB keyboard that's unused can keep one core awake and burn=
 8
> >watts if something else goes wrong in the kernel to cause that?
> =

> a bad USB keyboard can keep the processor out of deep package C states..
> not a lot the software can do about that...
> but yet it can be THAT much power delta.
> =

> (we've seen for example on some servers that a cheap keyboard makes > 15 =
Watts difference, but measured
> at the wall socket, so after the power supply/etc)

So note that it's actually a very small USB widget that behaves as a
keyboard (it's an OTP token).
I've only had that OTP token show as 7W once, and it was suspicious that
it was at the exact same time as my built in camera.

So from what you're staying, you're pretty sure that the measuring code
was correct and that somehow the USB system was wedged or that power
management suspend failed in a way that both devices were taking 14W
together, more than what the entire laptop uses when on batteries with
CPUs mostly asleep?

Marc
-- =

"A mouse is a device used to point at the xterm you want to type in" - A.S.=
R.
Microsoft is to operating systems ....
                                      .... what McDonalds is to gourmet coo=
king
Home page: http://marc.merlins.org/                         | PGP 1024R/763=
BE901

--===============8479692026481911610==--

