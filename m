Content-Type: multipart/mixed; boundary="===============3010554928942317471=="
MIME-Version: 1.0
From: Igor Zhbanov <i.zhbanov at samsung.com>
Subject: Re: [Powertop] Support for printing report in text format in
 powertop2.x
Date: Wed, 29 Aug 2012 10:59:08 +0400
Message-ID: <503DBDBC.1020801@samsung.com>
In-Reply-To: CAOh2x=nmJYnz1JT=m8KUU=Lj9iRn__Xt-uua9RReqfioXn+gOw@mail.gmail.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============3010554928942317471==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi everyone!

Viresh Kumar wrote:

> I have following test case, i need to capture data using powertop
> for some time and then analyse it.
>
> There are two formats in which this is done as of today
> - html
> - csv
>
> I believe we must also have a plain text version for it. Any cons
> of that?

I agree with that. Also I think that report system with many places like:

if (html)
	printf(something);
else
	printf(nearly-the-same);

that needs to be redesigned. I use something like CSV-generator in my
yet to be merged MALI GPU support patch because generated CVS's doesn't
conform to any CSV standards: there are no quotes for empty values,
also quote symbols are not escaped inside the values. Commas are not escape=
d too. So it is impossible to parse generated CSV's with
traditional parsers.

I think that we could design generalized reporting system that could
output data in any desired format (HTML, CSV and probably TXT).

Since all results are contained inside the tables, that system could have i=
nterface like
create_report(type);
report.add_table(...);
report.add_column_name(const char *name, bool last_in_line =3D false);
report.add_column_val(const char *value, bool last_in_line =3D false);
report.get_result();

Now there are a lots of code like that:

if (reporttype)
	fprintf(reportout.http_report,
		"<tr class=3D\"%s\"><td class=3D\"process_power\">%s</td><td class=3D\"pr=
ocess_power\">%s</td><td class=3D\"process_power\">%s</td><td>%s</td><td>%s=
</td></tr>\n",
		process_class(lines), power, usage, events, name, pretty_print(all_power[=
i]->description(), descr, 128));
else
	fprintf(reportout.csv_report,
		"%s,%s,%s,%s,%s \n",
		power, usage, events, name, pretty_print(all_power[i]->description(), des=
cr, 128));

I think that we could separate CSV/HTML generation code from processing log=
ic. What you think?

-- =

Best regards,
Igor Zhbanov,
Expert Software Engineer,
phone: +7 (495) 797 25 00 ext 3806
e-mail: i.zhbanov(a)samsung.com

ASWG, Moscow R&D center, Samsung Electronics
12 Dvintsev street, building 1
127018, Moscow, Russian Federation


--===============3010554928942317471==--

