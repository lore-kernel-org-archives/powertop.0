Content-Type: multipart/mixed; boundary="===============8183859186964419103=="
MIME-Version: 1.0
From: Arjan van de Ven <arjan at linux.intel.com>
Subject: Re: [Powertop] how does powertop estimate the watt of laptop
 computers?
Date: Tue, 29 Mar 2016 10:58:03 -0700
Message-ID: <56FAC22B.5020803@linux.intel.com>
In-Reply-To: tencent_611127A954D980684BF72795@qq.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============8183859186964419103==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 3/28/2016 11:20 PM, haoyu Wang wrote:
> hi,powertop's  developers .I am a student which recently studing  power c=
onsumption of pc.I have known windows power monitor software
> Joulemeter. there are some papers introduce how it works . but i can't fi=
nd the same documents that introduce the powertop.
>
> so  i want to know the  process of calculating the  watts of those compon=
ents .for example, how to calculate  the cpu's power ? i  have following  q=
uestions :
> 1. does powertop  use power model to calculate the  power ?
> 2. does powertop use the utilization of cpu and combine some cpu's  power=
 model to calculate power ?
> 3.how to get  those utilization ?use linux kernal function  or directly r=
ead some data from cpu  registers which likes  intel power gadget ?

powertop builds a dynamic model of your system and tries to estimate the co=
ntribution to total system power based on that model and the current utiliz=
ations of each of the =

components in the model, and tries to, over time, train that model based on=
 more and more measurements that are taken (usually by the battery, but we =
also support some
external power meters)



--===============8183859186964419103==--

