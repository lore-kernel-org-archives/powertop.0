Content-Type: multipart/mixed; boundary="===============4917616132885714154=="
MIME-Version: 1.0
From: Lekensteyn <lekensteyn at gmail.com>
Subject: Re: [Powertop] compile error
Date: Sat, 19 May 2012 10:40:57 +0200
Message-ID: <32624773.lg1b7yUjrF@penguin>
In-Reply-To: CALRnzVXVymDy_zPvL+gS1t27oNYeeXxcWN-9eH4Adb+RVjzPGA@mail.gmail.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============4917616132885714154==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Friday 18 May 2012 19:45:04 u know gascogne wrote:
> your version of libnl broke the build earlier for me i reverted back to
> lib-nl and am still exitng at the same point all other dependances are
> installed
Have you uninstalled the other libnl libraries and development headers?

$ dpkg -l libnl\* | awk '/^ii/{print $2}'
libnl-3-200
libnl-3-dev
libnl-genl-3-200
libnl-genl-3-dev
libnl-route-3-200

I have no issues with building powertop from the 2.0 tarball / git on Kubun=
tu =

12.04 64-bit.

Regards,
Peter

--===============4917616132885714154==--

