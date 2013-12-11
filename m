Content-Type: multipart/mixed; boundary="===============7747624221863484969=="
MIME-Version: 1.0
From: Alexandra Yates <alexandra.yates at linux.intel.com>
Subject: Re: [Powertop] [PATCH v3 18/31] report: CPU Frequency html & csv
Date: Wed, 11 Dec 2013 11:08:30 -0800
Message-ID: <55741.10.7.198.65.1386788910.squirrel@linux.intel.com>
In-Reply-To: 63891.10.7.198.70.1386722193.squirrel@linux.intel.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============7747624221863484969==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


>
>> On (11/18/13 12:27), Alexandra Yates wrote:
>>> Enables html and csv report new stlyes for "CPU Frequency" section,
>>> While preserving translation macros.
>>>
>>> Signed-off-by: Alexandra Yates <alexandra.yates(a)linux.intel.com>
>>> ---
>>>  src/cpu/cpu.cpp |  139
>>> ++++++++++++++++++++++++++++++++++++++++---------------
>>>  1 file changed, 101 insertions(+), 38 deletions(-)
>>>
>>> diff --git a/src/cpu/cpu.cpp b/src/cpu/cpu.cpp
>>> index b8f74a8..c3787e6 100644
>>> --- a/src/cpu/cpu.cpp
>>> +++ b/src/cpu/cpu.cpp
>>> @@ -612,29 +612,81 @@ void report_display_cpu_cstates(void)
>>>
>>>  void report_display_cpu_pstates(void)
>>>  {
>>> -	char buffer[512], buffer2[512];
>>> +	char buffer[512], buffer2[512], tmp_num[50];
>>>  	unsigned int package, core, cpu;
>>>  	int line;
>>>  	class abstract_cpu *_package, * _core, * _cpu;
>>>  	unsigned int i, pstates_num;
>>>
>>> -	for (i =3D 0, pstates_num =3D 0; i < all_cpus.size(); i++)
>>> +	/* div attr css_class and css_id */
>>> +	tag_attr div_attr;
>>> +	init_div(&div_attr, "clear_block", "cpufreq");
>>> +
>>> +	/* Set Table attributes, rows, and cols */
>>> +	table_attributes std_table_css;
>>> +	table_size pkg_tbl_size;
>>> +	table_size core_tbl_size;
>>> +	table_size cpu_tbl_size;
>>> +
>>> +
>>> +	/* Set Title attributes */
>>> +	tag_attr title_attr;
>>> +	init_title_attr(&title_attr);
>>> +
>>> +	/* Report add section */
>>> +        report.add_div(&div_attr);
>>> +        report.add_title(&title_attr, __("Processor Frequency
>>> Report"));
>>> +
>>> +        /* Set array of data in row Major order */
>>> +	int idx1, idx2, idx3, num_cpus=3D0;
>>> +        string tmp_str;
>>> +
>>> +	for (i =3D 0, pstates_num =3D 0; i < all_cpus.size(); i++) {
>>>  		if (all_cpus[i])
>>>  			pstates_num =3D std::max<unsigned int>(pstates_num,
>>> -								all_cpus[i]->pstates.size());
>>> -
>>> -	report.begin_section(SECTION_CPUFREQ);
>>> -	report.add_header("Processor Frequency Report");
>>> +				all_cpus[i]->pstates.size());
>>> +	}
>>>
>>>  	for (package =3D 0; package < system_level.children.size(); package++)
>>> {
>>>  		bool first_core =3D true;
>>> +		idx1=3D0;
>>> +		idx2=3D0;
>>> +		idx3=3D0;
>>>
>>>  		_package =3D system_level.children[package];
>>>  		if (!_package)
>>>  			continue;
>>>
>>> -		report.begin_table(TABLE_WIDE);
>>> +		/*  Tables for PKG, CORE, CPU */
>>> +		pkg_tbl_size.cols=3D2;
>>> +		pkg_tbl_size.rows=3Dpstates_num+2;
>>> +		string pkg_data[pkg_tbl_size.cols * pkg_tbl_size.rows];
>>> +
>>> +		core_tbl_size.cols=3D2;
>>> +		core_tbl_size.rows=3D((pstates_num+2) *_package->children.size());
>>> +		string core_data[core_tbl_size.cols * core_tbl_size.rows];
>>> +
>>> +		/* PKG */
>>> +		num_cpus=3D0;
>>> +		for (core =3D 0; core < _package->children.size(); core++) {
>>> +			_core =3D _package->children[core];
>>> +			if (!_core)
>>> +				continue;
>>> +			for (cpu =3D 0; cpu < _core->children.size(); cpu++) {
>>> +				if (!_cpu)
>>> +				continue;
>>> +				_cpu =3D _core->children[cpu];
>>> +				num_cpus+=3D1;
>>> +			}
>>> +		}
>>> +		cpu_tbl_size.cols=3D num_cpus+1;
>>> +		cpu_tbl_size.rows=3D (pstates_num+2)* _package->children.size();
>>> +		string cpu_data[cpu_tbl_size.cols * cpu_tbl_size.rows];
>>> +
>>> +		/* Core */
>>>  		for (core =3D 0; core < _package->children.size(); core++) {
>>> +			cpu_data[idx3]=3D"&nbsp;";
>>> +			idx3+=3D1;
>>>  			_core =3D _package->children[core];
>>>  			if (!_core)
>>>  				continue;
>>> @@ -646,75 +698,86 @@ void report_display_cpu_pstates(void)
>>>  				bool first_cpu =3D true;
>>>
>>>  				if (!_package->has_pstate_level(line))
>>> -					continue;
>>> -
>>> -				report.begin_row();
>>> +				continue;
>>>
>>>  				buffer[0] =3D 0;
>>>  				buffer2[0] =3D 0;
>>>  				if (first_core) {
>>>  					if (line =3D=3D LEVEL_HEADER) {
>>> -						report.begin_cell(CELL_FIRST_PACKAGE_HEADER);
>>> -						report.addf(__("Package %i"), _package->get_number());
>>> +						pkg_data[idx1]=3D__("Package");
>>> +						idx1+=3D1;
>>> +						sprintf(tmp_num,"%d",  _package->get_number());
>>> +						pkg_data[idx1]=3D string(tmp_num);
>>> +						idx1+=3D1;
>>
>>
>> initialisation:
>>
>>        report.begin_section(SECTION_CPUFREQ);
>>        report.add_header("Processor Frequency Report");
>>
>>        report.begin_table(TABLE_WIDE);
>>
>> vs
>>
>>        /* div attr css_class and css_id */
>>        tag_attr div_attr;
>>        init_div(&div_attr, "clear_block", "cpufreq");
>>
>>        /* Set Table attributes, rows, and cols */
>>        table_attributes std_table_css;
>>        table_size pkg_tbl_size;
>>        table_size core_tbl_size;
>>        table_size cpu_tbl_size;
>>
>>
>>        /* Set Title attributes */
>>        tag_attr title_attr;
>>        init_title_attr(&title_attr);
>>
>>        /* Report add section */
>>         report.add_div(&div_attr);
>>         report.add_title(&title_attr, __("Processor Frequency Report"));
>>
>>         /* Set array of data in row Major order */
>>        int idx1, idx2, idx3, num_cpus=3D0;
>>         string tmp_str;
>>
>>
>>
>>
>>
>> reporter usage:
>>
>>
>>          report.begin_cell(CELL_CORE_HEADER);
>>          report.addf(__("Core %i"), _core->get_number());
>>
>> vs
>>
>>          core_data[idx2]=3D"";
>>          idx2+=3D1;
>>          sprintf(tmp_num,__("Core %d"),_core->get_number());
>>          core_data[idx2]=3Dstring(tmp_num);
>>          idx2+=3D1;
>>
>>
>>
>>
>>
>> and
>>
>>
>>
>>
>>
>>          report.begin_cell(CELL_STATE_NAME);
>>          report.add(_core->fill_pstate_name(line, buffer));
>>          report.begin_cell(CELL_PACKAGE_STATE_VALUE);
>>          report.add(_core->fill_pstate_line(line, buffer2));
>>
>> vs
>>
>>          tmp_str=3Dstring(_core->fill_pstate_name(line, buffer));
>>          core_data[idx2]=3D (tmp_str=3D=3D"" ? "&nbsp;" : tmp_str);
>>          idx2+=3D1;
>>          tmp_str=3Dstring(_core->fill_pstate_line(line, buffer2));
>>          core_data[idx2]=3D (tmp_str=3D=3D"" ? "&nbsp;" : tmp_str);
>>          idx2+=3D1;
>>
>>
>> sorry, but the existing one really looks easier to follow and use.
>> current
>> reporter user
>> cares less about reporter internall details.
>>
>> 	-ss
>>
>>
>>>  					} else {
>>> -						report.begin_cell(CELL_STATE_NAME);
>>> -						report.add(_package->fill_pstate_name(line, buffer));
>>> -						report.begin_cell(CELL_PACKAGE_STATE_VALUE);
>>> -						report.add(_package->fill_pstate_line(line, buffer2));
>>> +						tmp_str=3Dstring(_package->fill_pstate_name(line, buffer));
>>> +						pkg_data[idx1]=3D(tmp_str=3D=3D"" ? "&nbsp;" : tmp_str);
>>> +						idx1+=3D1;
>>> +						tmp_str=3Dstring(_package->fill_pstate_line(line, buffer2));
>>> +						pkg_data[idx1]=3D(tmp_str=3D=3D"" ? "&nbsp;" : tmp_str);
>>> +						idx1+=3D1;
>>>  					}
>>> -				} else {
>>> -					report.begin_cell(CELL_EMPTY_PACKAGE_STATE);
>>> -					report.add_empty_cell();
>>>  				}
>>>
>>> -				report.begin_cell(CELL_SEPARATOR);
>>> -				report.add_empty_cell();
>>>
>>>  				if (!_core->can_collapse()) {
>>>  					buffer[0] =3D 0;
>>>  					buffer2[0] =3D 0;
>>>  					if (line =3D=3D LEVEL_HEADER) {
>>> -						report.begin_cell(CELL_CORE_HEADER);
>>> -						report.addf(__("Core %i"), _core->get_number());
>>> +						core_data[idx2]=3D"";
>>> +						idx2+=3D1;
>>> +						sprintf(tmp_num,__("Core %d"),_core->get_number());
>>> +						core_data[idx2]=3Dstring(tmp_num);
>>> +						idx2+=3D1;
>>>  					} else {
>>> -						report.begin_cell(CELL_STATE_NAME);
>>> -						report.add(_core->fill_pstate_name(line, buffer));
>>> -						report.begin_cell(CELL_PACKAGE_STATE_VALUE);
>>> -						report.add(_core->fill_pstate_line(line, buffer2));
>>> +						tmp_str=3Dstring(_core->fill_pstate_name(line, buffer));
>>> +						core_data[idx2]=3D (tmp_str=3D=3D"" ? "&nbsp;" : tmp_str);
>>> +						idx2+=3D1;
>>> +						tmp_str=3Dstring(_core->fill_pstate_line(line, buffer2));
>>> +						core_data[idx2]=3D (tmp_str=3D=3D"" ? "&nbsp;" : tmp_str);
>>> +						idx2+=3D1;
>>>  					}
>>>  				}
>>>
>>> -				report.begin_cell(CELL_SEPARATOR);
>>> -				report.add_empty_cell();
>>> -
>>> +				/* CPU */
>>>  				for (cpu =3D 0; cpu < _core->children.size(); cpu++) {
>>>  					buffer[0] =3D 0;
>>>  					_cpu =3D _core->children[cpu];
>>>  					if (!_cpu)
>>>  						continue;
>>>
>>> -					report.set_cpu_number(cpu);
>>>  					if (line =3D=3D LEVEL_HEADER) {
>>> -						report.begin_cell(CELL_CPU_PSTATE_HEADER);
>>> -						report.addf(__("CPU %i"), _cpu->get_number());
>>> +						sprintf(tmp_num,__("CPU %d"),_cpu->get_number());
>>> +						cpu_data[idx3] =3D string(tmp_num);
>>> +						idx3+=3D1;
>>>  						continue;
>>>  					}
>>>
>>>  					if (first_cpu) {
>>> -						report.begin_cell(CELL_STATE_NAME);
>>> -						report.add(_cpu->fill_pstate_name(line, buffer));
>>> +						tmp_str=3Dstring(_cpu->fill_pstate_name(line, buffer));
>>> +						cpu_data[idx3]=3D(tmp_str=3D=3D"" ? "&nbsp;" : tmp_str);
>>> +						idx3+=3D1;
>>>  						first_cpu =3D false;
>>>  					}
>>>
>>>  					buffer[0] =3D 0;
>>> -					report.begin_cell(CELL_CPU_STATE_VALUE);
>>> -					report.add(_cpu->fill_pstate_line(line, buffer));
>>> +					tmp_str=3Dstring(_cpu->fill_pstate_line(line, buffer));
>>> +					cpu_data[idx3]=3D(tmp_str=3D=3D"" ? "&nbsp;" : tmp_str);
>>> +					idx3+=3D1;
>>>  				}
>>>  			}
>>> -
>>>  			first_core =3D false;
>>>  		}
>>> +		init_pkg_table_attr(&std_table_css, pkg_tbl_size.rows,
>>> pkg_tbl_size.cols);
>>> +		report.add_table(pkg_data, &std_table_css);
>>> +		init_core_table_attr(&std_table_css, (pstates_num+2),
>>> +				core_tbl_size.rows, core_tbl_size.cols);
>>> +		report.add_table(core_data, &std_table_css);
>>> +		init_cpu_table_attr(&std_table_css, (pstates_num+2),
>>> +				cpu_tbl_size.rows, cpu_tbl_size.cols);
>>> +		report.add_table(cpu_data, &std_table_css);
>>>  	}
>>> +	report.end_div();
>>>  }
>>>
>>>  void impl_w_display_cpu_states(int state)
>>> --
>>> 1.7.9.5
>>>
>>> _______________________________________________
>>> PowerTop mailing list
>>> PowerTop(a)lists.01.org
>>> https://lists.01.org/mailman/listinfo/powertop
>>>
>>
>
> This is matter of opinion.   I found this module the most difficult to
> manipulate in general because the complexity of the current code.
>
> If you look the other examples they are pretty straight forward.
>
> Thank you,
> Alexandra.
>

Hi Sergey,

I gave more thought at your feedback and you are right to bring attention
to  the items here.  As I mentioned before during this iteration of
changes I tried to reuse as much code as possible, therefore the current
result is not optimal.

However, it is part of my plan to continue changing the UI code to remove
clutter like the once you pointed.  But this changes will come in the next
phase of development, because it will be more intrusive. The current
changes  are incremental so that we have a chance to do testing in between
the big changes of the UI.

Thank you again for taking the time to look at my code and your feedback,
I will make sure to incorporate it as a requirement for phase two.

Alexandra.

--===============7747624221863484969==--

