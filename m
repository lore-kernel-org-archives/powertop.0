Content-Type: multipart/mixed; boundary="===============5879613371420778913=="
MIME-Version: 1.0
From: =?utf-8?q?Jan-Simon_M=C3=B6ller_=3Cdl9pf_at_gmx=2Ede=3E?=
Subject: Re: [Powertop] Device list sort function bug
Date: Wed, 11 Jul 2012 09:55:10 +0200
Message-ID: <201207110955.10925.dl9pf@gmx.de>
In-Reply-To: 20120711073342.GA3081@swordfish
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============5879613371420778913==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Yes, in an hour or so.
Best,
JS
Am Mittwoch, 11. Juli 2012, 09:33:42 schrieb Sergey Senozhatsky:
> On (07/11/12 10:11), Igor Zhbanov wrote:
> > Sometimes PowerTOP dies with a Segmentation Fault while generating
> > the report. Little investigation shown that it dies while sorting
> > the device list. The problem is that comparison function devlist_sort
> > is incorrect.
> > =

> > The function should return true if first argument "preceeds" second.
> > But when strcmp() is used, it can return -1, 0 and 1. So both -1 and 1
> > values are silently converted to true, which is wrong. It confuses the
> > sort() function and it crosses boundary of array.
> =

> Jan, could you please test this one?
> =

> Thanks in advance,
> =

> 	-ss


--===============5879613371420778913==--

