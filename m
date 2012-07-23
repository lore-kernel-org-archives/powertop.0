Content-Type: multipart/mixed; boundary="===============4112993796020157462=="
MIME-Version: 1.0
From: Magnus Fromreide <magfr at lysator.liu.se>
Subject: Re: [Powertop] [PATCH] Get rid of ncurses' TRUE and FALSE
Date: Mon, 23 Jul 2012 09:31:33 +0200
Message-ID: <1343028693.3103.4.camel@sara>
In-Reply-To: 500CF009.908@samsung.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============4112993796020157462==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, 2012-07-23 at 10:32 +0400, Igor Zhbanov wrote:
> Hi Chris!
> Thank you for your answer.
> =

> Chris Ferron wrote:
> > On 07/20/2012 12:06 AM, Igor Zhbanov wrote:
> >>
> >> Linaro has made only few commits after forking from mainline.
> >>
> >> They are:
> >>
> >> 1) adding __NR_perf_event_open define
> > Please insure this is fresh code authored by you and detailed if you =

> > submit, and I will be happy to take it.
> Yes, this is just a system call number copied from unistd.h for ARM =

> platform.
> Without it PowerTOP will not know what system call number =

> __NR_perf_event_open has on ARM.

Why can't it take __NR_perf_event_open from the libc headers?
That is, why can't the whole ifdef under /* some people have stale
headers */ go?

Powertop is rather demanding with regards to the environment anyhow and
magic constants are never fun.

/MF


--===============4112993796020157462==--

