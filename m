Content-Type: multipart/mixed; boundary="===============4155432574739324856=="
MIME-Version: 1.0
From: Sergey Senozhatsky <sergey.senozhatsky at gmail.com>
Subject: Re: [Powertop] [PATCH] Fix crash on Linux ARM hosts
Date: Thu, 12 Jul 2012 23:17:30 +0300
Message-ID: <20120712201730.GB2981@swordfish.datadirect.datadirectnet.com>
In-Reply-To: 4FFF2DED.3020604@weilnetz.de
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============4155432574739324856==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On (07/12/12 22:05), Stefan Weil wrote:
> >We had this before. I would rather prefer default CPU number
> >to be 1, instead of -1.
> >
> >Discussion:
> >http://lists.01.org/pipermail/powertop/2012-May/000055.html
> >http://lists.01.org/pipermail/powertop/2012-May/000073.html
> >
> >
> >And the patch is:
> >http://lists.01.org/pipermail/powertop/2012-May/000052.html
> >
> >Chris, did you have a chance to take a look on this one?
> >
> >	-ss
> >
> Thanks for the pointers to the previous mails - I had searched
> the archive and bug trackers but did not notice them.
> =

> The default CPU number should be 0, not 1, because
> that seems to be a common value for other architectures
> with only one CPU.
>

Good point.
 =

> My patch only sets it to -1 to avoid any use of it (it could
> also be set to any negative value).
> =

> I'm just preparing a 2nd patch on top of this one which
> adds ARM support. It should also fix any other architecture
> which does not use "processor\t:" (there are several of them
> according to the Linux source code). It takes a while until
> it is built, because my new Raspberry PI is so terribly slow.
> =

> =


Great.

	-ss

--===============4155432574739324856==--

