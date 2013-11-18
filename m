Content-Type: multipart/mixed; boundary="===============7204327667564507104=="
MIME-Version: 1.0
From: Igor Zhbanov <i.zhbanov at samsung.com>
Subject: Re: [Powertop] [PATCH v2 25/31] report: fixed empty SW settings in
 need	of tunning
Date: Mon, 18 Nov 2013 19:06:04 +0400
Message-ID: <528A2CDC.2000905@samsung.com>
In-Reply-To: 1384561758-21516-26-git-send-email-alexandra.yates@linux.intel.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============7204327667564507104==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Alexandra,


Alexandra Yates wrote:
> After tunning the sistem the Software Setings in Need of Tunning table
> appreared empty. Added a conditional statement to print the table only
> when there are software settings  in need of tunning.
>
> Signed-off-by: Alexandra Yates <alexandra.yates(a)linux.intel.com>
> ---
>   src/tuning/tuning.cpp |   65 ++++++++++++++++++++++++++----------------=
-------
>   1 file changed, 35 insertions(+), 30 deletions(-)
>
> diff --git a/src/tuning/tuning.cpp b/src/tuning/tuning.cpp
> index ac479a2..67d604f 100644
> --- a/src/tuning/tuning.cpp
> +++ b/src/tuning/tuning.cpp
...
> @@ -257,12 +267,7 @@ void report_show_tunables(void)
>   		untunable_data[i+1]=3D string(all_untunables[i]->description());
>   =

>   	/* Report Output */
> -<<<<<<< HEAD
> -	report.add_div(&div_attr);
>   	report.add_title(&title_attr,__("Untunable Software Issues"));
> -=3D=3D=3D=3D=3D=3D=3D
> -	report.add_title(&title_attr,"Untunable Software Issues");
> ->>>>>>> 4d9b82e... report-html: fixed not hidding sections errors
>   	report.add_table(untunable_data, &tune_table_css);

Here is some garbage after merge.

>   =

>   	/* Third Table */

-- =

Best regards,
Igor Zhbanov,
Expert Software Engineer,
phone: +7 (495) 797 25 00 ext 3981
e-mail: i.zhbanov(a)samsung.com

Mobile group, Moscow R&D center, Samsung Electronics
12 Dvintsev street, building 1
127018, Moscow, Russian Federation


--===============7204327667564507104==--

