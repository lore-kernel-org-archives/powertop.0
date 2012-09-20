Content-Type: multipart/mixed; boundary="===============5142860007646666299=="
MIME-Version: 1.0
From: Igor Zhbanov <i.zhbanov at samsung.com>
Subject: Re: [Powertop] Powertop doesn't detects sleeping ARM cores
Date: Thu, 20 Sep 2012 14:55:43 +0400
Message-ID: <505AF62F.5070006@samsung.com>
In-Reply-To: 505AF31A.4000400@linux.intel.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============5142860007646666299==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Arjan van de Ven wrote:
> On 9/20/2012 12:40 PM, Igor Zhbanov wrote:
>> But is it correct to consider ARM core to be offline when it is just in =
WFI state?
> nope
>
> for all intents and purposes, the cpu is still there.
>
> in an idle state, the cpu logically is there, and ready to resume executi=
on if needed...
> that's the definition of idle ;-)
>
> offline is where the administrator takes a cpu out of circulation.
>
> neither specifies any physical hardware state... in fact offline is usual=
ly implemented as an idle state, at
> least on x86. the semantics for how to get back are different (system aut=
onomous versus administrator)
>
> now, quite possible some ARM platforms abuse this and don't implement som=
ething as "idle" but as "offline" instead.
> that sounds not very smart to me.

Yes, it seems that on some ARM platforms offline and idle are mixed.
On my test device it is even hard to bring the core online. If I write 1 to=
 "online" file,
then I see other pseudo-files only for a less than a second, then the core
will be brought offline again. It seems that kernel powers up the core, the=
n sees that there
no task for it, and powers it down again.

May be we should talk to ARM developers to do things more correctly. It see=
ms that now impossible
to administratively enable/disable some cores. The CPU governor will always=
 consider all available
cores to be possible to use (except of limit of nr_cpus boot parameter).

So I don't know what to do best.

-- =

Best regards,
Igor Zhbanov,
Expert Software Engineer,
phone: +7 (495) 797 25 00 ext 3806
e-mail: i.zhbanov(a)samsung.com

ASWG, Moscow R&D center, Samsung Electronics
12 Dvintsev street, building 1
127018, Moscow, Russian Federation


--===============5142860007646666299==--

