Content-Type: multipart/mixed; boundary="===============7388783128151424779=="
MIME-Version: 1.0
From: Igor Zhbanov <i.zhbanov at samsung.com>
Subject: Re: [Powertop] [RFC][PATCH 1/2] Adding report generator facility
Date: Tue, 09 Oct 2012 21:02:28 +0400
Message-ID: <507458A4.8090403@samsung.com>
In-Reply-To: 20121008165743.GA21958@swordfish.datadirect.datadirectnet.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============7388783128151424779==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Sergey,

Sergey Senozhatsky wrote:

> Hello,
>
> - can we please avoid code duplication? for example, both html and csv
> reporters contain identical implementations of
>
> clear_result()/get_result()/add*() and friends.

Done. Please check v2 patchset (after list moderator will approve those big=
 letters).

> - I think null formatter could be a basic class with default
> implementation (null) of virtual functions, rather than separate
> implementation of basic formatter interface (abstract class).

The null formatter is needed only because the code that uses the report
facility is called even when the reports are not needed.

The function one_measurement() (which calls to other reporting functions) f=
irst
called from make_report() with 1 second parameter. And that report will be =
thrown
away. In the comments there is a note that this is to warm-up the system. I=
 don't know
whether it is really needed.

After that make_report() produces real reports inside the loop by calling
the one_measurement() function.

Also one_measurement() is called from calibration code, and that code doesn=
't need
any reports too.

So we need to decide when to call reporting functions from one_measurement(=
).
We could check the report_type there. But what type of report maker should =
we create
when we don't need the reports? HTML? CSV? Sounds no good.

Providing a flag inside the report maker whether we need to produce the rep=
orts
and check it upon entry to every method is no good too.

We could create report maker and provide it to the needed functions by poin=
ter.
But what to provide when we need not report? NULL? Then we have to check fo=
r it
in every function. Lot's of unnecessary checks.

We could combine two mentioned approaches -- create report maker only when
we actually need to produce the report, and call report creating functions =
from
one_measurement() with non-NULL pointer to report (and pass it down to all
other functions that need it).

Then we could get rid of null report-maker. But now it is easier way to dea=
l with
such usage of report facility.

What you think?

It is very hard to refactor this code.

-- =

Best regards,
Igor Zhbanov,
Expert Software Engineer,
phone: +7 (495) 797 25 00 ext 3806
e-mail: i.zhbanov(a)samsung.com

ASWG, Moscow R&D center, Samsung Electronics
12 Dvintsev street, building 1
127018, Moscow, Russian Federation


--===============7388783128151424779==--

