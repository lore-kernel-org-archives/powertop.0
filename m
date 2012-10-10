Content-Type: multipart/mixed; boundary="===============3075871205945604226=="
MIME-Version: 1.0
From: Igor Zhbanov <i.zhbanov at samsung.com>
Subject: Re: [Powertop] [RFC][PATCH 1/2] Adding report generator facility
Date: Wed, 10 Oct 2012 16:49:01 +0400
Message-ID: <50756EBD.6000703@samsung.com>
In-Reply-To: 20121009191147.GC3633@swordfish
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============3075871205945604226==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Sergey Senozhatsky wrote:
> On (10/09/12 21:25), Igor Zhbanov wrote:
>>> - I think null formatter could be a basic class with default
>>> implementation (null) of virtual functions, rather than separate
>>> implementation of basic formatter interface (abstract class).
>> One more note.
>>
>> In my opinion making an empty implementation of the functions
>> inside the interface class is not good.
>>
>> The first reason, if now the programmer will forget to implement
>> some method of the abstract interface, the program will not compile,
>> instead of getting empty implementation and doing nothing.
> yes, this is valid point, but at the same time also one of the reasons we=
 have commit
> review ;-)
>> Second, I don't like to mix all types of report formatters because some
>> of them would use string to hold the result, while another (probably XML)
>> could use tree for DOM implementation). And not every formatter need
>> escaping string function. So I have provides report_formatter_base
>> as a common part for CSV and HTML report formatters but not for
>> NULL formatter.
> in my example I don't think we mix anything. we just define a sub-set of =
common
> funictions and implementations via base_impl classes. while this looks li=
ke a win
> for current case (2 clases using string storage, so no code duplication),=
 it may be
> not as cool if every formatter class would use different data storage typ=
e:
> xml, json, proto buff, whatever.
I think that if other formatters would have something common, then we will
create another base class for them, e.g. DOM-based storage. And it could be
that these formatters will not need to use string storage and related =

functions.

I have tried to make classes simple as possible without unneeded members.
So I use the abstract interface that every formatter must implement.
And so I have used one base class for CSV and HTML formatters that =

implements
common part of them (related to string storage).
But there could be more base classes containing common parts of another
formatters.

-- =

Best regards,
Igor Zhbanov,
Expert Software Engineer,
phone: +7 (495) 797 25 00 ext 3806
e-mail: i.zhbanov(a)samsung.com

ASWG, Moscow R&D center, Samsung Electronics
12 Dvintsev street, building 1
127018, Moscow, Russian Federation


--===============3075871205945604226==--

