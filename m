Content-Type: multipart/mixed; boundary="===============7547509798016399131=="
MIME-Version: 1.0
From: Sergey Senozhatsky <sergey.senozhatsky at gmail.com>
Subject: Re: [Powertop] [RFC][PATCH 2/2] Convert powertop to use new report
 generator facility
Date: Mon, 08 Oct 2012 11:32:27 -0700
Message-ID: <20121008183227.GA3120@swordfish.datadirect.datadirectnet.com>
In-Reply-To: 507319DF.5000607@linux.intel.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============7547509798016399131==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On (10/08/12 11:22), Chris Ferron wrote:
> =

> #1 I noticed that the scripts section of Software Settings in need of
> Tuning is missing. I see the nice header, but not data.
> #2 C0 active table cells are not aligned , and the CPU's are also not
> aligned correctly in the Processor Idle state report section.
> #3 I get some warning compiling, I know PowerTOP is not warning less,
> but would like to attempt to prevent adding more. (and fixing exiting
> ones of course)
> report/report-maker.cpp: In destructor =E2=80=98report_maker::~report_mak=
er()=E2=80=99:
> report/report-maker.cpp:51:10: warning: deleting object of abstract
> class type =E2=80=98report_formatter=E2=80=99 which has non-virtual destr=
uctor will
> cause undefined behaviour [-Wdelete-non-virtual-dtor]
> report/report-maker.cpp: In member function =E2=80=98void
> report_maker::setup_report_formatter()=E2=80=99:
> report/report-maker.cpp:110:10: warning: deleting object of abstract
> class type =E2=80=98report_formatter=E2=80=99 which has non-virtual destr=
uctor will
> cause undefined behaviour [-Wdelete-non-virtual-dtor]
>


#3 is fixed already.

	-ss

 =

> #4 report[c,h] should probable just go in your new sub/dir (report).
> #5 csv report has alignment issues for both the cpu Idle and Freq.
> Even if they are machine readable, they need to be easily parsed
> using open office or MS excel and look aligned with the http report.
> =

> other issues are small and can be attended to in the future, or have
> been already expressed.
> =

> Thanks
> -C
>=20

--===============7547509798016399131==--

