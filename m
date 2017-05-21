Content-Type: multipart/mixed; boundary="===============0401458108053829000=="
MIME-Version: 1.0
From: Eugene Syromyatnikov <evgsyr at gmail.com>
Subject: Re: [Powertop] 'PowerTOP --calibrate' output
Date: Sun, 21 May 2017 19:17:36 +0000
Message-ID: <CACGkJdu-NYUqz_9MBQDGdjjp4-117V=MU+pXdT17RDWSKcRw0g@mail.gmail.com>
In-Reply-To: CAOZcyfbJ3R+qP+0DgVjrT8f8+p+_nYssky_EkmfwjnXP9_Jp9A@mail.gmail.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============0401458108053829000==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sun, May 21, 2017 at 6:36 PM, Amit Singh <amit112amit(a)gmail.com> wrote:
> Hi.
> After exiting 'sudo powertop --calibrate', there are some statistics prin=
ted
> like "Score =3D 1.7 (18069.1) Guess =3D 12.1 Actual =3D 12.3" (These numb=
ers are
> made up, I do not remember the actual values I got). I tried looking up w=
hat
> these values mean but could not find it mentioned anywhere in the User's
> guide. Can someone point me to a resource that has this information? Or if
> you know what these mean then kindly explain it to me as well.

https://github.com/fenrus75/powertop/blob/master/src/parameters/parameters.=
cpp#L255

They are calculated in [1].

[1] https://github.com/fenrus75/powertop/blob/master/src/parameters/paramet=
ers.cpp#L182

-- =

Eugene Syromyatnikov
mailto:evgsyr(a)gmail.com
xmpp:esyr(a)jabber.{ru|org}

--===============0401458108053829000==--

