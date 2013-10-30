Content-Type: multipart/mixed; boundary="===============8939561906310123849=="
MIME-Version: 1.0
From: Alexandra Yates <alexandra.yates at linux.intel.com>
Subject: [Powertop] [PATCH 00/29]Report Redesign
Date: Wed, 30 Oct 2013 14:20:51 -0700
Message-ID: <1383168080-18233-1-git-send-email-alexandra.yates@linux.intel.com>
In-Reply-To: Report Redesign
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============8939561906310123849==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

This patches are to be applied post release 2.5. =


This set of patches include the redesign changes for HTML
and CSV reports.  Additionally, includes removing the suggestion
to use on demand cpu frequency governor.  This feature was removed because =
the
Intel P-States driver is the Intel recommended method for CPU frequency. =


Alexandra Yates (29):
  report-formater-html: add logo
  report: call powertop logo
  html-report: add title and div tags
  report: report maker add title and div
  report-csv: title, div, logo, header
  report-html: summary list and navigation
  report-maker: navigation & summary
  report-csv: Added navigation & summary list
  report-html: Table generation
  report-maker: modular table generation
  report-csv: modular table
  report: Logo and system Information
  report-html-css: html 5 and css for new design
  report-summary: enable html and csv new styles
  report: redesign html menu
  report: Cpu Idle section redesigned html & csv
  report: Fixed html summary & menu colapse styles
  report: CPU Frequency html & csv
  report: redesign System Information csv and html
  report: redesign Device Power Report css & html
  report: Redesign Device Activity css & html
  report: cleanup csv title and unused vars
  report: report tuning with new desig html csv
  report-html: fixed not hidding sections errors
  report: fixed empty SW settings in need of tunning
  report: design batery discharge/system baseline
  report: conditional runs ncurses & cpu html report
  report: logo size & menu compatibility
  tunables: removed on-demand cpu frequency governor

 PowerTop.png                         |  Bin 0 -> 6975 bytes
 src/Makefile.am                      |    1 +
 src/cpu/cpu.cpp                      |  327 ++++++++++++++++++++++++------=
----
 src/devices/device.cpp               |   81 +++++----
 src/devlist.cpp                      |   44 +++--
 src/main.cpp                         |    7 +-
 src/powertop.css                     |  287 +++++++++++++----------------
 src/process/do_process.cpp           |  233 ++++++++++++++----------
 src/report/report-data-html.cpp      |  118 ++++++++++++
 src/report/report-data-html.h        |   69 +++++++
 src/report/report-formatter-csv.cpp  |   92 +++++++++-
 src/report/report-formatter-csv.h    |   15 +-
 src/report/report-formatter-html.cpp |  123 ++++++++++++-
 src/report/report-formatter-html.h   |   16 +-
 src/report/report-formatter.h        |   13 ++
 src/report/report-maker.cpp          |   57 ++++++
 src/report/report-maker.h            |   13 +-
 src/report/report.cpp                |   83 +++++----
 src/tuning/cpufreq.cpp               |  213 ----------------------
 src/tuning/cpufreq.h                 |   50 ------
 src/tuning/tuning.cpp                |  130 ++++++++------
 21 files changed, 1213 insertions(+), 759 deletions(-)
 create mode 100644 PowerTop.png
 create mode 100644 src/report/report-data-html.cpp
 create mode 100644 src/report/report-data-html.h
 delete mode 100644 src/tuning/cpufreq.cpp
 delete mode 100644 src/tuning/cpufreq.h

-- =

1.7.9.5


--===============8939561906310123849==--

