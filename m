Content-Type: multipart/mixed; boundary="===============5735508568064075344=="
MIME-Version: 1.0
From: Kammela, Gayatri <gayatri.kammela at intel.com>
Subject: Re: [Powertop] CoreDump on version 2.9 and git.
Date: Fri, 22 Feb 2019 18:14:24 +0000
Message-ID: <2824B99DC70CE746926327C52CA42F76487E65E0@ORSMSX111.amr.corp.intel.com>
In-Reply-To: 4f6c529d-7c96-9f0b-8a15-cc1883ab923d@locolandia.net
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============5735508568064075344==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Pablo,
Thanks for the update, looks like there is a kernel bug  in 4.20.8-4.20.10 =
kernel versions and was fixed in 4.20.11.

Thanks,
Gayatri

> -----Original Message-----
> From: PowerTop [mailto:powertop-bounces(a)lists.01.org] On Behalf Of
> Pablo Catalina
> Sent: Wednesday, February 20, 2019 9:18 AM
> To: powertop(a)lists.01.org
> Subject: Re: [Powertop] CoreDump on version 2.9 and git.
> =

> Hi,
> =

> =

> OK, kernel compilation finished and I tested it.
> =

> =

> I can confirm that works fine on kernel 4.20.7 and 4.20.11, but not on ke=
rnel
> 4.20.10
> =

> So, it seems a problem with powertop running on kernel 4.20.10=C2=A0 (not=
 tested
> 4.20.9 nor 4.20.8 as I did not compiled it)
> =

> =

> Regards,
> =

> =

> Pablo
> =

> =

> =

> On 20/2/19 17:30, Pablo Catalina wrote:
> > Hi,
> >
> > Now compiling the latest kernel, I'll provide you more feedback tomorro=
w.
> Attached my kernel config.
> >
> > Not sure if it is a problem with the kernel or hardware... I'll check it
> tomorrow too by running the latest stable kernel provided by Ubuntu.
> >
> >
> > Regarding powertop version: I tested with latest version from git (tag:
> v2.10) and powertop 2.9 from Ubuntu 18.10 package.
> >
> >
> > Same coredump when running powertop without args and with --auto-
> tune.
> >
> >
> > Regards,
> >
> >
> > Pablo
> >
> >
> >
> > On 19/2/19 10:30, Kammela, Gayatri wrote:
> >> Hi Pablo,
> >> Thanks for reporting! I have tried powertop v2.9 and v2.10 on kernel 4=
.20
> with Ubuntu generic+ additional config options and didn't notice any core
> dump issues. I have changed the processor type to Xeon and I couldn't
> reproduce it. Could you please share the kernel config that you've used to
> reproduce this issue? Also, could you try running latest powertop with la=
test
> kernel to see if it is still reproducible?
> >>
> >> Thanks,
> >> Gayatri
> >>
> >>> -----Original Message-----
> >>> From: PowerTop [mailto:powertop-bounces(a)lists.01.org] On Behalf Of
> >>> Pablo Catalina
> >>> Sent: Monday, February 18, 2019 1:46 PM
> >>> To: powertop(a)lists.01.org
> >>> Subject: [Powertop] CoreDump on version 2.9 and git.
> >>>
> >>> Hi,
> >>>
> >>> I have an Ubuntu 18.04 with kernel 4.20.10 (compiled manually with
> >>> default Ubuntu options but changing the processor type to Xeon)
> >>>
> >>>
> >>> I tested the version 2.9 and the latest code from git (tag 2.10):
> >>>
> >>> # git log
> >>>
> >>> e8765b5 (HEAD -> master, tag: v2.10, origin/master, origin/HEAD)
> >>> src/wakeup/wakeup.h: Fix a minor issue in the wakeup.h file
> >>>
> >>>
> >>> And I got a coredump when I run it normally and with --auto-tune (I
> >>> dont have the coredump with --debug).
> >>>
> >>>
> >>> The same coredump on normal run and with --auto-autotune.
> >>>
> >>>
> >>> See attached the output of gdb (bt, registers, ...) and the coredump.
> >>>
> >>>
> >>> Let me know if I can do anything else to help you to fix the bug,
> >>> I'm not C developer but I have a minimal knowledge about compiling
> >>> code, patching, debug, ...
> >>>
> >>>
> >>>
> >>> Regards,
> >>>
> >>>
> >>> Pablo
> >>>
> >>> _______________________________________________
> >>> PowerTop mailing list
> >>> PowerTop(a)lists.01.org
> >>> https://lists.01.org/mailman/listinfo/powertop


--===============5735508568064075344==--

