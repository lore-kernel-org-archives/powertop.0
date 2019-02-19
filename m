Content-Type: multipart/mixed; boundary="===============1775636050094564552=="
MIME-Version: 1.0
From: Kammela, Gayatri <gayatri.kammela at intel.com>
Subject: Re: [Powertop] CoreDump on version 2.9 and git.
Date: Tue, 19 Feb 2019 09:30:48 +0000
Message-ID: <2824B99DC70CE746926327C52CA42F76487E461A@ORSMSX111.amr.corp.intel.com>
In-Reply-To: 80190921-c55b-6bef-02c8-d7030d8cfed4@locolandia.net
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============1775636050094564552==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Pablo,
Thanks for reporting! I have tried powertop v2.9 and v2.10 on kernel 4.20 w=
ith Ubuntu generic+ additional config options and didn't notice any core du=
mp issues. I have changed the processor type to Xeon and I couldn't reprodu=
ce it. Could you please share the kernel config that you've used to reprodu=
ce this issue? Also, could you try running latest powertop with latest kern=
el to see if it is still reproducible? =


Thanks,
Gayatri

> -----Original Message-----
> From: PowerTop [mailto:powertop-bounces(a)lists.01.org] On Behalf Of
> Pablo Catalina
> Sent: Monday, February 18, 2019 1:46 PM
> To: powertop(a)lists.01.org
> Subject: [Powertop] CoreDump on version 2.9 and git.
> =

> Hi,
> =

> I have an Ubuntu 18.04 with kernel 4.20.10 (compiled manually with default
> Ubuntu options but changing the processor type to Xeon)
> =

> =

> I tested the version 2.9 and the latest code from git (tag 2.10):
> =

> # git log
> =

> e8765b5 (HEAD -> master, tag: v2.10, origin/master, origin/HEAD)
> src/wakeup/wakeup.h: Fix a minor issue in the wakeup.h file
> =

> =

> And I got a coredump when I run it normally and with --auto-tune (I dont
> have the coredump with --debug).
> =

> =

> The same coredump on normal run and with --auto-autotune.
> =

> =

> See attached the output of gdb (bt, registers, ...) and the coredump.
> =

> =

> Let me know if I can do anything else to help you to fix the bug, I'm not=
 C
> developer but I have a minimal knowledge about compiling code, patching,
> debug, ...
> =

> =

> =

> Regards,
> =

> =

> Pablo


--===============1775636050094564552==--

