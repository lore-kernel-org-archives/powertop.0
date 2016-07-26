Content-Type: multipart/mixed; boundary="===============8205460838432810447=="
MIME-Version: 1.0
From: Joe Konno <joe.konno at linux.intel.com>
Subject: Re: [Powertop] cpu wiggle changes userspace governor settings
Date: Tue, 26 Jul 2016 10:27:02 -0700
Message-ID: <20160726102702.236c2892@jbkonno-lemu6.jf.intel.com>
In-Reply-To: c9a9b03b-a3b1-d362-7bbc-60e84af79acb@tu-dresden.de
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============8205460838432810447==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Thomas,

I cannot apply your diff to either the v2.8 tag or master. Could you
rebase it atop master and re-submit? Thanks!

PS: I'll address the question about wiggle particulars separately.
To be perfectly honest I have some digging to do. ^_^

On Thu, 21 Jul 2016 12:13:17 +0200
Thomas Ilsche <thomas.ilsche(a)tu-dresden.de> wrote:

> Dear Powertop Team,
> =

> I have noticed that powertop changes the frequency set by the
> userspace governor to the minimum available frequency.
> =

> This is caused by abstract_cpu::wiggle that touches the
> {min,max}_freq. By doing so, it also narrows down the
> scaling_setspeed setting within the min-max-range, but it is not
> reset upon restoring max_freq. To illustrate what is happening behind
> the scenes:
> =

> $ cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_{min,max,cur}_freq
> 1200000
> 2901000
> 2000000
> $ cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_{governor,setspeed}
> userspace
> 2000000
> $ echo 1200000 | sudo
> tee /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq 1200000
> $ cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_setspeed
> 1200000
> =

> (Tested with Linux 4.4.0-21 Ubuntu)
> =

> Attached is a patch that resets the setspeed value if it was set to a
> numeric value before the wiggle.
> =

> Please note that I don't really understand what you are trying to
> achieve with the wiggle in the first place. It seems for instance
> that this doesn't do anything if max_freq =3D=3D min_freq.
> =

> Best Regards,
> Thomas Ilsche
> =



--===============8205460838432810447==
Content-Type: application/pgp-signature
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.sig"

LS0tLS1CRUdJTiBQR1AgU0lHTkFUVVJFLS0tLS0KVmVyc2lvbjogR251UEcgdjIKCmlRSWNCQUVC
Q0FBR0JRSlhsNTFuQUFvSkVJMklSOVV2U3FwbTMvMFFBT2ozczJlbmtFdkhJYWNkeE15UDhrNEMK
NVlVQXNYckF0bjMvNllIT0p3Tk5HanRLdW5XWkNQL1Y1TnEwOU1DK3BJTmNuZ04zVFFHdXFvVkVS
bVdteldWVwp2TXZ4WUtJRkF2T1V3L1JCemY0bVltYmtrQm0yUEJtRnh2cW1tREw3aUU0cXF2eDI3
NU9qOW5PUjFWcmZNTW5vCmh5T2praUVjRFpXeXBvNEgzSEVhby8zbmpneXhiaUhTUTd2MlpJMGZt
bWxiVjBjbmwrT1I1UWplTEYyMjJmMUEKblU5VGxmQ3gvbU5sY0luTGpJNmZ4QzFFa013YWtmNHpB
UHhHS3lqOWg3RGVGU05lMVl0OFpkNmRxQmtzK1JWegorZzVBakdTMElWeTY3S2hXOEthWHFHcVZY
blAwa3JtbFhTTTdENVNDeklwSGpnOVNQeFVqNVNPcDMzOWhWK1haCkpkU2tCb3prWnZVUWkzNXEx
YTB3UzRHVnJ3U0JGck1aQjh3bkg1TmF5SlFycGFnTURVcHlDZWpkWWl4YTVCaTYKNXY3QTVYY2x3
dzJzVElSb0s2ZDYrMDF5MkpsOWVsWEhxeGZaSm5RbXdnSXZGSFBZMWVqbEgvRzFxNEZTTkZIWQpD
NkZtU0szY1dPdzQwWk1DR1E4TEVzR2pjZ3BjbDQ0QUxxcEV1ZW1wSkw0NHRXMlp1UnJQNWJIUUNn
WHIxemhwCnhzSzkwUWdvQmoxOUZSYXJYZVNaZDBRNXRIZFhYNTVhNDZmc1JMdHN1ZE16ZWxZY0dt
Y0tFek1YYmdYWEM1RDkKeHZMRU1hd2ZTMldQcWIvZ3lmSGlJK1lQYkp1eDcybGdZcXA5N1I4Q1J5
ZmdYRU11V0pUMmpmM05aN2FnMHZkdwpndnhRalIvamtMQTdLNXp3Z1IzcAo9TTd6TAotLS0tLUVO
RCBQR1AgU0lHTkFUVVJFLS0tLS0K

--===============8205460838432810447==--

