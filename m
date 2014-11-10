Content-Type: multipart/mixed; boundary="===============7134390033654213200=="
MIME-Version: 1.0
From: Magnus Fromreide <magfr at lysator.liu.se>
Subject: Re: [Powertop] [PATCH v2 07/14] configure: use autoconf-archive
 ax_cxx_compile_stdcxx_11.m4
Date: Mon, 10 Nov 2014 22:53:40 +0100
Message-ID: <20141110215340.GA24890@sara.bahnhof.se>
In-Reply-To: 1415538871-11411-8-git-send-email-sami.kerola@lastminute.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============7134390033654213200==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 09, 2014 at 01:14:24PM +0000, Sami Kerola wrote:
> From: Sami Kerola <kerolasa(a)iki.fi>
> =

> Ensure the powertop is compiled C++11 compliant compiler.  That allows
> project contributors to use features from the latest standard without
> hesitation are they allowed in this project.  The idea is to grant
> greater liberties to upstream in cost of a dependency to downstream.

If this is the point, should we go for C++14?
The latest standard part is also obviously wrong :^)

I favour this patch.

/MF

--===============7134390033654213200==--

