Content-Type: multipart/mixed; boundary="===============0429940845172871959=="
MIME-Version: 1.0
From: Alexandra Yates <alexandra.yates at linux.intel.com>
Subject: Re: [Powertop] A series of patches towards limiting memory corruption
 and foot print
Date: Mon, 05 May 2014 15:40:34 -0700
Message-ID: <52553.10.24.6.59.1399329634.squirrel@linux.intel.com>
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============0429940845172871959==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

> On (05/01/14 14:11), Kalowsky, Daniel wrote:
>>    Sorry about a second post, looks like email stripped the
>> attachements.=C3=82=C2=A0
>>    Second attempt here.
>
> Hello,
>
> it's much easier to review/comment/etc if a patch is inlined in your
> email, in plain text. (http://www.tux.org/lkml/#s1-10)
>
> care to resend using git send-email?
> thanks.
>
> 	-ss

Hi Dan,

Thank you for re-sending your patches.  This time I added the patches to
PowerTOP v2.6-rc2 to facilitate other people's reviews.  However, in the
future please send your patches using git send-mail.  As Sergey indicated
that is a easier way for every one to review patches.

Thank you,
Alexandra.

>
>>    =C3=82=C2=A0
>>
>>    From: PowerTop [mailto:powertop-bounces(a)lists.01.org] On Behalf Of
>>    Kalowsky, Daniel
>>    Sent: Tuesday, April 29, 2014 5:15 PM
>>    To: powertop(a)lists.01.org
>>    Subject: [Powertop] A series of patches towards limiting memory
>> corruption
>>    and foot print
>>
>>    =C3=82=C2=A0
>>
>>    Hi Powertop,
>>
>>    =C3=82=C2=A0
>>
>>    I=C3=A2=C2=80=C2=99ve been working with the interactive mode and have=
 run into cases
>> where
>>    powertop will crash due to a series of memory corruptions.=C3=82=C2=
=A0 The
>> following
>>    series of patches have helped to reduce the frequency of the issue,
>>    although not completely solved it.=C3=82=C2=A0 The issues arise much =
faster on
>>    platforms where there are constrained amounts of RAM to work within.
>>
>>    =C3=82=C2=A0
>>
>>    Patch 1 =C3=A2=C2=80=C2=93 When shutting down the interactive display=
, the display
>> bits of
>>    memory is not correctly released.=C3=82=C2=A0 This patch provides a m=
ethod for
>>    correctly doing so.=C3=82=C2=A0
>>
>>    =C3=82=C2=A0
>>
>>    Patch 2 =C3=A2=C2=80=C2=93 Solving a documented memory leak with a no=
n-elegant
>> solution.=C3=82=C2=A0
>>    The path either adds the bundle to the stack, or it forgets about
>> it.=C3=82=C2=A0 If
>>    it is forgotten about, make sure to clear that memory before moving
>> on.=C3=82=C2=A0
>>    This is done with a simple flag variable being set.=C3=82=C2=A0
>>
>>    =C3=82=C2=A0
>>
>>    Patch 3 =C3=A2=C2=80=C2=93 When the tuning window is updated, the cur=
rent pointer is
>> just
>>    set adrift and not properly free=C3=A2=C2=80=C2=99d.=C3=82=C2=A0 This=
 patch catches that issue
>> and
>>    removes the dangling pointer by holding a reference to the pointer
>> until
>>    it is reset or specifically free=C3=A2=C2=80=C2=99d.
>>
>>    =C3=82=C2=A0
>>
>>    Patch 4 =C3=A2=C2=80=C2=93 Someone actually added in the code to crea=
te a onetime
>>    pretty-print array, this patch just puts it to use by setting the
>>    variable.=C3=82=C2=A0
>>
>>    =C3=82=C2=A0
>>
>>    Patch 5 =C3=A2=C2=80=C2=93 Limiting the buffer copy to the size of th=
e allocated
>> buffer
>>    with snprintf.
>>
>>    =C3=82=C2=A0
>>
>>    Patch 6 =C3=A2=C2=80=C2=93 There exist some processes and entries tha=
t can and do
>> extend
>>    beyond the length of these buffers.=C3=82=C2=A0 This limits those ent=
ries so as
>> not
>>    to corrupt other memory on the system when in interactive mode.=C3=82=
=C2=A0
>>
>>    =C3=82=C2=A0
>>
>>    Patch 7 =C3=A2=C2=80=C2=93 This is an untested patch, but follows alo=
ng the same
>> lines of
>>    Patch 6.=C3=82=C2=A0 It applies the same principals only for the repo=
rt
>> method.=C3=82=C2=A0
>>
>>    =C3=82=C2=A0
>>
>>    Patch 8 =C3=A2=C2=80=C2=93 Creates a clean_shutdown function that can=
 be used to
>> cleanup
>>    the memory space at shutdown time.=C3=82=C2=A0 Calls upon parts of Pa=
tch 1 to
>> make
>>    this happen.=C3=82=C2=A0
>>
>>    =C3=82=C2=A0
>>
>>    There will more than likely be some more patches in the future as
>> time
>>    permits.=C3=82=C2=A0
>
>
>> _______________________________________________
>> PowerTop mailing list
>> PowerTop(a)lists.01.org
>> https://lists.01.org/mailman/listinfo/powertop
>
> _______________________________________________
> PowerTop mailing list
> PowerTop(a)lists.01.org
> https://lists.01.org/mailman/listinfo/powertop
>


Thank you,
Alexandra.

--===============0429940845172871959==--

