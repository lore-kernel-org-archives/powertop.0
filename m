Content-Type: multipart/mixed; boundary="===============0193583013089838624=="
MIME-Version: 1.0
From: Sergey Senozhatsky <sergey.senozhatsky at gmail.com>
Subject: Re: [Powertop] [Announce] v2.5-rc1
Date: Tue, 22 Oct 2013 11:16:09 +0300
Message-ID: <20131022081608.GA2286@swordfish>
In-Reply-To: 526215F6.50106@fifthhorseman.net
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============0193583013089838624==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On (10/19/13 01:17), Daniel Kahn Gillmor wrote:
> On 10/18/2013 06:33 PM, Yates, Alexandra wrote:
> > Tested PowerTop different platforms including Linux and Windows.  The f=
ollowing patch breaks IE compatibility. =

> > =

> > https://lists.01.org/pipermail/powertop/2013-September/000925.html =

> =

> Can you describe how IE breaks?  what specifically fails?  is there an
> explicit javascript error or a backtrace or debug log or something?  Is
> data lost or hidden?
> =

> sorry, but i don't have IE to test with, or a windows platform to run it
> on if i did.
> =


ok, classList is not supported by IE10 and older.

so this generates NULL object access:

    var el =3D document.getElementById(idx);
    if (el)
      el.classList.add(c);


	-ss

--===============0193583013089838624==--

