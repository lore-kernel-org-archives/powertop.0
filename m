Content-Type: multipart/mixed; boundary="===============4660754750944873266=="
MIME-Version: 1.0
From: Sergey Senozhatsky <sergey.senozhatsky at gmail.com>
Subject: Re: [Powertop] [RFC][PATCH 1/2] Adding report generator facility
Date: Thu, 04 Oct 2012 14:17:17 -0700
Message-ID: <20121004211717.GB3333@swordfish.datadirect.datadirectnet.com>
In-Reply-To: 1349283900-26721-1-git-send-email-i.zhbanov@samsung.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============4660754750944873266==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On (10/03/12 21:05), Igor Zhbanov wrote:
> +
> +#include "report-maker.h"
> +
> +class report_formatter /* Interface */
> +{
> +public:
> +	virtual void finish_report() =3D 0;
> +	virtual const char *get_result() =3D 0;
> +	virtual void clear_result() =3D 0;
> +
> +	virtual void add(const char *str) =3D 0;
> +	virtual void addv(const char *fmt, va_list ap) =3D 0;
> +
> +	virtual void add_header(const char *header, int level) =3D 0;
> +
> +	virtual void begin_section(section_type stype) =3D 0;
> +	virtual void end_section() =3D 0;
> +
> +	virtual void begin_table(table_type ttype) =3D 0;
> +	virtual void end_table() =3D 0;
> +
> +	virtual void begin_row(row_type rtype) =3D 0;
> +	virtual void end_row() =3D 0;
> +
> +	virtual void begin_cell(cell_type ctype) =3D 0;
> +	virtual void end_cell() =3D 0;
> +	virtual void add_empty_cell() =3D 0;
> +
> +	virtual void begin_paragraph() =3D 0;
> +	virtual void end_paragraph() =3D 0;
> +
> +	/* For quad-colouring CPU tables in HTML */
> +	virtual void set_cpu_number(int nr) =3D 0;
> +};
> +

it's better have a destructor in abstract class.

	-ss

--===============4660754750944873266==--

