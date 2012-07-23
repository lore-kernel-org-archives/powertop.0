Content-Type: multipart/mixed; boundary="===============6841489056667455550=="
MIME-Version: 1.0
From: Arjan van de Ven <arjan at linux.intel.com>
Subject: Re: [Powertop] [PATCH] Get rid of ncurses' TRUE and FALSE
Date: Mon, 23 Jul 2012 06:23:57 -0700
Message-ID: <500D506D.8060204@linux.intel.com>
In-Reply-To: 1343028693.3103.4.camel@sara
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============6841489056667455550==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 7/23/2012 12:31 AM, Magnus Fromreide wrote:

>> Without it PowerTOP will not know what system call number =

>> __NR_perf_event_open has on ARM.
> =

> Why can't it take __NR_perf_event_open from the libc headers?
> That is, why can't the whole ifdef under /* some people have stale
> headers */ go?
> =

> Powertop is rather demanding with regards to the environment anyhow and
> magic constants are never fun.

100% agreed; I briefly talked to Chris on Friday based on this patch and
that is the conclusion we came to as well.



--===============6841489056667455550==--

