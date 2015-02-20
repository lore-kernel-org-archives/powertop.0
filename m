Content-Type: multipart/mixed; boundary="===============7943803433565211841=="
MIME-Version: 1.0
From: Alexandra Yates <alexandra.yates at linux.intel.com>
Subject: Re: [Powertop] Regression: read_msr cpu0 0x3fe : Input/output error
Date: Fri, 20 Feb 2015 15:46:29 -0800
Message-ID: <39528.10.7.198.102.1424475989.squirrel@linux.intel.com>
In-Reply-To: 8B5BDC21C48FAF4CA5D7E3FE1A63A90870A0143E@ORSMSX111.amr.corp.intel.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============7943803433565211841==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


> This also happens on BYT-M N2830 CPU... and likely all other BYT-M SKUs.
>
> ----
> U. Artie
>
> From: PowerTop [mailto:powertop-bounces(a)lists.01.org] On Behalf Of Eoff,
> Ullysses A
> Sent: Wednesday, February 18, 2015 12:27 PM
> To: powertop(a)lists.01.org
> Subject: [Powertop] Regression: read_msr cpu0 0x3fe : Input/output error
>
> Powertop fails with error: "read_msr cpu0 0x3fe : Input/output error" on
> BYT-M N3540 CPU (model 0x37).
>
> From the sourcecode, it appears c7 support depends on the presence of
> "/sys/bus/pci/devices/0000:00:13.0" for model 0x37.  Directory
> "/sys/bus/pci/devices/0000:00:13.0" does not exist on my system.
>
> The commit that introduced this problem is:
>
> commit e01a025bc37f730379edc001e7f12fa269b68fbd
> Author:
> alexandra.yates(a)linux.intel.com<mailto:alexandra.yates(a)linux.intel.co=
m>
> <alexandra.yates(a)linux.intel.com<mailto:alexandra.yates(a)linux.intel.c=
om>>
> Date:   Fri Aug 22 02:52:19 2014 -0700
>
>     bug fix intel bdw: package c-state support
>
>
> ----
> U. Artie
>
> _______________________________________________
> PowerTop mailing list
> PowerTop(a)lists.01.org
> https://lists.01.org/mailman/listinfo/powertop
>
Hi Ullysses,

Thank you for reporting the bug.  I'm investigating.

Thank you,
Alexandra.

--===============7943803433565211841==--

