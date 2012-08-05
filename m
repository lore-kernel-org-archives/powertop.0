Content-Type: multipart/mixed; boundary="===============2489605460975179856=="
MIME-Version: 1.0
From: Sergey Senozhatsky <sergey.senozhatsky at gmail.com>
Subject: Re: [Powertop] [PATCH 4/4] Add support for Intel GPU statistics
Date: Sun, 05 Aug 2012 21:02:52 +0300
Message-ID: <20120805180251.GB3199@swordfish>
In-Reply-To: 501EAF6F.3020106@linux.intel.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============2489605460975179856==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On (08/05/12 10:37), Arjan van de Ven wrote:
> >>
> >> +	file.open("/sys/class/drm/card0/power/rc6_residency_ms",  ios::in);
> >> +
> >> +	if (file) {
> >> +		handle_i965_gpu();
> >> +		file.close();
> >> +	}
> >> +
> > =

> > side note: just wonder how much C++ stream with its heavy buffering, et=
c. is slower
> > than stat(). I'll review and if it makes sense will probably prepare si=
mple stat()
> > wrapper to lib.cpp
> =

> better to use access() than stat.
> =

> both have the fun of getting a bunch of low level system headers into C++
> I'm sure that'll work most of the time, but for something as non-time cri=
tical as this
> I wonder how badly that is inviting trouble.
> =

> =

good point, that was just a small nit. I'm ok with one time fstream call.

> >> +	=

> >> +	if (line_nr =3D=3D 0)
> >> +		d =3D 100.0 - ratio * (rc6_after + rc6p_after + rc6pp_after - rc6_b=
efore - rc6p_before - rc6pp_before);
> >> +	if (line_nr =3D=3D 1)
> >> +		d =3D ratio * (rc6_after - rc6_before);
> >> +	if (line_nr =3D=3D 2)
> >> +		d =3D ratio * (rc6p_after - rc6p_before);
> >> +	if (line_nr =3D=3D 3)
> >> +		d =3D ratio * (rc6pp_after - rc6pp_before);
> >> +	if (line_nr >=3D 4 || line_nr < 0)
> >> +		return buffer;
> >> +
> > =

> > small side note /* someone will do it anyway :-) */:
> > how about
> > =

> > 	if (line_nr =3D=3D 0)
> > 		d =3D 100.0 - ratio * (rc6_after + rc6p_after + rc6pp_after - rc6_bef=
ore - rc6p_before - rc6pp_before);
> > 	else if (line_nr =3D=3D 1)
> > 		d =3D ratio * (rc6_after - rc6_before);
> > 	else if (line_nr =3D=3D 2)
> > 		d =3D ratio * (rc6p_after - rc6p_before);
> > 	else if (line_nr =3D=3D 3)
> > 		d =3D ratio * (rc6pp_after - rc6pp_before);
> > 	else if (line_nr >=3D 4 || line_nr < 0)
> > 		return buffer;
> =

> well last time I looked at the disassembly for such a case, this generate=
d worse code.
> I'll admit that that was about 2 gcc versions ago though.
> =


it's hard to tell nowadays, when GCC is free (and able) to generate even se=
veral functions (not in this case,
of course) each of those will be specified for known parameter value: e.g. =
foo.part.1(), foo.part.2(), foo.part.3()
for foo(1), foo(2) and foo(3) calls.

on my host (tested on dummy foo() routine) it's something like this (just f=
or note)

gcc version 4.7.1 20120721

	-O2

if ()
if ()
if ()

Dump of assembler code for function foo:
   0x00000000004006b0 <+0>:	cmp    $0x1,%edi
   0x00000000004006b3 <+3>:	je     0x4006d8 <foo+40>
   0x00000000004006b5 <+5>:	cmp    $0x2,%edi
   0x00000000004006b8 <+8>:	je     0x4006d8 <foo+40>
   0x00000000004006ba <+10>:	cmp    $0x3,%edi
   0x00000000004006bd <+13>:	jne    0x4006f0 <foo+64>
   0x00000000004006bf <+15>:	mov    %esi,%eax
   0x00000000004006c1 <+17>:	mov    $0x4007bf,%edi
   0x00000000004006c6 <+22>:	imul   %esi,%eax
   0x00000000004006c9 <+25>:	imul   %esi,%eax
   0x00000000004006cc <+28>:	mov    %eax,%esi
   0x00000000004006ce <+30>:	xor    %eax,%eax
   0x00000000004006d0 <+32>:	jmpq   0x4004a0 <printf(a)plt>
   0x00000000004006d5 <+37>:	nopl   (%rax)
   0x00000000004006d8 <+40>:	mov    %esi,%eax
   0x00000000004006da <+42>:	imul   %esi,%eax
   0x00000000004006dd <+45>:	mov    %eax,%esi
   0x00000000004006df <+47>:	mov    $0x4007bf,%edi
   0x00000000004006e4 <+52>:	xor    %eax,%eax
   0x00000000004006e6 <+54>:	jmpq   0x4004a0 <printf(a)plt>
   0x00000000004006eb <+59>:	nopl   0x0(%rax,%rax,1)
   0x00000000004006f0 <+64>:	jbe    0x400706 <foo+86>
   0x00000000004006f2 <+66>:	lea    (%rsi,%rsi,1),%eax
   0x00000000004006f5 <+69>:	mov    $0x4007bf,%edi
   0x00000000004006fa <+74>:	imul   %esi,%eax
   0x00000000004006fd <+77>:	mov    %eax,%esi
   0x00000000004006ff <+79>:	xor    %eax,%eax
   0x0000000000400701 <+81>:	jmpq   0x4004a0 <printf(a)plt>
   0x0000000000400706 <+86>:	xor    %eax,%eax
   0x0000000000400708 <+88>:	jmp    0x4006dd <foo+45>


