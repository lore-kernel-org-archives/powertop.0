Content-Type: multipart/mixed; boundary="===============0871865989746296538=="
MIME-Version: 1.0
From: Chris Samuel <chris at csamuel.org>
Subject: Re: [Powertop] [Announcement] Updated Users Guide Released
Date: Tue, 16 Dec 2014 21:40:32 +1100
Message-ID: <9995241.6PyfrQ3JKN@quad>
In-Reply-To: 57889.10.254.17.184.1418351950.squirrel@linux.intel.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============0871865989746296538==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, 11 Dec 2014 06:39:10 PM Alexandra Yates wrote:

> An updated version of the PowerTOP User's Guide was released today!!
> =

> Visit https://01.org/powertop to get the latest copy.

It would also be useful to explain how to select the intel_pstate driver as =

whilst the Kubuntu 14.04 kernel has it compiled in it does not select it by =

default.

root(a)quad:~# cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_driver
acpi-cpufreq

root(a)quad:~# grep -i pstate /boot/config-3.13.0-43-generic =

CONFIG_X86_INTEL_PSTATE=3Dy

CPU is IVB.

Intel(R) Core(TM) i7-3770K CPU @ 3.50GHz (fam: 06, model: 3a, stepping: 09)

All the best,
Chris
-- =

 Chris Samuel  :  http://www.csamuel.org/  :  Melbourne, VIC



--===============0871865989746296538==--

