Content-Type: multipart/mixed; boundary="===============1721820805232429422=="
MIME-Version: 1.0
From: Paul Menzel <paulepanter at users.sourceforge.net>
Subject: Re: [Powertop] Device list sort function bug
Date: Wed, 11 Jul 2012 09:52:00 +0200
Message-ID: <1341993120.4108.7.camel@mattotaupa>
In-Reply-To: 4FFD1904.7040804@samsung.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============1721820805232429422==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Dear Igor,


thank you for your patches!


Am Mittwoch, den 11.07.2012, 10:11 +0400 schrieb Igor Zhbanov:

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
> =

> Here is the patch:
> --8<--Cut-here-----------------------------------------------------------=
-----
> diff -purN powertop-il/src/devlist.cpp powertop-il-fix/src/devlist.cpp
> --- powertop-il/src/devlist.cpp	2012-07-03 17:00:50.000000000 +0400
> +++ powertop-il-fix/src/devlist.cpp	2012-07-03 20:01:05.896232845 +0400
> @@ -273,7 +273,7 @@ static bool devlist_sort(struct devuser
>   	if (i->pid !=3D j->pid)
>   		return i->pid<  j->pid;
> =

> -	return strcmp(i->device, j->device);
> +	return (strcmp(i->device, j->device)<  0);
>   }
> =

>   static const char *dev_class(int line)
> --8<---------------------------------------------------------------------=
-----

Nice find!

To decrease work for the maintainers, could you please send patches
formatted by `git format-patch`? After that you can either use `git
send-email` or copy the output into Seamonkey=E2=80=99s new message window.

        $ git clone git://github.com/fenrus75/powertop.git
        $ cd powertop
        $ git config --global user.name "Igor Zhbanov"
        $ git config --global user.email i.zhbanov(a)samsung.com
        $ git checkout -b sort-fix # new branch for each fix
        $ # apply your change
        $ git commit -a # enter a nice commit message \
        you should be able to use your great ones from your messages
        $ git format-patch -1

Then maintainers can just apply it using the following command.

    $ git am yourmessagewithpatch.mbox

If you need more help with Git, just ask.


Thanks,

Paul

--===============1721820805232429422==
Content-Type: application/pgp-signature
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="signature.asc"

LS0tLS1CRUdJTiBQR1AgU0lHTkFUVVJFLS0tLS0KVmVyc2lvbjogR251UEcgdjEuNC4xMiAoR05V
L0xpbnV4KQoKaUVZRUFCRUNBQVlGQWsvOU1LQUFDZ2tRUFgxYUsyd09IVmd0V3dDZmYzSXRzdzBT
YVd6VFdXejFtTitKTlRibApKVDBBb0lmalNoaXdxRWFtNG5keUVjaEg1bjJLeE10Zgo9bVFNTAot
LS0tLUVORCBQR1AgU0lHTkFUVVJFLS0tLS0K

--===============1721820805232429422==--

