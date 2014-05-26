Content-Type: multipart/mixed; boundary="===============8192140684678642815=="
MIME-Version: 1.0
From: Jaroslav Skarvada <jskarvad at redhat.com>
Subject: Re: [Powertop] [Announce] PowerTOP v2.6.1 released
Date: Mon, 26 May 2014 09:12:40 -0400
Message-ID: <514352428.8211738.1401109960163.JavaMail.zimbra@redhat.com>
In-Reply-To: 58373.10.24.4.100.1400870500.squirrel@linux.intel.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============8192140684678642815==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

----- Original Message -----
> We are pleased to announce the release of PowerTOP v2.6.1
> =

> =

> About PowerTOP
> =

> PowerTOP is a Linux tool to diagnose issues with power consumption and
> power management. In addition to being a diagnostic tool, PowerTOP also
> has an interactive mode you can use to experiment with various power
> management settings, for cases where the Linux distribution has not
> enabled those settings.
> =

> PowerTOP reports which components in the system are most likely to blame
> for higher-than-needed power consumption, ranging from software
> applications to active components in the system. Detailed screens are
> available for CPU C and P states, device activity, and software activity.
> =

> For many years, PowerTOP has been used heavily by Intel, Linux
> distributors, and various parts of the open source community.
> =

> =

> =

> Fixes
> =

> Segmentation faults with PowerTOP2.6 reported by Julian Wollrath
> <jwollrath(a)web.de>
> Packaging issues reported by Julian Wollrath <jwollrath(a)web.de>
> Thank you to everyone who contributed to this release!
> =

> Alexandra Yates (3):
> =

>       Bug-fix:Seg-fault with powertop --html & --csv
> =

>       Update translation files and configuration
> =

>       PowerTOP version 2.6.1
> =

> =

> Thank you,
> Alexandra.
> _______________________________________________
> PowerTop mailing list
> PowerTop(a)lists.01.org
> https://lists.01.org/mailman/listinfo/powertop
> =


Hi,

the source tarball contains 32 bit object files under
/src/tuning

Also it is not possible to compile it after running:
$ make clean

It seems csstoh.sh script is missing

regards

Jaroslav

--===============8192140684678642815==--

