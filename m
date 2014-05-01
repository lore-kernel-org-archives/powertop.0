Content-Type: multipart/mixed; boundary="===============4012974830914501691=="
MIME-Version: 1.0
From: Sergey Senozhatsky <sergey.senozhatsky at gmail.com>
Subject: Re: [Powertop] A series of patches towards limiting memory corruption
 and foot print
Date: Thu, 01 May 2014 22:28:43 +0300
Message-ID: <20140501192843.GA938@swordfish>
In-Reply-To: 4628F0C61321354285DF2950999754456DF935BE@ORSMSX114.amr.corp.intel.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============4012974830914501691==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On (05/01/14 14:11), Kalowsky, Daniel wrote:
>    Sorry about a second post, looks like email stripped the attachements.=
=C2=A0
>    Second attempt here.

Hello,

it's much easier to review/comment/etc if a patch is inlined in your
email, in plain text. (http://www.tux.org/lkml/#s1-10)

care to resend using git send-email?
thanks.

	-ss

>    =C2=A0
> =

>    From: PowerTop [mailto:powertop-bounces(a)lists.01.org] On Behalf Of
>    Kalowsky, Daniel
>    Sent: Tuesday, April 29, 2014 5:15 PM
>    To: powertop(a)lists.01.org
>    Subject: [Powertop] A series of patches towards limiting memory corrup=
tion
>    and foot print
> =

>    =C2=A0
> =

>    Hi Powertop,
> =

>    =C2=A0
> =

>    I=E2=80=99ve been working with the interactive mode and have run into =
cases where
>    powertop will crash due to a series of memory corruptions.=C2=A0 The f=
ollowing
>    series of patches have helped to reduce the frequency of the issue,
>    although not completely solved it.=C2=A0 The issues arise much faster =
on
>    platforms where there are constrained amounts of RAM to work within.
> =

>    =C2=A0
> =

>    Patch 1 =E2=80=93 When shutting down the interactive display, the disp=
lay bits of
>    memory is not correctly released.=C2=A0 This patch provides a method f=
or
>    correctly doing so.=C2=A0
> =

>    =C2=A0
> =

>    Patch 2 =E2=80=93 Solving a documented memory leak with a non-elegant =
solution.=C2=A0
>    The path either adds the bundle to the stack, or it forgets about it.=
=C2=A0 If
>    it is forgotten about, make sure to clear that memory before moving on=
.=C2=A0
>    This is done with a simple flag variable being set.=C2=A0
> =

>    =C2=A0
> =

>    Patch 3 =E2=80=93 When the tuning window is updated, the current point=
er is just
>    set adrift and not properly free=E2=80=99d.=C2=A0 This patch catches t=
hat issue and
>    removes the dangling pointer by holding a reference to the pointer unt=
il
>    it is reset or specifically free=E2=80=99d.
> =

>    =C2=A0
> =

>    Patch 4 =E2=80=93 Someone actually added in the code to create a oneti=
me
>    pretty-print array, this patch just puts it to use by setting the
>    variable.=C2=A0
> =

>    =C2=A0
> =

>    Patch 5 =E2=80=93 Limiting the buffer copy to the size of the allocate=
d buffer
>    with snprintf.
> =

>    =C2=A0
> =

>    Patch 6 =E2=80=93 There exist some processes and entries that can and =
do extend
>    beyond the length of these buffers.=C2=A0 This limits those entries so=
 as not
>    to corrupt other memory on the system when in interactive mode.=C2=A0
> =

>    =C2=A0
> =

>    Patch 7 =E2=80=93 This is an untested patch, but follows along the sam=
e lines of
>    Patch 6.=C2=A0 It applies the same principals only for the report meth=
od.=C2=A0
> =

>    =C2=A0
> =

>    Patch 8 =E2=80=93 Creates a clean_shutdown function that can be used t=
o cleanup
>    the memory space at shutdown time.=C2=A0 Calls upon parts of Patch 1 t=
o make
>    this happen.=C2=A0
> =

>    =C2=A0
> =

>    There will more than likely be some more patches in the future as time
>    permits.=C2=A0


> _______________________________________________
> PowerTop mailing list
> PowerTop(a)lists.01.org
> https://lists.01.org/mailman/listinfo/powertop


--===============4012974830914501691==--

