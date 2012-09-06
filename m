Content-Type: multipart/mixed; boundary="===============7751846765658189947=="
MIME-Version: 1.0
From: Arjan van de Ven <arjan at linux.intel.com>
Subject: Re: [Powertop] [PATCH] Fix timer and work perf events timestamp
 tracing
Date: Thu, 06 Sep 2012 06:51:36 -0700
Message-ID: <5048AA68.6000509@linux.intel.com>
In-Reply-To: CA+Z25wX6CkgLbKwKw6yei2i=R1AawdkEY0UWgjWDwuv9BLu=oQ@mail.gmail.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============7751846765658189947==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 9/6/2012 6:42 AM, Rajagopal Venkat wrote:
> (305177)	      (4380506988525)		(4380506988525)
> (4380507324219)       (4380507019042)		(0)    <<<<<<<
> (4380507354736)       (4380596923827)		(4380596893310)
> (4380507415771)       (4380606964111)		(4380606903076)
> =

> cpu usage from total_cpu_time() - (425033.990889%)
> -------------------------------------------------------------------------=
-----
> =

> As mentioned in my earlier comments, next patch will be submitted
> to handle these events(for which start time is not recorded) instead
> of ignoring them.
> =


now THIS explains a lot, and makes the fix (the one in the other mail you j=
ust sent) make a lot more sense
than the things from earlier ;-)

thanks for chasing this down!



--===============7751846765658189947==--

