Content-Type: multipart/mixed; boundary="===============2442270196787820287=="
MIME-Version: 1.0
From: Arjan van de Ven <arjan at linux.intel.com>
Subject: Re: [Powertop] [PATCH] report: Try /etc/lsb-release for OS information
Date: Thu, 20 Sep 2012 17:01:51 +0200
Message-ID: <505B2FDF.3000804@linux.intel.com>
In-Reply-To: 1348153109-2991-1-git-send-email-namhyung@gmail.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============2442270196787820287==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 9/20/2012 4:58 PM, Namhyung Kim wrote:
> Ubuntu doesn't provide /etc/{system,redhat,os}-release but
> /etc/lsb-release file.  Since it's present on any LSB (Linux Standard
> Base) compliant distributions, it'd better to try to read it.

it's obsolete though
everyone has moved (or is moving) to /etc/os-release, which is a freedeskto=
p standard
and has pretty decent semantics...



--===============2442270196787820287==--

