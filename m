Content-Type: multipart/mixed; boundary="===============8478185276512608020=="
MIME-Version: 1.0
From: Chris Ferron <chris.e.ferron at linux.intel.com>
Subject: Re: [Powertop] PowerTOP 2.0 bugs
Date: Tue, 15 May 2012 10:29:20 -0700
Message-ID: <4FB29270.60008@linux.intel.com>
In-Reply-To: CABRT9RDdKghGM67oP6awBXDoF8mvxg9w0xib7u6yyxiNDpSxNA@mail.gmail.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============8478185276512608020==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 05/14/2012 04:11 PM, Marti Raudsepp wrote:
> On Tue, May 15, 2012 at 1:05 AM, Chris Ferron
> <chris.e.ferron(a)linux.intel.com>  wrote:
>> Can you please tell me what system, processors and distro (and version) =
you
>> are running?
>> Also are you running in a VM by chance?
> No VM, physical hardware. Arch Linux (testing repos enabled), kernel
> 3.3.5, x86_64.
>
> Bug #1 occurs on my desktop (AMD Phenom II X4 965) as well as laptop
> (Intel Core i5-560M)
OK, lets start with bug 1. It seem there is a definite issues with =

non-intel processors.
Problem is I am having a hard time getting my hands on a non-intel based =

system.
Second part of my thoughts is you are seeing a issues wiht you AMD, but =

you Core i5
may look similar but actually i suspect is not incorrect. From you =

example for bug 1, I am assumeing by what I am seeing that you took =

those numbers from your AMD system.
The reason this is important to define, is there is different code paths =

for Intel and non-intel processors, so getting comparable data between =

them is important. In other words there are three general areas where is =

issue could be happening, and if you are actually seeing the same issue =

on both processors then it points to the only 1 point that is shard in =

this area.

In regards to your Intel system. You could be seeing more the 100% of =

cpus. This is the measurement of the cpus not the package. I don't have =

the full data sheet for your CPU, but you may see up to 400% as your =

system has 2cores with two threads each. 400% of the cpu =3D 100% of the =

package.
  You may also see such number while looking at Frequency and C0 active. =

For instance 100% would indicate that you are pegged at the Stamped rate =

(which is not the max for an Intel processor). over 100% indicates the =

the freq governor is running the processor higher then the stamped rate. =

So for instance the stamped rate on my i7 is 3.4GHz, and in turbo mode I =

can see the rates at 3.5GHz to 3.8GHz at times. So at ~3.5GHz I would =

see 102.5% as C0 active as it's about ~2.2 to 2.5% per bin of 100Hz.

At this point I think for Bug1, this is an issue with the "last_stamp" =

not getting zeroed out, and the effective freq measurements. It could be =

something as simple as below, but like I said I haven't gotten a AMD =

system to work with.

Could you reproduce Bug 1 and send me the data for each Processor, and =

if you feel so inclined maybe play with the changes below on you AMD =

system.

Thanks
Chris



diff --git a/src/cpu/cpu_linux.cpp b/src/cpu/cpu_linux.cpp
index ab37d57..8aa9772 100644
--- a/src/cpu/cpu_linux.cpp
+++ b/src/cpu/cpu_linux.cpp
@@ -59,6 +59,8 @@ void cpu_linux::measurement_start(void)

         abstract_cpu::measurement_start();

+       last_stamp =3D 0;
+
         len =3D sprintf(filename, =

"/sys/devices/system/cpu/cpu%i/cpuidle", number);

         dir =3D opendir(filename);
@@ -365,6 +367,7 @@ void cpu_linux::change_effective_frequency(uint64_t =

time, uint64_t frequency)

         effective_frequency =3D frequency;
         last_stamp =3D time;
+       abstract_cpu::change_effective_frequency(time, frequency);
  }


--===============8478185276512608020==--

