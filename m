Content-Type: multipart/mixed; boundary="===============1513993605115904687=="
MIME-Version: 1.0
From: Joerg Mayer <jmpt at loplof.de>
Subject: Re: [Powertop] [Warning fixes 5/6] Fix warning: warning: this decimal
 constant is unsigned only in ISO C90 [enabled by default] by explicitely
 declaring the value as UL
Date: Sat, 25 Aug 2012 00:01:34 +0200
Message-ID: <20120824220134.GC29623@rhrk.uni-kl.de>
In-Reply-To: 20120824215433.GB29623@rhrk.uni-kl.de
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============1513993605115904687==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 24, 2012 at 11:54:33PM +0200, Joerg Mayer wrote:
> On Fri, Aug 24, 2012 at 08:18:58PM +0000, Howard, James D wrote:
> > A change was suggested in .../cpu.cpp at or near line 975, explicitly a=
dding the "UL" suffix to the decimal integer literal:
> >      4294967295   -->   4294967295UL
> > Is that the right thing to do?  This is "ULONG_MAX" (for machines with =
32-bit "word" size).  Would it be more correct to use the identifier ULONG_=
MAX?  In modern #include files, <limits.h> (for example) correctly provides=
 the "UL" suffix.
> =

> If __WORDSIZE is 32 on all architectures that powertop will run on,
> then yes, we should use ULONG_MAX instead. I will have to find out about
> WORDSIZE on 64 bit architectures, as I'm still on a 32 bit system.
> =

> On sytems with __WORDSIZE of 64 bits ULONG_MAX is 18446744073709551615UL.
> =

> But that's something I will look at after a night's sleep.

OK, this was much less work than I thought:

On a 64 bit system that I have access to, /usr/include/bits/wordsize.h:

#if defined __x86_64__
# define __WORDSIZE     64
# define __WORDSIZE_COMPAT32    1
#else
# define __WORDSIZE     32
#endif

So I think the answer to your question should be "no", we should not use
ULONG_MAX.

Ciao
      Ja=C3=B6rg
-- =

Joerg Mayer                                           <jmayer(a)loplof.de>
We are stuck with technology when what we really want is just stuff that
works. Some say that should read Microsoft instead of technology.

--===============1513993605115904687==--

