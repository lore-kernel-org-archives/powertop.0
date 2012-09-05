Content-Type: multipart/mixed; boundary="===============1673651462852662879=="
MIME-Version: 1.0
From: Viresh Kumar <viresh.linux at gmail.com>
Subject: Re: [Powertop] [PATCH] Fix timer and work perf events timestamp
 tracing
Date: Wed, 05 Sep 2012 16:58:50 +0530
Message-ID: <CAOh2x=m_KLU9rho-DvT5sz0MW5ZRswxTuTQt2=+i4brd1OyjjA@mail.gmail.com>
In-Reply-To: 1346840555-18457-1-git-send-email-rajagopal.venkat@linaro.org
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============1673651462852662879==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 5, 2012 at 3:52 PM, Rajagopal Venkat
<rajagopal.venkat(a)linaro.org> wrote:
> Incorrect timer and work perf events timestamp tracing is one
> of the reason for reporting usage over 100%. This patch will
> resolve the issue by
> - rejecting the events for which entry timestamp is not recorded.
> Currently these events exit timestamp itself is considered as
> usage period resulting in over 100% usage.
> - clearing event timestamps from global map at the end of each
> measurement to avoid collision with earlier recorded timestamps.

Tried it few times on Panda Board.

Tested-by: Viresh Kumar <viresh.kumar(a)linaro.org>

--===============1673651462852662879==--

