Content-Type: multipart/mixed; boundary="===============0370637696656363864=="
MIME-Version: 1.0
From: Lekensteyn <lekensteyn at gmail.com>
Subject: Re: [Powertop] compile error
Date: Fri, 18 May 2012 22:12:20 +0200
Message-ID: <28457856.EWR6mSpK1X@penguin>
In-Reply-To: CALRnzVVcCjdbULfw-3w8tXnkLy9TgSOfuOwBbgiOBokGoN9wqA@mail.gmail.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============0370637696656363864==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Friday 18 May 2012 11:49:24 u know gascogne wrote:
> I have pcitutils version 3.19 installed and have verified that libpci-a i=
s =

> present i am on 3.4rc kernel on ubuntu 12.04  =


You need to install libpci-dev. From my debian/control file:

Build-Depends: debhelper (>=3D 8.0.0), libncursesw5-dev,
 libncurses5-dev, libnl-3-dev, libnl-genl-3-dev, pkg-config, libpci-dev,
 zlib1g-dev, autopoint

If you are interested, my debian/rules file is not particularly interesting:
#!/usr/bin/make -f
%:
        dh $@ --parallel

Regards,
Peter

--===============0370637696656363864==--

