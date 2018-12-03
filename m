Content-Type: multipart/mixed; boundary="===============1298677528196569427=="
MIME-Version: 1.0
From: Jaroslav Skarvada <jskarvad at redhat.com>
Subject: [Powertop] Fwd: [PATCH] Fixed -C and -r to take optional argument
Date: Mon, 03 Dec 2018 18:21:18 -0500
Message-ID: <1138573700.60449481.1543879278387.JavaMail.zimbra@redhat.com>
In-Reply-To: 20181128173148.21132-1-jskarvad@redhat.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============1298677528196569427==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi,

it seems git send-email didn't reach the list, so forwarding
by hand (and rather sending the patch as a attachment)

thanks & regards

Jaroslav

----- Forwarded Message -----
> From: "Jaroslav =C5=A0karvada" <jskarvad(a)redhat.com>
> To: powertop(a)lists.01.org
> Cc: "Jaroslav =C5=A0karvada" <jskarvad(a)redhat.com>
> Sent: Wednesday, November 28, 2018 6:31:48 PM
> Subject: [PATCH] Fixed -C and -r to take optional argument
> =

> I.e. it fixes the following:
> powertop -C -t 1
> ...
> Taking 1 measurement(s) for a duration of 20 second(s) each.
> PowerTOP outputing using base filename -t
> =

> But:
> powertop --html -t 1
> ...
> Taking 1 measurement(s) for a duration of 1 second(s) each.
> PowerTOP outputing using base filename powertop.html
> =

> Signed-off-by: Jaroslav =C5=A0karvada <jskarvad(a)redhat.com>
> ---
>  src/main.cpp | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> =

> diff --git a/src/main.cpp b/src/main.cpp
> index 7467f0f..d1c18cc 100644
> --- a/src/main.cpp
> +++ b/src/main.cpp
> @@ -441,7 +441,7 @@ int main(int argc, char **argv)
>  #endif
>  	ui_notify_user =3D ui_notify_user_ncurses;
>  	while (1) { /* parse commandline options */
> -		c =3D getopt_long(argc, argv, "cC:r:i:qt:w:Vh", long_options,
> &option_index);
> +		c =3D getopt_long(argc, argv, "cC::r::i:qt:w:Vh", long_options,
> &option_index);
>  		/* Detect the end of the options. */
>  		if (c =3D=3D -1)
>  			break;
> --
> 2.14.5
> =

>=20

--===============1298677528196569427==
Content-Type: text/x-patch
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="powertop-2.9-optional-args-fix.patch"

ZGlmZiAtLWdpdCBhL3NyYy9tYWluLmNwcCBiL3NyYy9tYWluLmNwcAppbmRleCA3NDY3ZjBmLi5k
MWMxOGNjIDEwMDY0NAotLS0gYS9zcmMvbWFpbi5jcHAKKysrIGIvc3JjL21haW4uY3BwCkBAIC00
NDEsNyArNDQxLDcgQEAgaW50IG1haW4oaW50IGFyZ2MsIGNoYXIgKiphcmd2KQogI2VuZGlmCiAJ
dWlfbm90aWZ5X3VzZXIgPSB1aV9ub3RpZnlfdXNlcl9uY3Vyc2VzOwogCXdoaWxlICgxKSB7IC8q
IHBhcnNlIGNvbW1hbmRsaW5lIG9wdGlvbnMgKi8KLQkJYyA9IGdldG9wdF9sb25nKGFyZ2MsIGFy
Z3YsICJjQzpyOmk6cXQ6dzpWaCIsIGxvbmdfb3B0aW9ucywgJm9wdGlvbl9pbmRleCk7CisJCWMg
PSBnZXRvcHRfbG9uZyhhcmdjLCBhcmd2LCAiY0M6OnI6Omk6cXQ6dzpWaCIsIGxvbmdfb3B0aW9u
cywgJm9wdGlvbl9pbmRleCk7CiAJCS8qIERldGVjdCB0aGUgZW5kIG9mIHRoZSBvcHRpb25zLiAq
LwogCQlpZiAoYyA9PSAtMSkKIAkJCWJyZWFrOwo=

--===============1298677528196569427==--

