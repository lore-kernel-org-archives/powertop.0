Content-Type: multipart/mixed; boundary="===============8293820499930606771=="
MIME-Version: 1.0
From: Andika Triwidada <andika at gmail.com>
Subject: Re: [Powertop] Fwd: powertop 2.4 questions
Date: Thu, 19 Sep 2013 21:38:22 +0700
Message-ID: <CANHSFsuzzDuKT+GRLyW8Vrjk30jDSADV_vq9u1T2jLYZUv36iA@mail.gmail.com>
In-Reply-To: 20130918195352.GG6886@merlins.org
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============8293820499930606771==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 19, 2013 at 2:53 AM, Marc MERLIN <marc_powertop(a)merlins.org> =
wrote:
> By the way, my more nagging question was, how can I stop the built in cam=
era
> in my T530 from taking so much power? (I'm sure the number is wrong, but =
still)

How about unloading/blacklisting its driver?

>
> The battery reports a discharge rate of 18.4 W
> The estimated remaining time is 4 hours, 18 minutes
>
> Summary: 657.6 wakeups/second,  28.4 GPU ops/seconds, 0.0 VFS ops/sec and=
 9.3% CPU use
>
> Power est.  Usage       Events/s   Category       Description
>   12.2 W    100.0%                 Device         USB device: Integrated =
Camera (Chicony Electronics Co., Ltd.)
>   997 mW     60.0%                 Device         Display backlight
>  76.1 mW     34.9 =C2=B5s/s      34.8   Process        [rcu_preempt]
>  23.1 mW      1.5 ms/s      16.5   Process        xfce4-terminal -T windo=
w11 --role=3Dwindow11
>  9.20 mW     59.0 ms/s     347.4   Process        /usr/bin/enlightenment
>
> Note that tunables says:
>    Good          Autosuspend for USB device Integrated Camera [Chicony El=
ectronics Co., Ltd.]
>
> Kernel 3.10.6.
>
> Any ideas?
>
> Thanks,
> Marc

--===============8293820499930606771==--

