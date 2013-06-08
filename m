Content-Type: multipart/mixed; boundary="===============6707962140098579506=="
MIME-Version: 1.0
From: Sergey Senozhatsky <sergey.senozhatsky at gmail.com>
Subject: Re: [Powertop] Outdated autotools helper files
Date: Sat, 08 Jun 2013 17:27:30 +0300
Message-ID: <20130608142730.GA9423@swordfish.datadirectnet.com>
In-Reply-To: 20130608161752.3c496f62@ilfaris
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============6707962140098579506==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On (06/08/13 16:17), Julian Wollrath wrote:
> Hello,
> =

> in the 2.3 release you are using config.guess and config.sub files
> older than April of 2012. This means, that powertop will probably not
> build correctly on ARM64. So please consider switching to a newer
> autotools version for your next release. Thanks.
> =


these files are local to your host. ./autogen.sh rewrites them.

configure.ac:15: installing './config.guess'
configure.ac:15: installing './config.sub'

good point, we should not ship them in tar.gz.


	-ss

--===============6707962140098579506==--

