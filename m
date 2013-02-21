Content-Type: multipart/mixed; boundary="===============5271454048405203339=="
MIME-Version: 1.0
From: Jani Nikula <jani.nikula at linux.intel.com>
Subject: Re: [Powertop] [PATCH] Add a more informative error message about MSR
 not found
Date: Thu, 21 Feb 2013 13:17:56 +0200
Message-ID: <87621lq5jv.fsf@intel.com>
In-Reply-To: 20130221093738.GA2325@swordfish.minsk.epam.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============5271454048405203339==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, 21 Feb 2013, Sergey Senozhatsky <sergey.senozhatsky(a)gmail.com> wr=
ote:
> I think we're beyond the `string freeze' date, most likely it will not
> get into upcoming release.

I'm ignorant about powertop release practices, and don't mind whether it
makes the next release or not; hopefully some release after that though.

I'm just trying to give a hint to the next developer hitting the issue,
so he won't have to first grep the powertop sources to figure out what
the error really is about, and then the kernel sources to figure out
who's responsible for creating /dev/cpu/%d/msr, and what config knob to
turn to enable that... The README patch I sent of course helps too.

BR,
Jani.

--===============5271454048405203339==--

