Content-Type: multipart/mixed; boundary="===============8226555584491093393=="
MIME-Version: 1.0
From: Sergey Senozhatsky <sergey.senozhatsky at gmail.com>
Subject: Re: [Powertop] Multiple Batteries
Date: Tue, 27 Nov 2012 10:35:14 +0300
Message-ID: <20121127073514.GA2726@swordfish.minsk.epam.com>
In-Reply-To: CAKZK7ux7BrjOBTjczoWLA2yL13BUA3cKaOLeKy0JGh2p=rR7VQ@mail.gmail.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============8226555584491093393==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On (11/27/12 00:09), Justin Brown wrote:
>    Sergey,
>    Thanks for the quick reply and patch.=C2=A0
>    I'm wondering if you can walk me through building PowerTop from source.
>    I've spent way too much time with Python and Ruby, and I don't know ho=
w to
>    build this project.
>    I've cloned the Git repository and applied your patch.
>

Sure,

we have "Building & Installing PowerTOP" section in README file.


please install required packages

autoconf
automake
m4

pciutils-devel (is only required if you have PCI) =

ncurses-devel  (required) =

libnl-devel    (required)


then

./autogen.sh =

./configure
make


hope it helps.


	-ss

--===============8226555584491093393==--

