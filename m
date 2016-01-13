Content-Type: multipart/mixed; boundary="===============7092544641011010241=="
MIME-Version: 1.0
From: Zhaoyang Huang <zhaoyang.huang at linaro.org>
Subject: Re: [Powertop] Fwd: powertop result
Date: Wed, 13 Jan 2016 13:23:47 +0800
Message-ID: <CAN2waFuTKSkso-mx-r95OdbBt8=FsL8PbVBmUsmF2hQO8YQUaA@mail.gmail.com>
In-Reply-To: CAN2waFtEPvpYrf4hxLcGoyBunbPf-MsPT=Pv=QZpnOHmLqDmng@mail.gmail.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============7092544641011010241==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Please find bellowing for console's log. Thanks

root(a)scx35l64_sp9838aea_5mod:/system/bin # powertop --html
modprobe cpufreq_stats failedmodprobe msr failedLoaded 0 prior measurements
Cannot load from file /data/local/powertop/saved_parameters.powertop
File will be loaded after taking minimum number of measurement(s) with
battery only
RAPL device for cpu 7
Model-specific registers (MSR)             not found (try enabling
CONFIG_X86_MSR).
Model-specific registers (MSR)             not found (try enabling
CONFIG_X86_MSR).
Model-specific registers (MSR)             not found (try enabling
CONFIG_X86_MSR).
Model-specific registers (MSR)             not found (try enabling
CONFIG_X86_MSR).
Model-specific registers (MSR)             not found (try enabling
CONFIG_X86_MSR).
Model-specific registers (MSR)             not found (try enabling
CONFIG_X86_MSR).
Model-specific registers (MSR)             not found (try enabling
CONFIG_X86_MSR).
RAPL device for cpu 7
Model-specific registers (MSR)             not found (try enabling
CONFIG_X86_MSR).
Model-specific registers (MSR)             not found (try enabling
CONFIG_X86_MSR).
Model-specific registers (MSR)             not found (try enabling
CONFIG_X86_MSR).
Model-specific registers (MSR)             not found (try enabling
CONFIG_X86_MSR).
Model-specific registers (MSR)             not found (try enabling
CONFIG_X86_MSR).
Model-specific registers (MSR)             not found (try enabling
CONFIG_X86_MSR).
Model-specific registers (MSR)             not found (try enabling
CONFIG_X86_MSR).
Cannot load from file /data/local/powertop/saved_parameters.powertop
File will be loaded after taking minimum number of measurement(s) with
battery only
Preparing to take measurements
trace-cmd: No such device
  unknown op '{'
Taking 1 measurement(s) for a duration of 20 second(s) each.
PowerTOP outputing using base filename powertop.html



On 13 January 2016 at 13:04, Zhaoyang Huang <zhaoyang.huang(a)linaro.org> w=
rote:
> Hi,
> I have rebased my tree on the master branch. The result remains same
> as before, where the problem mainly focus on powertop can not parse
> the topology correctly. Powertop just show cpu 7 while we have 8 cores
> within two clusters.
>
> On 12 January 2016 at 17:46, Wang, Wendy <wendy.wang(a)intel.com> wrote:
>> Pls try powertop v2.8.
>>
>> -----Original Message-----
>> From: PowerTop [mailto:powertop-bounces(a)lists.01.org] On Behalf Of Zha=
oyang Huang
>> Sent: Tuesday, January 12, 2016 5:44 PM
>> To: powertop(a)lists.01.org
>> Subject: [Powertop] Fwd: powertop result
>>
>> Hi powertop guys,
>> I have compiled the powertop based on Android5.1 successfully and have t=
he powertop run on a bL SOC. Whereas, the result shows abnormal, which can =
not parse the topology correctly. Do you run across the same problem.
>>
>> please find the attachment for the test report

--===============7092544641011010241==--

