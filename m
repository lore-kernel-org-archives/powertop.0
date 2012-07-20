Content-Type: multipart/mixed; boundary="===============1785699460969818875=="
MIME-Version: 1.0
From: Chris Ferron <chris.e.ferron at linux.intel.com>
Subject: Re: [Powertop] [PATCH] Relaxed autoconf version restriction for
 scratchbox build
Date: Fri, 20 Jul 2012 10:27:34 -0700
Message-ID: <50099506.4010601@linux.intel.com>
In-Reply-To: 1342767160-22667-1-git-send-email-i.zhbanov@samsung.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============1785699460969818875==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 07/19/2012 11:52 PM, Igor Zhbanov wrote:
> Relaxed autoconf version restriction for scratchbox build.
> PowerTOP successfully builds with 2.67 version of Autotools.
> ---
>   configure.ac |    2 +-
>   1 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/configure.ac b/configure.ac
> index 4b3d027..e1e670a 100644
> --- a/configure.ac
> +++ b/configure.ac
> @@ -1,7 +1,7 @@
>   #                                               -*- Autoconf -*-
>   # Process this file with autoconf to produce a configure script.
>   =

> -AC_PREREQ([2.68])
> +AC_PREREQ([2.67])
>   AC_INIT([powertop], [2.0], [powertop(a)lists.01.org])
>   AM_INIT_AUTOMAKE([-Wall foreign ])
>   AC_LANG([C++])
What is the problem? Why do you need to do this? What is the benefit to =

the PowerTOP project?


--===============1785699460969818875==--

