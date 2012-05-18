Content-Type: multipart/mixed; boundary="===============4516942274508647627=="
MIME-Version: 1.0
From: Arjan van de Ven <arjan at linux.intel.com>
Subject: Re: [Powertop] [Discuss] [PATCH] iw: handle HAVE_LIBNL20 properly
Date: Fri, 18 May 2012 06:50:55 -0700
Message-ID: <4FB653BF.8030300@linux.intel.com>
In-Reply-To: 4FB6513B.4040908@freemail.hu
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============4516942274508647627==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 5/18/2012 6:40 AM, N=C3=A9meth M=C3=A1rton wrote:
> Hi Sergey,
> Sergey Senozhatsky wrote:
>> On (05/18/12 10:22), N=C3=A9meth M=C3=A1rton wrote:
>>> starting with the commit b0d2854861de2f15671e633da11f42207d4357df
>>> I get the following compile time error:
>>>
>>
>> Well, that's strange, since commit itself doesn't change much....
>>
>> how about the following one
> =

> Doesn't compile either:
> =

> gcc -DHAVE_CONFIG_H -I. -I..  -D_FORTIFY_SOURCE=3D2        -g -O2 -MT tun=
ing/powertop-iw.o -MD -MP -MF tuning/.deps/powertop-iw.Tpo -c -o tuning/pow=
ertop-iw.o
> `test -f 'tuning/iw.c' || echo './'`tuning/iw.c
> tuning/iw.c: In function =E2=80=98set_power_save=E2=80=99:
> tuning/iw.c:130: error: storage size of =E2=80=98ps_state=E2=80=99 isn=E2=
=80=99t known
> tuning/iw.c:132: error: =E2=80=98NL80211_PS_DISABLED=E2=80=99 undeclared =
(first use in this function)
> tuning/iw.c:132: error: (Each undeclared identifier is reported only once
> tuning/iw.c:132: error: for each function it appears in.)
> tuning/iw.c:134: error: =E2=80=98NL80211_PS_ENABLED=E2=80=99 undeclared (=
first use in this function)
> tuning/iw.c:136: error: =E2=80=98NL80211_ATTR_PS_STATE=E2=80=99 undeclare=
d (first use in this function)
> tuning/iw.c: In function =E2=80=98print_power_save_handler=E2=80=99:
> tuning/iw.c:152: error: =E2=80=98NL80211_ATTR_PS_STATE=E2=80=99 undeclare=
d (first use in this function)
> tuning/iw.c:156: error: =E2=80=98NL80211_PS_ENABLED=E2=80=99 undeclared (=
first use in this function)
> tuning/iw.c:159: error: =E2=80=98NL80211_PS_DISABLED=E2=80=99 undeclared =
(first use in this function)
> tuning/iw.c: In function =E2=80=98__handle_cmd=E2=80=99:
> tuning/iw.c:227: error: =E2=80=98NL80211_CMD_GET_POWER_SAVE=E2=80=99 unde=
clared (first use in this function)
> tuning/iw.c:230: error: =E2=80=98NL80211_CMD_SET_POWER_SAVE=E2=80=99 unde=
clared (first use in this function)
> make[3]: *** [tuning/powertop-iw.o] Error 1
> make[3]: Leaving directory `/mnt/store/nmarci/src/powertop/powertop2/powe=
rtop/src'
> make[2]: *** [all] Error 2
> make[2]: Leaving directory `/mnt/store/nmarci/src/powertop/powertop2/powe=
rtop/src'
> make[1]: *** [all-recursive] Error 1
> make[1]: Leaving directory `/mnt/store/nmarci/src/powertop/powertop2/powe=
rtop'
> make: *** [all] Error 2
> =

> Looks like I have a linux/nl80211.h installed on my system which doesn't =
contain
> NL80211_PS_ENABLED, NL80211_PS_DISABLED, NL80211_ATTR_PS_STATE, NL80211_C=
MD_GET_POWER_SAVE
> and NL80211_CMD_SET_POWER_SAVE. These were added by commit
> http://git.kernel.org/?p=3Dlinux/kernel/git/torvalds/linux-2.6.git;a=3Dco=
mmitdiff;h=3Dffb9eb3d8b450c22bbbc688c6b630141ac476fd9

Feb 2010

what kind of OS are you running???

--===============4516942274508647627==--

