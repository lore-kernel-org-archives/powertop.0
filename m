Content-Type: multipart/mixed; boundary="===============2761874559465312047=="
MIME-Version: 1.0
From: Zhang, Xiaofeng <xiaofeng.zhang at intel.com>
Subject: Re: [Powertop] powertop doesnt show watts
Date: Thu, 31 Oct 2013 09:07:44 +0000
Message-ID: <0A69F75AE33F46479629A1B92848A62C04B051B9@SHSMSX104.ccr.corp.intel.com>
In-Reply-To: 20131031090219.GB2209@swordfish.minsk.epam.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============2761874559465312047==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Great thanks!
It works now.

Best Regards =E2=98=BA
Xiaofeng Zhang

-----Original Message-----
From: Sergey Senozhatsky [mailto:sergey.senozhatsky(a)gmail.com] =

Sent: Thursday, October 31, 2013 5:02 PM
To: Zhang, Xiaofeng
Cc: powertop(a)lists.01.org
Subject: Re: [Powertop] powertop doesnt show watts

On (10/31/13 08:31), Zhang, Xiaofeng wrote:
> Thanks ss
> =

> But sorry, I didn't understand.. :(, what's your mean "some number of pre=
vious measurements"? Do you mean I need run powertop several times? I have =
tried it, not a valid method. =

> Could you provide more info? Thanks. =


