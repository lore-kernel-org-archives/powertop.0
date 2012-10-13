Content-Type: multipart/mixed; boundary="===============2839040181747626501=="
MIME-Version: 1.0
From: Sergey Senozhatsky <sergey.senozhatsky at gmail.com>
Subject: Re: [Powertop] [RFC][PATCH] Small rework on report formatter side
Date: Sat, 13 Oct 2012 06:31:28 -0700
Message-ID: <20121013133128.GA3041@swordfish>
In-Reply-To: 50781F22.3050805@samsung.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============2839040181747626501==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On (10/12/12 17:46), Igor Zhbanov wrote:
> He Sergey,
> =

> Sergey Senozhatsky wrote:
> =

> =

> 1)
> - "Basic report_formatter::get_resul call\n"
> + "basic_report_formatter::get_result call\n"
>

oops.

[..] =

> >+	virtual void end_paragraph() {};
> >+
> >+	/* For quad-colouring CPU tables in HTML */
> >+	virtual void set_cpu_number(int nr) {};
> >+};
> =

> 2) You don't need semicolon after closing bracket in class member inline =
definition in C++.
> =


ok.
AFAIK, it has been merged already, so I'll prepare fixes later (I'm in airp=
ort currently). =

Thanks!

	-ss

--===============2839040181747626501==--

