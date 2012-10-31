Content-Type: multipart/mixed; boundary="===============4392041252785475899=="
MIME-Version: 1.0
From: Patrick McCarty <patrick.mccarty at linux.intel.com>
Subject: Re: [Powertop] [Powertop ]compiling issue and running issue
Date: Wed, 31 Oct 2012 14:03:02 -0700
Message-ID: <20121031210302.GA555@linux.intel.com>
In-Reply-To: CAGLu0vNFFArQ4oLhBaApRNgN=3zrmNm9G-qWgdiEoTjw4b6o=A@mail.gmail.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============4392041252785475899==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 31, 2012 at 10:11:13PM +0800, Austin Zhang wrote:
> Hi,=C2=A0
> =

> I am trying to compile powertop on my box: ubuntu 12.04, X86-64.
> =

> (1)compiling issue
> =

> Here, my system didn=E2=80=99t install libnl-1, but I installed libnl2 (u=
nder /usr/lib)
> and libnl-3 (under /lib).
> =

> Then when =E2=80=98./configure=E2=80=99, I got:
> =

> checking for LIBNL... no
> =

> configure: error: Package requirements (libnl-1) were not met:
> =

> =C2=A0No package 'libnl-1' found
> =

> so seemed the below logic in configure.ac doesn=E2=80=99t work
> =

> =E2=80=A6=E2=80=A6
> =

> has_libnl_ver=3D0
> =

> PKG_CHECK_MODULES([LIBNL], [libnl-3.0 libnl-genl-3.0], [
> =

> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 has_libnl_ver=3D3], [
> =

> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 AC_SEARCH_LIBS([nl_socket_allo=
c], [nl-3 nl-genl-3], [
> =

> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 has_libnl_ver=3D3], [
> =

> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 AC_SEARCH_LIBS([nl_socket_alloc], [nl], [
> =

> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 has_libn=
l_ver=3D2], [
> =

> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 PKG_CHEC=
K_MODULES([LIBNL], [libnl-1], [has_libnl_ver=3D
> 1], [])])])])
> =

> =E2=80=A6=E2=80=A6

Based on the file lists you sent in a followup post, it appears that
Ubuntu uses a different naming convention for these libraries, so
AC_SEARCH_LIBS will not find the function it needs in either libnl-3 or
libnl-genl-3, since they don't exist.

Is there a -devel package you can install that provides a pkgconfig
file for libnl-3?

-Patrick

--===============4392041252785475899==--

