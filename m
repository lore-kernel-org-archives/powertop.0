Content-Type: multipart/mixed; boundary="===============6501359955559631395=="
MIME-Version: 1.0
From: Arjan van de Ven <arjan at linux.intel.com>
Subject: Re: [Powertop] USB devices get wrong power use values
Date: Sun, 13 Oct 2013 15:38:21 -0700
Message-ID: <525B20DD.6070902@linux.intel.com>
In-Reply-To: 20131013221048.GI30504@merlins.org
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============6501359955559631395==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

>
> So note that it's actually a very small USB widget that behaves as a
> keyboard (it's an OTP token).
> I've only had that OTP token show as 7W once, and it was suspicious that
> it was at the exact same time as my built in camera.
>
> So from what you're staying, you're pretty sure that the measuring code
> was correct and that somehow the USB system was wedged or that power
> management suspend failed in a way that both devices were taking 14W
> together, more than what the entire laptop uses when on batteries with
> CPUs mostly asleep?

well powertop cannot measure, only model these things
if you go WAAAY outside the current model (by adding devices never seen bef=
ore)
the accuracy will go up over time, but initially might be off by a bit.



--===============6501359955559631395==--

