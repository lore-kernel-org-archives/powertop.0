Content-Type: multipart/mixed; boundary="===============7355627344338949745=="
MIME-Version: 1.0
From: Kammela, Gayatri <gayatri.kammela at intel.com>
Subject: Re: [Powertop] CoreDump on version 2.9 and git.
Date: Fri, 22 Feb 2019 17:59:31 +0000
Message-ID: <2824B99DC70CE746926327C52CA42F76487E65C2@ORSMSX111.amr.corp.intel.com>
In-Reply-To: bab55e50-3e5d-90ac-a692-59564fe5d084@gmx.de
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============7355627344338949745==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Harvey,
Great! Thanks for the update. =


Thanks,
Gayatri

> -----Original Message-----
> From: Harvey [mailto:harv(a)gmx.de]
> Sent: Friday, February 22, 2019 5:25 AM
> To: Kammela, Gayatri <gayatri.kammela(a)intel.com>
> Subject: Re: [Powertop] CoreDump on version 2.9 and git.
> =

> Hi all
> =

> as Pablo already stated the issue has gone with kernel 4.20.11. All my
> machines using powertop are back to normal now.
> =

> Greetings
> Harvey
> =

> Am 20.02.19 um 11:21 schrieb Kammela, Gayatri:
> > Hi Harvey,
> > Thanks for the report! I will try and reproduce the issue on ArchLinux.=
 Just
> curious if Archlinux has any issues with PowerTop v2.9 on 4.20 kernel as =
well.
> >
> > Thanks,
> > Gayatri
> >
> >> -----Original Message-----
> >> From: PowerTop [mailto:powertop-bounces(a)lists.01.org] On Behalf Of
> >> Harvey
> >> Sent: Tuesday, February 19, 2019 2:05 AM
> >> To: powertop(a)lists.01.org
> >> Subject: Re: [Powertop] CoreDump on version 2.9 and git.
> >>
> >> Hello,
> >>
> >> please forgive me to chime in here, but...
> >>
> >> this happens as well on Archlinux with a vanilla kernel
> >> 4.20.10-arch1-1-ARCH and powertop 2.10
> >> (https://www.archlinux.org/packages/community/x86_64/powertop/)
> >>
> >> If one starts powertop it bails out with
> >>
> >> Feb 19 11:03:13 obelix systemd-coredump[14698]: Process 14692
> >> (powertop) of user 0 dumped core.
> >>
> >>                                                 Stack trace of thread =
14692:
> >>                                                 #0  0x000055868ba1d157=
 n/a (powertop)
> >>                                                 #1  0x000055868ba1df22=
 n/a (powertop)
> >>                                                 #2  0x000055868b9f7cb3=
 n/a (powertop)
> >>                                                 #3  0x000055868b9f2556=
 n/a (powertop)
> >>                                                 #4  0x000055868b9e8a16=
 n/a (powertop)
> >>                                                 #5
> >> 0x00007f7215905223 __libc_start_main
> >> (libc.so.6)
> >>                                                 #6
> >> 0x000055868b9e9b5e n/a (powertop)
> >>
> >>
> >> HTH
> >>
> >> Greetings
> >> Harvey
> >>
> >> Am 19.02.19 um 10:30 schrieb Kammela, Gayatri:
> >>> Hi Pablo,
> >>> Thanks for reporting! I have tried powertop v2.9 and v2.10 on kernel
> >>> 4.20
> >> with Ubuntu generic+ additional config options and didn't notice any
> >> core dump issues. I have changed the processor type to Xeon and I
> >> couldn't reproduce it. Could you please share the kernel config that
> >> you've used to reproduce this issue? Also, could you try running
> >> latest powertop with latest kernel to see if it is still reproducible?
> >>>
> >>> Thanks,
> >>> Gayatri
> >>>
> >>>> -----Original Message-----
> >>>> From: PowerTop [mailto:powertop-bounces(a)lists.01.org] On Behalf Of
> >>>> Pablo Catalina
> >>>> Sent: Monday, February 18, 2019 1:46 PM
> >>>> To: powertop(a)lists.01.org
> >>>> Subject: [Powertop] CoreDump on version 2.9 and git.
> >>>>
> >>>> Hi,
> >>>>
> >>>> I have an Ubuntu 18.04 with kernel 4.20.10 (compiled manually with
> >>>> default Ubuntu options but changing the processor type to Xeon)
> >>>>
> >>>>
> >>>> I tested the version 2.9 and the latest code from git (tag 2.10):
> >>>>
> >>>> # git log
> >>>>
> >>>> e8765b5 (HEAD -> master, tag: v2.10, origin/master, origin/HEAD)
> >>>> src/wakeup/wakeup.h: Fix a minor issue in the wakeup.h file
> >>>>
> >>>>
> >>>> And I got a coredump when I run it normally and with --auto-tune (I
> >>>> dont have the coredump with --debug).
> >>>>
> >>>>
> >>>> The same coredump on normal run and with --auto-autotune.
> >>>>
> >>>>
> >>>> See attached the output of gdb (bt, registers, ...) and the coredump.
> >>>>
> >>>>
> >>>> Let me know if I can do anything else to help you to fix the bug,
> >>>> I'm not C developer but I have a minimal knowledge about compiling
> >>>> code, patching, debug, ...
> >>>>
> >>>>
> >>>>
> >>>> Regards,
> >>>>
> >>>>
> >>>> Pablo
> >>>
> >>> _______________________________________________
> >>> PowerTop mailing list
> >>> PowerTop(a)lists.01.org
> >>> https://lists.01.org/mailman/listinfo/powertop
> >>>
> >>
> >> --
> >> I am root. If you see me laughing, you'd better have a backup!
> >
> =

> --
> I am root. If you see me laughing, you'd better have a backup!


--===============7355627344338949745==--

