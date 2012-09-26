Content-Type: multipart/mixed; boundary="===============0836655122460217589=="
MIME-Version: 1.0
From: Sergey Senozhatsky <sergey.senozhatsky at gmail.com>
Subject: Re: [Powertop] [PATCH v2 2/2] Add stubs to support Android platform
Date: Wed, 26 Sep 2012 16:00:20 -0700
Message-ID: <20120926230020.GA2945@swordfish.datadirect.datadirectnet.com>
In-Reply-To: 20120926220905.GB8841@bacon.lysator.liu.se
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============0836655122460217589==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On (09/27/12 00:09), Magnus Fromreide wrote:
> That they fail to throw exceptions from new is no reason to disable
> set_new_handler, the newhandler is called by the runtime on out of memory
> and is intended to allow the user to try fixing the issue. This is true f=
or
> the noexcept version as well. Is this yet another incompatibility?
>


right. the funny thing is, guess what, gcc actually has "#ifdef __EXCEPTION=
S"
within operator new()

 44 _GLIBCXX_WEAK_DEFINITION void *
 45 operator new (std::size_t sz) _GLIBCXX_THROW (std::bad_alloc)
 46 {
 47   void *p;
 48 =

 49   /* malloc (0) is unpredictable; avoid it.  */
 50   if (sz =3D=3D 0)
 51     sz =3D 1;
 52   p =3D (void *) malloc (sz);
 53   while (p =3D=3D 0)
 54     {
 55       new_handler handler =3D __new_handler;
 56       if (! handler)
 57 #ifdef __EXCEPTIONS
 58         throw bad_alloc();
 59 #else
 60         std::abort();
 61 #endif
 62       handler ();
 63       p =3D (void *) malloc (sz);
 64     }
 65 =

 66   return p;
 67 }


It tourned out, that __EXCEPTIONS with us (for operator new and STL) since =
2001
"2001-02-15  Benjamin Kosnik  <bkoz(a)redhat.com>"

So, I guess this is how Google has came up with the idea of C++ w/o excepti=
ons.

Wow.

	-ss

 =

> > +/* define stubs for C++ exception handling */
> > +#define try     	if (true)
> > +#define catch(x) 	if (false)
> =

> If you should do this then I think it should be spelled
> =

> #define try if (true)
> #define catch else if (false)
> =

> in order to not break
> =

> if (condition)
>     try {
>     } catch(type variable) {
>     }
> =

> but it still breaks the syntax for it which can be shown by simply adding=
 an
> else clause to the if statement.
> =

> Oh, and furthermore I consider that Android needs a C++ compiler.
> =

> > +
> > +/* Define __NR_perf_event_open if not already defined */
> > +#if __arm__
> > +#ifndef __NR_perf_event_open
> > +#define __NR_perf_event_open    364
> > +#endif
> > +#endif
> > +
> > +/*
> > + * bionic libc mbstowcs version returns zero when max parameter
> > + * is zero, resulting infinite loops in powertop source. Add
> > + * mbstowcs wrapper to fix it.
> > + */
> > +namespace pandroid {
> > +	extern "C" inline size_t mbstowcs(wchar_t *dst,
> > +			const char *src, size_t len)
> > +	{
> > +		return ::mbstowcs(dst, src, ::strlen(src));
> > +	}
> > +}
> > +
> > +#define mbstowcs(dst, src, len)		pandroid::mbstowcs(dst, src, len)
> =

> Still broken.
> If dst isn't a NULL pointer then len is the limit on the length of the
> destination buffer. In throwing away this you open up for stack smashing
> attacks.
>=20

--===============0836655122460217589==--

