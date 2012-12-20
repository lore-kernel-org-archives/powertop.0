Content-Type: multipart/mixed; boundary="===============6226800721038265736=="
MIME-Version: 1.0
From: Sergey Senozhatsky <sergey.senozhatsky at gmail.com>
Subject: Re: [Powertop] Libnl in Powertop
Date: Thu, 20 Dec 2012 19:01:13 +0300
Message-ID: <20121220160113.GA2690@swordfish.minsk.epam.com>
In-Reply-To: CABa1t5xZ6ud2=QSYV-6VWDtiM3EcwOS0EdnCdm1D9U7bscN3yw@mail.gmail.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============6226800721038265736==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello,

On (12/19/12 09:10), Ganapati Bhat wrote:
>    Hello All,
>    I am new to using powertop and development in opensource as a whole. W=
hen
>    I went through the earlier versions I found that libnl was not needed =
in
>    the older versions. =


well,
"The libnl suite is a collection of libraries providing APIs to netlink pro=
tocol
based Linux kernel interfaces.[..]  It was designed to be a more flexible s=
uccessor
to ioctl to provide mainly networking related kernel configuration and moni=
toring interfaces"


> Can anyone please tell me what is functionality that libnl adds to powert=
op? =


for example, 802.11 tuning.


> Is it possible to build v2.1 without using libnl?
>

no, it's not.


	-ss

--===============6226800721038265736==--