yes, powertop collects data during each measurement tick.
the short list is: start powertop, unplug AC adapter, hit `s'
button, enter 5 and wait.

	-ss

> =

> Best Regards =E2=98=BA
> Xiaofeng Zhang
> =

> -----Original Message-----
> From: Sergey Senozhatsky [mailto:sergey.senozhatsky(a)gmail.com]
> Sent: Thursday, October 31, 2013 3:55 PM
> To: Zhang, Xiaofeng
> Cc: powertop(a)lists.01.org
> Subject: Re: [Powertop] powertop doesnt show watts
> =

> On (10/31/13 06:34), Zhang, Xiaofeng wrote:
> > Hi
> > =

> > From this mail thread, I see a result format like this:
> > Power est.  Events/s    Category       Description
> > 8.18 W    100.0%      Device         USB device: Yubico Yubikey II (Yub=
ico)
> > 8.13 W    100.0%      Device         USB device: Integrated Camera (Chi=
cony
> > =

> > However, when I use powertop on my Ubuntu laptop, I can't get the first=
 column (8.18W, etc.). I use the commond "powertop --calibrate ", while my =
laptop in discharging mode.
> > I can't find the solution in README or website, could you help?
> > =

> =

> Hello,
> I think you're talking about "Power est." column. quote from the =

> source code
> =

> 	/*
> 	 * only report power numbers once we have 3* more measurements than
> 	 * we have parameters; anything less and our model fit is highly
> 	 * suspect
> 	 */
> =

> =

> so powertop need some number of previous measurements in order to start e=
stimating.
> =

> 	-ss
> =

> > =

> > Best Regards =E2=98=BA
> > Xiaofeng Zhang
> > =

> > -----Original Message-----
> > From: powertop-bounces(a)lists.01.org =

> > [mailto:powertop-bounces(a)lists.01.org] On Behalf Of =

> > powertop-request(a)lists.01.org
> > Sent: Saturday, October 19, 2013 3:00 AM
> > To: powertop(a)lists.01.org
> > Subject: PowerTop Digest, Vol 18, Issue 19
> > =

> > Send PowerTop mailing list submissions to
> > 	powertop(a)lists.01.org
> > =

> > To subscribe or unsubscribe via the World Wide Web, visit
> > 	https://lists.01.org/mailman/listinfo/powertop
> > or, via email, send a message with subject or body 'help' to
> > 	powertop-request(a)lists.01.org
> > =

> > You can reach the person managing the list at
> > 	powertop-owner(a)lists.01.org
> > =

> > When replying, please edit your Subject line so it is more specific tha=
n "Re: Contents of PowerTop digest..."
> > =

> > =

> > Today's Topics:
> > =

> >    1. [PATCH -next] intel cpus: add proper C-states init
> >       (Sergey Senozhatsky)
> >    2. Re: USB devices get wrong power use values (Marc MERLIN)
> >    3. Re: USB devices get wrong power use values (Marc MERLIN)
> >    4. Re: [PATCH -next] intel cpus: add proper C-states init
> >       (Kristen Carlson Accardi)
> >    5. [Announce] v2.5-rc1 (Kristen Carlson Accardi)
> > =

> > =

> > --------------------------------------------------------------------
> > --
> > =

> > Message: 1
> > Date: Thu, 17 Oct 2013 23:37:51 +0300
> > From: Sergey Senozhatsky <sergey.senozhatsky(a)gmail.com>
> > To: powertop(a)lists.01.org
> > Subject: [Powertop] [PATCH -next] intel cpus: add proper C-states =

> > init
> > Message-ID: <20131017203751.GA2280(a)swordfish>
> > Content-Type: text/plain; charset=3Dus-ascii
> > =

> > add missing has_c2c7_res init to nhm_core() .ctor and has_c8c9c10_res/h=
as_c2c7_res init to nhm_package() .ctor.
> > =

> > uninitialised has_c2c7_res/has_c8c9c10_res/has_c2c7_res
> > may be used in core/package measurement_start()/measurement_end().
> > =

> > Signed-off-by: Sergey Senozhatsky <sergey.senozhatsky(a)gmail.com>
> > =

> > ---
> > =

> > src/cpu/intel_cpus.cpp | 6 +++++-
> >  1 file changed, 5 insertions(+), 1 deletion(-)
> > =

> > diff --git a/src/cpu/intel_cpus.cpp b/src/cpu/intel_cpus.cpp index
> > 194dc75..ad80337 100644
> > --- a/src/cpu/intel_cpus.cpp
> > +++ b/src/cpu/intel_cpus.cpp
> > @@ -87,6 +87,8 @@ static uint64_t get_msr(int cpu, uint64_t offset)
> >  =

> >  nhm_core::nhm_core(int model)
> >  {
> > +	has_c2c7_res =3D 0;
> > +
> >  	switch(model) {
> >  		case 0x2A:	/* SNB */
> >  		case 0x2D:	/* SNB Xeon */
> > @@ -252,6 +254,9 @@ char * nhm_core::fill_pstate_line(int line_nr, =

> > char *buffer)
> >  =

> >  nhm_package::nhm_package(int model)  {
> > +	has_c8c9c10_res =3D 0;
> > +	has_c2c7_res =3D 0;
> > +
> >  	switch(model) {
> >  		case 0x2A:	/* SNB */
> >  		case 0x2D:	/* SNB Xeon */
> > @@ -269,7 +274,6 @@ nhm_package::nhm_package(int model)
> >  	else
> >  		has_c3_res =3D 1;
> >  =

> > -
> >  	/* Haswell-ULT has C8/9/10*/
> >  	if (model =3D=3D 0x45)
> >  		has_c8c9c10_res =3D 1;
> > =

> > =

> > =

> > ------------------------------
> > =

> > Message: 2
> > Date: Thu, 17 Oct 2013 17:01:54 -0700
> > From: Marc MERLIN <marc_powertop(a)merlins.org>
> > To: Arjan van de Ven <arjan(a)linux.intel.com>
> > Cc: powertop(a)ml01.01.org
> > Subject: Re: [Powertop] USB devices get wrong power use values
> > Message-ID: <20131018000154.GA5362(a)merlins.org>
> > Content-Type: text/plain; charset=3Dus-ascii
> > =

> > On Sun, Oct 13, 2013 at 09:22:12AM -0700, Marc MERLIN wrote:
> > > On Sun, Oct 13, 2013 at 08:33:51AM -0700, Arjan van de Ven wrote:
> > > > On 9/22/2013 4:54 PM, Marc MERLIN wrote:
> > > > >So, I asked on the linux-usb list, and one thing I quickly =

> > > > >found out is that the Watt value given by powertop 2.4 is way off =
for USB devices:
> > > > =

> > > > what makes you think the value is off?
> > > > =

> > > > >>Power est.  Events/s    Category       Description
> > > > >>   8.18 W    100.0%      Device         USB device: Yubico Yubike=
y II (Yubico)
> > > > >>   8.13 W    100.0%      Device         USB device: Integrated Ca=
mera (Chicony Electronics Co., Ltd.)
> > > > =

> > > > having a USB device active also generally makes the CPU/etc use =

> > > > much more power, which Powertop "charges" to the USB device in ques=
tion.
> > > > =

> > > > 8 Watts sounds entirely reasonable for that to me...
> > > =

> > > Aah, if the CPU gets involved, then yes, it's a bit more possible.
> > > So, a simple USB keyboard that's unused can keep one core awake =

> > > and burn 8 watts if something else goes wrong in the kernel to cause =
that?
> > =

> > So, I just upgraded to 3.11.5, and see things like this below. Can alsa=
 sound really take 10W when I'm batteries?
> > Let me put it another way, it just cannot be correct. Full power use is=
 15W and if you removed 10W for audio (I'm sure that's wrong) and 3W for wi=
fi (that may be correct) it means my quad core laptop is running at 2W with=
 the screen on?
> > Not possible at all.
> > =

> > So there has to be a bug in powertop 2.4 USB device power calculation.
> > =

> > For what it's worth, I got the data below right after running powertop =
--calibrate and letting it go through a full cycle.
> > =

> > --------------------------------------------------------------------
> > --
> > ------ The battery reports a discharge rate of 15.1 W The estimated =

> > remaining time is 4 hours, 53 minutes
> > =

> > Summary: 572.4 wakeups/second,  18.3 GPU ops/seconds, 0.0 VFS =

> > ops/sec and 8.3% CPU use
> > =

> > Power est.              Usage       Events/s    Category       Descript=
ion
> >   10.5 W    100.0%                      Device         Audio codec alsa=
:hwC0D0: thinkpad (Realtek)
> >   3.10 W      7.0 pkts/s                Device         Network interfac=
e: wlan0 (iwlwifi)
> >   772 mW     25.1 ms/s     208.4        Process        /usr/bin/enlight=
enment
> >  13.4 mW      1.2 ms/s       8.5        Process        xfce4-terminal -=
T window10 --role=3Dwindow10 --tab
> > (...)
> > --------------------------------------------------------------------
> > --
> > ------
> > =

> > Calibrate results if that helps:
> > gandalfthegreat:~# powertop --calibrate Loaded 750 prior =

> > measurements RAPL device for cpu 0 RAPL device for cpu 0 RAPL device =

> > for cpu 0 Starting PowerTOP power estimate calibration Calibrating =

> > idle
> > Calibrating: disk usage
> > Calibrating backlight
> > .... device /sys/class/backlight/intel_backlight/brightness
> > .... device /sys/class/backlight/acpi_video0/brightness
> > Calibrating idle
> > Calibrating: CPU usage on 1 threads
> > Calibrating: CPU usage on 4 threads
> > Calibrating: CPU wakeup power consumption
> > Calibrating: CPU wakeup power consumption
> > Calibrating: CPU wakeup power consumption Calibrating USB devices .... =

> > device /sys/bus/usb/devices/3-1/power/control
> > .... device /sys/bus/usb/devices/4-1/power/control
> > .... device /sys/bus/usb/devices/usb1/power/control
> > .... device /sys/bus/usb/devices/usb2/power/control
> > .... device /sys/bus/usb/devices/usb3/power/control
> > .... device /sys/bus/usb/devices/usb4/power/control
> > .... device /sys/bus/usb/devices/3-1.2/power/control
> > .... device /sys/bus/usb/devices/3-1.6/power/control
> > Calibrating radio devices
> > .... device /sys/class/rfkill/rfkill0/soft .... device /sys/class/rfkil=
l/rfkill1/soft .... device /sys/class/rfkill/rfkill0/soft .... device /sys/=
class/rfkill/rfkill1/soft Finishing PowerTOP power estimate calibration Par=
ameters after calibration:
> > =

> > =

> > Parameter state
> > ----------------------------------
> > Value		Name
> >  2.23		alsa-codec-power (2)
> >  0.37		backlight (3)
> >  3.51		backlight-boost-100 (4)
> >  2.52		backlight-boost-40 (5)
> >  6.65		backlight-boost-80 (6)
> >  0.00		backlight-power (7)
> >  0.21		base power (8)
> >  0.00		cpu-consumption (9)
> >  0.00		cpu-wakeups (10)
> >  0.00		disk-operations (11)
> >  0.00		disk-operations-hard (12)
> >  0.00		eth0-link-100 (13)
> > 10.93		eth0-link-1000 (14)
> >  0.00		eth0-link-high (15)
> >  0.00		eth0-packets (16)
> >  0.00		eth0-powerunsave (17)
> >  0.00		eth0-up (18)
> >  0.20		gpu-operations (19)
> >  0.00		radio:hci0 (20)
> >  0.00		radio:phy0 (21)
> >  0.31		radio:tpacpi_bluetooth_sw (22)
> >  0.00		runtime-0000:00:00.0 (23)
> >  0.00		runtime-0000:00:02.0 (24)
> >  0.00		runtime-0000:00:14.0 (25)
> >  0.00		runtime-0000:00:16.0 (26)
> >  0.00		runtime-0000:00:16.3 (27)
> >  0.00		runtime-0000:00:19.0 (28)
> >  0.00		runtime-0000:00:1a.0 (29)
> >  0.00		runtime-0000:00:1b.0 (30)
> >  0.00		runtime-0000:00:1c.0 (31)
> >  0.00		runtime-0000:00:1c.1 (32)
> >  0.00		runtime-0000:00:1c.2 (33)
> >  0.00		runtime-0000:00:1d.0 (34)
> >  0.00		runtime-0000:00:1f.0 (35)
> >  0.00		runtime-0000:00:1f.2 (36)
> >  0.00		runtime-0000:00:1f.3 (37)
> >  0.00		runtime-0000:02:00.0 (38)
> >  0.00		runtime-0000:03:00.0 (39)
> >  0.00		thinkpad-fan (40)
> >  0.00		thinkpad-fan-cub (41)
> >  0.00		thinkpad-fan-sqr (42)
> >  0.00		thinkpad-light (43)
> >  0.00		usb-device-0403-6001 (44)
> >  0.00		usb-device-04e8-6860 (45)
> >  0.00		usb-device-04e8-6864 (46)
> >  2.58		usb-device-04f2-b2ea (47)
> >  0.00		usb-device-058f-6387 (48)
> >  0.00		usb-device-091e-0003 (49)
> >  1.34		usb-device-0a5c-21e6 (50)
> >  9.82		usb-device-1050-0010 (51)
> >  0.00		usb-device-18d1-4ee2 (52)
> >  0.00		usb-device-18d1-4ee4 (53)
> >  0.00		usb-device-1d6b-0002 (54)
> >  0.00		usb-device-1d6b-0003 (55)
> >  0.00		usb-device-8087-0024 (56)
> >  0.00		usb0-link-100 (57)
> >  0.00		usb0-link-1000 (58)
> >  0.00		usb0-link-high (59)
> >  0.00		usb0-packets (60)
> >  0.00		usb0-powerunsave (61)
> >  0.00		usb0-up (62)
> >  0.00		vboxnet0-link-100 (63)
> >  0.00		vboxnet0-link-1000 (64)
> >  0.00		vboxnet0-link-high (65)
> >  0.00		vboxnet0-packets (66)
> >  0.00		vboxnet0-powerunsave (67)
> >  0.00		vboxnet0-up (68)
> >  0.00		wlan0-link-100 (69)
> >  0.00		wlan0-link-1000 (70)
> >  0.00		wlan0-link-high (71)
> >  0.00		wlan0-packets (72)
> >  1.64		wlan0-powerunsave (73)
> >  0.00		wlan0-up (74)
> >  0.00		xwakes (75)
> > =

> > Score:    2.6  (104691.5)
> > Guess:   13.2
> > Actual:  13.6
> > ----------------------------------
> > =

> > =

> > --
> > "A mouse is a device used to point at the xterm you want to type in" - =
A.S.R.
> > Microsoft is to operating systems ....
> >                                       .... what McDonalds is to =

> > gourmet cooking Home page: http://marc.merlins.org/
> > =

> > =

> > ------------------------------
> > =

> > Message: 3
> > Date: Thu, 17 Oct 2013 17:24:41 -0700
> > From: Marc MERLIN <marc_powertop(a)merlins.org>
> > To: Arjan van de Ven <arjan(a)linux.intel.com>
> > Cc: powertop(a)ml01.01.org
> > Subject: Re: [Powertop] USB devices get wrong power use values
> > Message-ID: <20131018002441.GB5362(a)merlins.org>
> > Content-Type: text/plain; charset=3Dus-ascii
> > =

> > On Thu, Oct 17, 2013 at 05:01:54PM -0700, Marc MERLIN wrote:
> > > On Sun, Oct 13, 2013 at 09:22:12AM -0700, Marc MERLIN wrote:
> > > > On Sun, Oct 13, 2013 at 08:33:51AM -0700, Arjan van de Ven wrote:
> > > > > On 9/22/2013 4:54 PM, Marc MERLIN wrote:
> > > > > >So, I asked on the linux-usb list, and one thing I quickly =

> > > > > >found out is that the Watt value given by powertop 2.4 is way of=
f for USB devices:
> > > > > =

> > > > > what makes you think the value is off?
> > > > > =

> > > > > >>Power est.  Events/s    Category       Description
> > > > > >>   8.18 W    100.0%      Device         USB device: Yubico Yubi=
key II (Yubico)
> > > > > >>   8.13 W    100.0%      Device         USB device: Integrated =
Camera (Chicony Electronics Co., Ltd.)
> > > > > =

> > > > > having a USB device active also generally makes the CPU/etc =

> > > > > use much more power, which Powertop "charges" to the USB device i=
n question.
> > > > > =

> > > > > 8 Watts sounds entirely reasonable for that to me...
> > > > =

> > > > Aah, if the CPU gets involved, then yes, it's a bit more possible.
> > > > So, a simple USB keyboard that's unused can keep one core awake =

> > > > and burn 8 watts if something else goes wrong in the kernel to caus=
e that?
> > > =

> > > So, I just upgraded to 3.11.5, and see things like this below. Can =

> > > alsa sound really take 10W when I'm batteries?
> > > Let me put it another way, it just cannot be correct. Full power =

> > > use is 15W and if you removed 10W for audio (I'm sure that's =

> > > wrong) and 3W for wifi (that may be correct) it means my quad core la=
ptop is running at 2W with the screen on?
> > > Not possible at all.
> > =

> > > So there has to be a bug in powertop 2.4 USB device power calculation.
> > > =

> > > For what it's worth, I got the data below right after running =

> > > powertop --calibrate and letting it go through a full cycle.
> > > =

> > > ------------------------------------------------------------------
> > > --
> > > -------- The battery reports a discharge rate of 15.1 W The =

> > > estimated remaining time is 4 hours, 53 minutes
> > > =

> > > Summary: 572.4 wakeups/second,  18.3 GPU ops/seconds, 0.0 VFS =

> > > ops/sec and 8.3% CPU use
> > > =

> > > Power est.              Usage       Events/s    Category       Descri=
ption
> > >   10.5 W    100.0%                      Device         Audio codec al=
sa:hwC0D0: thinkpad (Realtek)
> > >   3.10 W      7.0 pkts/s                Device         Network interf=
ace: wlan0 (iwlwifi)
> > >   772 mW     25.1 ms/s     208.4        Process        /usr/bin/enlig=
htenment
> > >  13.4 mW      1.2 ms/s       8.5        Process        xfce4-terminal=
 -T window10 --role=3Dwindow10 --tab
> > > (...)
> > > ------------------------------------------------------------------
> > > --
> > > --------
> > =

> > Just after I wrote this, I'm now seeing my yubikey back to 10W when =

> > it was alsa holding the slot earlier.
> >  =

> > > ------------------------------------------------------------------
> > > --
> > > --------
> > The battery reports a discharge rate of 21.3 W The estimated =

> > remaining time is 3 hours, 0 minutes
> > =

> > Summary: 2685.1 wakeups/second,  149.8 GPU ops/seconds, 0.0 VFS =

> > ops/sec and 31.2% CPU use
> > =

> > Power est.              Usage       Events/s    Category       Descript=
ion
> >   10.4 W    100.0%                      Device         USB device: Yubi=
co Yubikey II (Yubico)
> >   5.50 W     13.0%                      Device         Display backlight
> >   1.51 W     17.4 pkts/s                Device         Network interfac=
e: wlan0 (iwlwifi)
> >   566 mW     85.8 ms/s     1520.4       Process        /usr/bin/enlight=
enment
> >   109 mW    100.0%                      Device         Audio codec alsa=
:hwC0D0: thinkpad (Realtek)
> >  43.2 mW      5.2 ms/s      72.9        Process        xfce4-terminal -=
T window5 --role=3Dwindow5
> >  25.9 mW      0.8 ms/s      14.8        Process        xfce4-terminal -=
T window9 --role=3Dwindow9 --tab
> > > ------------------------------------------------------------------
> > > --
> > > --------
> > =

> > I hope this is useful.
> > =

> > Marc
> > --
> > "A mouse is a device used to point at the xterm you want to type in" - =
A.S.R.
> > Microsoft is to operating systems ....
> >                                       .... what McDonalds is to =

> > gourmet cooking Home page: http://marc.merlins.org/
> > =

> > =

> > ------------------------------
> > =

> > Message: 4
> > Date: Fri, 18 Oct 2013 11:07:25 -0700
> > From: Kristen Carlson Accardi <kristen(a)linux.intel.com>
> > To: Sergey Senozhatsky <sergey.senozhatsky(a)gmail.com>
> > Cc: powertop(a)lists.01.org
> > Subject: Re: [Powertop] [PATCH -next] intel cpus: add proper C-states
> > 	init
> > Message-ID: <20131018110725.7a2b1459(a)bluebird.jf.intel.com>
> > Content-Type: text/plain; charset=3DUS-ASCII
> > =

> > On Thu, 17 Oct 2013 23:37:51 +0300
> > Sergey Senozhatsky <sergey.senozhatsky(a)gmail.com> wrote:
> > =

> > > add missing has_c2c7_res init to nhm_core() .ctor and =

> > > has_c8c9c10_res/has_c2c7_res init to nhm_package() .ctor.
> > > =

> > > uninitialised has_c2c7_res/has_c8c9c10_res/has_c2c7_res
> > > may be used in core/package measurement_start()/measurement_end().
> > > =

> > > Signed-off-by: Sergey Senozhatsky <sergey.senozhatsky(a)gmail.com>
> > =

> > Applied, thanks.
> > =

> > =

> > ------------------------------
> > =

> > Message: 5
> > Date: Fri, 18 Oct 2013 11:09:26 -0700
> > From: Kristen Carlson Accardi <kristen(a)linux.intel.com>
> > To: powertop(a)lists.01.org
> > Subject: [Powertop] [Announce] v2.5-rc1
> > Message-ID: <20131018110926.2deb6450(a)bluebird.jf.intel.com>
> > Content-Type: text/plain; charset=3DUS-ASCII
> > =

> > Please test.
> > =

> > Thanks,
> > Kristen
> > =

> > =

> > ------------------------------
> > =

> > _______________________________________________
> > PowerTop mailing list
> > PowerTop(a)lists.01.org
> > https://lists.01.org/mailman/listinfo/powertop
> > =

> > =

> > End of PowerTop Digest, Vol 18, Issue 19
> > ****************************************
> > _______________________________________________
> > PowerTop mailing list
> > PowerTop(a)lists.01.org
> > https://lists.01.org/mailman/listinfo/powertop

--===============2761874559465312047==--

