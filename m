Content-Type: multipart/mixed; boundary="===============2804645285146746471=="
MIME-Version: 1.0
From: Alexandra Yates <alexandra.yates at linux.intel.com>
Subject: Re: [Powertop] [PATCH 19/29] report: redesign System Information
 csv	and html
Date: Thu, 31 Oct 2013 13:27:22 -0700
Message-ID: <52741.10.252.131.237.1383251242.squirrel@linux.intel.com>
In-Reply-To: 52720838.7080106@samsung.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============2804645285146746471==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


> Hi Alexandra,
>
> Alexandra Yates wrote:
>> Enabled "System Information" section for csv and html report design.
>>
>> Signed-off-by: Alexandra Yates <alexandra.yates(a)linux.intel.com>
>> ---
>>   src/process/do_process.cpp      |  113
>> ++++++++++++++++++++++-----------------
>>   src/report/report-data-html.cpp |   11 +++-
>>   src/report/report-data-html.h   |    2 +
>>   3 files changed, 77 insertions(+), 49 deletions(-)
>>
>> diff --git a/src/process/do_process.cpp b/src/process/do_process.cpp
>> index 6708f12..c50fdd3 100644
>> --- a/src/process/do_process.cpp
>> +++ b/src/process/do_process.cpp
>> @@ -889,42 +889,48 @@ void report_process_update_display(void)
> ...
>>
>> -	report.begin_section(SECTION_SOFTWARE);
>> -	report.add_header(__("Overview of Software Power Consumers"));
>> -	report.begin_table(TABLE_WIDE);
>> -	report.begin_row();
>> -	if (show_power) {
>> -		report.begin_cell(CELL_SOFTWARE_HEADER);
>> -		report.add(__("Power est."));
>> -	}
>> +	/* Set Table attributes, rows, and cols */
>> +	cols=3D7;
>> +	if (show_power)
>> +		cols=3D8;
>>
>> -	report.begin_cell(CELL_SOFTWARE_HEADER);
>> -	report.add(__("Usage"));
>> -	report.begin_cell(CELL_SOFTWARE_HEADER);
>> -	report.add(__("Wakeups/s"));
>> -	report.begin_cell(CELL_SOFTWARE_HEADER);
>> -	report.add(__("GPU ops/s"));
>> -	report.begin_cell(CELL_SOFTWARE_HEADER);
>> -	report.add(__("Disk IO/s"));
>> -	report.begin_cell(CELL_SOFTWARE_HEADER);
>> -	report.add(__("GFX Wakeups/s"));
>> -	report.begin_cell(CELL_SOFTWARE_PROCESS);
>> -	report.add(__("Category"));
>> -	report.begin_cell(CELL_SOFTWARE_DESCRIPTION);
>> -	report.add(__("Description"));
> ...
>> +	/* Set array of data in row Major order */
>> +	string  software_data[cols * rows];
>> +	software_data[0]=3D"Usage";
>> +	software_data[1]=3D"Wakeups/s";
>> +	software_data[2]=3D"GPU ops/s";
>> +	software_data[3]=3D"Disk IO/s";
>> +	software_data[4]=3D"GFX Wakeups/s";
>> +	software_data[5]=3D"Category";
>> +	software_data[6]=3D"Description";
>> +
>> +	if (show_power)
>> +		software_data[7]=3D"PW Estimate";
>>
> Didn't you miss the __(...) macro here? This macro is used for localizing
> strings to produce reports on another languages too.
>
> Thank you.
>
> --
> Best regards,
> Igor Zhbanov,
> Expert Software Engineer,
> phone: +7 (495) 797 25 00 ext 3981
> e-mail: i.zhbanov(a)samsung.com
>
> Mobile group, Moscow R&D center, Samsung Electronics
> 12 Dvintsev street, building 1
> 127018, Moscow, Russian Federation
>
> _______________________________________________
> PowerTop mailing list
> PowerTop(a)lists.01.org
> https://lists.01.org/mailman/listinfo/powertop
>

Hi Igor,

I totally missed that macro, I will correct and recheck all the other
patches to ensure they all meet the requirement.

Thank you,
Alexandra.

--===============2804645285146746471==--

