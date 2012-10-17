Content-Type: multipart/mixed; boundary="===============5325999834951244218=="
MIME-Version: 1.0
From: Igor Zhbanov <i.zhbanov at samsung.com>
Subject: Re: [Powertop] [PATCH] Enable asserts and make correct comment
Date: Wed, 17 Oct 2012 19:10:33 +0400
Message-ID: <507ECA69.4000408@samsung.com>
In-Reply-To: 1349953133-17076-1-git-send-email-i.zhbanov@samsung.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============5325999834951244218==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi all.

Any comments? ;-)
This patch fixes the comments and enables the asserts.

Igor Zhbanov wrote:
> Enable asserts for test period and correct the comments.
> It is better to know why a crash happen when it could happen
> than just silently die.
> ---
>   src/report/report-formatter-base.cpp |    3 ++-
>   src/report/report-formatter-csv.cpp  |    3 ++-
>   src/report/report-formatter-html.cpp |    3 ++-
>   src/report/report-maker.cpp          |    3 ++-
>   4 files changed, 8 insertions(+), 4 deletions(-)
>
> diff --git a/src/report/report-formatter-base.cpp b/src/report/report-for=
matter-base.cpp
> index 4b448be..e0dc49c 100644
> --- a/src/report/report-formatter-base.cpp
> +++ b/src/report/report-formatter-base.cpp
> @@ -25,7 +25,8 @@
>   =

>   #define _BSD_SOURCE
>   =

> -#define NDEBUG /* Enable asserts */
> +/* Uncomment to disable asserts */
> +/*#define NDEBUG*/
>   =

>   #include <stdio.h>
>   #include <assert.h>
> diff --git a/src/report/report-formatter-csv.cpp b/src/report/report-form=
atter-csv.cpp
> index 9b154b5..cd70d91 100644
> --- a/src/report/report-formatter-csv.cpp
> +++ b/src/report/report-formatter-csv.cpp
> @@ -25,7 +25,8 @@
>   =

>   #define _BSD_SOURCE
>   =

> -#define NDEBUG /* Enable asserts */
> +/* Uncomment to disable asserts */
> +/*#define NDEBUG*/
>   =

>   #include <stdio.h>
>   #include <assert.h>
> diff --git a/src/report/report-formatter-html.cpp b/src/report/report-for=
matter-html.cpp
> index 56f9648..5851575 100644
> --- a/src/report/report-formatter-html.cpp
> +++ b/src/report/report-formatter-html.cpp
> @@ -25,7 +25,8 @@
>   =

>   #define _BSD_SOURCE
>   =

> -#define NDEBUG /* Enable asserts */
> +/* Uncomment to disable asserts */
> +/*#define NDEBUG*/
>   =

>   #include <stdio.h>
>   #include <assert.h>
> diff --git a/src/report/report-maker.cpp b/src/report/report-maker.cpp
> index 4a68a8c..c00c955 100644
> --- a/src/report/report-maker.cpp
> +++ b/src/report/report-maker.cpp
> @@ -23,7 +23,8 @@
>    * Written by Igor Zhbanov <i.zhbanov(a)samsung.com>
>    * 2012.10 */
>   =

> -#define NDEBUG /* Enable asserts */
> +/* Uncomment to disable asserts */
> +/*#define NDEBUG*/
>   =

>   #include <assert.h>
>   #include <stdarg.h>

-- =

Best regards,
Igor Zhbanov,
Technical Leader,
phone: +7 (495) 797 25 00 ext 3806
e-mail: i.zhbanov(a)samsung.com

ASWG, Moscow R&D center, Samsung Electronics
12 Dvintsev street, building 1
127018, Moscow, Russian Federation


--===============5325999834951244218==--

