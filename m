Content-Type: multipart/mixed; boundary="===============0041653238188939423=="
MIME-Version: 1.0
From: Sergey Senozhatsky <sergey.senozhatsky at gmail.com>
Subject: Re: [Powertop] segmentation fault when shutting
Date: Fri, 09 May 2014 13:06:40 +0300
Message-ID: <20140509100640.GE937@swordfish>
In-Reply-To: alpine.DEB.2.10.1405090024520.17228@zertz.mathematik.uni-freiburg.de
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============0041653238188939423==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On (05/09/14 00:22), Martin Ziegler wrote:
> The bisection resulted in
> =

> commit 5f5976f8b42e4e4717f2d573cf43cb87ccd88fa2
> Author: Dan Kalowsky <daniel.kalowsky(a)intel.com>
> Date:   Tue Apr 29 15:55:31 2014 -0700
> =

>     Adding a clean_shutdown function
> =

>     Function is designed to be a on stop place to clean up
>     the entire application at shutdown time.
> =

> as the first bad commit.
> =


thanks, Martin.

yes... well

a) clean_shutdown() calls close_display() which iterates tab_windows[tab_na=
mes[i]]
and deletes every tab_window. the problem is that prior to
close_display() main executes clear_tuning(), which [surprise surprise]
does `delete tune_window' since commit eb08d4480969c8e48347c7621bd96dc248ee=
2138
("Remove another memory leak") , whilst tab_windows[tab_names[i]] still hol=
ds
a pointer which we just secretly free()-d. so this is double free().
and it has no other option (and will never have) than to crash.

this obviously has not been tested before push.


b) there is no point in free()-ing memory which will be free()-d anyway,
because we exit() the program.

	-ss

--===============0041653238188939423==--

