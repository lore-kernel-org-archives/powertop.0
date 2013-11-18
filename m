Content-Type: multipart/mixed; boundary="===============4785482159192218306=="
MIME-Version: 1.0
From: Igor Zhbanov <i.zhbanov at samsung.com>
Subject: Re: [Powertop] [PATCH v2 03/31] html-report: add title and div tags
Date: Mon, 18 Nov 2013 11:36:14 +0400
Message-ID: <5289C36E.4050207@samsung.com>
In-Reply-To: 1384561758-21516-4-git-send-email-alexandra.yates@linux.intel.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============4785482159192218306==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Alexandra,

Alexandra Yates wrote:

...
> +void
> +report_formatter_html::add_div(struct tag_attr * div_attr)
> +{
> +	std::string empty=3D"";
> +	std::string tmp_str;
> +
> +	if (div_attr->css_class =3D=3D empty && div_attr->css_id =3D=3D empty)
> +	add_exact("<div>\n");
> +
> +	else if (div_attr->css_class =3D=3D empty && div_attr->css_id !=3D empt=
y)
> +	addf_exact("<div id=3D\"%s\">\n", div_attr->css_id);
> +
> +	else if (div_attr->css_class !=3D empty && div_attr->css_id =3D=3D empt=
y)
> +	addf_exact("<div class=3D\"%s\">\n", div_attr->css_class);
> +
> +	else if (div_attr->css_class !=3D empty && div_attr->css_id !=3D empty)
> +	addf_exact("<div class=3D\"%s\" id=3D\"%s\">\n", div_attr->css_class, d=
iv_attr->css_id);

Please use indentation like:

if (something)
	do_something();
else if (other)
	do_something else();

-- =

Best regards,
Igor Zhbanov,
Expert Software Engineer,
phone: +7 (495) 797 25 00 ext 3981
e-mail: i.zhbanov(a)samsung.com

Mobile group, Moscow R&D center, Samsung Electronics
12 Dvintsev street, building 1
127018, Moscow, Russian Federation


--===============4785482159192218306==--

