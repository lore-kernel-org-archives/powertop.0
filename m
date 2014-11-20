Content-Type: multipart/mixed; boundary="===============3472231353003576156=="
MIME-Version: 1.0
From: Alexandra Yates <alexandra.yates at linux.intel.com>
Subject: Re: [Powertop] close_display() sigsegv
Date: Thu, 20 Nov 2014 11:47:42 -0800
Message-ID: <49456.10.24.1.226.1416512862.squirrel@linux.intel.com>
In-Reply-To: CAG27Bk3hHpWcMu7sEJwjk8asPPUOq+cm9HDUEkSWHo5nefi_HQ@mail.gmail.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============3472231353003576156==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Sami,

> On 20 November 2014 04:13, Alexandra Yates
> <alexandra.yates(a)linux.intel.com> wrote:
>> Thank you for sending this bug report.  Yes I want to get this workout
>> before the release.
>>
>> I'm trying to reproduce this error but I cant get it to show me the seg
>> fault.
>
> Strange.
>
>> Please help me review the steps to compile powertop using clang.
>
> I did not do anything special.
>
> export CC=3Dclang
> export CXX=3Dclang++
> export CFLAGS=3D'-O0 -g -ggdb -Wall -Wextra -pedantic
> -fno-omit-frame-pointer'
> export LD=3Dld.gold
>
> I don't think the gold linker has much to do with the bug, but then
> again I did not test with the traditional linker so I cannot say it
> has no effect.
>
> cd powertop
> git checkout master
> git clean -xdf
> git reset --hard
> ./autogen.sh && ./configure && make -j3
> sudo ./src/powertop
> [press  esc quit] -> core
>
> I am archlinux testing repos user, so all packages are pretty fresh
> from open source bakers.
>
> $ clang --version
> clang version 3.5.0 (tags/RELEASE_350/final)
> Target: i386-pc-linux-gnu
> Thread model: posix
>
> Just in case you have systemd 'core dropped' message might not appear
> after running the command. The easy thing to check is have a look of
> journal
>
> journalctl --boot --output=3Djson-pretty SYSLOG_IDENTIFIER=3Dsystemd-core=
dump
>
> The '--boot' option limits the search to the current boot, that is
> what everyone usually needs.
>
> --
> Sami Kerola
> http://www.iki.fi/kerolasa/
>

Followed all steps, in two platforms still cant reproduce.  (Difference)
I'm running Ubuntu.

I will revert the culprit commit.  I would appreciate you testing again.

Thank you,
Alexandra.

--===============3472231353003576156==--

