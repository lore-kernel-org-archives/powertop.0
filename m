Content-Type: multipart/mixed; boundary="===============2389821780189356868=="
MIME-Version: 1.0
From: George Barrett <bob at bob131.so>
Subject: Re: [Powertop] Fwd: Suggested tunables addition: sysctl
 kernel.core_pattern
Date: Tue, 05 Jan 2016 11:49:23 +1100
Message-ID: <1451954963.2932.0@mail.bob131.so>
In-Reply-To: 20160105004749.GA18569@noemi.bahnhof.se
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============2389821780189356868==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

I primarily use my laptop for hacking on my own little projects, so =

this occurs fairly frequently

On Tue, Jan 5, 2016 at 11:47 AM, Magnus Fromreide =

<magfr(a)lysator.liu.se> wrote:
> On Sat, Jan 02, 2016 at 09:00:57PM +1100, George Barrett wrote:
>>  Hi, first off thanks for the great tool!
>> =

>>  I currently rely on a systemd unit file present in the Fedora =

>> package for
>>  powertop to do most of my laptop's power saving config on boot, and =

>> it works
>>  great. However, I've noticed a missing tunable which might be =

>> helpful for
>>  some folks: setting the kernel.core_pattern sysctl parameter to =

>> |/dev/null
>>  or similar. On my x220, this parameter set to it's default causes
>>  systemd-coredump to peg a single core, sometimes for quite an =

>> extended
>>  period of time. On many devices this would cause substantially =

>> greater heat
>>  output, and most importantly substantially higher power consumption.
> =

> I have to ask, why do you get enough core dumps for this to be a =

> problem?
> Wouldn't a better solution be to fix the application that dumps core?
> =

> /MF


--===============2389821780189356868==--

