Content-Type: multipart/mixed; boundary="===============5917249640477373030=="
MIME-Version: 1.0
From: Arjan van de Ven <arjan at linux.intel.com>
Subject: Re: [Powertop] [PATCH v2 6/8] Stop buffer overflow
Date: Wed, 15 Oct 2014 08:24:26 -0700
Message-ID: <543E91AA.7070703@linux.intel.com>
In-Reply-To: 20141015151941.GL1189@swordfish
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============5917249640477373030==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

>
>> the data is still truncated and partial.. and you keep running with it.
>
> which is not that big deal. I agree, that this is not 100% handy.
> but suppose there is a process with very long name. long enough to cause
> overrun and powertop abort(). and that process is part of a runtime and
> it must be alive, etc... and that automatically leaves only one option --
> either that process or powertop. and never together.
>

for cases where you know you can truncate correctly, making a "truncate_str=
ing_to(str, n, trailing_pattern)" helper that you
call explicitly is likely a better answer than hiding it inside a sprintf-l=
ike makro.
(and you then truncate the source string/content)

but maybe I'm just getting old and grumpy ;-)


also asprintf() for cases where you don't know how long it will be is not a=
 bad idea


--===============5917249640477373030==--

