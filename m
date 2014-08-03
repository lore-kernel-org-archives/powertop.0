Content-Type: multipart/mixed; boundary="===============3815097844732827221=="
MIME-Version: 1.0
From: Sergey Senozhatsky <sergey.senozhatsky at gmail.com>
Subject: Re: [Powertop] [PATCH 07/12] move options structure to function scope
Date: Sun, 03 Aug 2014 20:46:43 +0900
Message-ID: <20140803114643.GA1150@swordfish>
In-Reply-To: CAG27Bk3KH-yYU-w6fCv_RZF8n+s21SG7EpwEChKpCH=Ua24SpA@mail.gmail.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============3815097844732827221==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On (08/03/14 10:34), Sami Kerola wrote:
> On 3 August 2014 04:52, Sergey Senozhatsky <sergey.senozhatsky(a)gmail.co=
m> wrote:
> > On (08/02/14 23:20), Sami Kerola wrote:
> >> On 2 August 2014 14:47, Sergey Senozhatsky <sergey.senozhatsky(a)gmail=
.com> wrote:
> >> >> Subject: [Powertop] [PATCH 07/12] move options structure to functio=
n scope
> >> >
> >> > what for?
> >>
> >> They've told me keeping variables in as narrow scope as possible is a
> >> virtue. Even if it would not be I don't see any harm of moving
> >> everything out of global scope when ever possible.
> >>
> >> https://www.securecoding.cert.org/confluence/display/cplusplus/DCL07-C=
PP.+Minimize+the+scope+of+variables+and+methods
> >
> > this is different. let's keep it as is.
> =

> Hi Sergey,
> =

> That's alright the scope move is reverted. When I did that I started
> to look the option structure, and later switch case segment. I started
> to wonder why '-a' is marked as an option in structure but it is
> missing from short options in optstring. That lead me to write two
> small clean ups.
> =

> https://github.com/kerolasa/powertop/commit/09a3bb68d1f92c30675679b64d63c=
ddeafbfbce7
> https://github.com/kerolasa/powertop/commit/8d81534bf55486b5230e18b217524=
a07694c5e9e
> =

> Reminder. As mentioned yesterday, the patch series in maillist is
> broken. Up to date versions of these changes are in my github branch,
> which makes this a pull request.
> =

>   https://github.com/kerolasa/powertop sami
>

Hi,

powertop does not pull from outside repos. please resend
your patch series to the list. thanks for your contribution.

	-ss

--===============3815097844732827221==--

