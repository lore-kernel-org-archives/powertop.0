Content-Type: multipart/mixed; boundary="===============2251238120285143930=="
MIME-Version: 1.0
From: Igor Zhbanov <i.zhbanov at samsung.com>
Subject: Re: [Powertop] [PATCH] V2: Fix C states and P states presentation
 issue.
Date: Wed, 23 Jan 2013 18:57:14 +0400
Message-ID: <50FFFA4A.1030201@samsung.com>
In-Reply-To: 20130122170926.GB2320@swordfish
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============2251238120285143930==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Sergey Senozhatsky wrote:

> just for note, perhaps we can do the same for pstates_num in report_displ=
ay_cpu_pstates(),
> to keep it similar.

I don't have any objection. It could be the same for pstates.
I didn't send the patch for cstates because was not sure that there
are architectures with more than 10 cstates. Austin pointed that IA is.
So both pstates and cstates handling could be fixed in the same way.

-- =

Best regards,
Igor Zhbanov,
Technical Leader,
phone: +7 (495) 797 25 00 ext 3806
e-mail: i.zhbanov(a)samsung.com

Mobile group, Moscow R&D center, Samsung Electronics
12 Dvintsev street, building 1
127018, Moscow, Russian Federation


--===============2251238120285143930==--

