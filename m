Content-Type: multipart/mixed; boundary="===============5713125224447862867=="
MIME-Version: 1.0
From: Igor Zhbanov <i.zhbanov at samsung.com>
Subject: Re: [Powertop] [RFC][PATCH 1/2] Adding report generator facility
Date: Tue, 09 Oct 2012 21:25:02 +0400
Message-ID: <50745DEE.5050707@samsung.com>
In-Reply-To: 20121008165743.GA21958@swordfish.datadirect.datadirectnet.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============5713125224447862867==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Sergey Senozhatsky wrote:

> - I think null formatter could be a basic class with default
> implementation (null) of virtual functions, rather than separate
> implementation of basic formatter interface (abstract class).

One more note.

In my opinion making an empty implementation of the functions
inside the interface class is not good.

The first reason, if now the programmer will forget to implement
some method of the abstract interface, the program will not compile,
instead of getting empty implementation and doing nothing.

Second, I don't like to mix all types of report formatters because some
of them would use string to hold the result, while another (probably XML)
could use tree for DOM implementation). And not every formatter need
escaping string function. So I have provides report_formatter_base
as a common part for CSV and HTML report formatters but not for
NULL formatter.

-- =

Best regards,
Igor Zhbanov,
Expert Software Engineer,
phone: +7 (495) 797 25 00 ext 3806
e-mail: i.zhbanov(a)samsung.com

ASWG, Moscow R&D center, Samsung Electronics
12 Dvintsev street, building 1
127018, Moscow, Russian Federation


--===============5713125224447862867==--

