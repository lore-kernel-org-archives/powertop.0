Content-Type: multipart/mixed; boundary="===============2575463886301111637=="
MIME-Version: 1.0
From: Arjan van de Ven <arjan at linux.intel.com>
Subject: Re: [Powertop] [PATCH] do not implement get_user_input() in
 DISABLE_NCURSES builds
Date: Mon, 20 Aug 2012 08:34:41 -0700
Message-ID: <50325911.2020603@linux.intel.com>
In-Reply-To: 5032585E.10707@linux.intel.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============2575463886301111637==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 8/20/2012 8:31 AM, Chris Ferron wrote:
> On 08/20/2012 08:21 AM, Arjan van de Ven wrote:
>> On 8/20/2012 8:18 AM, Chris Ferron wrote:
>>
>>>>      -ss
>>> The only reason we allowed DISABLE_NCURSES in the first place, was to s=
upport android. If we don't want to support android out of the box, we can =
start removing the crude
>>> and android can patch PowerTOP within their distro if they wanted.
>>
>> ..or for an android build one adds ncurses to the local android.. like l=
ibpci and libnl are anyway
>>
> Yep, another perfectly reasonable option. So lets make ncurses a hard req=
uirement and remove the ifdef's.

it's already a runtime option anyway (with --html and co)

worst case, if someone really cannot stand this, they can contribute a mini=
 "stub" ncurses that we then
compile in for those people who can't cope. But that really should be a sep=
arate stub (similar to how we
do the pevent lib), not a ton of ifdefs in code.


--===============2575463886301111637==--

