Content-Type: multipart/mixed; boundary="===============7306293635580492158=="
MIME-Version: 1.0
From: Chris Ferron <chris.e.ferron at linux.intel.com>
Subject: Re: [Powertop] [PATCH] do not implement get_user_input() in
 DISABLE_NCURSES builds
Date: Mon, 20 Aug 2012 08:31:42 -0700
Message-ID: <5032585E.10707@linux.intel.com>
In-Reply-To: 503255F3.8010304@linux.intel.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============7306293635580492158==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 08/20/2012 08:21 AM, Arjan van de Ven wrote:
> On 8/20/2012 8:18 AM, Chris Ferron wrote:
>
>>>      -ss
>> The only reason we allowed DISABLE_NCURSES in the first place, was to su=
pport android. If we don't want to support android out of the box, we can s=
tart removing the crude
>> and android can patch PowerTOP within their distro if they wanted.
>
> ..or for an android build one adds ncurses to the local android.. like li=
bpci and libnl are anyway
>
Yep, another perfectly reasonable option. So lets make ncurses a hard =

requirement and remove the ifdef's.


--===============7306293635580492158==--

