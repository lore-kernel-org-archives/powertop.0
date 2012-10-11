Content-Type: multipart/mixed; boundary="===============4993853392933911077=="
MIME-Version: 1.0
From: Arjan van de Ven <arjan at linux.intel.com>
Subject: Re: [Powertop] [PATCH] Move report.cpp and report.h to report/
 directory.
Date: Thu, 11 Oct 2012 06:21:45 -0700
Message-ID: <5076C7E9.1030205@linux.intel.com>
In-Reply-To: 5076A76E.4020001@samsung.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============4993853392933911077==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 10/11/2012 4:03 AM, Igor Zhbanov wrote:
> Igor Zhbanov wrote:
>> Move report.cpp and report.h to report/ directory to other report-related
>> files.
>> ---
>>   src/Makefile.am            |    4 +-
>>   src/cpu/cpu.cpp            |    2 +-
>>   src/devices/device.cpp     |    2 +-
>>   src/devlist.cpp            |    2 +-
>>   src/main.cpp               |    2 +-
>>   src/process/do_process.cpp |    2 +-
>>   src/report.cpp             |  195 ------------------------------------=
--------
>>   src/report.h               |   46 ----------
>>   src/tuning/tuning.cpp      |    2 +-
>>   9 files changed, 8 insertions(+), 249 deletions(-)
>>   delete mode 100644 src/report.cpp
>>   delete mode 100644 src/report.h
> Oops... Forget to tell the git about new file. Please wait for the new ve=
rsion of the patch.
> =


can you tell git also to make a patch that detects renames (m option)
that way it's more obvious nothing changed ;-)


--===============4993853392933911077==--

