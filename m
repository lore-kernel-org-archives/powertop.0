Content-Type: multipart/mixed; boundary="===============9114843874340417911=="
MIME-Version: 1.0
From: Arjan van de Ven <arjan at linux.intel.com>
Subject: Re: [Powertop] [Powertop ]compiling issue and running issue
Date: Wed, 31 Oct 2012 08:24:03 -0700
Message-ID: <50914293.80704@linux.intel.com>
In-Reply-To: CAGLu0vNFFArQ4oLhBaApRNgN=3zrmNm9G-qWgdiEoTjw4b6o=A@mail.gmail.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============9114843874340417911==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 10/31/2012 7:11 AM, Austin Zhang wrote:
> Hi, =

> =

> I am trying to compile powertop on my box: ubuntu 12.04, X86-64.
> =

> (1)compiling issue
> =

> Here, my system didn=E2=80=99t install libnl-1, but I installed libnl2 (u=
nder /usr/lib) and libnl-3 (under /lib).


on a 64 bit system, that should have been /usr/lib64 and  /lib64
otherwise you got 32 bit libraries ;-)


--===============9114843874340417911==--

