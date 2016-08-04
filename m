Content-Type: multipart/mixed; boundary="===============2566030175749186001=="
MIME-Version: 1.0
From: Joe Konno <joe.konno at linux.intel.com>
Subject: Re: [Powertop] [PATCH v2 00/10] Housecleaning and Gettext cleanup
Date: Wed, 03 Aug 2016 18:08:35 -0700
Message-ID: <20160803180835.49d2c126@jbkonno-basil.jf.intel.com>
In-Reply-To: 1470272369-218664-1-git-send-email-joe.konno@linux.intel.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============2566030175749186001==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Apologies for not catching the "v2 00/10" gaffe prior to submission. I won't
bombard your inbox with another submission. ^_^

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

Once again, v2 patches 10-19 will likely be squashed into ...
    po: regenerate with new POT and strings

... at commit time. So, once this gets pushed, it will be a 10 patch series
(and not a 19-patch series).

Cheers, hth

--===============2566030175749186001==--

