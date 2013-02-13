Content-Type: multipart/mixed; boundary="===============1459640724333309308=="
MIME-Version: 1.0
From: Sergey Senozhatsky <sergey.senozhatsky at gmail.com>
Subject: Re: [Powertop] Powertop --claibrate doesn't run
Date: Wed, 13 Feb 2013 22:03:49 +0300
Message-ID: <20130213190349.GA2507@swordfish>
In-Reply-To: 1360781220.12424.YahooMailNeo@web122502.mail.ne1.yahoo.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============1459640724333309308==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello,

On (02/13/13 10:47), Don Rhummy wrote:
> When I run the command "powertop =

> --calibrate --debug" it turns my screen black but then does nothing =

> (even if I leave it for 30 minutes) and when I touch the mousepad, it =

> shows the command simply returned with no output like this:
> =

> =

> myuser:~>kdesu /usr/sbin/powertop --calibrate --debug=C2=A0
> myuser:~>
> =

> =

> I'm using:
> openSUSE 12.2
> KDE 4.8.5
> Kernel: 3.4.11 (64bit)
> 8GB RAM (6.5GB free)
> Intel i5 1.7 quad core
> =


and powertop version?


> =

> How do I fix this? What could be wrong?
> =


well, let's try:

 sudo gdb /usr/sbin/powertop
 run --calibrate --debug


	-ss

--===============1459640724333309308==--

