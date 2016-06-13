Content-Type: multipart/mixed; boundary="===============2078871772740026058=="
MIME-Version: 1.0
From: Joe Konno <joe.konno at linux.intel.com>
Subject: [Powertop] [PATCH 0/2 v1] intel_cpus: average cpu frequency,
 dnd some idle data
Date: Mon, 13 Jun 2016 09:00:32 -0700
Message-ID: <20160613160034.29283-1-joe.konno@linux.intel.com>
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============2078871772740026058==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Joe Konno <joe.konno(a)intel.com>

The first patch in this series makes a cosmetic change to the Frequency Sta=
ts
tab for Intel end-users. "Actual" cpu frequency will be changed to "Average=
",
which is a more accurate representation of that data (since it displays the
average cpu frequency for the sampling period). The underlying algorithms w=
hich
generate this data remain unchanged.

The second patch will add a condition to the Frequency Stats tab "Idle"
display, which will _not_ display "Idle" data if the intel_pstate kernel dr=
iver
(not cpufreq) is loaded. Only the average frequency of each logical core for
the sample period will be displayed (if intel_pstate is loaded).

With intel_pstate, Idle data for the Frequency Stats tab is inferred from
cpu_frequency PM trace events. There have been particular workloads where
PowerTOP may display 100% idle (in Frequency Stats) for the sampling period
despite logical cores doing work. Further, Frequency Stats' 'idle' data may=
 not
match idle data presented in the Idle Stats tab. This is a bug, and is the
justification for patch 2 in this series.

After this patch series is committed, end-users who load the intel_pstate
driver are directed to perform idle analysis on data gathered from the Idle
Stats tab, as the Frequency Stats tab will only provide average logical core
frequency for the sampling period. It may be possible to bring idle statist=
ics
back to the Frequency Stats tab for intel_pstate in the future, but only af=
ter
careful re-examination of Frequency Stats' idle calculations.

Joe Konno (2):
  intel_cpus: frequency: clarify average clock speed
  intel_cpus: no pstate Idle pct with intel_pstate

 src/cpu/intel_cpus.cpp | 52 ++++++++++++++++++++++++++++++++++++++++++----=
----
 src/cpu/intel_cpus.h   |  2 ++
 2 files changed, 46 insertions(+), 8 deletions(-)

-- =

2.8.3


--===============2078871772740026058==--

