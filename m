Content-Type: multipart/mixed; boundary="===============0599048821702787656=="
MIME-Version: 1.0
From: Arjan van de Ven <arjan at linux.intel.com>
Subject: Re: [Powertop] Why C++ is the language of implementation?
Date: Mon, 31 Mar 2014 08:48:48 -0700
Message-ID: <53398E60.50904@linux.intel.com>
In-Reply-To: CADy9ZNA_1wW69nyNNS=yqL0iqoWZZB=UiTt2BCkft=nqwZP5Sg@mail.gmail.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============0599048821702787656==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 3/31/2014 8:43 AM, Bill Vyzas wrote:
> Hi all,
>
> I am curious to know why PowerTOP is using C++ as the language of impleme=
ntation but the majority of the program is written with the C standards. I =
checked also some other
> open source programs like the Gnome Power Manager and its doing the same =
thing.
>
> I know that C++ can also call C and I also know that there are couple of =
classes on the program but why use C++ for a few classes when you can have =
structs, which are
> basically classes, instead.


C++ and objects are a very useful paradigm for certain things (especially i=
f they map
to actual physical things)... and powertop uses that.

I'm not one of those people who goes overboard and sees objects for things =
that are not
really objects, just pieces of data.


--===============0599048821702787656==--

