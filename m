Content-Type: multipart/mixed; boundary="===============8052949494440864286=="
MIME-Version: 1.0
From: Alexandra Yates <alexandra.yates at linux.intel.com>
Subject: Re: [Powertop] [PATCH 00/14] pull: various changes,
 mostly build system related
Date: Fri, 31 Oct 2014 16:07:49 -0700
Message-ID: <53905.10.24.5.246.1414796869.squirrel@linux.intel.com>
In-Reply-To: 1414258441-30099-1-git-send-email-kerolasa@iki.fi
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============8052949494440864286==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Sami,

> Hello,
>
> Here is my next random collection of various small changes here and there
> in source tree.  Many of the changes has relation to build system, and
> the remainign one are reactions to compiler complaints found after build
> system teaks.  I hope these changes are reviewed before next release, and
> in best case they might even be part of it.
>
>
> ----------------------------------------------------------------
> The following changes since commit
> 41c54e81145a0f35c2bd576a0ee57c3844dee710:
>
>   allow none-ncurses messaging with ui_notify_user() (2014-09-29 11:34:25
> -0700)
>
> are available in the git repository at:
>
>   git://github.com/kerolasa/powertop.git various
>
> for you to fetch changes up to e6663e420abb526523fa1a7fda42661801480155:
>
>   add missing include (2014-10-25 11:16:36 +0100)
> ----------------------------------------------------------------
> Sami Kerola (14):
>   configure: require the least automake version 1.11.1
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
> 2.1.2
>
> _______________________________________________
> PowerTop mailing list
> PowerTop(a)lists.01.org
> https://lists.01.org/mailman/listinfo/powertop
>


Keep in mind that for PowerTOP patches there is a turnaround cycle of
about two weeks give and take.  This gives the maintainer and the
community time to check your work.

Here is my first pass for your patches:

3, 4, 5, 6, 8, 10, 11, 12, 13, 14: At glance look good. They need testing.

1: Require at least automake 1.12.2 to avoid exploitable issues with
earlier versions.

9: Looks good. However, what is the object of moving
measurment_interval(def_sampling_interval) to be after first_cpu(cpu)?

2: Please explain what is the difference from what we have to what you
propose?

7: This one makes no sense as-is. Please update the commit message
explaining why the patch is necessary. As far as I can tell from the
PowerTOP source code, it doesn't use C++11, so I don't understand why it
would be necessary to fail.

Thank you,
Alexandra.

--===============8052949494440864286==--

