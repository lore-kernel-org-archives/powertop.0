Content-Type: multipart/mixed; boundary="===============0822048512255469898=="
MIME-Version: 1.0
From: Chris Ferron <chris.e.ferron at linux.intel.com>
Subject: Re: [Powertop] [PATCH 1/2] Make it possible to include parse-events.h
 before libc headers.
Date: Wed, 25 Jul 2012 10:44:20 -0700
Message-ID: <50103074.5020703@linux.intel.com>
In-Reply-To: 1343209431.2554.0.camel@sara
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============0822048512255469898==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 07/23/2012 11:03 PM, Magnus Fromreide wrote:
> The __unused macro interferes with the glibc and is in a reserved namespa=
ce
> so it should be renamed.
> Additionally the __ununsed macro is used from just one implementation fil=
e so
> the macro is moved there.
>
> Signed-off-by: Magnus Fromreide <magfr(a)lysator.liu.se>
> ---
>   pevent/parse-events.c |   12 +++++++++---
>   pevent/parse-events.h |    4 ----
>   2 files changed, 9 insertions(+), 7 deletions(-)
>
> diff --git a/pevent/parse-events.c b/pevent/parse-events.c
> index 58716e9..c039698 100644
> --- a/pevent/parse-events.c
> +++ b/pevent/parse-events.c
> @@ -37,6 +37,10 @@
>   =

>   #include "parse-events.h"
>   =

> +#ifndef pevent_unused
> +#define pevent_unused __attribute__ ((unused))
> +#endif
> +
>   static const char *input_buf;
>   static unsigned long long input_buf_ptr;
>   static unsigned long long input_buf_siz;
> @@ -1777,7 +1781,7 @@ process_op(struct event_format *event, struct print=
_arg *arg, char **tok)
>   }
>   =

>   static enum event_type
> -process_entry(struct event_format *event __unused, struct print_arg *arg,
> +process_entry(struct event_format *event pevent_unused, struct print_arg=
 *arg,
>   	      char **tok)
>   {
>   	enum event_type type;
> @@ -2350,7 +2354,8 @@ process_paren(struct event_format *event, struct pr=
int_arg *arg, char **tok)
>   =

>   =

>   static enum event_type
> -process_str(struct event_format *event __unused, struct print_arg *arg, =
char **tok)
> +process_str(struct event_format *event pevent_unused, struct print_arg *=
arg,
> +	    char **tok)
>   {
>   	enum event_type type;
>   	char *token;
> @@ -3500,7 +3505,8 @@ static void free_args(struct print_arg *args)
>   }
>   =

>   static char *
> -get_bprint_format(void *data, int size __unused, struct event_format *ev=
ent)
> +get_bprint_format(void *data, int size pevent_unused,
> +		  struct event_format *event)
>   {
>   	struct pevent *pevent =3D event->pevent;
>   	unsigned long long addr;
> diff --git a/pevent/parse-events.h b/pevent/parse-events.h
> index 5d5d195..124aa1b 100644
> --- a/pevent/parse-events.h
> +++ b/pevent/parse-events.h
> @@ -27,10 +27,6 @@
>   #include <stdarg.h>
>   #include <regex.h>
>   =

> -#ifndef __unused
> -#define __unused __attribute__ ((unused))
> -#endif
> -
>   /* ----------------------- trace_seq ----------------------- */
>   =

>   =

I will forward this on to Steve Rostedt. pevent code is not actually =

strictly part of the powertop src, it is just temporarily being built as =

part of the project so powertop can take advantage of it early. That =

said, it may not be a good fit for the grand scheme.
Which reminds me I need to push a readme explaining this.

-Chris

--===============0822048512255469898==--

