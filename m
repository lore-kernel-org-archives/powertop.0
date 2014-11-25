Content-Type: multipart/mixed; boundary="===============1066000524556682965=="
MIME-Version: 1.0
From: Alexandra Yates <alexandra.yates at linux.intel.com>
Subject: Re: [Powertop] [PATCH v3 00/15] pull: various changes,
 mostly build system related
Date: Tue, 25 Nov 2014 15:40:12 -0800
Message-ID: <56219.10.24.1.128.1416958812.squirrel@linux.intel.com>
In-Reply-To: 1416950188-16616-1-git-send-email-kerolasa@iki.fi
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============1066000524556682965==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


> This times includes a fix to white space issue reported by checkpatch.pl
>
> ERROR: trailing whitespace
>     14 #139: FILE: src/csstoh.sh:37:
>     15 +const char css[] =3D $
>
> And the conflict after version number update in configure.ac is removed,
> plus one new patch that makes textual correction to a information
> message.
>
>
> Sami Kerola (15):
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
>   textual: add new line to a message
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
>  src/parameters/parameters.cpp        |   2 +-
>  src/report/report-formatter-base.cpp |   2 -
>  src/report/report-formatter-csv.cpp  |   2 -
>  src/report/report-formatter-html.cpp | 248 +++++++++++++-------------
>  src/report/report.cpp                |   5 +-
>  17 files changed, 720 insertions(+), 168 deletions(-)
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

Sami,

Thank you again for submitting your patches.

They were added to up stream today!

Thank you,
Alexandra.

--===============1066000524556682965==--

