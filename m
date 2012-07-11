Content-Type: multipart/mixed; boundary="===============1230633295655670214=="
MIME-Version: 1.0
From: Paul Menzel <paulepanter at users.sourceforge.net>
Subject: Re: [Powertop] Device list sort function bug
Date: Wed, 11 Jul 2012 10:57:26 +0200
Message-ID: <1341997046.4108.18.camel@mattotaupa>
In-Reply-To: 4FFD3661.7020202@samsung.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============1230633295655670214==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Dear Igor,


thank you for following my advise. Some more minor suggestions are
inlined but until the maintainers ask for further changes you do not
need to take any further actions.


Am Mittwoch, den 11.07.2012, 12:16 +0400 schrieb Igor Zhbanov:
> So here is the formatted version:

Normally when sending patches no introduction or email style formalities
(like greeting and so on) are needed.

If you want to use them put them at the top and separate them from the
patch using

---- 8< ----- >8 ----

so that `git am --scissors` strips the email text off automatically.

>  From 5d284137a6035bab65717fbacd98423b96d862cf Mon Sep 17 00:00:00 2001
> From: Igor Zhbanov<i.zhbanov(a)samsung.com>

SeaMonkey and some Thunderbird versions seem to have a bug deleting a
space before =C2=BB<=C2=AB.

But if your email account you sending the message from is the same as
the commit author of the patch you can also delete that line.

> Date: Wed, 11 Jul 2012 12:08:21 +0400
> Subject: [PATCH] Device list sort function bug

You can copy the text after =C2=BBSubject: =C2=AB into the email message su=
bject
line. Then your message automatically has the =C2=BBPATCH=C2=AB tag.

> Sometimes PowerTOP dies with a Segmentation Fault while generating
> the report. Little investigation shown that it dies while sorting
> the device list. The problem is that comparison function devlist_sort
> is incorrect.
> =

> The function should return true if first argument "preceeds" second.
> But when strcmp() is used, it can return -1, 0 and 1. So both -1 and 1
> values are silently converted to true, which is wrong. It confuses the so=
rt()
> function and it crosses boundary of array.
> ---

Some comments not meant for the commit message, like what changed in
patch iterations go after the --- line and Git will ignore them.

>   src/devlist.cpp |    2 +-
>   1 files changed, 1 insertions(+), 1 deletions(-)
> =

> diff --git a/src/devlist.cpp b/src/devlist.cpp
> index 93f2081..cd5b5d8 100644
> --- a/src/devlist.cpp
> +++ b/src/devlist.cpp
> @@ -273,7 +273,7 @@ static bool devlist_sort(struct devuser * i, struct d=
evuser * j)
>   	if (i->pid !=3D j->pid)
>   		return i->pid<  j->pid;
> =

> -	return strcmp(i->device, j->device);
> +	return (strcmp(i->device, j->device)<  0);
>   }
> =

>   static const char *dev_class(int line)
> -- =

> 1.7.5.4

Just delete the quote next time if you are not citing it in any way [1].

> Jan-Simon M=C3=B6ller wrote:
> > Yes, in an hour or so.
> > Best,
> > JS
> > Am Mittwoch, 11. Juli 2012, 09:33:42 schrieb Sergey Senozhatsky:
> >> On (07/11/12 10:11), Igor Zhbanov wrote:
> >>> Sometimes PowerTOP dies with a Segmentation Fault while generating
> >>> the report. Little investigation shown that it dies while sorting
> >>> the device list. The problem is that comparison function devlist_sort
> >>> is incorrect.
> >>>
> >>> The function should return true if first argument "preceeds" second.
> >>> But when strcmp() is used, it can return -1, 0 and 1. So both -1 and 1
> >>> values are silently converted to true, which is wrong. It confuses the
> >>> sort() function and it crosses boundary of array.
> >> Jan, could you please test this one?
> >>
> >> Thanks in advance,
> >>
> >> 	-ss


Thanks again,

Paul


[1] http://en.opensuse.org/openSUSE:Mailing_list_netiquette

--===============1230633295655670214==
Content-Type: application/pgp-signature
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="signature.asc"

LS0tLS1CRUdJTiBQR1AgU0lHTkFUVVJFLS0tLS0KVmVyc2lvbjogR251UEcgdjEuNC4xMiAoR05V
L0xpbnV4KQoKaUVZRUFCRUNBQVlGQWsvOVAvWUFDZ2tRUFgxYUsyd09IVmdFVFFDZmFwanUrZm5Q
Y0VEa3lFRG5WTjVhcU9XSAo4L1FBbjBpb3hFODdjKzVjZXl6bVhvUXdVYWQ5TzJSLwo9dlpsMgot
LS0tLUVORCBQR1AgU0lHTkFUVVJFLS0tLS0K

--===============1230633295655670214==--

