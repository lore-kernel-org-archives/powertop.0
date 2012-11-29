Content-Type: multipart/mixed; boundary="===============4690164022983352136=="
MIME-Version: 1.0
From: Chris Ferron <chris.e.ferron at linux.intel.com>
Subject: Re: [Powertop] [PATCH] report: fixed crash when writing report to RO
 filesystem
Date: Thu, 29 Nov 2012 07:57:33 -0800
Message-ID: <50B785ED.6000505@linux.intel.com>
In-Reply-To: 1354117361-29155-1-git-send-email-jskarvad@redhat.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============4690164022983352136==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 11/28/2012 07:42 AM, Jaroslav =C5=A0karvada wrote:
> Signed-off-by: Jaroslav =C5=A0karvada <jskarvad(a)redhat.com>
> ---
>   src/report/report.cpp | 11 +++++++----
>   1 file changed, 7 insertions(+), 4 deletions(-)
>
> diff --git a/src/report/report.cpp b/src/report/report.cpp
> index 51bc6a7..c018bb1 100644
> --- a/src/report/report.cpp
> +++ b/src/report/report.cpp
> @@ -183,13 +183,16 @@ void init_report_output(char *filename_str, int ite=
rations)
>   =

>   void finish_report_output(void)
>   {
> -	fprintf(stderr, _("PowerTOP outputing using base filename %s\n"), repor=
tout.filename);
>   	if (reporttype =3D=3D REPORT_OFF)
>   		return;
>   =

>   	report.finish_report();
> -	fputs(report.get_result(), reportout.report_file);
> -	fdatasync(fileno(reportout.report_file));
> -	fclose(reportout.report_file);
> +	if (reportout.report_file)
> +	{
> +		fprintf(stderr, _("PowerTOP outputing using base filename %s\n"), repo=
rtout.filename);
> +		fputs(report.get_result(), reportout.report_file);
> +		fdatasync(fileno(reportout.report_file));
> +		fclose(reportout.report_file);
> +	}
>   	report.clear_result();
>   }
You patch has been merged.
Thank You
Chris


--===============4690164022983352136==--

