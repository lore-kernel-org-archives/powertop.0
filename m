Content-Type: multipart/mixed; boundary="===============6039053962897413270=="
MIME-Version: 1.0
From: Magnus Fromreide <magfr at lysator.liu.se>
Subject: Re: [Powertop] [PATCH 1/2] Updates to support Android platform
Date: Tue, 18 Sep 2012 07:43:13 +0200
Message-ID: <1347946993.3210.21.camel@sara>
In-Reply-To: CA+Z25wVqtYcSq_rQHThD7mqxHXSWPkZRK1xfrZWCMdxahrLSxw@mail.gmail.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============6039053962897413270==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, 2012-09-18 at 09:20 +0530, Rajagopal Venkat wrote:
> On 17 September 2012 21:29, Arjan van de Ven <arjan(a)linux.intel.com> wr=
ote:
> >
> >
> Android doesn't support C++ exception handling. Here is the Android offic=
ial
> answer [1]. This is the reason for having DISABLE_TRYCATCH macro in
> powertop code which were removed in recent commit.
> =

> [1] https://groups.google.com/forum/?fromgroups=3D#!topic/android-ndk/idt=
n7R-_ZFA

That reference is two years old and it ends with a note that they will
try to enable exception handling for user space programs. Have anything
happened on that part in these last two years?

/MF


--===============6039053962897413270==--

