Content-Type: multipart/mixed; boundary="===============7093968224210200789=="
MIME-Version: 1.0
From: Joe Konno <joe.konno at linux.intel.com>
Subject: Re: [Powertop] [PATCH v1 0/4] gettext cleanup series
Date: Wed, 03 Aug 2016 13:33:19 -0700
Message-ID: <20160803133319.12b667d9@jbkonno-basil.jf.intel.com>
In-Reply-To: 20160726193535.27247-1-joe.konno@linux.intel.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============7093968224210200789==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

I'll have to NACK myself for the first 3 patches in this series. Bumping up=
 to
gettext-0.19.8 will likely introduce problems for packagers for
heavily-validated distros-- think Ubuntu LTS, CentOS, or their
commercially-supported peers.

I'll review the 0.18-era gettext documentation and see if there's any
additional cleanup I can do, and then re-submit.

On Tue, 26 Jul 2016 12:35:31 -0700
Joe Konno <joe.konno(a)linux.intel.com> wrote:

> From: Joe Konno <joe.konno(a)intel.com>
> =

> Hey gang,
> =

> I've been getting gettext warnings during the configuration stage for some
> time. This fixes most of them. Review and feedback welcomed, as always.
> =

> In a nutshell, I ran gettextize (from v0.19.8), and touched a few configu=
ration
> files as directed by the gettext documentation. As a result, there was so=
me
> gitignore housecleaning that needed attention.
> =

> No functional side-effects anticipated.
> =

> Joe Konno (4):
>   gettext: bump to 0.19.8
>   Makefile.am: ACLOCAL_AMFLAGS updated
>   .gitignore: ignore a few more m4 macros
>   LINGUAS: add en(a)quot and en(a)boldquot
> =

>  .gitignore        |  2 ++
>  Makefile.am       |  4 ++-
>  configure.ac      |  2 +-
>  m4/ChangeLog      | 11 ++++++++
>  po/ChangeLog      | 11 ++++++++
>  po/LINGUAS        |  2 ++
>  po/Makefile.in.in | 77 +++++++++++++++++++++++++++++++++++++++++--------=
------
>  po/Makevars       | 37 ++++++++++++++++++++++++++
>  8 files changed, 125 insertions(+), 21 deletions(-)
>  create mode 100644 m4/ChangeLog
>  create mode 100644 po/ChangeLog
> =



--===============7093968224210200789==--

