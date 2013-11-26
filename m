Content-Type: multipart/mixed; boundary="===============2349924906750537375=="
MIME-Version: 1.0
From: Sergey Senozhatsky <sergey.senozhatsky at gmail.com>
Subject: Re: [Powertop] [PATCH v3 00/31] Report Redesign
Date: Tue, 26 Nov 2013 22:34:33 +0300
Message-ID: <20131126193432.GC2329@swordfish.minsk.epam.com>
In-Reply-To: 1384806442-20294-1-git-send-email-alexandra.yates@linux.intel.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============2349924906750537375==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On (11/18/13 12:26), Alexandra Yates wrote:
> This patches are to be applied post release 2.5.
> =

> This set of patches include the redesign changes for HTML and CSV reports=
 and
> cleans up unused reporting functions.  Additionally, removes the suggesti=
on
> to use on demand CPU frequency governor.  This feature was removed because
> the Intel P-States driver is the Intel recommended method for CPU frequen=
cy.
> =

> Igor Zhbanov reported that the localization macro __(=E2=80=A6)  was left=
 out from
> previous version.  These patches changed to add the localization macro to
> all report components.

Hello Alexandra,

thanks for your patches. I'll take a look in a week or two [sorry to
tell that, really don't have enough time at the moment].

and thanks to Igor Zhbanov for review.

thanks,
	-ss

> Alexandra Yates (31):
>   report-formater-html: add logo
>   report: call powertop logo
>   html-report: add title and div tags
>   report: report maker add title and div
>   report-csv: title, div, logo, header
>   report-html: summary list and navigation
>   report-maker: navigation & summary
>   report-csv: Added navigation & summary list
>   report-html: Table generation
>   report-maker: modular table generation
>   report-csv: modular table
>   report: Logo and system Information
>   report-html-css: html 5 and css for new design
>   report-summary: enable html and csv new styles
>   report: redesign html menu
>   report: CPU Idle section redesigned html & csv
>   report: Fixed html summary & menu colapse styles
>   report: CPU Frequency html & csv
>   report: redesign Software Information csv and html
>   report: redesign Device Power Report csv & html
>   report: Redesign Device Activity csv & html report
>   report: cleanup csv title and unused vars
>   report: report tuning with new desig html & csv
>   report-html: fixed not hidding sections errors
>   report: fixed empty SW settings in need of tunning
>   report: design batery discharge/system baseline
>   report: conditional runs ncurses & cpu html report
>   report: logo size & menu compatibility
>   tunables: removed on-demand cpu frequency governor
>   report-cleanup: removed old table, row, & cell.
>   report-cleanup: removed html & csv old methods
> =

>  PowerTop.png                         |  Bin 0 -> 6975 bytes
>  src/Makefile.am                      |    5 +-
>  src/cpu/cpu.cpp                      |  327 ++++++++++++++++++--------
>  src/devices/device.cpp               |   81 ++++---
>  src/devlist.cpp                      |   44 ++--
>  src/main.cpp                         |    7 +-
>  src/powertop.css                     |  287 ++++++++++-------------
>  src/process/do_process.cpp           |  233 +++++++++++--------
>  src/report/report-data-html.cpp      |  118 ++++++++++
>  src/report/report-data-html.h        |   69 ++++++
>  src/report/report-formatter-csv.cpp  |  189 ++++++---------
>  src/report/report-formatter-csv.h    |   42 ++--
>  src/report/report-formatter-html.cpp |  417 +++++++++-------------------=
------
>  src/report/report-formatter-html.h   |   71 ++----
>  src/report/report-formatter.h        |   32 +--
>  src/report/report-maker.cpp          |  180 ++-------------
>  src/report/report-maker.h            |  114 ++--------
>  src/report/report.cpp                |   83 ++++---
>  src/tuning/cpufreq.cpp               |  213 -----------------
>  src/tuning/cpufreq.h                 |   50 ----
>  src/tuning/tuning.cpp                |  131 ++++++-----
>  21 files changed, 1142 insertions(+), 1551 deletions(-)
>  create mode 100644 PowerTop.png
>  create mode 100644 src/report/report-data-html.cpp
>  create mode 100644 src/report/report-data-html.h
>  delete mode 100644 src/tuning/cpufreq.cpp
>  delete mode 100644 src/tuning/cpufreq.h
> =

> -- =

> 1.7.9.5
> =

> _______________________________________________
> PowerTop mailing list
> PowerTop(a)lists.01.org
> https://lists.01.org/mailman/listinfo/powertop

--===============2349924906750537375==--

