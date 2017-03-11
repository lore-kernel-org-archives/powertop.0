Content-Type: multipart/mixed; boundary="===============5141434792837546293=="
MIME-Version: 1.0
From: Chris Murphy <lists at colorremedies.com>
Subject: [Powertop] error: possibly undefined macro: AC_PROG_LIBTOOL
Date: Fri, 10 Mar 2017 18:43:07 -0700
Message-ID: <CAJCQCtT-s7zoNrg052ctZfL8BS7_pvBwG3YVuftQOJtN9NKwFA@mail.gmail.com>
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============5141434792837546293==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

I'm getting the following with master branch when using autogen.sh:

[...snip...]

Copying file po/insert-header.sin
Copying file po/quot.sed
Copying file po/remove-potcdate.sin
autoreconf: running: aclocal --install -I m4
aclocal: installing 'm4/pkg.m4' from '/usr/share/aclocal/pkg.m4'
autoreconf: configure.ac: tracing
autoreconf: configure.ac: not using Libtool
autoreconf: running: /usr/bin/autoconf
configure.ac:35: error: possibly undefined macro: AC_PROG_LIBTOOL
      If this token and others are legitimate, please use m4_pattern_allow.
      See the Autoconf documentation.
autoreconf: /usr/bin/autoconf failed with exit status: 1
[chris(a)f25s powertop]$

IF I checkout tag v2.9, HEAD is now at 746abef,

[chris(a)f25s powertop]$ ./autogen.sh
autoreconf: Entering directory `.'
autoreconf: running: autopoint
autoreconf: running: aclocal --install -I m4
autoreconf: configure.ac: tracing
autoreconf: configure.ac: not using Libtool
autoreconf: running: /usr/bin/autoconf
autoreconf: running: /usr/bin/autoheader
autoreconf: running: automake --add-missing --copy --no-force
traceevent/Makefile.am:1: error: Libtool library used but 'LIBTOOL' is unde=
fined
traceevent/Makefile.am:1:   The usual way to define 'LIBTOOL' is to
add 'LT_INIT'
traceevent/Makefile.am:1:   to 'configure.ac' and run 'aclocal' and
'autoconf' again.
traceevent/Makefile.am:1:   If 'LT_INIT' is in 'configure.ac', make sure
traceevent/Makefile.am:1:   its definition is in aclocal's search path.
autoreconf: automake failed with exit status: 1


---
Chris Murphy

--===============5141434792837546293==--

