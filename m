Content-Type: multipart/mixed; boundary="===============0721734373682969937=="
MIME-Version: 1.0
From: Nathan Van Ymeren <nathan.vany at gmail.com>
Subject: Re: [Powertop] Bug under Fedora 19 x86_64: Requesting Unregistered
 Parameters 63 and 58
Date: Thu, 04 Jul 2013 14:47:26 +0000
Message-ID: <1263270461-1372949241-cardhu_decombobulator_blackberry.rim.net-1236638658-@b3.c1.bise6.blackberry>
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============0721734373682969937==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Actually I've figured it out:

It was necessary to delete the cache files under /var

I didn't think it could have been a cache issue because I specifically aske=
d my package manager (yum in this case) to do a reinstall of powertop after=
 I upgraded my distro.

Apparently I needed to be reminded what happens when you ASSuME :)

Thanks for your help

N
------Original Message------
From: Sergey Senozhatsky
To: Nathan Van Ymeren
Cc: powertop(a)lists.01.org
Subject: Re: [Powertop] Bug under Fedora 19 x86_64: Requesting Unregistered=
 Parameters 63 and 58
Sent: Jul 4, 2013 2:25 AM

On (07/03/13 11:47), Nathan Van Ymeren wrote:
>    Hi Sergey,
>    Here are the listings of those directories =C2=A0
>    [1]http://pastebin.com/wJdxSN5B
> =

>    On Wed, Jul 3, 2013 at 4:55 AM, Sergey Senozhatsky
>    <[2]sergey.senozhatsky(a)gmail.com> wrote:
> =

>      > =C2=A0 =C2=A0BUG: requesting unregistered parameter 58
>      > =C2=A0 =C2=A0BUG: requesting unregistered parameter 63
>      >

Hello, thanks.

I assume you run powertop 2.3?

	-ss


--===============0721734373682969937==--

