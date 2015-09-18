Content-Type: multipart/mixed; boundary="===============2481504715944184873=="
MIME-Version: 1.0
From: Alexandra Yates <alexandra.yates at linux.intel.com>
Subject: Re: [Powertop] [PATCH 1/2] prevent segment fault for android built 2
Date: Thu, 17 Sep 2015 17:21:18 -0700
Message-ID: <55FB58FE.3070800@linux.intel.com>
In-Reply-To: CAN2waFs38gP+34_0hnidXW0TPA29hDT=jropbkZO+NHrVYq5bw@mail.gmail.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============2481504715944184873==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Rejecting this patch.  This is already handled on the Android patches.

On 07/06/2015 07:16 PM, Zhaoyang Huang wrote:
> Hi Daniel,
> Thank you for your feedback.
> I have noticed the patch you mentioned. However, under the android(use =

> bionic libc) environment, the bellowing condition maybe true which =

> will cause a NULL pointer access to buffer. I add another one more =

> condition to prevent it. This problem can also be reproduced by android.
>
> diff --git a/src/lib.cpp b/src/lib.cpp
> index 88fe5f3..8d1ca9f 100644
> --- a/src/lib.cpp
> +++ b/src/lib.cpp
> @@ -285,7 +285,7 @@ void align_string(char *buffer, size_t min_sz, =

> size_t max_sz)
>         /* start with mbsrtowcs() local mbstate_t * and
>          * NULL dst pointer*/
>         sz =3D mbsrtowcs(NULL, (const char **)&buffer, max_sz, NULL);
> -       if (sz =3D=3D (size_t)-1) {
> +       if ((sz =3D=3D (size_t)-1) && (NULL !=3D buffer)) {
>                 buffer[min_sz] =3D 0x00;
>                 return;
>         }
> -- =

> 1.7.9.5
>
>
> On 7 July 2015 at 05:44, Daniel Leung <daniel.leung(a)linux.intel.com =

> <mailto:daniel.leung(a)linux.intel.com>> wrote:
>
>     On Wed,  1 Jul 2015 19:52:24 +0800
>     Zhaoyang Huang <zhaoyang.huang(a)linaro.org
>     <mailto:zhaoyang.huang(a)linaro.org>> wrote:
>
>     > the buffer will be turn into NULL after invoking the mbsrtowcs
>     function
>     > of bionic libc. Add a condition judgement for that
>     >
>     > Signed-off-by: Zhaoyang Huang <zhaoyang.huang(a)linaro.org
>     <mailto:zhaoyang.huang(a)linaro.org>>
>     > ---
>     >  src/lib.cpp |    2 +-
>     >  1 file changed, 1 insertion(+), 1 deletion(-)
>     >
>     > diff --git a/src/lib.cpp b/src/lib.cpp
>     > index 88fe5f3..8d1ca9f 100644
>     > --- a/src/lib.cpp
>     > +++ b/src/lib.cpp
>     > @@ -285,7 +285,7 @@ void align_string(char *buffer, size_t
>     min_sz, size_t max_sz)
>     >       /* start with mbsrtowcs() local mbstate_t * and
>     >        * NULL dst pointer*/
>     >       sz =3D mbsrtowcs(NULL, (const char **)&buffer, max_sz, NULL);
>     > -     if (sz =3D=3D (size_t)-1) {
>     > +     if ((sz =3D=3D (size_t)-1) && (NULL !=3D buffer)) {
>     >               buffer[min_sz] =3D 0x00;
>     >               return;
>     >       }
>     > --
>     > 1.7.9.5
>     >
>
>     If you are on master branch, there is a patch
>     (patches/android/prevent_segfaults.patch) to workaround the NULL
>     pointer.
>
>     --
>     Daniel Leung <daniel.leung(a)linux.intel.com
>     <mailto:daniel.leung(a)linux.intel.com>>
>
>
>
>
> _______________________________________________
> PowerTop mailing list
> PowerTop(a)lists.01.org
> https://lists.01.org/mailman/listinfo/powertop

-- =

Thank you,
<Alexandra>


--===============2481504715944184873==--

