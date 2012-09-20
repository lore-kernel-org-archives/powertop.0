Content-Type: multipart/mixed; boundary="===============2985193711271853046=="
MIME-Version: 1.0
From: Namhyung Kim <namhyung at gmail.com>
Subject: Re: [Powertop] [PATCH] report: Try /etc/lsb-release for OS information
Date: Fri, 21 Sep 2012 00:07:27 +0900
Message-ID: <1348153647.1510.9.camel@leonhard>
In-Reply-To: 505B2FDF.3000804@linux.intel.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============2985193711271853046==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

2012-09-20 (=EB=AA=A9), 17:01 +0200, Arjan van de Ven:
> On 9/20/2012 4:58 PM, Namhyung Kim wrote:
> > Ubuntu doesn't provide /etc/{system,redhat,os}-release but
> > /etc/lsb-release file.  Since it's present on any LSB (Linux Standard
> > Base) compliant distributions, it'd better to try to read it.
> =

> it's obsolete though
> everyone has moved (or is moving) to /etc/os-release, which is a freedesk=
top standard
> and has pretty decent semantics...

Didn't know that.  But at least my desktop box doesn't have the
os-release yet.  Do you mind if we try the lsb-release file as a
fallback (as does in this patch)?

Thanks,
Namhyung




--===============2985193711271853046==--

