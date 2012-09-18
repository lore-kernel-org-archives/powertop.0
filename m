Content-Type: multipart/mixed; boundary="===============0578495158406130438=="
MIME-Version: 1.0
From: Sergey Senozhatsky <sergey.senozhatsky at gmail.com>
Subject: Re: [Powertop] [PATCH 1/2] Updates to support Android platform
Date: Tue, 18 Sep 2012 11:11:54 +0300
Message-ID: <20120918081153.GA3134@swordfish.minsk.epam.com>
In-Reply-To: CA+Z25wVXrMZaKyGsVjwyv3op4L3JaH7+ONi0oJUeFgi2cNN5jQ@mail.gmail.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============0578495158406130438==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On (09/18/12 11:28), Rajagopal Venkat wrote:
> >> >
> >> Android doesn't support C++ exception handling. Here is the Android of=
ficial
> >> answer [1]. This is the reason for having DISABLE_TRYCATCH macro in
> >> powertop code which were removed in recent commit.
> >>
> >> [1] https://groups.google.com/forum/?fromgroups=3D#!topic/android-ndk/=
idtn7R-_ZFA
> >
> > That reference is two years old and it ends with a note that they will
> > try to enable exception handling for user space programs. Have anything
> > happened on that part in these last two years?
> =

> I don't think it is yet there. Here is another reference[2],
> "Android does not yet support C++ exceptions".
> =

> [2] http://developer.android.com/guide/practices/jni.html
> =


so... we endup in need to support non-POSIX C runtime and non-ISO C++.


	-ss

--===============0578495158406130438==--

