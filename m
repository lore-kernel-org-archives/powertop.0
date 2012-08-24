Content-Type: multipart/mixed; boundary="===============4662595263035584547=="
MIME-Version: 1.0
From: Joerg Mayer <jmpt at loplof.de>
Subject: Re: [Powertop] [Warning fixes 5/6] Fix warning: warning: this decimal
 constant is unsigned only in ISO C90 [enabled by default] by explicitely
 declaring the value as UL
Date: Fri, 24 Aug 2012 23:54:33 +0200
Message-ID: <20120824215433.GB29623@rhrk.uni-kl.de>
In-Reply-To: 04DD5571759C064D967CF1D07D73B628490BBEF1@fmsmsx110.amr.corp.intel.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============4662595263035584547==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 24, 2012 at 08:18:58PM +0000, Howard, James D wrote:
> A change was suggested in .../cpu.cpp at or near line 975, explicitly add=
ing the "UL" suffix to the decimal integer literal:
>      4294967295   -->   4294967295UL
> Is that the right thing to do?  This is "ULONG_MAX" (for machines with 32=
-bit "word" size).  Would it be more correct to use the identifier ULONG_MA=
X?  In modern #include files, <limits.h> (for example) correctly provides t=
he "UL" suffix.

If __WORDSIZE is 32 on all architectures that powertop will run on,
then yes, we should use ULONG_MAX instead. I will have to find out about
WORDSIZE on 64 bit architectures, as I'm still on a 32 bit system.

On sytems with __WORDSIZE of 64 bits ULONG_MAX is 18446744073709551615UL.

But that's something I will look at after a night's sleep.

Ciao
     J=C3=B6rg


--===============4662595263035584547==--

