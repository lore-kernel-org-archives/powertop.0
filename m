Content-Type: multipart/mixed; boundary="===============1243983914924044658=="
MIME-Version: 1.0
From: Sergey Senozhatsky <sergey.senozhatsky at gmail.com>
Subject: Re: [Powertop] Intel GPU statistics on multi-GPU systems
Date: Mon, 08 Jul 2013 13:39:34 +0300
Message-ID: <20130708103934.GA4232@swordfish.minsk.epam.com>
In-Reply-To: 51DAB101.4090100@penneman.org
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============1243983914924044658==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On (07/08/13 14:30), Niels Penneman wrote:
[..]
> >> +
> > do we really need to store 512 bytes instead of 4? as a public member?
> >
> > btw, why 512?
> =

> Indeed, we can store GPU number instead. I looked at how paths were
> stored throughout powertop and found buffer sizes of 256 for filenames,
> so I doubled it to 512 when adding '/sys/class/drm' etc. GPU number is
> better though, I'll edit the patch.
>

thanks.


[..]
> >> +    char filename[512];
> >>  =

> > 4K
> Did you mean buffer size should be 4k ? It would be helpful if powertop
> sources actually had constants for this.
>

better to use standard ones.


linux/limits.h
[..]
#define NAME_MAX         255    /* # chars in a file name */
#define PATH_MAX        4096    /* # chars in a path name including nul
[..]

	-ss

--===============1243983914924044658==--

