Content-Type: multipart/mixed; boundary="===============2087500190073315631=="
MIME-Version: 1.0
From: Chris Ferron <chris.e.ferron at linux.intel.com>
Subject: Re: [Powertop] [PATCH] do not implement get_user_input() in
 DISABLE_NCURSES builds
Date: Mon, 20 Aug 2012 08:18:59 -0700
Message-ID: <50325563.6040605@linux.intel.com>
In-Reply-To: 20120820094917.GB3137@swordfish
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============2087500190073315631==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 08/20/2012 02:49 AM, Sergey Senozhatsky wrote:
> On (08/19/12 17:40), Arjan van de Ven wrote:
>> On 8/19/2012 2:57 PM, Sergey Senozhatsky wrote:
>>> do not implement get_user_input() in DISABLE_NCURSES builds
>> no offence.. but this ifdef madness needs to stop.
>>
>> right now, powertop uses ncurses.
>>
>> either we want to make it optional, but then this stuff needs to get a l=
ot more modular,
>> or we just declare that you need ncurses.
>> I'm very much leaning towards the later fwiw...
>>
> I agree, and actually I don't like this patch (ifdef stuff also affects p=
atches I'm currently
> working on). it's rather hard to tell how many people will be affected by=
 #2 decision, but we
> can tell the number for #1 case.
>
> DISABLE_NCURSES is not that nasty in overall, since it just disables some=
 application features,
> comparing to, for example, DISABLE_TRYCATCH, which disables standard lang=
uage features for very
> much non-obvious reason for someone with no embedded background.
>
> that said, it'll be nice if we forbid DISABLE_NCURSES, but we'll still ha=
ve ifdefs in
> code because of decisions different people made (like no ncurses in some =
distros or incomplete/buggy
> programming language support).
>
>
> 	-ss
The only reason we allowed DISABLE_NCURSES in the first place, was to =

support android. If we don't want to support android out of the box, we =

can start removing the crude and android can patch PowerTOP within their =

distro if they wanted.

All other ifdef's need to be scrutinized.
-C

> _______________________________________________
> PowerTop mailing list
> PowerTop(a)lists.01.org
> https://lists.01.org/mailman/listinfo/powertop


--===============2087500190073315631==--

