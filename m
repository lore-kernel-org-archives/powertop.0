Content-Type: multipart/mixed; boundary="===============5171796127974451345=="
MIME-Version: 1.0
From: Kok, Auke-jan H <auke-jan.h.kok at intel.com>
Subject: Re: [Powertop] Requesting help to get the power consumption of each
 thread or process id
Date: Fri, 18 Jul 2014 14:54:37 -0700
Message-ID: <CABsxX9+kqVccgWJQYKQyA-hRCQwoxk6q5UzDhwfA5Tw-KvEWkA@mail.gmail.com>
In-Reply-To: COL129-W98C4A2DB02F064BE0A0F8C6F40@phx.gbl
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============5171796127974451345==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 17, 2014 at 12:20 PM, Christopher Mansour
<cmansour(a)outlook.com> wrote:
> Hi,
>
> I was wondering if somebody can help in doing the following:
> I want to get the power consumption of each thread running. I am doing an
> experiment. I built a program that executes on several threads and I need=
 to
> know the power consumed by each thread or by each core of the eight CPU
> cores I have.  I do know the process ID of the processes that start but I
> don't know how to get their power consumption using powertop.

This is pretty much impossible to do as there's no way to actually
physically measure the power draw of a thread, and threads on a core
aren't receiving power separately and are often grouped when it comes
to power. Because of the complexity, there's just no solution to
getting per-thread power simply from a normal system.

Auke

--===============5171796127974451345==--

