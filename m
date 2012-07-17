Content-Type: multipart/mixed; boundary="===============3302960740586767732=="
MIME-Version: 1.0
From: Chris Ferron <chris.e.ferron at linux.intel.com>
Subject: Re: [Powertop] Device list sort function bug
Date: Tue, 17 Jul 2012 15:09:28 -0700
Message-ID: <5005E298.3010105@linux.intel.com>
In-Reply-To: 4FFD1904.7040804@samsung.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============3302960740586767732==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 07/10/2012 11:11 PM, Igor Zhbanov wrote:
> Hello!
>
> Sometimes PowerTOP dies with a Segmentation Fault while generating
> the report. Little investigation shown that it dies while sorting
> the device list. The problem is that comparison function devlist_sort
> is incorrect.
>
> The function should return true if first argument "preceeds" second.
> But when strcmp() is used, it can return -1, 0 and 1. So both -1 and 1
> values are silently converted to true, which is wrong. It confuses the =

> sort()
> function and it crosses boundary of array.
>
> Here is the patch:
> --8<--Cut-here-----------------------------------------------------------=
----- =

>
> diff -purN powertop-il/src/devlist.cpp powertop-il-fix/src/devlist.cpp
> --- powertop-il/src/devlist.cpp    2012-07-03 17:00:50.000000000 +0400
> +++ powertop-il-fix/src/devlist.cpp    2012-07-03 20:01:05.896232845 =

> +0400
> @@ -273,7 +273,7 @@ static bool devlist_sort(struct devuser
>      if (i->pid !=3D j->pid)
>          return i->pid<  j->pid;
>
> -    return strcmp(i->device, j->device);
> +    return (strcmp(i->device, j->device)<  0);
>  }
>
>  static const char *dev_class(int line)
> --8<---------------------------------------------------------------------=
----- =

>
>
> Thank you.
>
>
>
> _______________________________________________
> PowerTop mailing list
> PowerTop(a)lists.01.org
> https://lists.01.org/mailman/listinfo/powertop
Your patch has been merged.
Thank you,


--===============3302960740586767732==--

