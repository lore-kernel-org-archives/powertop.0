Content-Type: multipart/mixed; boundary="===============3112635495737634746=="
MIME-Version: 1.0
From: Namhyung Kim <namhyung at gmail.com>
Subject: Re: [Powertop] [PATCH 1/2] perf_bundle: Check memory allocation
 failure
Date: Tue, 18 Sep 2012 23:33:44 +0900
Message-ID: <1347978824.1771.4.camel@leonhard>
In-Reply-To: 50588442.7040404@linux.intel.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============3112635495737634746==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

2012-09-18 (=ED=99=94), 07:25 -0700, Arjan van de Ven:
> On 9/18/2012 7:21 AM, Namhyung Kim wrote:
> > Check return value of malloc/strdup not to make NULL dereferences.
> =

> I don't mind these patches; they are clean code
> =

> however, one of the core userspace developers at work basically said "we =
don't check for malloc NULL in userspace;
> if that ever happens the system is so screwed up anyway that you just can=
not continue".

Thanks for the quick reply. :)

Basically I agree with you.  But even in that case it'd be better
letting a user know about current situation somehow rather than just
segfault.  Maybe by replacing them to xmalloc or so?

Thanks,
Namhyung



--===============3112635495737634746==--

