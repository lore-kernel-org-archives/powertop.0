Content-Type: multipart/mixed; boundary="===============7530545412101737980=="
MIME-Version: 1.0
From: Magnus Fromreide <magfr at lysator.liu.se>
Subject: Re: [Powertop] [PATCH 1/2] Updates to support Android platform
Date: Tue, 18 Sep 2012 07:23:11 +0200
Message-ID: <1347945791.3210.9.camel@sara>
In-Reply-To: CA+Z25wU4UMNYCR7hR2LWDhSprArsSk8U=rKrGRNCM-+hYHhTRA@mail.gmail.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============7530545412101737980==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, 2012-09-18 at 09:54 +0530, Rajagopal Venkat wrote:
> On 17 September 2012 21:58, Chris Ferron <chris.e.ferron(a)linux.intel.co=
m> wrote:
> > On 09/17/2012 07:34 AM, Rajagopal Venkat wrote:
> >>
> >>     #include "devices/device.h"
> >> diff --git a/src/process/do_process.cpp b/src/process/do_process.cpp
> >> index eaef7f1..c9d6b0b 100644
> >> --- a/src/process/do_process.cpp
> >> +++ b/src/process/do_process.cpp
> >> @@ -869,7 +869,7 @@ void process_update_display(void)
> >>                 if (!show_power)
> >>                         strcpy(power, "          ");
> >>                 sprintf(name, "%s", all_power[i]->type());
> >> -               while (mbstowcs(NULL,name,0) < 14) strcat(name, " ");
> >> +               while (mbstowcs(NULL,name,20) < 14) strcat(name, " ");
> >>
> >
> > mbstowcs(NULL,name,0) is a test. return will be count. while catches the
> > error.
> =

> Agree. The Android bionic libc version of mbstowcs always returns zero if
> max(third parameter) is zero, resulting in infinite loop.

Have you reported the bug in the library to Google? If the first
argument is NULL posix says the third argument should be ignored.

What happens if 'name' is more than 20 characters? It shouldn't affect
this use of mbstowcs but there might be others.

> I believe this change should not cause any adverse effect on current beha=
vior.
> The mbstowcs would stop parsing source string when it encounters null-cha=
racter
> or max len. Atleast I didn't observe any change in return value(count).

It shouldn't change the behaviour since mbstowcs is required to ignore
it's third argument if the first argument is NULL.

/MF


--===============7530545412101737980==--

