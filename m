Content-Type: multipart/mixed; boundary="===============9210985560870413292=="
MIME-Version: 1.0
From: Alexandra Yates <alexandra.yates at linux.intel.com>
Subject: Re: [Powertop] [PATCH v3 06/31] report-html: summary list and
 navigation
Date: Tue, 10 Dec 2013 16:32:14 -0800
Message-ID: <55383.10.7.198.70.1386721934.squirrel@linux.intel.com>
In-Reply-To: 20131210195341.GA2422@swordfish
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============9210985560870413292==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


> On (11/18/13 12:26), Alexandra Yates wrote:
>> Generates the html tags to add navigation and summary including css
>> attribute support.
>>
>> Signed-off-by: Alexandra Yates <alexandra.yates(a)linux.intel.com>
>> ---
>>  src/report/report-formatter-html.cpp |   18 ++++++++++++++++++
>>  src/report/report-formatter-html.h   |    2 ++
>>  2 files changed, 20 insertions(+)
>>
>> diff --git a/src/report/report-formatter-html.cpp
>> b/src/report/report-formatter-html.cpp
>> index 2e59725..93a4c48 100644
>> --- a/src/report/report-formatter-html.cpp
>> +++ b/src/report/report-formatter-html.cpp
>> @@ -516,3 +516,21 @@ report_formatter_html::add_title(struct tag_attr
>> *title_att, const char *title)
>>  	addf_exact("<h2 class=3D\"%s\"> %s </h2>\n", title_att->css_class,
>> title);
>>  }
>>
>> +void
>> +report_formatter_html::add_navigation()
>> +{
>> +	add_exact("<br/><nav id=3D\"main_menu\"> </nav>\n");
>> +}
>> +
>> +void
>> +report_formatter_html::add_summary_list(std::string *list, int size)
>> +{
>> +	int i;
>> +	add_exact("<div><br/> <ul>\n");
>> +	for (i=3D0; i < size; i+=3D2){
>
>
> summary list is guaranteed to contain `2 * n' elements?
>
> 	-ss
>
>> +		addf_exact("<li class=3D\"summary_list\"> <b> %s </b> %s </li>",
>> +				list[i].c_str(), list[i+1].c_str());
>> +	}
>> +	add_exact("</ul> </div> <br />\n");
>> +}
>> +
>> diff --git a/src/report/report-formatter-html.h
>> b/src/report/report-formatter-html.h
>> index 0f508d3..261e0dd 100644
>> --- a/src/report/report-formatter-html.h
>> +++ b/src/report/report-formatter-html.h
>> @@ -89,6 +89,8 @@ public:
>>  	void add_div(struct tag_attr *div_attr);
>>  	void end_div();
>>  	void add_title(struct tag_attr *title_att, const char *title);
>> +	void add_navigation();
>> +	void add_summary_list(std::string *list, int size);
>>
>>  private:
>>  	/* Document structure related functions */
>> --
>> 1.7.9.5
>>
>> _______________________________________________
>> PowerTop mailing list
>> PowerTop(a)lists.01.org
>> https://lists.01.org/mailman/listinfo/powertop
>>
>
Yes.

Thank you,
Alexandra.

--===============9210985560870413292==--

