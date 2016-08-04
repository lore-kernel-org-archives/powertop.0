Content-Type: multipart/mixed; boundary="===============8751851575856062411=="
MIME-Version: 1.0
From: Joe Konno <joe.konno at linux.intel.com>
Subject: Re: [Powertop] [PATCH v2 00/10] Housecleaning and Gettext cleanup
Date: Thu, 04 Aug 2016 15:01:30 -0700
Message-ID: <20160804150130.4b42e787@jbkonno-basil.jf.intel.com>
In-Reply-To: 1470272369-218664-1-git-send-email-joe.konno@linux.intel.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============8751851575856062411==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed,  3 Aug 2016 17:59:10 -0700
Joe Konno <joe.konno(a)linux.intel.com> wrote:

> Joe Konno (10):
>   configure.ac: bump version to 2.9-pre
>   main.cpp: append __TIME__ to --version output
>   Makefile.am: add --install to ACLOCAL_AMFLAGS
>   gettext: run gettextize-0.18.2
>   .gitignore: ignnore m4/pkg.m4
>   Makevars: align more closely to generated .template
>   scripts: add regenerate-potfiles-in script
>   POTFILES.in: refresh files with strings
>   powertop.pot: xgettext refresh, attribution fix
>   po: regenerate with new POT and strings

Second patch was removed from series. As promised, v2 patches 10-19 were
squashed into one, for a total of 9 patches pushed (listed git log --reverse
order):

  7b35acae25e3 configure.ac: bump version to 2.9-pre
  fadd7a020c05 Makefile.am: add --install to ACLOCAL_AMFLAGS
  c0bb3d79f3e4 gettext: run gettextize-0.18.2
  f791afba18ec .gitignore: ignnore m4/pkg.m4
  6d56120e04f2 Makevars: align more closely to generated .template
  49fbc68887ea scripts: add regenerate-potfiles-in script
  8d89b588d977 POTFILES.in: refresh files with strings
  de4b41828aac powertop.pot: xgettext refresh, attribution fix
  1bfd95884978 po: regenerate with new POT and strings

Cheers

--===============8751851575856062411==--

