Content-Type: multipart/mixed; boundary="===============1592232832110505325=="
MIME-Version: 1.0
From: Chris Ferron <chris.e.ferron at linux.intel.com>
Subject: Re: [Powertop] [RFC][PATCH 2/2] Convert powertop to use new report
 generator facility
Date: Mon, 08 Oct 2012 11:22:23 -0700
Message-ID: <507319DF.5000607@linux.intel.com>
In-Reply-To: 1349283961-26760-1-git-send-email-i.zhbanov@samsung.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============1592232832110505325==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 10/03/2012 10:06 AM, Igor Zhbanov wrote:
> Convert report system to use new report generator facility
> for producing parsable CSV- and HTML-reports, enhancing code readability
> and maintainability, merging CSV and HTML codepaths, separating document
> structure from text formatting.
> ---
>   src/cpu/cpu.cpp            |  410 ++++++++++---------------------------=
-------
>   src/cpu/cpu.h              |    5 +
>   src/cpu/cpu_core.cpp       |   11 --
>   src/cpu/cpu_linux.cpp      |   55 +++++--
>   src/cpu/cpu_package.cpp    |   12 --
>   src/cpu/intel_cpus.cpp     |   19 --
>   src/devices/device.cpp     |  112 ++++--------
>   src/devlist.cpp            |   44 ++----
>   src/main.cpp               |   13 +-
>   src/powertop.css           |   10 +
>   src/process/do_process.cpp |  199 ++++++++++------------
>   src/report.cpp             |  145 +++++-----------
>   src/report.h               |   12 +-
>   src/tuning/tuning.cpp      |  145 +++++-----------
>   14 files changed, 393 insertions(+), 799 deletions(-)
>
>
Hello,
So first id like to say nice work. I see lots of improvements, and some =

fixes that were missed in the past.
Couple of things,

#1 I noticed that the scripts section of Software Settings in need of =

Tuning is missing. I see the nice header, but not data.
#2 C0 active table cells are not aligned , and the CPU's are also not =

aligned correctly in the Processor Idle state report section.
#3 I get some warning compiling, I know PowerTOP is not warning less, =

but would like to attempt to prevent adding more. (and fixing exiting =

ones of course)
report/report-maker.cpp: In destructor =E2=80=98report_maker::~report_maker=
()=E2=80=99:
report/report-maker.cpp:51:10: warning: deleting object of abstract =

class type =E2=80=98report_formatter=E2=80=99 which has non-virtual destruc=
tor will =

cause undefined behaviour [-Wdelete-non-virtual-dtor]
report/report-maker.cpp: In member function =E2=80=98void =

report_maker::setup_report_formatter()=E2=80=99:
report/report-maker.cpp:110:10: warning: deleting object of abstract =

class type =E2=80=98report_formatter=E2=80=99 which has non-virtual destruc=
tor will =

cause undefined behaviour [-Wdelete-non-virtual-dtor]

#4 report[c,h] should probable just go in your new sub/dir (report).
#5 csv report has alignment issues for both the cpu Idle and Freq. Even =

if they are machine readable, they need to be easily parsed using open =

office or MS excel and look aligned with the http report.

other issues are small and can be attended to in the future, or have =

been already expressed.

Thanks
-C



--===============1592232832110505325==--

