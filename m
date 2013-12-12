Content-Type: multipart/mixed; boundary="===============4394017342827794389=="
MIME-Version: 1.0
From: Sergey Senozhatsky <sergey.senozhatsky at gmail.com>
Subject: Re: [Powertop] [PATCH v3 18/31] report: CPU Frequency html & csv
Date: Thu, 12 Dec 2013 11:02:19 +0300
Message-ID: <20131212080219.GA2320@swordfish.minsk.epam.com>
In-Reply-To: 55741.10.7.198.65.1386788910.squirrel@linux.intel.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============4394017342827794389==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On (12/11/13 11:08), Alexandra Yates wrote:
> >> On (11/18/13 12:27), Alexandra Yates wrote:
[..]
> >>
> >>
> >> initialisation:
> >>
> >>        report.begin_section(SECTION_CPUFREQ);
> >>        report.add_header("Processor Frequency Report");
> >>
> >>        report.begin_table(TABLE_WIDE);
> >>
> >> vs
> >>
> >>        /* div attr css_class and css_id */
> >>        tag_attr div_attr;
> >>        init_div(&div_attr, "clear_block", "cpufreq");
> >>
> >>        /* Set Table attributes, rows, and cols */
> >>        table_attributes std_table_css;
> >>        table_size pkg_tbl_size;
> >>        table_size core_tbl_size;
> >>        table_size cpu_tbl_size;
> >>
> >>
> >>        /* Set Title attributes */
> >>        tag_attr title_attr;
> >>        init_title_attr(&title_attr);
> >>
> >>        /* Report add section */
> >>         report.add_div(&div_attr);
> >>         report.add_title(&title_attr, __("Processor Frequency Report")=
);
> >>
> >>         /* Set array of data in row Major order */
> >>        int idx1, idx2, idx3, num_cpus=3D0;
> >>         string tmp_str;
> >>
> >>
> >>
> >>
> >>
> >> reporter usage:
> >>
> >>
> >>          report.begin_cell(CELL_CORE_HEADER);
> >>          report.addf(__("Core %i"), _core->get_number());
> >>
> >> vs
> >>
> >>          core_data[idx2]=3D"";
> >>          idx2+=3D1;
> >>          sprintf(tmp_num,__("Core %d"),_core->get_number());
> >>          core_data[idx2]=3Dstring(tmp_num);
> >>          idx2+=3D1;
> >>
> >>
> >>
> >>
> >>
> >> and
> >>
> >>
> >>
> >>
> >>
> >>          report.begin_cell(CELL_STATE_NAME);
> >>          report.add(_core->fill_pstate_name(line, buffer));
> >>          report.begin_cell(CELL_PACKAGE_STATE_VALUE);
> >>          report.add(_core->fill_pstate_line(line, buffer2));
> >>
> >> vs
> >>
> >>          tmp_str=3Dstring(_core->fill_pstate_name(line, buffer));
> >>          core_data[idx2]=3D (tmp_str=3D=3D"" ? "&nbsp;" : tmp_str);
> >>          idx2+=3D1;
> >>          tmp_str=3Dstring(_core->fill_pstate_line(line, buffer2));
> >>          core_data[idx2]=3D (tmp_str=3D=3D"" ? "&nbsp;" : tmp_str);
> >>          idx2+=3D1;
> >>
> >>
> >> sorry, but the existing one really looks easier to follow and use.
> >> current
> >> reporter user
> >> cares less about reporter internall details.
> >>
[..]
> >
> > This is matter of opinion.   I found this module the most difficult to
> > manipulate in general because the complexity of the current code.
> >
> > If you look the other examples they are pretty straight forward.
> >
> > Thank you,
> > Alexandra.
> >
> =

> Hi Sergey,

Hi,

> I gave more thought at your feedback and you are right to bring attention
> to  the items here.  As I mentioned before during this iteration of
> changes I tried to reuse as much code as possible, therefore the current
> result is not optimal.

and saying that you pushed NACK-ed patchset to the master. there is a
`git branch' command for `incremental-make-it-ready-for-master' work.
my concerns are not about some fancy coding styles or my own opinion.
new reporter API simply asks for error. and you made off by one error
using your own `pretty straight forward' API.


[PATCH 19/31]

+       int show_power, cols, rows, idx;

[..]

+       cols=3D7;
+       if (show_power)
+               cols=3D8;

[..]

+       if (show_power)
+               software_data[7]=3D__("PW Estimate");
+
+       sort(all_power.begin(), all_power.end(), power_cpu_sort);
+       show_power =3D global_power_valid();

[..]

+               software_data[idx]=3Dstring(usage);
+               idx+=3D1;
+
+               software_data[idx]=3Dstring(wakes);
+               idx+=3D1;
+
+               software_data[idx]=3Dstring(gpus);
+               idx+=3D1;
+
+               software_data[idx]=3Dstring(disks);
+               idx+=3D1;
+
+               software_data[idx]=3Dstring(xwakes);
+               idx+=3D1;
+
+               software_data[idx]=3Dstring(name);
+               idx+=3D1;
+
+               software_data[idx]=3Dstring(pretty_print(all_power[i]->desc=
ription(), descr, 128));
+               idx+=3D1;
                if (show_power) {
-                       report.begin_cell(CELL_SOFTWARE_POWER);
-                       report.add(power);
+                       software_data[idx]=3Dstring(power);
+                       idx+=3D1;
                }



I'm not sure that powertop master now even works.

	-ss

> However, it is part of my plan to continue changing the UI code to remove
> clutter like the once you pointed.  But this changes will come in the next
> phase of development, because it will be more intrusive. The current
> changes  are incremental so that we have a chance to do testing in between
> the big changes of the UI.
> =

> Thank you again for taking the time to look at my code and your feedback,
> I will make sure to incorporate it as a requirement for phase two.
> =

> Alexandra.


--===============4394017342827794389==--

