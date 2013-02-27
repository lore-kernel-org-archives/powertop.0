Content-Type: multipart/mixed; boundary="===============7503583679203996442=="
MIME-Version: 1.0
From: Sergey Senozhatsky <sergey.senozhatsky at gmail.com>
Subject: Re: [Powertop] Version info in lib.h file
Date: Wed, 27 Feb 2013 14:14:06 +0300
Message-ID: <20130227111406.GA2352@swordfish.minsk.epam.com>
In-Reply-To: CABa1t5xkZRFG4W6FOiQTXMbaWwciXCqzo8fVoqknMiUjD48VVA@mail.gmail.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============7503583679203996442==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On (02/27/13 16:22), Ganapati Bhat wrote:
>    Hello all,
>    I was just going through the code of the release 2.2 of powertop and in
>    the lib.h file in src/ directory POWERTOP_VERSION is defined as v2.1 a=
nd
>    not v2.2. Why is it so? Has it been modified in some=EF=BF=BDsubsequen=
t=EF=BF=BDpatches?
>    Thanks and Regards,
>    Ganapati Bhat

fixed by

	commit 14fea0b879242a7171bbac56bfa3c8da4d93c56f
	Author: Namhyung Kim
	Date:   Sun Nov 18 00:42:47 2012 +0900

	    Use PACKAGE_VERSION for POWERTOP_VERSION
	[..]


	-ss

--===============7503583679203996442==--

