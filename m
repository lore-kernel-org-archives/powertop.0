Content-Type: multipart/mixed; boundary="===============5905711240040852050=="
MIME-Version: 1.0
From: Joe Konno <joe.konno at linux.intel.com>
Subject: [Powertop] Gentoo: v2.6.1 breaks packaging traditions
Date: Fri, 30 May 2014 14:57:04 -0700
Message-ID: <1401487024.3006.85.camel@jbkonno-mobl1>
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============5905711240040852050==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hey gang,

In hacking together a package (ebuild) for Gentoo, two issues
complicated what should otherwise have been a trivial update.

1) There are two release tarballs for the version. The first of these
was pointed to by default when I made my initial pass-- assumption was
that the "powertop-2.6.1.tar.gz" would be hosted on the server. I was
right. However, that tarball resulted in a broken build.

https://01.org/sites/default/files/downloads/powertop/powertop-2.6.1.tar.gz

https://01.org/sites/default/files/downloads/powertop/powertop-2.6.1.tar_0.=
gz

2) Further, the second tarball URL (found on 01.org mousing over links)
ends in "tar_0.gz", which breaks with filename convention and also
breaks Gentoo's out-of-the-box 'unpack' packaging function.

Are there any plans to remedy this?

Cheers and thanks


--===============5905711240040852050==--

