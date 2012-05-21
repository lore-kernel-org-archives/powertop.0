Content-Type: multipart/mixed; boundary="===============0376108131947547159=="
MIME-Version: 1.0
From: Chris Ferron <chris.e.ferron at linux.intel.com>
Subject: Re: [Powertop] [Discuss] [PATCH] iw: handle HAVE_LIBNL20 properly
Date: Mon, 21 May 2012 12:19:46 -0700
Message-ID: <4FBA9552.7050402@linux.intel.com>
In-Reply-To: 20120518135416.GE3074@swordfish
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============0376108131947547159==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

patch accepted
thanks
-Chris


On 05/18/2012 06:54 AM, Sergey Senozhatsky wrote:
> On (05/18/12 15:40), N=C3=A9meth M=C3=A1rton wrote:
>> Doesn't compile either:
>>
>> gcc -DHAVE_CONFIG_H -I. -I..  -D_FORTIFY_SOURCE=3D2        -g -O2 -MT tu=
ning/powertop-iw.o -MD -MP -MF tuning/.deps/powertop-iw.Tpo -c -o tuning/po=
wertop-iw.o
>> `test -f 'tuning/iw.c' || echo './'`tuning/iw.c
>> tuning/iw.c: In function =E2=80=98set_power_save=E2=80=99:
>> tuning/iw.c:130: error: storage size of =E2=80=98ps_state=E2=80=99 isn=
=E2=80=99t known
>> tuning/iw.c:132: error: =E2=80=98NL80211_PS_DISABLED=E2=80=99 undeclared=
 (first use in this function)
>> tuning/iw.c:132: error: (Each undeclared identifier is reported only once
>> tuning/iw.c:132: error: for each function it appears in.)
>> tuning/iw.c:134: error: =E2=80=98NL80211_PS_ENABLED=E2=80=99 undeclared =
(first use in this function)
>> tuning/iw.c:136: error: =E2=80=98NL80211_ATTR_PS_STATE=E2=80=99 undeclar=
ed (first use in this function)
>> tuning/iw.c: In function =E2=80=98print_power_save_handler=E2=80=99:
>> tuning/iw.c:152: error: =E2=80=98NL80211_ATTR_PS_STATE=E2=80=99 undeclar=
ed (first use in this function)
>> tuning/iw.c:156: error: =E2=80=98NL80211_PS_ENABLED=E2=80=99 undeclared =
(first use in this function)
>> tuning/iw.c:159: error: =E2=80=98NL80211_PS_DISABLED=E2=80=99 undeclared=
 (first use in this function)
>> tuning/iw.c: In function =E2=80=98__handle_cmd=E2=80=99:
>> tuning/iw.c:227: error: =E2=80=98NL80211_CMD_GET_POWER_SAVE=E2=80=99 und=
eclared (first use in this function)
>> tuning/iw.c:230: error: =E2=80=98NL80211_CMD_SET_POWER_SAVE=E2=80=99 und=
eclared (first use in this function)
>> make[3]: *** [tuning/powertop-iw.o] Error 1
>> make[3]: Leaving directory `/mnt/store/nmarci/src/powertop/powertop2/pow=
ertop/src'
>> make[2]: *** [all] Error 2
>> make[2]: Leaving directory `/mnt/store/nmarci/src/powertop/powertop2/pow=
ertop/src'
>> make[1]: *** [all-recursive] Error 1
>> make[1]: Leaving directory `/mnt/store/nmarci/src/powertop/powertop2/pow=
ertop'
>> make: *** [all] Error 2
>>
>> Looks like I have a linux/nl80211.h installed on my system which doesn't=
 contain
>> NL80211_PS_ENABLED, NL80211_PS_DISABLED, NL80211_ATTR_PS_STATE, NL80211_=
CMD_GET_POWER_SAVE
>> and NL80211_CMD_SET_POWER_SAVE. These were added by commit
>> http://git.kernel.org/?p=3Dlinux/kernel/git/torvalds/linux-2.6.git;a=3Dc=
ommitdiff;h=3Dffb9eb3d8b450c22bbbc688c6b630141ac476fd9
>>
>> The header file src/tuning/nl80211.h in powertop repository seems to be =
a newer one.
>>
> Hm.. In that case solution is simple.
>
>
> ---
>
>   src/tuning/iw.c |    1 +
>   src/tuning/iw.h |    6 ------
>   2 files changed, 1 insertion(+), 6 deletions(-)
>
> diff --git a/src/tuning/iw.c b/src/tuning/iw.c
> index aeba3fd..68eb6dc 100644
> --- a/src/tuning/iw.c
> +++ b/src/tuning/iw.c
> @@ -39,6 +39,7 @@ OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SO=
FTWARE.
>   #include<unistd.h>
>   #include<stdbool.h>
>
> +#include "nl80211.h"
>   #include<netlink/genl/genl.h>
>   #include<netlink/genl/family.h>
>   #include<netlink/genl/ctrl.h>
> diff --git a/src/tuning/iw.h b/src/tuning/iw.h
> index acf132d..6ea5a3d 100644
> --- a/src/tuning/iw.h
> +++ b/src/tuning/iw.h
> @@ -33,12 +33,6 @@ OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS S=
OFTWARE.
>   */
>
>   #include<stdbool.h>
> -#include<netlink/netlink.h>
> -#include<netlink/genl/genl.h>
> -#include<netlink/genl/family.h>
> -#include<netlink/genl/ctrl.h>
> -
> -#include<linux/nl80211.h>
>
>   #define ETH_ALEN 6
>


--===============0376108131947547159==--

