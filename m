Content-Type: multipart/mixed; boundary="===============4204181376596169051=="
MIME-Version: 1.0
From: Alexandra Yates <alexandra.yates at linux.intel.com>
Subject: Re: [Powertop] [powertop] Indicate that the <tab> key is to use to
 navigate in the application (#19)
Date: Thu, 26 Feb 2015 10:35:47 -0800
Message-ID: <55846.10.24.2.110.1424975747.squirrel@linux.intel.com>
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============4204181376596169051==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Pierre,


> This makes is explicit how to leave or navigate in the program from the
> front
> page. It changes one string for the translators.
>
> Fixes https://bugzilla.redhat.com/1191112
> You can view, comment on, or merge this pull request online at:
>
>   https://github.com/fenrus75/powertop/pull/19
>
> -- Commit Summary --
>
>   * Indicate that the <tab> key is to use to navigate in the application
>
> -- File Changes --
>
>     M src/display.cpp (2)
>
> -- Patch Links --
>
> https://github.com/fenrus75/powertop/pull/19.patch
> https://github.com/fenrus75/powertop/pull/19.diff
>
> ---
> Reply to this email directly or view it on GitHub:
> https://github.com/fenrus75/powertop/pull/19
>


Your patches add compilation Errors to PowerTOP.

 CXX      powertop-display.o
display.cpp: In function =C2=91void show_tab(unsigned int)=C2=92:
display.cpp:132:44: error: expected =C2=91;=C2=92 before =C2=91)=C2=92 token
                   _("Exit"), _("Navigate")));
                                            ^
make[3]: *** [powertop-display.o] Error 1
make[3]: Leaving directory `/home/magt/git/powertop/src'
make[2]: *** [all] Error 2
make[2]: Leaving directory `/home/magt/git/powertop/src'
make[1]: *** [all-recursive] Error 1
make[1]: Leaving directory `/home/magt/git/powertop'
make: *** [all] Error 2


Also please send your patches directly to the mailing list.  This gives
the list the ability to review your contributions.

Thank you,
Alexandra.

--===============4204181376596169051==--

