Content-Type: multipart/mixed; boundary="===============1809482909340413415=="
MIME-Version: 1.0
From: SF Markus Elfring <elfring at users.sourceforge.net>
Subject: Re: [Powertop] Complete build options for Pthread API
Date: Sun, 19 Oct 2014 13:30:18 +0200
Message-ID: <5443A0CA.1010506@users.sourceforge.net>
In-Reply-To: alpine.LNX.2.03.1410182355460.12471@iki.fi
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============1809482909340413415==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

> I suppose you mean change about like this.

Yes. - Your approach comes very close to my imaginations.

I suggest to reconsider a few implementation details there.


> The macro figures out how to build C programs using POSIX threads, and
> the PTHREAD_CFLAGS output variable to any special C compiler flags that
> are needed.

1. How do you think about to mention in your commit message that three
variables (including "LIBS") will be adjusted eventually?


> +AX_PTHREAD([], [AC_MSG_ERROR([Could not configure pthreads support])])

2. You chose to pass an empty "ACTION-IF-FOUND". Would it make sense to
restructure this place a bit in the configuration script so that the
following statements will be directly used by the first macro parameter?

Regards,
Markus

--===============1809482909340413415==--

