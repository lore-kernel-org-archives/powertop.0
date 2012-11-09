Content-Type: multipart/mixed; boundary="===============7150979224941919183=="
MIME-Version: 1.0
From: Sergey Senozhatsky <sergey.senozhatsky at gmail.com>
Subject: Re: [Powertop] [PATCH] Change library/pkg search condition for
 libnl2/3
Date: Fri, 09 Nov 2012 14:01:29 +0300
Message-ID: <20121109110129.GA3239@swordfish.minsk.epam.com>
In-Reply-To: CAGLu0vOxoPD_1vXqbyh_CtbQTxyXi2uRTusASzBDAe=t9x=KAQ@mail.gmail.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============7150979224941919183==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On (11/09/12 18:56), Austin Zhang wrote:
>    Hi, Sergey,
>    Sorry for late reply.
>    I just tried it in my ubuntu11.04 x86-64 box, but it doesn't work.
>    for libnl2 and libnl3 cases, both failed in configure and with the same
>    error like : No Package 'libnl-1' found.
>    So I didn't try it in other box anymore.=EF=BF=BD
> =


Hello,

hm... can you please run

	pkg-config --list-all | grep -i nl

and send me output. thanks.


	-ss

--===============7150979224941919183==--

