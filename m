Content-Type: multipart/mixed; boundary="===============6559273929132663940=="
MIME-Version: 1.0
From: Arjan van de Ven <arjan at linux.intel.com>
Subject: Re: [Powertop] [PATCH v2 6/8] Stop buffer overflow
Date: Wed, 15 Oct 2014 07:34:21 -0700
Message-ID: <543E85ED.5000408@linux.intel.com>
In-Reply-To: 20141015142130.GI1189@swordfish
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============6559273929132663940==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

>>>
>>> well... I think, this should work for both compile time known buffers a=
nd
>>> heap-alloced buffers.
>>>
>>
>> this is what __builtin_object_size() is for
>> (and sprintf already uses that due to -D_FORTIFY_SOURCE=3D2)
>>
>
> yes, but I didn't want to use GCC C extensions (e.g. __builtin_foo). thou=
gh,
> clang/llvm probably support them.
>
>> btw all these "n" usages in these patches are buggy, they do not leave s=
pace for a trailing 0
>> making the problem worse, not better...
>> esp since with -D_FORTIFY_SOURCE=3D2 the compiler will abort the program=
 if there's an overflow,
>> and now you make it silently keep running but corrupt.
>
> yes, this is the reason behind this proposal. these patches a) don't chec=
k for
> overrun; b) don't handle overrun. they just shut up the compiler.


that's never a good tradeoff.
-D_FORTIFY_SOURCE-2 is an essential compiler feature that has a defined sem=
antic/etc
patches that make behavior worse than that baseline, but shut up some warni=
ng, are damage
not value.




--===============6559273929132663940==--

