Content-Type: multipart/mixed; boundary="===============2962364685825976523=="
MIME-Version: 1.0
From: Kok, Auke-jan H <auke-jan.h.kok at intel.com>
Subject: Re: [Powertop] how does powertop estimate the watt of laptop
 computers?
Date: Tue, 29 Mar 2016 10:41:59 -0700
Message-ID: <CABsxX9K6i0YLcYHF4yrG=hr90cyGoKwCYyUcw9VamSkC7Z2fFg@mail.gmail.com>
In-Reply-To: tencent_611127A954D980684BF72795@qq.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============2962364685825976523==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 28, 2016 at 11:20 PM, haoyu Wang <864290826(a)qq.com> wrote:
> hi,powertop's  developers .I am a student which recently studing  power
> consumption of pc.I have known windows power monitor software Joulemeter.
> there are some papers introduce how it works . but i can't find the same
> documents that introduce the powertop.
>
> so  i want to know the  process of calculating the  watts of those
> components .for example, how to calculate  the cpu's power ? i  have
> following  questions :
> 1. does powertop  use power model to calculate the  power ?
> 2. does powertop use the utilization of cpu and combine some cpu's  power
> model to calculate power ?
> 3.how to get  those utilization ?use linux kernal function  or directly r=
ead
> some data from cpu  registers which likes  intel power gadget ?
>
> thanks for you reading this email and hope you can reply soon .

Everything you're asking for documented in source code. You'll have to
read that and find the answers from there yourself.

Auke

--===============2962364685825976523==--

