Content-Type: multipart/mixed; boundary="===============1578430586722436026=="
MIME-Version: 1.0
From: Sami Kerola <kerolasa at iki.fi>
Subject: Re: [Powertop] [PATCH 07/14] configure: use autoconf-archive
 ax_cxx_compile_stdcxx_11.m4
Date: Mon, 27 Oct 2014 18:52:26 +0000
Message-ID: <CAG27Bk2bp2jaJXxunnnfvF3JGvvxL_qYQbhT2GZ+xwc+415OfA@mail.gmail.com>
In-Reply-To: 20141025230159.GA5140@bacon.lysator.liu.se
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============1578430586722436026==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 26 October 2014 00:02, Magnus Fromreide <magfr(a)lysator.liu.se> wrote:
> On Sat, Oct 25, 2014 at 06:33:54PM +0100, Sami Kerola wrote:
>> Ensure the C++11 is supported, and fail when it is not.
>
> While I would love to be able to use features from C++11 in powertop I
> was under the impression that only C++98 was required, what are the
> facts regarding that?

Looking compiler warnings the C++11 is needed.

./../traceevent/event-parse.h:468:18: warning: use of C++11 long long
integer constant [-Wlong-long]
./../traceevent/event-parse.h:469:13: warning: use of C++11 long long
integer constant [-Wlong-long]
./../traceevent/event-parse.h:482:18: warning: use of C++11 long long
integer constant [-Wlong-long]
./../traceevent/event-parse.h:483:13: warning: use of C++11 long long
integer constant [-Wlong-long]
./../traceevent/event-parse.h:484:13: warning: use of C++11 long long
integer constant [-Wlong-long]
./../traceevent/event-parse.h:485:13: warning: use of C++11 long long
integer constant [-Wlong-long]
./../traceevent/event-parse.h:498:18: warning: use of C++11 long long
integer constant [-Wlong-long]
./../traceevent/event-parse.h:499:13: warning: use of C++11 long long
integer constant [-Wlong-long]
./../traceevent/event-parse.h:500:13: warning: use of C++11 long long
integer constant [-Wlong-long]
./../traceevent/event-parse.h:501:13: warning: use of C++11 long long
integer constant [-Wlong-long]
./../traceevent/event-parse.h:502:13: warning: use of C++11 long long
integer constant [-Wlong-long]
./../traceevent/event-parse.h:503:13: warning: use of C++11 long long
integer constant [-Wlong-long]
./../traceevent/event-parse.h:504:13: warning: use of C++11 long long
integer constant [-Wlong-long]
./../traceevent/event-parse.h:505:13: warning: use of C++11 long long
integer constant [-Wlong-long]
process/do_process.cpp:482:13: warning: use of C++11 long long integer
constant [-Wlong-long]
process/do_process.cpp:528:13: warning: use of C++11 long long integer
constant [-Wlong-long]
process/do_process.cpp:575:13: warning: use of C++11 long long integer
constant [-Wlong-long]
process/do_process.cpp:680:17: warning: use of C++11 long long integer
constant [-Wlong-long]
process/timer.cpp:83:11: warning: use of C++11 long long integer
constant [-Wlong-long]
process/work.cpp:60:11: warning: use of C++11 long long integer
constant [-Wlong-long]

-- =

Sami Kerola
http://www.iki.fi/kerolasa/

--===============1578430586722436026==--

