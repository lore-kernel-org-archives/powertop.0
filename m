Content-Type: multipart/mixed; boundary="===============0260043197707808513=="
MIME-Version: 1.0
From: Sergey Senozhatsky <sergey.senozhatsky at gmail.com>
Subject: Re: [Powertop] [PATCH] fix typo and correct coding styles in
 report_formatter
Date: Mon, 15 Oct 2012 08:06:40 -0700
Message-ID: <20121015150640.GE3140@swordfish.minsk.epam.com>
In-Reply-To: 1350309755.4867.15.camel@mattotaupa
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============0260043197707808513==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On (10/15/12 16:02), Paul Menzel wrote:
> thank you for your patch.
> =

> Am Montag, den 15.10.2012, 02:25 -0700 schrieb Sergey Senozhatsky:
> > [PATCH] fix typo and correct coding styles in report_formatter
> =

> Please do not repeat the summary in the commit message body.
>

I do like this line in git shortlog, the only thing with that line
is that *probably* [PATCH] should not be there, but I can't see any
problems with it anyway.


> > Igor noted a typo and coding styles errors in previous patch, correct t=
hem.
> =

> Two patches are better. If not only that you can make the commit summary
> smaller. ;-)
>

why? two patches are good for bisecting, no one ever will bisect those
2 small changes.

	-ss
 =

> report-formatter.h: Fix typo iget_resul =E2=86=92 get_result()
> report-formatter.h: Remove ; to adhere to coding style
> =

> > Signed-off-by: Sergey Senozhatsky <sergey.senozhatsky(a)gmail.com>
> =

> [=E2=80=A6]
> =

> =

> It would be great if you could resend.
>=20

--===============0260043197707808513==--