if ()
else if ()
else if ()
[..]

Dump of assembler code for function foo:
   0x00000000004006b0 <+0>:	xor    %eax,%eax
   0x00000000004006b2 <+2>:	test   %edi,%edi
   0x00000000004006b4 <+4>:	je     0x4006cd <foo+29>
   0x00000000004006b6 <+6>:	cmp    $0x1,%edi
   0x00000000004006b9 <+9>:	je     0x4006e0 <foo+48>
   0x00000000004006bb <+11>:	cmp    $0x2,%edi
   0x00000000004006be <+14>:	je     0x4006e0 <foo+48>
   0x00000000004006c0 <+16>:	cmp    $0x3,%edi
   0x00000000004006c3 <+19>:	je     0x4006f8 <foo+72>
   0x00000000004006c5 <+21>:	jbe    0x4006cd <foo+29>
   0x00000000004006c7 <+23>:	lea    (%rsi,%rsi,1),%eax
   0x00000000004006ca <+26>:	imul   %esi,%eax
   0x00000000004006cd <+29>:	mov    %eax,%esi
   0x00000000004006cf <+31>:	mov    $0x4007bf,%edi
   0x00000000004006d4 <+36>:	xor    %eax,%eax
   0x00000000004006d6 <+38>:	jmpq   0x4004a0 <printf(a)plt>
   0x00000000004006db <+43>:	nopl   0x0(%rax,%rax,1)
   0x00000000004006e0 <+48>:	mov    %esi,%eax
   0x00000000004006e2 <+50>:	mov    $0x4007bf,%edi
   0x00000000004006e7 <+55>:	imul   %esi,%eax
   0x00000000004006ea <+58>:	mov    %eax,%esi
   0x00000000004006ec <+60>:	xor    %eax,%eax
   0x00000000004006ee <+62>:	jmpq   0x4004a0 <printf(a)plt>
   0x00000000004006f3 <+67>:	nopl   0x0(%rax,%rax,1)
   0x00000000004006f8 <+72>:	mov    %esi,%eax
   0x00000000004006fa <+74>:	imul   %esi,%eax
   0x00000000004006fd <+77>:	imul   %esi,%eax
   0x0000000000400700 <+80>:	jmp    0x4006cd <foo+29>


both are not perfect, comparing to -Os case

if ()
if ()
if ()

Dump of assembler code for function foo:
   0x0000000000400691 <+0>:	cmp    $0x1,%edi
   0x0000000000400694 <+3>:	jne    0x40069d <foo+12>
   0x0000000000400696 <+5>:	mov    %esi,%eax
   0x0000000000400698 <+7>:	imul   %esi,%eax
   0x000000000040069b <+10>:	jmp    0x4006b0 <foo+31>
   0x000000000040069d <+12>:	cmp    $0x2,%edi
   0x00000000004006a0 <+15>:	je     0x400696 <foo+5>
   0x00000000004006a2 <+17>:	cmp    $0x3,%edi
   0x00000000004006a5 <+20>:	jne    0x4006ae <foo+29>
   0x00000000004006a7 <+22>:	mov    %esi,%eax
   0x00000000004006a9 <+24>:	imul   %esi,%eax
   0x00000000004006ac <+27>:	jmp    0x4006b8 <foo+39>
   0x00000000004006ae <+29>:	xor    %eax,%eax
   0x00000000004006b0 <+31>:	cmp    $0x3,%edi
   0x00000000004006b3 <+34>:	jbe    0x4006bb <foo+42>
   0x00000000004006b5 <+36>:	lea    (%rsi,%rsi,1),%eax
   0x00000000004006b8 <+39>:	imul   %esi,%eax
   0x00000000004006bb <+42>:	mov    %eax,%esi
   0x00000000004006bd <+44>:	mov    $0x40077f,%edi
   0x00000000004006c2 <+49>:	xor    %eax,%eax
   0x00000000004006c4 <+51>:	jmpq   0x4004a0 <printf(a)plt>

if ()
else if ()
else if ()

Dump of assembler code for function foo:
   0x0000000000400691 <+0>:	xor    %eax,%eax
   0x0000000000400693 <+2>:	test   %edi,%edi
   0x0000000000400695 <+4>:	je     0x4006b9 <foo+40>
   0x0000000000400697 <+6>:	cmp    $0x1,%edi
   0x000000000040069a <+9>:	jne    0x4006a0 <foo+15>
   0x000000000040069c <+11>:	mov    %esi,%eax
   0x000000000040069e <+13>:	jmp    0x4006b6 <foo+37>
   0x00000000004006a0 <+15>:	cmp    $0x2,%edi
   0x00000000004006a3 <+18>:	je     0x40069c <foo+11>
   0x00000000004006a5 <+20>:	cmp    $0x3,%edi
   0x00000000004006a8 <+23>:	jne    0x4006b1 <foo+32>
   0x00000000004006aa <+25>:	mov    %esi,%eax
   0x00000000004006ac <+27>:	imul   %esi,%eax
   0x00000000004006af <+30>:	jmp    0x4006b6 <foo+37>
   0x00000000004006b1 <+32>:	jbe    0x4006b9 <foo+40>
   0x00000000004006b3 <+34>:	lea    (%rsi,%rsi,1),%eax
   0x00000000004006b6 <+37>:	imul   %esi,%eax
   0x00000000004006b9 <+40>:	mov    %eax,%esi
   0x00000000004006bb <+42>:	mov    $0x40077f,%edi
   0x00000000004006c0 <+47>:	xor    %eax,%eax
   0x00000000004006c2 <+49>:	jmpq   0x4004a0 <printf(a)plt>



	-ss

--===============2489605460975179856==--

