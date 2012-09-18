Content-Type: multipart/mixed; boundary="===============2729113143585514131=="
MIME-Version: 1.0
From: Arjan van de Ven <arjan at linux.intel.com>
Subject: Re: [Powertop] [PATCH 1/2] perf_bundle: Check memory allocation
 failure
Date: Tue, 18 Sep 2012 07:25:06 -0700
Message-ID: <50588442.7040404@linux.intel.com>
In-Reply-To: 1347978063-10119-1-git-send-email-namhyung@gmail.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============2729113143585514131==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 9/18/2012 7:21 AM, Namhyung Kim wrote:
> Check return value of malloc/strdup not to make NULL dereferences.

I don't mind these patches; they are clean code

however, one of the core userspace developers at work basically said "we do=
n't check for malloc NULL in userspace;
if that ever happens the system is so screwed up anyway that you just canno=
t continue".



> =

> Signed-off-by: Namhyung Kim <namhyung(a)gmail.com>
> ---
>  src/perf/perf_bundle.cpp |   13 +++++++++++++
>  1 file changed, 13 insertions(+)
> =

> diff --git a/src/perf/perf_bundle.cpp b/src/perf/perf_bundle.cpp
> index 38e1e91..4e70f30 100644
> --- a/src/perf/perf_bundle.cpp
> +++ b/src/perf/perf_bundle.cpp
> @@ -60,6 +60,9 @@ void perf_bundle_event::handle_event(struct perf_event_=
header *header, void *coo
>  	vector<void *> *vector;
>  =

>  	buffer =3D (unsigned char *)malloc(header->size);
> +	if (!buffer)
> +		return;
> +
>  	memcpy(buffer, header, header->size);
>  =

>  #ifdef USE_DECLTYPE
> @@ -130,6 +133,9 @@ static void parse_event_format(const char *event_name)
>  {
>  	char *tptr;
>  	char *name =3D strdup(event_name);
> +	if (!name)
> +		return;
> +
>  	char *sys =3D strtok_r(name, ":", &tptr);
>  	char *event =3D strtok_r(NULL, ":", &tptr);
>  	char *file;
> @@ -137,6 +143,9 @@ static void parse_event_format(const char *event_name)
>  =

>  	file =3D (char *)malloc(strlen(sys) + strlen(event) +
>  		      strlen("/sys/kernel/debug/tracing/events////format") + 2);
> +	if (!file)
> +		return;
> +
>  	sprintf(file, "/sys/kernel/debug/tracing/events/%s/%s/format", sys, eve=
nt);
>  =

>  	buf =3D read_file(file);
> @@ -169,6 +178,10 @@ bool perf_bundle::add_event(const char *event_name)
>  		if ((int)ev->trace_type >=3D 0) {
>  			if (event_names.find(ev->trace_type) =3D=3D event_names.end()) {
>  				event_names[ev->trace_type] =3D strdup(event_name);
> +				if (!event_names[ev->trace_type]) {
> +					delete ev;
> +					continue;
> +				}
>  				parse_event_format(event_name);
>  			}
>  			events.push_back(ev);
> =



--===============2729113143585514131==--

