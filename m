Content-Type: multipart/mixed; boundary="===============7375590070941128597=="
MIME-Version: 1.0
From: Sergey Senozhatsky <sergey.senozhatsky at gmail.com>
Subject: Re: [Powertop] [RFC][PATCH 1/2] Adding report generator facility
Date: Tue, 09 Oct 2012 12:11:47 -0700
Message-ID: <20121009191147.GC3633@swordfish>
In-Reply-To: 50745DEE.5050707@samsung.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============7375590070941128597==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On (10/09/12 21:25), Igor Zhbanov wrote:
> >- I think null formatter could be a basic class with default
> >implementation (null) of virtual functions, rather than separate
> >implementation of basic formatter interface (abstract class).
> =

> One more note.
> =

> In my opinion making an empty implementation of the functions
> inside the interface class is not good.
> =

> The first reason, if now the programmer will forget to implement
> some method of the abstract interface, the program will not compile,
> instead of getting empty implementation and doing nothing.
>

yes, this is valid point, but at the same time also one of the reasons we h=
ave commit
review ;-)
 =

> Second, I don't like to mix all types of report formatters because some
> of them would use string to hold the result, while another (probably XML)
> could use tree for DOM implementation). And not every formatter need
> escaping string function. So I have provides report_formatter_base
> as a common part for CSV and HTML report formatters but not for
> NULL formatter.
> =


in my example I don't think we mix anything. we just define a sub-set of co=
mmon
funictions and implementations via base_impl classes. while this looks like=
 a win
for current case (2 clases using string storage, so no code duplication), i=
t may be
not as cool if every formatter class would use different data storage type: =

xml, json, proto buff, whatever.


	-ss

--===============7375590070941128597==--

