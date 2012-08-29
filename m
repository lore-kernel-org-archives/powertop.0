Content-Type: multipart/mixed; boundary="===============6281871476134313447=="
MIME-Version: 1.0
From: Igor Zhbanov <i.zhbanov at samsung.com>
Subject: Re: [Powertop] Support for printing report in text format in
 powertop2.x
Date: Wed, 29 Aug 2012 18:40:45 +0400
Message-ID: <503E29ED.8050803@samsung.com>
In-Reply-To: 503E26F1.1000408@linux.intel.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============6281871476134313447==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Arjan van de Ven wrote:
> On 8/28/2012 11:16 PM, Viresh Kumar wrote:
>> Hi Guys,
>>
>> I have following test case, i need to capture data using powertop
>> for some time and then analyse it.
>>
>> There are two formats in which this is done as of today
>> - html
>> - csv
> the CSV format is there for automatic (machine) analysis
>
> is that not good enough for some reason ?
It is good. But it is bad-formatted, so no one standard parser could parse =
it.
It contains unquoted empty values like , , ,
Also it doesn't escape double quote symbols inside the values.

It doesn't escape commas inside the values. This is especially important fo=
r some locales
where comma is used as decimal separator in floating-point numbers. So I pr=
efer to run PowerTOP
like this:
LC_NUMERIC=3Den ./powertop ...

It doesn't escape space characters inside the values.
It lefts hanging commas in the end of the string.
Etc.

So the CSV-report of the PowerTOP doesn't conform to any CSV standards.

-- =

Best regards,
Igor Zhbanov,
Expert Software Engineer,
phone: +7 (495) 797 25 00 ext 3806
e-mail: i.zhbanov(a)samsung.com

ASWG, Moscow R&D center, Samsung Electronics
12 Dvintsev street, building 1
127018, Moscow, Russian Federation


--===============6281871476134313447==--

