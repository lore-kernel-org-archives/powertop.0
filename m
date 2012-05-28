Content-Type: multipart/mixed; boundary="===============8407687981627050835=="
MIME-Version: 1.0
From: Kok, Auke-jan H <auke-jan.h.kok at intel.com>
Subject: Re: [Powertop] autoconf madness, AGAIN
Date: Mon, 28 May 2012 17:03:42 +0000
Message-ID: <CABsxX9+doHqLvq15LHB5vNGAVdX9yhh014VPEaCOHADiwwSvrw@mail.gmail.com>
In-Reply-To: 20120528165554.GA22853@rhlx01.hs-esslingen.de
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============8407687981627050835==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, May 28, 2012 at 4:55 PM, Andreas Mohr <andi(a)lisas.de> wrote:
> IMHO that means that powertop's autoconf version requirements
> are too aggressive and should be fixed. ESPECIALLY since even the newest
> autoconf release is only one version number newer than this requirement.
> I could try to work on that if this is
> "something that is deemed worthy of fixing".

Andreas,

all we did was start with `autoscan` and never looked at the version field
from that on. Have you tried just modifying the configure.ac version
requirement and running with e.g. 2.64?

Auke

--===============8407687981627050835==--

