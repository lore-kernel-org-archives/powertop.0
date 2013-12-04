Content-Type: multipart/mixed; boundary="===============0181829990399970440=="
MIME-Version: 1.0
From: Arjan van de Ven <arjan at linux.intel.com>
Subject: Re: [Powertop] PowerTop 2.5 installation
Date: Wed, 04 Dec 2013 08:07:29 -0800
Message-ID: <529F5341.7030103@linux.intel.com>
In-Reply-To: F9A26558D30ED241A8204F06F9947260257FE613@BGSMSX102.gar.corp.intel.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============0181829990399970440==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 12/3/2013 8:23 PM, Mukherjee, Adrip wrote:
> Thanks Auke. Ok sure.
>
> So now I tried to build the powertop in a Linux build machine following t=
he steps in the readme file.

please run

./configure
make

don't use Makefile.in, that's input to the configure script which will outp=
ut a real "Makefile" from it



--===============0181829990399970440==--

