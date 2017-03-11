Content-Type: multipart/mixed; boundary="===============3694865976794033806=="
MIME-Version: 1.0
From: Eugene Syromyatnikov <evgsyr at gmail.com>
Subject: Re: [Powertop] error: possibly undefined macro: AC_PROG_LIBTOOL
Date: Sat, 11 Mar 2017 11:32:02 +0000
Message-ID: <CACGkJdtLGxijzrD=PPQXXAkdHLtRr9dmLgZsQHz0F-RZYGetHA@mail.gmail.com>
In-Reply-To: CAJCQCtT-s7zoNrg052ctZfL8BS7_pvBwG3YVuftQOJtN9NKwFA@mail.gmail.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============3694865976794033806==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Try

# dnf install libtool

On Sat, Mar 11, 2017 at 1:43 AM, Chris Murphy <lists(a)colorremedies.com> w=
rote:
> I'm getting the following with master branch when using autogen.sh:
>
> [...snip...]
>
> Copying file po/insert-header.sin
> Copying file po/quot.sed
> Copying file po/remove-potcdate.sin
> autoreconf: running: aclocal --install -I m4
> aclocal: installing 'm4/pkg.m4' from '/usr/share/aclocal/pkg.m4'
> autoreconf: configure.ac: tracing
> autoreconf: configure.ac: not using Libtool
> autoreconf: running: /usr/bin/autoconf
> configure.ac:35: error: possibly undefined macro: AC_PROG_LIBTOOL
>       If this token and others are legitimate, please use m4_pattern_allo=
w.
>       See the Autoconf documentation.
> autoreconf: /usr/bin/autoconf failed with exit status: 1
> [chris(a)f25s powertop]$
>
> IF I checkout tag v2.9, HEAD is now at 746abef,
>
> [chris(a)f25s powertop]$ ./autogen.sh
> autoreconf: Entering directory `.'
> autoreconf: running: autopoint
> autoreconf: running: aclocal --install -I m4
> autoreconf: configure.ac: tracing
> autoreconf: configure.ac: not using Libtool
> autoreconf: running: /usr/bin/autoconf
> autoreconf: running: /usr/bin/autoheader
> autoreconf: running: automake --add-missing --copy --no-force
> traceevent/Makefile.am:1: error: Libtool library used but 'LIBTOOL' is un=
defined
> traceevent/Makefile.am:1:   The usual way to define 'LIBTOOL' is to
> add 'LT_INIT'
> traceevent/Makefile.am:1:   to 'configure.ac' and run 'aclocal' and
> 'autoconf' again.
> traceevent/Makefile.am:1:   If 'LT_INIT' is in 'configure.ac', make sure
> traceevent/Makefile.am:1:   its definition is in aclocal's search path.
> autoreconf: automake failed with exit status: 1
>
>
> ---
> Chris Murphy
> _______________________________________________
> PowerTop mailing list
> PowerTop(a)lists.01.org
> https://lists.01.org/mailman/listinfo/powertop



-- =

Eugene Syromyatnikov
mailto:evgsyr(a)gmail.com
xmpp:esyr(a)jabber.{ru|org}

--===============3694865976794033806==--

