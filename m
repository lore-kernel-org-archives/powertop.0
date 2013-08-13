Content-Type: multipart/mixed; boundary="===============2201481635642872507=="
MIME-Version: 1.0
From: Srinivas Pandruvada <srinivas.pandruvada at linux.intel.com>
Subject: Re: [Powertop] Lenovo T530 battery saving
Date: Tue, 13 Aug 2013 10:22:17 -0700
Message-ID: <520A6B49.3020903@linux.intel.com>
In-Reply-To: 20130813163602.GB11626@merlins.org
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============2201481635642872507==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 08/13/2013 09:36 AM, Marc MERLIN wrote:
> Mmmh, is there anyone here? Should I be sending this elsewhere?
>
> Thanks,
> Marc
>
> On Fri, Aug 02, 2013 at 10:27:38AM -0700, Marc MERLIN wrote:
>> Both powertop 2.1 and now powertop 2.4 tell me my onboard laptop camera
>> is burning battery.
>> This is a lenovo T530 with kernel 3.9.5.
>>
>> However, I've unloaded the module and that doesn't help:
>>
>> To save battery, I do:
>> ifconfig eth0 down
>> for i in videobuf2_core uvcvideo videodev e1000e
>> do
>>      rmmod $i
>> done
>>
>>
>> The battery reports a discharge rate of 14.5 W
>> The estimated remaining time is 2 hours, 8 minutes
>>
>> Summary: 681.7 wakeups/second,  2.0 GPU ops/seconds, 0.0 VFS ops/sec and=
 19.4% CPU use
>>
>> Power est.              Usage       Events/s    Category       Descripti=
on
>>    6.13 W     73.3%                      Device         Display backlight
>>    3.08 W    100.0%                      Device         USB device: Inte=
grated Camera (Chicony Electronics Co., Ltd.)
>>   71.2 mW    149.9 ms/s     240.0        Process        /usr/bin/enlight=
enment
>>   24.0 mW    175.6 =C2=B5s/s     144.5        Timer          menu_hrtime=
r_notify
>>   12.5 mW      1.0 ms/s      75.5        kWork          od_dbs_timer
>>   12.1 mW     98.3 =C2=B5s/s      72.9        Process        [kworker/2:=
0]
>>
>>
>> Yet, powertop is still showing this below which is still visible in lsus=
b after I unload
>> uvcvideo:
>> Bus 003 Device 004: ID 04f2:b2ea Chicony Electronics Co., Ltd
Unload module doesn't stop usb to enumerate the device. You should check =

with lsmod | grep "your module".
It is possible that BIOS power up this camera. So you should check any =

driver update for this, which sends some power down command to camera.
>>
>> I often have the same problem with my audio device too:
>>    1.88 W    100.0%                      Device         Audio codec alsa=
:hwC0D0: thinkpad (Realtek)
>>
>> Thankfully unloading some modules seems to fix this:
>> for i in snd_hda_intel snd_hda_codec_realtek snd_hda_codec snd_hwdep; do=
 rmmod $i; done
>>
>> Any idea how I can stop the camera from sucking power since unloading th=
e module isn't enough?
>>
>> Thanks,
>> Marc


--===============2201481635642872507==--

