Content-Type: multipart/mixed; boundary="===============0883720277131585905=="
MIME-Version: 1.0
From: Sergey Senozhatsky <sergey.senozhatsky at gmail.com>
Subject: Re: [Powertop] Deletion of unnecessary checks before specific
 function calls
Date: Wed, 22 Oct 2014 21:27:54 +0900
Message-ID: <20141022122754.GB950@swordfish>
In-Reply-To: 5442EEB5.2030601@users.sourceforge.net
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============0883720277131585905==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On (10/19/14 00:50), SF Markus Elfring wrote:
> Date: Sun, 19 Oct 2014 00:50:29 +0200
> From: SF Markus Elfring <elfring(a)users.sourceforge.net>
> To: powertop(a)lists.01.org
> Subject: [Powertop] Deletion of unnecessary checks before specific functi=
on
>  calls
> User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:31.0) Gecko/20100101
>  Thunderbird/31.2.0
> =

> Hello,
> =

> I suggest to delete redundant checks for null pointers.
> Would you like to integrate the attached update suggestion into your sour=
ce code
> repository?
> =

> Regards,
> Markus

makes sense.

	-ss

> From 1f7809ae8d1e4a14ad0f7a812e4f797f65597d1a Mon Sep 17 00:00:00 2001
> From: Markus Elfring <elfring(a)users.sourceforge.net>
> Date: Sun, 19 Oct 2014 00:30:53 +0200
> Subject: [PATCH 1/2] Deletion of unnecessary checks before calls of the
>  function "free"
> =

> The function "free" is documented in the way that no action shall occur f=
or
> a passed null pointer. It is therefore not needed that a function caller
> repeats a corresponding check.
> http://stackoverflow.com/questions/18775608/free-a-null-pointer-anyway-or=
-check-first
> =

> Signed-off-by: Markus Elfring <elfring(a)users.sourceforge.net>
> ---
>  src/devlist.cpp          | 9 +++------
>  src/perf/perf.cpp        | 6 ++----
>  traceevent/event-parse.c | 3 +--
>  3 files changed, 6 insertions(+), 12 deletions(-)
> =

> diff --git a/src/devlist.cpp b/src/devlist.cpp
> index 20fe5da..7f599ac 100644
> --- a/src/devlist.cpp
> +++ b/src/devlist.cpp
> @@ -77,18 +77,15 @@ void clean_open_devices()
>  	unsigned int i=3D0;
>  =

>  	for (i =3D 0; i < one.size(); i++) {
> -		if(one[i])
> -			free(one[i]);
> +		free(one[i]);
>  	}
>  =

>  	for (i =3D 0; i < two.size(); i++) {
> -		if(two[i])
> -			free(two[i]);
> +		free(two[i]);
>  	}
>  =

>  	for (i =3D 0; i < devpower.size(); i++){
> -		if(devpower[i])
> -			free(devpower[i]);
> +		free(devpower[i]);
>  	}
>  }
>  =

> diff --git a/src/perf/perf.cpp b/src/perf/perf.cpp
> index b176256..b1103a7 100644
> --- a/src/perf/perf.cpp
> +++ b/src/perf/perf.cpp
> @@ -149,8 +149,7 @@ void perf_event::create_perf_event(char *eventname, i=
nt _cpu)
>  =

>  void perf_event::set_event_name(const char *event_name)
>  {
> -	if (name)
> -		free(name);
> +	free(name);
>  	name =3D strdup(event_name);
>  	if (!name) {
>  		fprintf(stderr, "failed to allocate event name\n");
> @@ -168,8 +167,7 @@ void perf_event::set_event_name(const char *event_nam=
e)
>  =

>  perf_event::~perf_event(void)
>  {
> -	if (name)
> -		free(name);
> +	free(name);
>  =

>  	if (perf_event::pevent->ref_count =3D=3D 1) {
>  		pevent_free(perf_event::pevent);
> diff --git a/traceevent/event-parse.c b/traceevent/event-parse.c
> index 6195f6f..5a717a0 100644
> --- a/traceevent/event-parse.c
> +++ b/traceevent/event-parse.c
> @@ -1023,8 +1023,7 @@ static enum event_type force_token(const char *str,=
 char **tok)
>  =

>  static void free_token(char *tok)
>  {
> -	if (tok)
> -		free(tok);
> +	free(tok);
>  }
>  =

>  static enum event_type read_token(char **tok)
> -- =

> 2.1.2
> =


> From 4237084ad74a1370617f60f1146fb9e59221f970 Mon Sep 17 00:00:00 2001
> From: Markus Elfring <elfring(a)users.sourceforge.net>
> Date: Sun, 19 Oct 2014 00:40:20 +0200
> Subject: [PATCH 2/2] Removal of unnecessary checks before a few calls of =
the
>  C++ delete operator
> =

> The C++ delete operator can also handle passed null pointers on its own
> without unexpected side effects.
> http://www.parashift.com/c++-faq/delete-handles-null.html
> =

> It is therefore not needed to keep additional safety checks directly befo=
re
> such function calls.
> =

> Signed-off-by: Markus Elfring <elfring(a)users.sourceforge.net>
> ---
>  src/cpu/abstract_cpu.cpp    | 6 ++----
>  src/report/report-maker.cpp | 6 ++----
>  2 files changed, 4 insertions(+), 8 deletions(-)
> =

> diff --git a/src/cpu/abstract_cpu.cpp b/src/cpu/abstract_cpu.cpp
> index 3b841bf..a3a9ffa 100644
> --- a/src/cpu/abstract_cpu.cpp
> +++ b/src/cpu/abstract_cpu.cpp
> @@ -34,14 +34,12 @@ abstract_cpu::~abstract_cpu()
>  {
>  	unsigned int i=3D0;
>  	for (i=3D0; i < cstates.size(); i++){
> -		if(cstates[i])
> -			delete cstates[i];
> +		delete cstates[i];
>  	}
>  	cstates.clear();
>  =

>  	for (i=3D0; i < pstates.size(); i++){
> -		if(pstates[i])
> -			delete pstates[i];
> +		delete pstates[i];
>  	}
>  	pstates.clear();
>  }
> diff --git a/src/report/report-maker.cpp b/src/report/report-maker.cpp
> index f2fe522..4049a54 100644
> --- a/src/report/report-maker.cpp
> +++ b/src/report/report-maker.cpp
> @@ -47,8 +47,7 @@ report_maker::report_maker(report_type t)
>  =

>  report_maker::~report_maker()
>  {
> -	if (formatter)
> -		delete formatter;
> +	delete formatter;
>  }
>  =

>  /* *********************************************************************=
*** */
> @@ -98,8 +97,7 @@ report_maker::set_type(report_type t)
>  void
>  report_maker::setup_report_formatter()
>  {
> -	if (formatter)
> -		delete formatter;
> +	delete formatter;
>  =

>  	if (type =3D=3D REPORT_HTML)
>  		formatter =3D new report_formatter_html();
> -- =

> 2.1.2
> =


> _______________________________________________
> PowerTop mailing list
> PowerTop(a)lists.01.org
> https://lists.01.org/mailman/listinfo/powertop


--===============0883720277131585905==--

