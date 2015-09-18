Content-Type: multipart/mixed; boundary="===============8637656705152537065=="
MIME-Version: 1.0
From: Lorenzo Pieralisi <lorenzo.pieralisi at arm.com>
Subject: Re: [Powertop] [RESEND PATCH] powertop: fix erroneous C state
 detection on ARM
Date: Fri, 18 Sep 2015 11:23:06 +0100
Message-ID: <20150918102306.GB1261@red-moon>
In-Reply-To: 55FB5932.6040603@linux.intel.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============8637656705152537065==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 18, 2015 at 01:22:10AM +0100, Alexandra Yates wrote:
> This patch was added to the current powertop.rc1

Thanks !!!!

Lorenzo

> AY
> =

> On 07/07/2015 08:04 AM, Lorenzo Pieralisi wrote:
> > On Mon, Jun 15, 2015 at 10:57:29AM +0100, Lorenzo Pieralisi wrote:
> >> When the kernel is configured with CONFIG_CPU_IDLE_MULTIPLE_DRIVERS,
> >> the cpuidle directory contains a "driver" subdirectory that confuses
> >> the current code parsing the C states on ARM platforms, ending up
> >> with a C state entry corresponding to the actual driver name instead
> >> of a proper C state entry.
> >>
> >> This patch fixes the code by stopping the parsing if the files that
> >> characterise the C states (ie usage) are not found in the respective:
> >>
> >> /sys/devices/system/cpu/cpuX/cpuidle
> >>
> >> subdirectory containing C states information.
> >>
> >> Signed-off-by: Lorenzo Pieralisi <lorenzo.pieralisi(a)arm.com>
> >> Tested-by: Kevin Hilman <khilman(a)linaro.org>
> >> ---
> >> Alexandra, Arjan,
> >>
> >> previous posting here:
> >>
> >> https://lists.01.org/pipermail/powertop/2014-December/001724.html
> >>
> >> Please consider pulling this patch.
> > Gentle ping.
> >
> > Thanks,
> > Lorenzo
> >
> >> Thanks,
> >> Lorenzo
> >>
> >>   src/cpu/cpu_linux.cpp | 6 ++++--
> >>   1 file changed, 4 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/src/cpu/cpu_linux.cpp b/src/cpu/cpu_linux.cpp
> >> index e1ff165..78fd2d3 100644
> >> --- a/src/cpu/cpu_linux.cpp
> >> +++ b/src/cpu/cpu_linux.cpp
> >> @@ -83,7 +83,8 @@ void cpu_linux::parse_cstates_start(void)
> >>   		if (file) {
> >>   			file >> usage;
> >>   			file.close();
> >> -		}
> >> +		} else
> >> +			continue;
> >>   =

> >>   		sprintf(filename + len, "/%s/time", entry->d_name);
> >>   =

> >> @@ -172,7 +173,8 @@ void cpu_linux::parse_cstates_end(void)
> >>   		if (file) {
> >>   			file >> usage;
> >>   			file.close();
> >> -		}
> >> +		} else
> >> +			continue;
> >>   =

> >>   		sprintf(filename + len, "/%s/time", entry->d_name);
> >>   =

> >> -- =

> >> 1.9.1
> >>
> =

> -- =

> Thank you,
> <Alexandra>
>=20

--===============8637656705152537065==--

