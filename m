Content-Type: multipart/mixed; boundary="===============1370439699301381308=="
MIME-Version: 1.0
From: Kok, Auke-jan H <auke-jan.h.kok at intel.com>
Subject: Re: [Powertop] [PATCH] Make ncurses dependency optional
Date: Thu, 19 Jul 2012 16:02:31 +0000
Message-ID: <CABsxX9+Hc2o7YqVcqZmUQBUdoaf7Ec2KmqwgRPJa2tjgt5o5kQ@mail.gmail.com>
In-Reply-To: 50082484.6060000@linux.intel.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============1370439699301381308==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 19, 2012 at 3:15 PM, Arjan van de Ven <arjan(a)linux.intel.com>=
 wrote:
> On 7/18/2012 11:26 PM, Igor Zhbanov wrote:
>> Arjan van de Ven wrote:
>>> On 7/18/2012 7:54 AM, Igor Zhbanov wrote:
>>>> Make ncurses dependency optional. Provide --without-ncurses option
>>>> to configure.
>>> I'm sorry but this patch is disgusting;
>>> PowerTOP uses ncurses. Really.
>>>
>>> crapping ifdefs all over the codebase to pretend it does not, we're just
>>> really not going to do that this way.
>> I agree that lots of #ifdefs are ugly. But some mobile platforms doesn't
>> have ncurses.
>
> then maybe those mobile platforms should add ncurses?
>
> I did not realize Tizen lacked ncurses for example, sounds daft to be
> honest.

it doesn't:

https://review.tizen.org/git/?p=3Dpkgs/n/ncurses.git

Auke

--===============1370439699301381308==--

