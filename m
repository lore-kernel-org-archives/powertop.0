Content-Type: multipart/mixed; boundary="===============5982552070559599044=="
MIME-Version: 1.0
From: Arjan van de Ven <arjan at linux.intel.com>
Subject: Re: [Powertop] ia64 builds fails (and maybe alpha too?)
Date: Wed, 04 Sep 2013 07:52:22 -0700
Message-ID: <52274926.7050300@linux.intel.com>
In-Reply-To: 52266E38.3030307@debian.org
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============5982552070559599044==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 9/3/2013 4:18 PM, Jose Luis Rivas wrote:
> On Tue Sep  3 18:39:26 2013, Arjan van de Ven wrote:
>>
>> if your kernel does not have "perf", there is no point in using
>> powertop....
>> really; it will not work at all.
>>
>> (including anything asm-generic/foo also is the wrong answer; that
>> directory is not architectural
>> from a kernel perspective, only for indirect inclusion)
>>
>>
>
> It does. I was just writing to Julian about this. It seems like it is
> actually a bug in the kernel not having it defined in ia64's unistd.h[0]
> (checking Linus's master branch).
>
> [0]
> https://github.com/torvalds/linux/blob/master/arch/ia64/include/uapi/asm/=
unistd.h
>
> Meaning that it wont fail in alpha, but's failing on ia64 because that
> line is missing.

Lets add Tony to this... he knows IA64 a lot better than I do


--===============5982552070559599044==--

