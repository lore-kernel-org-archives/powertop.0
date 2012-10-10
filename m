Content-Type: multipart/mixed; boundary="===============0478149525582073751=="
MIME-Version: 1.0
From: Chris Ferron <chris.e.ferron at linux.intel.com>
Subject: Re: [Powertop] [RFC][PATCH 1/2] Adding report generator facility
Date: Wed, 10 Oct 2012 08:53:23 -0700
Message-ID: <507599F3.5080603@linux.intel.com>
In-Reply-To: 20121010153936.GA3196@swordfish
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============0478149525582073751==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 10/10/2012 08:39 AM, Sergey Senozhatsky wrote:
> On (10/10/12 16:49), Igor Zhbanov wrote:
>> Sergey Senozhatsky wrote:
>>> On (10/09/12 21:25), Igor Zhbanov wrote:
>>>>> - I think null formatter could be a basic class with default
>>>>> implementation (null) of virtual functions, rather than separate
>>>>> implementation of basic formatter interface (abstract class).
>>>> One more note.
>>>>
>>>> In my opinion making an empty implementation of the functions
>>>> inside the interface class is not good.
>>>>
>>>> The first reason, if now the programmer will forget to implement
>>>> some method of the abstract interface, the program will not compile,
>>>> instead of getting empty implementation and doing nothing.
>>> yes, this is valid point, but at the same time also one of the reasons =
we have commit
>>> review ;-)
>>>> Second, I don't like to mix all types of report formatters because some
>>>> of them would use string to hold the result, while another (probably X=
ML)
>>>> could use tree for DOM implementation). And not every formatter need
>>>> escaping string function. So I have provides report_formatter_base
>>>> as a common part for CSV and HTML report formatters but not for
>>>> NULL formatter.
>>> in my example I don't think we mix anything. we just define a sub-set o=
f common
>>> funictions and implementations via base_impl classes. while this looks =
like a win
>>> for current case (2 clases using string storage, so no code duplication=
), it may be
>>> not as cool if every formatter class would use different data storage t=
ype:
>>> xml, json, proto buff, whatever.
>> I think that if other formatters would have something common, then we wi=
ll
>> create another base class for them, e.g. DOM-based storage. And it could=
 be
>> that these formatters will not need to use string storage and related
>> functions.
>>
>> I have tried to make classes simple as possible without unneeded members.
>> So I use the abstract interface that every formatter must implement.
>> And so I have used one base class for CSV and HTML formatters that
>> implements
>> common part of them (related to string storage).
>> But there could be more base classes containing common parts of another
>> formatters.
>>
> yes, that's the idea. we don't force people to copy-paste code or re-impl=
ement
> something that already there, or define and implement empty interface's f=
unctions,
> we provide a set of _impl classes instead. looks not that bad, at least f=
or
> case of 2 basic_string storage classes.
>
>
> at this point let's commit the patches. we can revisit re-factoring/re-de=
sign
> part later since it's not that critical (at least this topic is not a com=
mit
> blocker to my mind).
I agree, but I would like to revisit.
For the most part all my tested issues seem to be fixed, with the =

exception to some alignment issues in the csv report.
The alignment is small and I won't hold up the patches due to the issue.
I will be merging the V2 patches now.
Thanks All
-C

>
> 	-ss
> _______________________________________________
> PowerTop mailing list
> PowerTop(a)lists.01.org
> https://lists.01.org/mailman/listinfo/powertop


--===============0478149525582073751==--

