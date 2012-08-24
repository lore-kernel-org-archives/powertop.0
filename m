Content-Type: multipart/mixed; boundary="===============1154397476984585619=="
MIME-Version: 1.0
From: Magnus Fromreide <magfr at lysator.liu.se>
Subject: Re: [Powertop] [Warning fixes 2/6] Build with -Wno-unused-result for
 now, it seems at least some of these cases are intentional (see ml discussion)
Date: Fri, 24 Aug 2012 19:38:07 +0200
Message-ID: <1345829887.2831.1.camel@sara>
In-Reply-To: 20120824173217.DE8C4DFFDC@linda.rhrk.uni-kl.de
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============1154397476984585619==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, 2012-08-24 at 18:53 +0200, Joerg Mayer wrote:
> Note: Is this this flag supported on all compilers?

Please don't.

If you really mean to ignore the result values then the canonical thing
to do is to cast them to (void)

/MF


--===============1154397476984585619==--

