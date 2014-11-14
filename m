Content-Type: multipart/mixed; boundary="===============8777409740265972177=="
MIME-Version: 1.0
From: Alexandra Yates <alexandra.yates at linux.intel.com>
Subject: Re: [Powertop] [PATCH v2 00/14] pull: various changes,
 mostly build system related
Date: Thu, 13 Nov 2014 20:30:26 -0800
Message-ID: <62192.10.254.178.169.1415939426.squirrel@linux.intel.com>
In-Reply-To: 1415538871-11411-1-git-send-email-sami.kerola@lastminute.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============8777409740265972177==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Sami,


> Hello,
>
> This change set is related to previous submission, that is discussed in
> thread below:
>
> https://lists.01.org/pipermail/powertop/2014-November/001664.html
>
> My assumption is that these changes may not be completely in acceptable
> to be part of upstream just before release.  See the link for details.
>
> Sami Kerola (14):
>   configure: require new enough automake version
>   configure: use autoconf-archive ax_pthread.m4
>   add missing space to --version print out
>   csstoh.sh: check every single return value
>   configure: use AC_USE_SYSTEM_EXTENSIONS to determine features
>   powertop.m4: GCC_FORTIFY_SOURCE_CC copy idea of macro from Archlinux
>     pacman
>   configure: use autoconf-archive ax_cxx_compile_stdcxx_11.m4
>   main: fix incompatible operand type
>   move variables to protected scope
>   make --quiet option to suppress various info messages
>   squeeze all extra bits from size of binary and html report
>   add timestamp to html report
>   fix typo in message
>   add missing include
>
>  .gitignore                           |  39 +++-
>  PowerTop.png                         | Bin 6975 -> 5542 bytes
>  configure.ac                         |  21 ++-
>  m4/ax_cxx_compile_stdcxx_11.m4       | 142 +++++++++++++++
>  m4/ax_pthread.m4                     | 332
> +++++++++++++++++++++++++++++++++++
>  m4/gcc_fortify_source_cc.m4          |  29 +++
>  src/Makefile.am                      |   1 -
>  src/cpu/rapl/rapl_interface.cpp      |   7 +-
>  src/cpu/rapl/rapl_interface.h        |   9 +-
>  src/csstoh.sh                        |  40 +++--
>  src/lib.h                            |   1 +
>  src/main.cpp                         |   8 +-
>  src/report/report-formatter-base.cpp |   2 -
>  src/report/report-formatter-csv.cpp  |   2 -
>  src/report/report-formatter-html.cpp | 248 +++++++++++++-------------
>  src/report/report.cpp                |   5 +-
>  16 files changed, 719 insertions(+), 167 deletions(-)
>  create mode 100644 m4/ax_cxx_compile_stdcxx_11.m4
>  create mode 100644 m4/ax_pthread.m4
>  create mode 100644 m4/gcc_fortify_source_cc.m4
>
> --
> 2.1.3
>
> _______________________________________________
> PowerTop mailing list
> PowerTop(a)lists.01.org
> https://lists.01.org/mailman/listinfo/powertop
>

Patches look good.  Two things:

1- I could not get this patch to apply
"configure: require new enough automake version"
Patch is empty.  Was it split wrong?

2- Please get the latest checkpatch.pl from the linux kernel scripts and
run it over your files before creating the patches.

Thank you,
Alexandra.

--===============8777409740265972177==--

