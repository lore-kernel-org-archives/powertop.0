Content-Type: multipart/mixed; boundary="===============1840189626472020547=="
MIME-Version: 1.0
From: Sergey Senozhatsky <sergey.senozhatsky at gmail.com>
Subject: Re: [Powertop] [PATCH] Add a more informative error message about MSR
 not found
Date: Thu, 21 Feb 2013 15:52:59 +0300
Message-ID: <20130221125259.GA9471@swordfish.minsk.epam.com>
In-Reply-To: 87621lq5jv.fsf@intel.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============1840189626472020547==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On (02/21/13 13:17), Jani Nikula wrote:
> On Thu, 21 Feb 2013, Sergey Senozhatsky <sergey.senozhatsky(a)gmail.com> =
wrote:
> > I think we're beyond the `string freeze' date, most likely it will not
> > get into upcoming release.
> =

> I'm ignorant about powertop release practices, and don't mind whether it
> makes the next release or not; hopefully some release after that though.
> =

> I'm just trying to give a hint to the next developer hitting the issue,
> so he won't have to first grep the powertop sources to figure out what
> the error really is about, and then the kernel sources to figure out
> who's responsible for creating /dev/cpu/%d/msr, and what config knob to
> turn to enable that... The README patch I sent of course helps too.
>

sure, thanks.

	-ss
 =

> BR,
> Jani.
>=20

--===============1840189626472020547==--

