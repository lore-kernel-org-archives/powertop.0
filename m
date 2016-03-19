Content-Type: multipart/mixed; boundary="===============7618280540960573358=="
MIME-Version: 1.0
From: Sami Kerola <kerolasa at iki.fi>
Subject: Re: [Powertop] powertop hci tools bug report
Date: Sat, 19 Mar 2016 10:01:04 +0000
Message-ID: <CAG27Bk3wNQ3ZA-XkZNDFcBCefK3MSijygZD=0XM1ULZhi+3+RA@mail.gmail.com>
In-Reply-To: CA+z5DszTAPK48juHex0kxgMcjQu4upfKO9yKFK1oU7T0hmR2=Q@mail.gmail.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============7618280540960573358==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 17 March 2016 at 23:42, Blair Bethwaite <blair.bethwaite(a)gmail.com> wr=
ote:
> Any particular reason there is no issue tracker for powertop on the
> official site or github?
>
> Anyhoo, bug report here from an Ubuntu Wily machine. Powertop is
> currently hard-coding the location of hciconfig and friends in
> src/tuning/bluetooth.cpp to /usr/sbin/hciconfig. On my platform
> hciconfig lives in /bin.
>
> This should probably be discovered via configure. Only other
> questionable hard-coding seems to be for xset.

Perhaps hardcoding should be dropped in favour of execl(3) or
execv(3), with PATH being _PATH_STDPATH definition  from paths.h
include file. That ought to work much better than hard coding, but
avoiding to trust user environment too much as powertop can, and
probably is, in some installations setuid binary.

-- =

Sami Kerola
http://www.iki.fi/kerolasa/

--===============7618280540960573358==--

