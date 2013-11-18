Content-Type: multipart/mixed; boundary="===============5970113758754124678=="
MIME-Version: 1.0
From: Igor Zhbanov <i.zhbanov at samsung.com>
Subject: Re: [Powertop] [PATCH v2 24/31] report-html: fixed not hidding
 sections errors
Date: Mon, 18 Nov 2013 19:08:47 +0400
Message-ID: <528A2D7F.10909@samsung.com>
In-Reply-To: 1384561758-21516-25-git-send-email-alexandra.yates@linux.intel.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============5970113758754124678==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Alexandra,


Alexandra Yates wrote:
> Removed multiple division when displaying more than one table on a
> section as it was the case of Device Info and Tuning sections. Now all
> sections display accordingly to the selected menu button.
>
> Signed-off-by: Alexandra Yates <alexandra.yates(a)linux.intel.com>
> ---
>   src/devices/device.cpp          |    4 ++--
>   src/devlist.cpp                 |    4 +---
>   src/powertop.css                |   19 +++++++++----------
>   src/report/report-data-html.cpp |   11 +++++++++++
>   src/report/report-data-html.h   |    4 ++++
>   src/tuning/tuning.cpp           |    9 +++++----
>   6 files changed, 32 insertions(+), 19 deletions(-)
>
...
> diff --git a/src/tuning/tuning.cpp b/src/tuning/tuning.cpp
> index 8a41114..ac479a2 100644
> --- a/src/tuning/tuning.cpp
> +++ b/src/tuning/tuning.cpp
...
> @@ -258,10 +257,13 @@ void report_show_tunables(void)
>   		untunable_data[i+1]=3D string(all_untunables[i]->description());
>   =

>   	/* Report Output */

Here is some garbage after merge.

> +<<<<<<< HEAD
>   	report.add_div(&div_attr);
>   	report.add_title(&title_attr,__("Untunable Software Issues"));
> +=3D=3D=3D=3D=3D=3D=3D
> +	report.add_title(&title_attr,"Untunable Software Issues");
> +>>>>>>> 4d9b82e... report-html: fixed not hidding sections errors
>   	report.add_table(untunable_data, &tune_table_css);
> -	report.end_div();
>   =

>   	/* Third Table */
>   	/* Set Table attributes, rows, and cols */
> @@ -283,7 +285,6 @@ void report_show_tunables(void)
>   		idx+=3D1;
>           }
>   	/* Report Output */
> -	report.add_div(&div_attr);
>   	report.add_title(&title_attr,__("Optimal Tuned Software Settings"));
>           report.add_table(tuned_data, &tune_table_css);
>           report.end_div();

-- =

Best regards,
Igor Zhbanov,
Expert Software Engineer,
phone: +7 (495) 797 25 00 ext 3981
e-mail: i.zhbanov(a)samsung.com

Mobile group, Moscow R&D center, Samsung Electronics
12 Dvintsev street, building 1
127018, Moscow, Russian Federation


--===============5970113758754124678==--

