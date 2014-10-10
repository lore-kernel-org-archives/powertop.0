Content-Type: multipart/mixed; boundary="===============8183205112919238406=="
MIME-Version: 1.0
From: Sanjay Singh Rawat <sanjay.rawat at linaro.org>
Subject: Re: [Powertop] [PATCH] devfreq: add devfreq devices stats support
Date: Fri, 10 Oct 2014 15:13:13 +0530
Message-ID: <5437AA31.4050908@linaro.org>
In-Reply-To: 20141001202201.GA2236@sara.bahnhof.se
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============8183205112919238406==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


On Thursday 02 October 2014 01:52 AM, Magnus Fromreide wrote:
> On Tue, Sep 30, 2014 at 12:04:54PM +0530, Sanjay Singh Rawat wrote:
>> add window to show frequency stats for devfreq devices
>>
>> Signed-off-by: Rajagopal Venkat <rajagopal.venkat(a)gmail.com>
>> Signed-off-by: Sanjay Singh Rawat <sanjay.rawat(a)linaro.org>
>> ---
>>
>> v2 - Show devfreq window on support basis. Check for empty devfreq
>>       directory.
>>     - Free the open dirp while exiting.
>> ---
>>   src/Makefile.am           |   1 +
>>   src/devices/devfreq.cpp   | 367 ++++++++++++++++++++++++++++++++++++++=
++++++++
>>   src/devices/devfreq.h     |  75 ++++++++++
>>   src/main.cpp              |   9 ++
>>   src/report/report-maker.h |   1 +
>>   5 files changed, 453 insertions(+)
>>   create mode 100644 src/devices/devfreq.cpp
>>   create mode 100644 src/devices/devfreq.h
>>
>> diff --git a/src/Makefile.am b/src/Makefile.am
>> index 311b75e..d2f1da7 100644
>> --- a/src/Makefile.am
>> +++ b/src/Makefile.am
>> @@ -39,6 +39,7 @@ powertop_SOURCES =3D \
>>   	devices/alsa.h \
>>   	devices/backlight.cpp \
>>   	devices/backlight.h \
>> +	devices/devfreq.cpp \
>>   	devices/device.cpp \
>>   	devices/device.h \
>>   	devices/gpu_rapl_device.cpp \
>> diff --git a/src/devices/devfreq.cpp b/src/devices/devfreq.cpp
>> new file mode 100644
>> index 0000000..3eb63e5
>> --- /dev/null
>> +++ b/src/devices/devfreq.cpp
>> @@ -0,0 +1,367 @@
> ...
>> +/* todo: adapt to new report format */
>> +#if 0
> Do it, or at least do not commit big #if 0-blocks.

ack
>
>> +	char buffer[512];
>> +	unsigned int i, j;
>> +
>> +	report.begin_section(SECTION_DEVFREQ);
>> +	report.add_header("Device Frequency Report");
>> +
>> +	report.begin_table(TABLE_WIDE);
>> +	if (!all_devfreq.size()) {
>> +		report.begin_row();
>> +		report.add(" No devfreq devices available");
>> +		return;
>> +	}
>> +
>> +	for (i =3D 0; i < all_devfreq.size(); i++) {
>> +		buffer[0] =3D 0;
>> +		class devfreq *df =3D all_devfreq[i];
>> +
>> +		report.begin_row();
>> +		report.begin_cell(CELL_CPU_PSTATE_HEADER);
>> +		report.addf("%s", df->device_name());
>> +
>> +		for (j =3D 0; j < df->dstates.size(); j++) {
>> +			report.begin_row();
>> +			report.begin_cell(CELL_CPU_STATE_VALUE);
>> +			df->fill_freq_name(j, buffer);
>> +			report.add(buffer);
>> +			report.begin_cell(CELL_CPU_STATE_VALUE);
>> +			df->fill_freq_utilization(j, buffer);
>> +			report.add(buffer);
>> +		}
>> +	}
>> +#endif
> /MF

-- =

sanjay


--===============8183205112919238406==--

