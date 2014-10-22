Content-Type: multipart/mixed; boundary="===============7700820355718381405=="
MIME-Version: 1.0
From: Sami Kerola <kerolasa at iki.fi>
Subject: Re: [Powertop] Complete build options for Pthread API
Date: Wed, 22 Oct 2014 10:41:35 +0100
Message-ID: <CAG27Bk2OTe7upn7-FoAy2zCPz7OopfDgj+rJSe35kJdzgqeOEA@mail.gmail.com>
In-Reply-To: 54449349.2000400@users.sourceforge.net
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============7700820355718381405==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 20 October 2014 05:44, SF Markus Elfring
<elfring(a)users.sourceforge.net> wrote:
>> I don't know what sort of adjustments you have in mind.
>
> I suggest a bit more fine-tuning for the explanation.
>
>
>> The variables are in commit body, so I am assuming people who read code
>> can see them without explicit note about them.
>
> I would prefer a commit message that will also be useful to some degree w=
ithout
> reading the affected source code.
>
>
>> But if you insist improvement with the message could you write what you
>> would like to see so that I can include it without confusions.
>
> You can see from a few contributions for other software that I used a wor=
ding
> like the following:
>
> The configuration script "AX_PTHREAD" was added to the build specification
> so that corresponding special parameters will be taken into account.
> http://www.gnu.org/software/autoconf-archive/ax_pthread.html
>
>
>
> You might be still interested to stress other details for your PowerTop t=
esters
> and reviewers.

Thanks Markus.  I will add your text to commit message & Reviewed-by
line.

>>>> +AX_PTHREAD([], [AC_MSG_ERROR([Could not configure pthreads support])])
>>>
>>> 2. You chose to pass an empty "ACTION-IF-FOUND". Would it make sense to
>>> restructure this place a bit in the configuration script so that the
>>> following statements will be directly used by the first macro parameter?
>>
>> That would make powertop m4 code copy to drift from version provided by
>> autotools-archive, making the upstream fixes to incompatible. I strongly
>> recommend against adding additional maintenance cost to this sort of stu=
ff.
>
> I do not really understand the intention in this feedback.

And when I see your message below I understand why.  We were talking
about totally different things.  Please ignore my previous message.

> How do you think about the following statement layout at the discussed sc=
ript place?
>
> diff --git a/configure.ac b/configure.ac
> index 4991d97..0ebe69d 100644
> --- a/configure.ac
> +++ b/configure.ac
> @@ -128,11 +128,12 @@ AS_IF([test "$has_libpci" -eq 0], [
>         ])
>  ])
>
> -AC_SEARCH_LIBS([pthread_create], [pthread], [], [
> -       AC_MSG_ERROR([libpthread is required but was not found])
> -], [])
> -AC_SEARCH_LIBS([inet_aton], [resolv], [], [
> -       AC_MSG_ERROR([libresolv is required but was not found])
> -], [])
> -
> -AC_OUTPUT
> +AX_PTHREAD([LIBS=3D"$PTHREAD_LIBS $LIBS"
> +CFLAGS=3D"$CFLAGS $PTHREAD_CFLAGS"
> +CC=3D"$PTHREAD_CC"
> +AC_SEARCH_LIBS([inet_aton],
> +               [resolv],
> +               [AC_OUTPUT],
> +               [AC_MSG_ERROR([libresolv is required but was not found])],
> +               [])],
> +           [AC_MSG_ERROR([Could not configure pthreads support])])

Indentation seems a bit funky in the proposed change, but that could be
fixed.  The bigger problem I have with nesting AC_SEARCH_LIBS to
AX_PTHREAD is that it does not seem to add clarity.  Secondly the
threading seems to be used in calibrate & measure/extech code.  If I am
not wrong that code do not require resolv library.

Perhaps the LIBS etc variable assignments should be in true case of
AX_PTHREAD, but surely not the resolv library search.  I'll run
./autogen.sh to that variation to see how the Makefile will look with
this variant to see it has change working as one might expect.

This and few other patches will be resubmitted about at the end of the
Sunday (I'm just hobbyist, so I can use only my free time to things
like powertop hacking).

-- =

Sami Kerola
http://www.iki.fi/kerolasa/

--===============7700820355718381405==--

