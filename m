Content-Type: multipart/mixed; boundary="===============5958689474116166781=="
MIME-Version: 1.0
From: Sergey Senozhatsky <sergey.senozhatsky at gmail.com>
Subject: Re: [Powertop] Device list sort function bug
Date: Wed, 11 Jul 2012 10:33:42 +0300
Message-ID: <20120711073342.GA3081@swordfish>
In-Reply-To: 4FFD1904.7040804@samsung.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============5958689474116166781==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On (07/11/12 10:11), Igor Zhbanov wrote:
> =

> Sometimes PowerTOP dies with a Segmentation Fault while generating
> the report. Little investigation shown that it dies while sorting
> the device list. The problem is that comparison function devlist_sort
> is incorrect.
> =

> The function should return true if first argument "preceeds" second.
> But when strcmp() is used, it can return -1, 0 and 1. So both -1 and 1
> values are silently converted to true, which is wrong. It confuses the so=
rt()
> function and it crosses boundary of array.
> =


Jan, could you please test this one?

Thanks in advance,

	-ss

--===============5958689474116166781==--

