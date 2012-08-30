Content-Type: multipart/mixed; boundary="===============1754348871950392485=="
MIME-Version: 1.0
From: Sergey Senozhatsky <sergey.senozhatsky at gmail.com>
Subject: Re: [Powertop] Support for printing report in text format in
 powertop2.x
Date: Thu, 30 Aug 2012 19:12:34 +0300
Message-ID: <20120830161234.GA3131@swordfish>
In-Reply-To: 503F0AC8.20602@samsung.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============1754348871950392485==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On (08/30/12 10:40), Igor Zhbanov wrote:
> Hi Sergey.
>

Hello Igor,
 =

> Sergey Senozhatsky wrote:
> =

> >no offense, but do we actually need that kind of flexibility?
> I don't know whether the project needs that kind of flexibility but I sup=
pose
> that some general framework could lead to two things:
> 1) Avoid doubling the code for printing in CSV and HTML lines.
> 2) Allows to easily produce correct CSV and HTML files that can be succes=
sfully validated.
> =


yes, good points.

so, now we have two proposals for reworks:
UI rework and generalization (scaling, scrolilng, etc.) and proposal for re=
porting
system generalization and rework, and the latter one is priority (if we sti=
ck to
it) --  it's rather hard to depend on UI and pretty easy on output file for=
mat, thus
format changes should be done as soon as possible.


	-ss

--===============1754348871950392485==--

