Content-Type: multipart/mixed; boundary="===============9183722361502240231=="
MIME-Version: 1.0
From: Sami Kerola <kerolasa at iki.fi>
Subject: Re: [Powertop] Complete build options for Pthread API
Date: Sun, 19 Oct 2014 19:18:02 +0100
Message-ID: <CAG27Bk0EgYDVvoPPoqqSP1UwmVuLpL_ax1Z4fwmLAYSdtM9ZHw@mail.gmail.com>
In-Reply-To: 5443A0CA.1010506@users.sourceforge.net
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============9183722361502240231==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 19 October 2014 12:30, SF Markus Elfring
<elfring(a)users.sourceforge.net> wrote:
>> I suppose you mean change about like this.
>
> Yes. - Your approach comes very close to my imaginations.
>
> I suggest to reconsider a few implementation details there.
>
>
>> The macro figures out how to build C programs using POSIX threads, and
>> the PTHREAD_CFLAGS output variable to any special C compiler flags that
>> are needed.
>
> 1. How do you think about to mention in your commit message that three
> variables (including "LIBS") will be adjusted eventually?

I don't know what sort of adjustments you have in mind. The variables are
in commit body, so I am assuming people who read code can see them without
explicit note about them. But if you insist improvement with the message co=
uld
you write what you would like to see so that I can include it without
confusions.

>> +AX_PTHREAD([], [AC_MSG_ERROR([Could not configure pthreads support])])
>
> 2. You chose to pass an empty "ACTION-IF-FOUND". Would it make sense to
> restructure this place a bit in the configuration script so that the
> following statements will be directly used by the first macro parameter?

That would make powertop m4 code copy to drift from version provided by
autotools-archive, making the upstream fixes to incompatible. I strongly
recommend against adding additional maintenance cost to this sort of stuff.

-- =

Sami Kerola
http://www.iki.fi/kerolasa/

--===============9183722361502240231==--

