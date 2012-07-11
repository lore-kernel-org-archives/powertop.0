Content-Type: multipart/mixed; boundary="===============0718367527607390799=="
MIME-Version: 1.0
From: =?utf-8?q?Jan-Simon_M=C3=B6ller_=3Cdl9pf_at_gmx=2Ede=3E?=
Subject: Re: [Powertop] Device list sort function bug
Date: Wed, 11 Jul 2012 16:43:23 +0200
Message-ID: <201207111643.23770.dl9pf@gmx.de>
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============0718367527607390799==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

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

Confirmed. Fixes the crash & works here.

Acked-by: Jan-Simon Moeller <dl9pf(a)gmx.de>


--===============0718367527607390799==--

