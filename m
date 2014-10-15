Content-Type: multipart/mixed; boundary="===============1616846703806855052=="
MIME-Version: 1.0
From: Sergey Senozhatsky <sergey.senozhatsky at gmail.com>
Subject: Re: [Powertop] [PATCH v2 6/8] Stop buffer overflow
Date: Thu, 16 Oct 2014 00:42:18 +0900
Message-ID: <20141015154218.GM1189@swordfish>
In-Reply-To: 543E91AA.7070703@linux.intel.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============1616846703806855052==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On (10/15/14 08:24), Arjan van de Ven wrote:
> >
> >>the data is still truncated and partial.. and you keep running with it.
> >
> >which is not that big deal. I agree, that this is not 100% handy.
> >but suppose there is a process with very long name. long enough to cause
> >overrun and powertop abort(). and that process is part of a runtime and
> >it must be alive, etc... and that automatically leaves only one option --
> >either that process or powertop. and never together.
> >
> =

> for cases where you know you can truncate correctly, making a "truncate_s=
tring_to(str, n, trailing_pattern)" helper that you
> call explicitly is likely a better answer than hiding it inside a sprintf=
-like makro.
> (and you then truncate the source string/content)
> =

> but maybe I'm just getting old and grumpy ;-)
> =

> =

> also asprintf() for cases where you don't know how long it will be is not=
 a bad idea

the idea was (and is) to introduce min (nearly 0) runtime overhead.



I'm not a fan of asprintf() personally. hidden malloc(), manual free()
everywhere, possible memleaks, etc...


Joe, care to take a second look at those buffer overruns?

	-ss

--===============1616846703806855052==--

