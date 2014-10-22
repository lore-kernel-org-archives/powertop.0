Content-Type: multipart/mixed; boundary="===============2617944365506218445=="
MIME-Version: 1.0
From: Sergey Senozhatsky <sergey.senozhatsky at gmail.com>
Subject: Re: [Powertop] error when auto-tune on last git (Sept 30th)
Date: Wed, 22 Oct 2014 21:26:23 +0900
Message-ID: <20141022122623.GA950@swordfish>
In-Reply-To: CAPU6dhDN20R0vJ4WjtZKiBxTkTA3U2V+2MR0ha96u9Ny7jxsSw@mail.gmail.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============2617944365506218445==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On (10/19/14 12:35), sheepdestroyer wrote:
>    Just compiled last available source from Github
>    I get this error on fedora 20 when trying auto-tune
> =

>    $ sudo powertop --auto-tune
>    Loaded 750 prior measurements
>    RAPL device for cpu 0
>    RAPL device for cpu 0
>    RAPL device for cpu 0
>    =C2=A0 unknown op '{'
not critical (and known). comes from traceevent lib.
need to check with the most recent libtraceevent if plug-in support
has been integrated.

>    Leaving PowerTOP
this is "ok" message in this case.

	-ss

--===============2617944365506218445==--

