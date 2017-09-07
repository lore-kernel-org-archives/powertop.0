Content-Type: multipart/mixed; boundary="===============6668895047875780507=="
MIME-Version: 1.0
From: Mike Simms <micsim2007 at outlook.com>
Subject: Re: [Powertop] RH Bugzilla [Bug 1482649] Logitech USB Unified
 Receiver+M570 need 'waking' up by click after kernel update
Date: Thu, 07 Sep 2017 18:09:59 +0000
Message-ID: <VI1PR0301MB2510765FF1A9FBAE0EDEFDFD87940@VI1PR0301MB2510.eurprd03.prod.outlook.com>
In-Reply-To: bb7316ca-780d-2e1a-8f21-9151b17e163d@intel.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============6668895047875780507==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Then explain why it was never an issue before kernel 4.12 please

On Thu, 7 Sep 2017 10:30:34 -0700
Auke Kok <auke-jan.h.kok(a)intel.com> wrote:

> =

> This is indicative of enabling usb suspend for the trackball device,
> and common to mice, touchpads and trackballs.
> =

> The only solution is to disable usb suspend for these devices, and
> remember not to enable it for the device in powertop.
> =

> Auke
> =

> =

> =

> On 09/07/2017 06:32 AM, Mike Simms wrote:
> > Description of problem: For some reason the trackball is no longer
> > able to respond to user input immediately. it only responds when I
> > click a button to wake it up or roll the ball about a bit first.
> > With earlier kernels this was not necessary. Booting from the
> > previous kernel 4.11.11-300.fc26 and it still works fine.
> > =

> > =

> > Version-Release number of selected component (if
> > applicable):4.12.5-300.fc26.x86_64
> > =

> > Also affected Fedora 27 4.13 rc kernel
> > =

> > =

> > How reproducible: consistently
> > =

> > =

> > Steps to Reproduce:
> > 1. start notebook computer with the unified receiver attached
> > 2. login and use the computer as normal
> > =

> > Actual results: trackball works initially but if left for a few
> > seconds to type or read for example, it needs waking up with
> > movement or a click of a button.
> > =

> > =

> > Expected results: should respond normally without this lag or
> > waking up nonsense
> > =

> > =

> > Additional info:the unified receiver is plugged into the same USB 2
> > port it has always been.
> > =

> > powertop is using the autotune profile and the usb autosuspend
> > entry is Good.
> > =

> > Something in the kernel code has caused a power management
> > regression. I'm not sure what and the bug I opened so far has drawn
> > a blank. The kernel maintainer is not able to help as they don't
> > know about power management or powertop. please give some guidance
> > as to where to look and how to resolve this if possible. Full
> > information so far here, including dmesg, lspci, lsusb output,
> > dumps for comparison of power profiles etc.
> > =

> > I'm an end user, not a developer or maintainer so please keep it in
> > relatively simple terms I can relay back to the maintainers please
> > and understand at the same time.
> > =

> > https://bugzilla.redhat.com/show_bug.cgi?id=3D1482649
> > =

> > Thanks
> > =

> > Mike Simms
> > _______________________________________________
> > PowerTop mailing list
> > PowerTop(a)lists.01.org
> > https://lists.01.org/mailman/listinfo/powertop
> > =

> =



--===============6668895047875780507==--

