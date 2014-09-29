Content-Type: multipart/mixed; boundary="===============8467016018531145367=="
MIME-Version: 1.0
From: Alexandra Yates <alexandra.yates at linux.intel.com>
Subject: Re: [Powertop] [PATCH 1/1] tunable: update sched_mc_power_savings
 target value
Date: Mon, 29 Sep 2014 10:43:46 -0700
Message-ID: <50901.10.24.5.188.1412012626.squirrel@linux.intel.com>
In-Reply-To: CAJDL4uLZo9A4a_jAXKNGuLuQ+voS3TaUbr8Ljr+QaKb0TESdgQ@mail.gmail.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============8467016018531145367==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


> On Fri, Aug 22, 2014 at 9:10 PM, Alexandra Yates <
> alexandra.yates(a)linux.intel.com> wrote:
>
>>
>> > On Tue, Aug 19, 2014 at 7:49 AM, Sergey Senozhatsky <
>> > sergey.senozhatsky(a)gmail.com> wrote:
>> >
>> >> On (08/13/14 21:28), Nanley Chery wrote:
>> >> > Starting in kernel 2.6.29, the highest power savings level
>> increased
>> >> to
>> >> "2".
>> >> > However, in kernel 3.5, the sched power savings feature was removed
>> >> altogether.
>> >>
>> >> hello,
>> >> thanks for reporting,
>> >>
>> >>
>> >> so, it's been removed 2 years ago (3.5 release date was 21 Jul 2012).
>> >>
>> >> do we need to support it at all?
>> >
>> >
>> > Hello,
>> >
>> > Good question. Our README file indicates linux-kernel >=3D 2.6.38 to be
>> a
>> > build requirement. Does this mean we support power management features
>> > starting from that kernel? Or does it mean that this is only a build
>> > requirement and we target the latest kernels? It is not clear from the
>> > current documentation.
>> >
>> > On a much smaller scope, supporting this feature is essentially free
>> > (maintenance-wise) and would keep some of our end users on older
>> kernels
>> > happy. Btw, I submitted a simpler version 2 of this patch that does
>> not
>> > check for the kernel version.
>> >
>> > Thanks,
>> > Nanley
>> > _______________________________________________
>> > PowerTop mailing list
>> > PowerTop(a)lists.01.org
>> > https://lists.01.org/mailman/listinfo/powertop
>> >
>>
>> From PowerTOP 2.0 and up the requirement is to run at least Linux kernel
>> 2.6.38. If it is not in the supported kernel then PowerTOP does not need
>> it.
>>
>> Thank you,
>> Alexandra.
>>
>
> Since we're supporting kernels starting from 2.6.38 (which has this power
> management feature itself), please consider this patch which produces the
> correct behavior.
>
> Thanks,
> Nanley
>

Hi Nanley,

Thank you for your patch.  However, since this feature was faced out the
kernel over two years ago it doesn't make sense to add it now to PowerTOP.
I will update the release notes to use a later kernel.  Please excuse the
confusion.

Thank you,
Alexandra.


--===============8467016018531145367==--

