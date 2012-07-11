Content-Type: multipart/mixed; boundary="===============7188845786021649141=="
MIME-Version: 1.0
From: Igor Zhbanov <i.zhbanov at samsung.com>
Subject: Re: [Powertop] Wrong common field name in GFX Wakeups event
Date: Wed, 11 Jul 2012 12:33:34 +0400
Message-ID: <4FFD3A5E.2000704@samsung.com>
In-Reply-To: 4FFD1A0C.90704@samsung.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============7188845786021649141==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Here is formatted version of the patch:

 From 23362fa0f7bbfd0497a8ccbb9d06a4520eae8057 Mon Sep 17 00:00:00 2001
From: Igor Zhbanov<i.zhbanov(a)samsung.com>
Date: Wed, 11 Jul 2012 12:30:27 +0400
Subject: [PATCH] Wrong common field name in GFX Wakeups event

I have found that PowerTOP doesn't displays values in "GFX Wakeups/s" colum=
n.
It is because of wrong event field name the handle_trace_point() method
expects to find in a trace event.
---
  src/process/do_process.cpp |    4 ++--
  1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/src/process/do_process.cpp b/src/process/do_process.cpp
index b7006ee..731fe3e 100644
--- a/src/process/do_process.cpp
+++ b/src/process/do_process.cpp
@@ -312,7 +312,7 @@ void perf_process_bundle::handle_trace_point(void *trac=
e, int cpu, uint64_t time
  		int flags;
  		int pid;

-		ret =3D pevent_get_common_field_val(NULL, event, "flags",&rec,&val, 0);
+		ret =3D pevent_get_common_field_val(NULL, event, "common_flags",&rec,&va=
l, 0);
  		if (ret<  0)
  			return;
  		flags =3D (int)val;
@@ -597,7 +597,7 @@ void perf_process_bundle::handle_trace_point(void *trac=
e, int cpu, uint64_t time
  		class power_consumer *consumer =3D NULL;
  		int flags;

-		ret =3D pevent_get_common_field_val(NULL, event, "flags",&rec,&val, 0);
+		ret =3D pevent_get_common_field_val(NULL, event, "common_flags",&rec,&va=
l, 0);
  		if (ret<  0)
  			return;
  		flags =3D (int)val;
-- =

1.7.5.4

Igor Zhbanov wrote:
> Hello!
>
> I have found that PowerTOP doesn't displays values in "GFX Wakeups/s" =

> column.
> It is because of wrong event field name the handle_trace_point() method
> expects to find in a trace event.
>
> Here is the patch:
> --8<--Cut-here-----------------------------------------------------------=
----- =

>
> diff -purN powertop/src/process/do_process.cpp =

> powertop-new/src/process/do_process.cpp
> --- powertop/src/process/do_process.cpp    2012-07-05 =

> 13:06:16.080258858 +0400
> +++ powertop-new/src/process/do_process.cpp    2012-07-06 =

> 13:31:14.382651388 +0400
> @@ -340,7 +340,7 @@ void perf_process_bundle::handle_trace_p
>          int flags;
>          int pid;
>
> -        ret =3D pevent_get_common_field_val(NULL, event, =

> "flags",&rec,&val, 0);
> +        ret =3D pevent_get_common_field_val(NULL, event, =

> "common_flags",&rec,&val, 0);
>          if (ret<  0)
>              return;
>          flags =3D (int)val;
> @@ -625,7 +625,7 @@ void perf_process_bundle::handle_trace_p
>          class power_consumer *consumer =3D NULL;
>          int flags;
>
> -        ret =3D pevent_get_common_field_val(NULL, event, =

> "flags",&rec,&val, 0);
> +        ret =3D pevent_get_common_field_val(NULL, event, =

> "common_flags",&rec,&val, 0);
>          if (ret<  0)
>              return;
>          flags =3D (int)val;
> --8<---------------------------------------------------------------------=
----- =

>
>
> Thank you.
-- =

Best regards,
Igor Zhbanov,
Expert Software Engineer,
phone: +7 (495) 797 25 00 ext 3806
e-mail: i.zhbanov(a)samsung.com

ASWG, Moscow R&D center, Samsung Electronics
12 Dvintsev street, building 1
127018, Moscow, Russian Federation


--===============7188845786021649141==--

