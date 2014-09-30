Content-Type: multipart/mixed; boundary="===============7159048468220446273=="
MIME-Version: 1.0
From: Alexandra Yates <alexandra.yates at linux.intel.com>
Subject: Re: [Powertop] [PATCH v3 05/15] fix clang++ compilation errors
Date: Mon, 29 Sep 2014 19:42:28 -0700
Message-ID: <56378.10.24.5.188.1412044948.squirrel@linux.intel.com>
In-Reply-To: 20140908194942.GA26566@rhlx01.hs-esslingen.de
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============7159048468220446273==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


> Hi,
>
> On Sun, Sep 07, 2014 at 02:28:11PM -0700, powertop-request(a)lists.01.org
> wrote:
>> Date: Sun,  7 Sep 2014 22:27:08 +0100
>> From: Sami Kerola <kerolasa(a)iki.fi>
>>
>> The same error was fixed in multiple files to made clang++ work.
>>
>> error: variable length array of non-POD element type 'string' (aka
>> 'basic_string<char>')
>>
>> Signed-off-by: Sami Kerola <kerolasa(a)iki.fi>
>
>> diff --git a/src/cpu/cpu.cpp b/src/cpu/cpu.cpp
>> index dbca20c..4e040c1 100644
>> --- a/src/cpu/cpu.cpp
>> +++ b/src/cpu/cpu.cpp
>> @@ -479,12 +479,12 @@ void report_display_cpu_cstates(void)
>>  		/* Tables for PKG, CORE, CPU */
>>  		pkg_tbl_size.cols=3D2;
>>  		pkg_tbl_size.rows=3D ((cstates_num+1)-LEVEL_HEADER)+1;
>> -		string pkg_data[pkg_tbl_size.cols * pkg_tbl_size.rows];
>> +		string *pkg_data =3D new string[pkg_tbl_size.cols * pkg_tbl_size.rows=
];
>>
>>  		core_tbl_size.cols=3D2;
>>  		core_tbl_size.rows=3D(cstates_num *_package->children.size())
>>  				+ _package->children.size();
>> -		string core_data[core_tbl_size.cols * core_tbl_size.rows];
>> +		string *core_data =3D new string[core_tbl_size.cols *
>> core_tbl_size.rows];
>>  		int num_cpus=3D0, num_cores=3D0;
>>
>>  		for (core =3D 0; core < _package->children.size(); core++) {
>> @@ -506,7 +506,7 @@ void report_display_cpu_cstates(void)
>>  		cpu_tbl_size.cols=3D(2 * (num_cpus / num_cores)) + 1;
>>  		cpu_tbl_size.rows =3D ((cstates_num+1-LEVEL_HEADER) *
>> _package->children.size())
>>  				+ _package->children.size();
>> -		string cpu_data[cpu_tbl_size.cols * cpu_tbl_size.rows];
>> +		string *cpu_data =3D new string[cpu_tbl_size.cols * cpu_tbl_size.rows=
];
>>
>>  		for (core =3D 0; core < _package->children.size(); core++) {
>>  			cpu_data[idx3]=3D"&nbsp;";
>> @@ -633,6 +633,9 @@ void report_display_cpu_cstates(void)
>>  		init_cpu_table_attr(&std_table_css, title+1, cpu_tbl_size.rows,
>>  				cpu_tbl_size.cols);
>>  		report.add_table(cpu_data, &std_table_css);
>> +		delete [] pkg_data;
>> +		delete [] core_data;
>> +		delete [] cpu_data;
>>  	}
>>  	report.end_div();
>>  }
>
> As a C++ developer with certain experience of sometimes (very) painful
> quality(the last VERY PAINFUL one less than 6 weeks ago...),
> I really wouldn't want to see open-coded, error-prone new/delete (or,
> heaven forbid, malloc/free used in C++ code) in new (pun not intended)
> code anywhere -
> nor non-scoped (omission-prone, return-hampered, exception-unsafe)
> handling
> of any other, possibly more critical resources (think locks, files, ...).
> Therefore I'd strongly recommend changing this patch
> into using properly scoped resource handling such as std::vector
> (std::array should also work, but since that is C++11 only
> I'd prefer std::vector).
> And possibly plus handling of std::bad_alloc cases, in this or outer
> scope...
>
>
> Put differently, one could even say
> that given an automated commit review system
> any appearance of new/delete should automatically make the review fail,
> with subsequent manual white-listing needed for the few rare cases
> that do really want to have it (think class-internal handling of
> resources,
> or some such).
>
>
> That said, thank you very much for enabling clang++ compatibility,
> and for all the other fixes!
> I had wanted to venture into such areas myself, too
> (e.g. for C++ diagnosis reasons), but simply haven't found the time yet.
>
> Andreas Mohr
> _______________________________________________
> PowerTop mailing list
> PowerTop(a)lists.01.org
> https://lists.01.org/mailman/listinfo/powertop
>

Andreas, feel free to submit a patch with this fix.

Thank you,
Alexandra.

--===============7159048468220446273==--

