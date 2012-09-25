Content-Type: multipart/mixed; boundary="===============7112564918589769627=="
MIME-Version: 1.0
From: Rajagopal Venkat <rajagopal.venkat at linaro.org>
Subject: Re: [Powertop] [PATCH v2 1/2] Updates to support Android platform
Date: Tue, 25 Sep 2012 11:04:23 +0530
Message-ID: <CA+Z25wV9QXDp9zmaoQrxXUh6VGMBs0Rb3=tNd-xnT50HPz2Uqg@mail.gmail.com>
In-Reply-To: 506082EE.5080602@linux.intel.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============7112564918589769627==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 24 September 2012 21:27, Chris Ferron <chris.e.ferron(a)linux.intel.com>=
 wrote:
> On 09/24/2012 06:28 AM, Rajagopal Venkat wrote:
>>
>> This patch adds following minor changes to prepare powertop
>> to support Android platform.
>>
>> - Add missing HAVE_CONFIG_H conditional check.
>> - remove un-used ethtool_cmd_speed_set and ethtool_cmd_speed
>> functions.
>> - Minimize dependency on exception handling in catch blocks.
>>
>> These changes will not affect powertop functionality.
>>
>> Signed-off-by: Rajagopal Venkat <rajagopal.venkat(a)linaro.org>
>> ---
>>   src/devices/ahci.cpp    |  4 ++--
>>   src/devices/alsa.cpp    |  4 ++--
>>   src/devices/network.cpp | 16 ----------------
>>   src/main.cpp            |  2 ++
>>   4 files changed, 6 insertions(+), 20 deletions(-)
>>
>> diff --git a/src/devices/ahci.cpp b/src/devices/ahci.cpp
>> index 1fe39c7..67ce06e 100644
>> --- a/src/devices/ahci.cpp
>> +++ b/src/devices/ahci.cpp
>> @@ -170,7 +170,7 @@ void ahci::start_measurement(void)
>>                 file.close();
>>         }
>>         catch (std::ios_base::failure &c) {
>> -               fprintf(stderr, "%s\n", c.what());
>> +               fprintf(stderr, "Failed to start measurement for ahci
>> device\n");
>
> adding addition message here is acceptable, but eliminating the informati=
on
> from the catches error is not.
>
As discussed in first patch set, android doesn't support exception
handling. This
is the reason powertop had DISABLE_TRYCATCH conditional macro which is
removed in recent commit.

The patch 2/2 adds stubs for exception handling

#define try           if (true)
#define catch(x)      if (false)

With this, fprintf(stderr, "%s\n", c.what()); in catch block throws
undefined reference
to c. So added message instead of c.what().

Any better ways of adding stubs are welcome.

>
>>         }
>>     }
>> @@ -203,7 +203,7 @@ void ahci::end_measurement(void)
>>                 file.close();
>>         }
>>         catch (std::ios_base::failure &c) {
>> -               fprintf(stderr, "%s\n", c.what());
>> +               fprintf(stderr, "Failed to end measurement for ahci
>> device\n");
>>         }
>>         if (end_active < start_active)
>>                 end_active =3D start_active;
>> diff --git a/src/devices/alsa.cpp b/src/devices/alsa.cpp
>> index 4f5d3f9..a67780c 100644
>> --- a/src/devices/alsa.cpp
>> +++ b/src/devices/alsa.cpp
>> @@ -104,7 +104,7 @@ void alsa::start_measurement(void)
>>                 file.close();
>>         }
>>         catch (std::ios_base::failure &c) {
>> -               fprintf(stderr, "%s\n", c.what());
>> +               fprintf(stderr, "Failed to start measurement for alsa
>> device\n");
>>         }
>>   }
>>   @@ -130,7 +130,7 @@ void alsa::end_measurement(void)
>>                 file.close();
>>         }
>>         catch (std::ios_base::failure &c) {
>> -               fprintf(stderr, "%s\n", c.what());
>> +               fprintf(stderr, "Failed to end measurement for alsa
>> device\n");
>>         }
>>         p =3D (end_active - start_active) / (0.001 + end_active +
>> end_inactive - start_active - start_inactive) * 100.0;
>> diff --git a/src/devices/network.cpp b/src/devices/network.cpp
>> index b8a5c9c..ed9d7aa 100644
>> --- a/src/devices/network.cpp
>> +++ b/src/devices/network.cpp
>> @@ -55,22 +55,6 @@ extern "C" {
>>     static map<string, class network *> nics;
>>   -#ifdef DISABLE_TRYCATCH
>> -
>> -static inline void ethtool_cmd_speed_set(struct ethtool_cmd *ep,
>> -                                               __u32 speed)
>> -{
>> -
>> -       ep->speed =3D (__u16)speed;
>> -       ep->speed_hi =3D (__u16)(speed >> 16);
>> -}
>> -
>> -static inline __u32 ethtool_cmd_speed(struct ethtool_cmd *ep)
>> -{
>> -       return (ep->speed_hi << 16) | ep->speed;
>> -}
>> -
>> -#endif
>>     static void do_proc_net_dev(void)
>>   {
>> diff --git a/src/main.cpp b/src/main.cpp
>> index 1815075..dc49dba 100644
>> --- a/src/main.cpp
>> +++ b/src/main.cpp
>> @@ -42,7 +42,9 @@
>>   #include "perf/perf.h"
>>   #include "perf/perf_bundle.h"
>>   #include "lib.h"
>> +#ifdef HAVE_CONFIG_H
>>   #include "../config.h"
>> +#endif
>>       #include "devices/device.h"
>
>



-- =

Regards,
Rajagopal

--===============7112564918589769627==--

