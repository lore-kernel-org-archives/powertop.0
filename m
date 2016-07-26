Content-Type: multipart/mixed; boundary="===============2594453958467956067=="
MIME-Version: 1.0
From: Joe Konno <joe.konno at linux.intel.com>
Subject: Re: [Powertop] cpu wiggle changes userspace governor settings
Date: Tue, 26 Jul 2016 11:20:53 -0700
Message-ID: <20160726112053.4982a0da@jbkonno-lemu6.jf.intel.com>
In-Reply-To: c9a9b03b-a3b1-d362-7bbc-60e84af79acb@tu-dresden.de
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============2594453958467956067==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

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

We need to force a perf event at the beginning of the sampling
period. That's the only way the code can determine the starting
frequency. There may be other/better ways to do this. Patches, input
always welcome.

> =

> Best Regards,
> Thomas Ilsche
> =



--===============2594453958467956067==
Content-Type: application/pgp-signature
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.sig"

LS0tLS1CRUdJTiBQR1AgU0lHTkFUVVJFLS0tLS0KVmVyc2lvbjogR251UEcgdjIKCmlRSWNCQUVC
Q0FBR0JRSlhsNm9GQUFvSkVJMklSOVV2U3FwbWxBd1FBTGZOOUtUdnk3a3hPM0hXa1lBSTNJcHoK
eGt6Y2M0aEhtTTgwNm5MUlF0T0JvamcyblJVM0VmVTZhZWJEUDRlMGIzRllyZTJSbjJ1Q0dTdi9H
cTgwRS9lOApQaDlzSlVKVlpBRGExVFMwdHpEV2wycFdQM2QvZlFVVXdpR0JsbUJ2YjJEMmVrblp3
cnd4OU1rS1RHd1ZESFA1CnY1bEVkS3ZKWWpUdjl5bDNCWjVZQVJuZ3BqWWJITUFWTnR0bjdHWWxo
WUh4SFlqQjlFc2MzQ2ppUldkNnRKMG8KUTF5UTRkakduVXprZW5MV29XaWNMR2FoY2tZWUs4OEt4
eWZzclFCQmVXRzltbFJOc3VTTUwwbzIxVGRCNjRzTQpMZGIya2hPYnQxUUxtNjFPRVR0S2VCeHlk
RThONVRpd0EvMWtCZmVGWkM0dHN6VmlNK0dKSFNjNUxUUjdUWWM0CjNLc2lCWmlnNVFJTmFXTVpz
ZERQWm5tdkF5TVdLZkF6c1pkajlFREpOcUwvZ2NSRWptOTBzS2lXSVMxRU52a1gKNFY0ZksxcVgw
NlBLV0NYMmxuVHZPc2NPZ0ExR1NET2hNSUFRa3RqMVBIVG9ZYjNHZFkrMGUvbno5akcxR1VESgpt
R250aUpwUU94Sld1OTFPaG9LeCtaN1BEejBiTlBWS3g4TEdCY2ZQV3ovRTZIWnE0MFZvS1hvVFFX
dzhHNktqCjFoR3hMajNkd1dCNGxNeEs0Q2UrYjdFeHcwRzlmcm9uN0ZadDRwSDRtZkJzUVRLcjkw
dGVlQWRDb3FSbUFINUgKSVVNb1cxOU45bXBsQTJMcDI4c1dKZGU5S0lFeVdiUjNtV3pUVFBobGY0
dkJhN2FLRzkzMTZHSWU5dHJWSmxzWgpodDVia0ZmenBMcEVqSDhzbmdnRgo9emRHNQotLS0tLUVO
RCBQR1AgU0lHTkFUVVJFLS0tLS0K

--===============2594453958467956067==--

