Content-Type: multipart/mixed; boundary="===============8645631740660447639=="
MIME-Version: 1.0
From: Alexandra Yates <alexandra.yates at linux.intel.com>
Subject: Re: [Powertop] [Announce] PowerTOP v2.6-rc1
Date: Fri, 25 Apr 2014 16:52:25 -0700
Message-ID: <56179.10.254.3.215.1398469945.squirrel@linux.intel.com>
In-Reply-To: AC81B6AA7676DD448250A85A459C1F412F13C074@IRSMSX102.ger.corp.intel.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============8645631740660447639==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

I'm holding up release for the time being, there are a couple of bugs that
need to be workout before release.

Thank you,
Alexandra.

> Hello,
>
>
>
> Here are results of PowerTop 2.6 rc1 validation.
>
>
>
> Note:
>
> Results seem bad but most of reported bugs deal with cosmetic.
>
> The most serious problem appears when trying to reach the deeper state and
> only stats for Core C7 state are reported.
>
>
>
> Results:
> 44
>
> Pass
>
> 13
>
> Fail
>
> 1
>
> Warning
>
> 7
>
> Blocked
>
> 0
>
> Not run
>
> 65
>
> Total
>
> 100.0%
>
> Run rate
>
> 67.7%
>
> Pass
>
> 20.0%
>
> Fail
>
> 1.5%
>
> Warning
>
> 10.8%
>
> Blocked
>
> 0.0%
>
> Not run
>
>
>
>
> Setup:
>
> PowerTop 2.6: 8f56e9f12f66e13f602eb436d9c53614d6816253 from
> https://github.com/fenrus75/powertop.git
>
> Linux distribution: Ubuntu 13.10 64 bits
>
> Kernel 3.14.0 from
> git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
>
>
>
> Bugs:
> Duration of measurement is not indicated in report
>
> Several warnings when compiling PowerTop
>
> System out of order when enabling SATA link power management for hosts
>
> PowerTop must be launched twice to see correct AHCI ALPM Residency
> Statistics
>
> PowerTop logo is missing in html report when created outside source folder
>
> "Not Applicable" can be displayed in the product name
>
> CSV report contains an error 510
>
> Some cells are not in the appropriate column when device name contains a
> coma
>
> Section "Process Device Activity" is not well aligned
>
> W3C validator "Markup Validation Service" returns one error
>
> W3C validator "CSS Validation Service" returns one error and five warnings
>
> Wrong values of Package and Cores residency when trying to reach the
> deeper state
>
> Only Core C7 state stats are reported
>
> Problems when changing language
>
> Need to clarify which Package C states are reported by PowerTop on
> Baytrail
>
>
> ---------------------------------------------------------------------
> Intel Corporation SAS (French simplified joint stock company)
> Registered headquarters: "Les Montalets"- 2, rue de Paris,
> 92196 Meudon Cedex, France
> Registration Number:  302 456 199 R.C.S. NANTERRE
> Capital: 4,572,000 Euros
>
> This e-mail and any attachments may contain confidential material for
> the sole use of the intended recipient(s). Any review or distribution
> by others is strictly prohibited. If you are not the intended
> recipient, please contact the sender and delete all copies.
> _______________________________________________
> PowerTop mailing list
> PowerTop(a)lists.01.org
> https://lists.01.org/mailman/listinfo/powertop
>


Thank you,
Alexandra.

--===============8645631740660447639==--

