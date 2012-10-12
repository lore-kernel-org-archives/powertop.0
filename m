Content-Type: multipart/mixed; boundary="===============5063305758221722712=="
MIME-Version: 1.0
From: Igor Zhbanov <i.zhbanov at samsung.com>
Subject: Re: [Powertop] [RFC][PATCH] Small rework on report formatter side
Date: Fri, 12 Oct 2012 17:46:10 +0400
Message-ID: <50781F22.3050805@samsung.com>
In-Reply-To: 20121010230322.GD4628@swordfish.datadirect.datadirectnet.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============5063305758221722712==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

He Sergey,

Sergey Senozhatsky wrote:

...

> ---
>   src/Makefile.am                      |   1 -
>   src/report/basic-report-formatter.h  |  65 +++++++++++++
>   src/report/report-formatter-base.cpp |  14 +--
>   src/report/report-formatter-base.h   |   4 +-
>   src/report/report-formatter-csv.cpp  |  42 --------
>   src/report/report-formatter-csv.h    |  10 +-
>   src/report/report-formatter-html.h   |   2 +-
>   src/report/report-formatter-null.cpp | 179 ----------------------------=
-------
>   src/report/report-formatter-null.h   |  66 -------------
>   src/report/report-formatter.h        |  65 -------------
>   src/report/report-maker.cpp          |   3 +-
>   src/report/report-maker.h            |   4 +-
>   12 files changed, 79 insertions(+), 376 deletions(-)
...
> +class basic_report_formatter
> +{
> +public:
> +	virtual ~basic_report_formatter() {}
> +
> +	virtual void finish_report() {};
> +	virtual const char *get_result() {return "Basic report_formatter::get_r=
esul call\n";};

1)
- "Basic report_formatter::get_resul call\n"
+ "basic_report_formatter::get_result call\n"

> +	virtual void clear_result() {};
> +
> +	virtual void add(const char *str) {};
> +	virtual void addv(const char *fmt, va_list ap) {};
> +
> +	virtual void add_header(const char *header, int level) {};
> +
> +	virtual void begin_section(section_type stype) {};
> +	virtual void end_section() {};
> +
> +	virtual void begin_table(table_type ttype) {};
> +	virtual void end_table() {};
> +
> +	virtual void begin_row(row_type rtype) {};
> +	virtual void end_row() {};
> +
> +	virtual void begin_cell(cell_type ctype) {};
> +	virtual void end_cell() {};
> +	virtual void add_empty_cell() {};
> +
> +	virtual void begin_paragraph() {};
> +	virtual void end_paragraph() {};
> +
> +	/* For quad-colouring CPU tables in HTML */
> +	virtual void set_cpu_number(int nr) {};
> +};

2) You don't need semicolon after closing bracket in class member inline de=
finition in C++.

-- =

Best regards,
Igor Zhbanov,
Expert Software Engineer,
phone: +7 (495) 797 25 00 ext 3806
e-mail: i.zhbanov(a)samsung.com

ASWG, Moscow R&D center, Samsung Electronics
12 Dvintsev street, building 1
127018, Moscow, Russian Federation


--===============5063305758221722712==--

