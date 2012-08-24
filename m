Content-Type: multipart/mixed; boundary="===============3357047098080219411=="
MIME-Version: 1.0
From: Chris Ferron <chris.e.ferron at linux.intel.com>
Subject: Re: [Powertop] [Warning fixes 2/6] Build with -Wno-unused-result for
 now, it seems at least some of these cases are intentional (see ml discussion)
Date: Fri, 24 Aug 2012 10:54:17 -0700
Message-ID: <5037BFC9.3080305@linux.intel.com>
In-Reply-To: 1345829887.2831.1.camel@sara
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============3357047098080219411==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 08/24/2012 10:38 AM, Magnus Fromreide wrote:
> On Fri, 2012-08-24 at 18:53 +0200, Joerg Mayer wrote:
>> Note: Is this this flag supported on all compilers?
> Please don't.
>
> If you really mean to ignore the result values then the canonical thing
> to do is to cast them to (void)
Agreed. Also really don't want this as some of the results that are =

being ignored should really be fixed. Meaning wrapped in error handling.
>
> /MF
>
> _______________________________________________
> PowerTop mailing list
> PowerTop(a)lists.01.org
> https://lists.01.org/mailman/listinfo/powertop


--===============3357047098080219411==--

