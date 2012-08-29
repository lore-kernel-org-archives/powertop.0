Content-Type: multipart/mixed; boundary="===============8300813918421743639=="
MIME-Version: 1.0
From: Sergey Senozhatsky <sergey.senozhatsky at gmail.com>
Subject: Re: [Powertop] Support for printing report in text format in
 powertop2.x
Date: Thu, 30 Aug 2012 00:15:24 +0300
Message-ID: <20120829211524.GA3157@swordfish>
In-Reply-To: 503DBDBC.1020801@samsung.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============8300813918421743639==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On (08/29/12 10:59), Igor Zhbanov wrote:
> Hi everyone!
> =

> Viresh Kumar wrote:
> =

> >I have following test case, i need to capture data using powertop
> >for some time and then analyse it.
> >
> >There are two formats in which this is done as of today
> >- html
> >- csv
> >
> >I believe we must also have a plain text version for it. Any cons
> >of that?
> =

> I agree with that. Also I think that report system with many places like:
> =

> if (html)
> 	printf(something);
> else
> 	printf(nearly-the-same);
> =

> that needs to be redesigned. I use something like CSV-generator in my
> yet to be merged MALI GPU support patch because generated CVS's doesn't
> conform to any CSV standards: there are no quotes for empty values,
> also quote symbols are not escaped inside the values. Commas are not esca=
ped too. So it is impossible to parse generated CSV's with
> traditional parsers.
>

thanks a lot for reporting.


> I think that we could design generalized reporting system that could
> output data in any desired format (HTML, CSV and probably TXT).
>


no offense, but do we actually need that kind of flexibility?


	-ss

 =

> Since all results are contained inside the tables, that system could have=
 interface like
> create_report(type);
> report.add_table(...);
> report.add_column_name(const char *name, bool last_in_line =3D false);
> report.add_column_val(const char *value, bool last_in_line =3D false);
> report.get_result();
> =

> Now there are a lots of code like that:
> =

> if (reporttype)
> 	fprintf(reportout.http_report,
> 		"<tr class=3D\"%s\"><td class=3D\"process_power\">%s</td><td class=3D\"=
process_power\">%s</td><td class=3D\"process_power\">%s</td><td>%s</td><td>=
%s</td></tr>\n",
> 		process_class(lines), power, usage, events, name, pretty_print(all_powe=
r[i]->description(), descr, 128));
> else
> 	fprintf(reportout.csv_report,
> 		"%s,%s,%s,%s,%s \n",
> 		power, usage, events, name, pretty_print(all_power[i]->description(), d=
escr, 128));
> =

> I think that we could separate CSV/HTML generation code from processing l=
ogic. What you think?
> =

> -- =

> Best regards,
> Igor Zhbanov,
> Expert Software Engineer,
> phone: +7 (495) 797 25 00 ext 3806
> e-mail: i.zhbanov(a)samsung.com
> =

> ASWG, Moscow R&D center, Samsung Electronics
> 12 Dvintsev street, building 1
> 127018, Moscow, Russian Federation
> =

> _______________________________________________
> PowerTop mailing list
> PowerTop(a)lists.01.org
> https://lists.01.org/mailman/listinfo/powertop
>=20

--===============8300813918421743639==--

