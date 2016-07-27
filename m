Content-Type: multipart/mixed; boundary="===============4065238835305564411=="
MIME-Version: 1.0
From: Joe Konno <joe.konno at linux.intel.com>
Subject: Re: [Powertop] cpu wiggle changes userspace governor settings
Date: Wed, 27 Jul 2016 07:34:31 -0700
Message-ID: <20160727073431.1fbe4a6c@jbkonno-lemu6>
In-Reply-To: a093d2a4-a720-034d-e679-abb8332ba567@tu-dresden.de
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============4065238835305564411==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, 27 Jul 2016 09:07:04 +0200
Thomas Ilsche <thomas.ilsche(a)tu-dresden.de> wrote:

> Hi Joe,
> =

> seems the patch was already applied successfully:
> =

> https://github.com/fenrus75/powertop/commit/1636ce2c01d9bba024f2840f114b6=
c0554d05724
> =


Hah! Sorry for the noise. Cheers, and thanks for the contribution!

> On 2016-07-26 19:27, Joe Konno wrote:
> > Hi Thomas,
> >
> > I cannot apply your diff to either the v2.8 tag or master. Could you
> > rebase it atop master and re-submit? Thanks!
> >
> > PS: I'll address the question about wiggle particulars separately.
> > To be perfectly honest I have some digging to do. ^_^
> >
> > On Thu, 21 Jul 2016 12:13:17 +0200
> > Thomas Ilsche <thomas.ilsche(a)tu-dresden.de> wrote:
> >  =

> >> Dear Powertop Team,
> >>
> >> I have noticed that powertop changes the frequency set by the
> >> userspace governor to the minimum available frequency.
> >>
> >> This is caused by abstract_cpu::wiggle that touches the
> >> {min,max}_freq. By doing so, it also narrows down the
> >> scaling_setspeed setting within the min-max-range, but it is not
> >> reset upon restoring max_freq. To illustrate what is happening
> >> behind the scenes:
> >>
> >> $
> >> cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_{min,max,cur}_freq
> >> 1200000 2901000
> >> 2000000
> >> $
> >> cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_{governor,setspeed}
> >> userspace 2000000
> >> $ echo 1200000 | sudo
> >> tee /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq 1200000
> >> $ cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_setspeed
> >> 1200000
> >>
> >> (Tested with Linux 4.4.0-21 Ubuntu)
> >>
> >> Attached is a patch that resets the setspeed value if it was set
> >> to a numeric value before the wiggle.
> >>
> >> Please note that I don't really understand what you are trying to
> >> achieve with the wiggle in the first place. It seems for instance
> >> that this doesn't do anything if max_freq =3D=3D min_freq.
> >>
> >> Best Regards,
> >> Thomas Ilsche
> >>  =

> >  =

> =



--===============4065238835305564411==--

