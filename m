Content-Type: multipart/mixed; boundary="===============2800666760507071654=="
MIME-Version: 1.0
From: Jaroslav Skarvada <jskarvad at redhat.com>
Subject: Re: [Powertop] patch: tell user if the system is running out of FDs
Date: Tue, 08 Oct 2013 08:08:17 -0400
Message-ID: <32937649.3381028.1381234097785.JavaMail.root@redhat.com>
In-Reply-To: 20131007140508.GA2271@swordfish.minsk.epam.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============2800666760507071654==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

> Hello,
> =

> > I used Youquan's patch, but we have noticed that it can only overcome s=
oft
> > limits,
> > but not hard limits. E.g. on Fedora (and probably others) there is a so=
ft
> > limit
> > of 1024 and a hard limit of 4096, so if powertop opens at least 15 file
> > descriptors
> > per CPU, then this will fail on a system with >273 CPUs.
> =

> that's a pretty big system
> =

> > In case you think we can also temporally increase the hard limit (as we
> > already have
> > the privilege), the attached patch will do it. In case you think the ha=
rd
> > limits set by
> > the system administrator are untouchable (e.g. violation of system
> > resources hard limits
> > could result in a bad effects like explosion in a nuclear power plant :=
),
> > the
> > previously sent patch that fixes the error message needs to be also used
> =

> hm, need to think about this for a moment. both your patches make sense.
> I'd probably go with `temporally increase the hard limit' solution, to ma=
ke
> someones life easier. what do you, guys, think?
> =

> =

> 	-ss
> =

> > regards
> > =

> > Jaroslav
> =

> > diff --git a/src/main.cpp b/src/main.cpp
> > index 0883424..e0e8a71 100644
> > --- a/src/main.cpp
> > +++ b/src/main.cpp
> > @@ -36,6 +36,8 @@
> >  #include <getopt.h>
> >  #include <unistd.h>
> >  #include <locale.h>
> > +#include <sys/resource.h>
> > +#include <linux/limits.h>
> >  =

> >  #include "cpu/cpu.h"
> >  #include "process/process.h"
> > @@ -283,11 +285,16 @@ static void powertop_init(void)
> >  	static char initialized =3D 0;
> >  	int ret;
> >  	struct statfs st_fs;
> > +	struct rlimit rlmt;
> >  =

> >  	if (initialized)
> >  		return;
> >  =

> >  	checkroot();
> > +
> > +	rlmt.rlim_cur =3D rlmt.rlim_max =3D NR_OPEN;

This seems to be wrong. On my system NR_OPEN is 1024, but
/proc/sys/fs/nr_open gives me 1048576. It seems the linux kernel
hardcodes 1024 * 1024 as the default kernel limit. This default
limit can be raised to:

sysctl_nr_open_max =3D min((size_t)INT_MAX, ~(size_t)0/sizeof(void *)) &
  -BITS_PER_LONG;

which is 2 Gi - 63 on my 64 bit system. I think we shouldn't
touch/increase this. It seems there is no header definition for these
limits.

I am proposing new patch, which reads the current kernel limit from the
/proc. I am not sure about the portability, but at least it shouldn't
break anything.

Finally I think, the first patch could be applied together with this patch
(probably with the changed message) to notify user that he/she reached
the FDs limit, because there is still some limit. This could also
occur if some process would decrease the /proc/sys/fs/nr_open after
it is read by powertop and before the ulimit is set

regards

Jaroslav

--===============2800666760507071654==
Content-Type: text/x-patch
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="powertop-2.4-unlimit-fds.patch"

ZGlmZiAtLWdpdCBhL3NyYy9tYWluLmNwcCBiL3NyYy9tYWluLmNwcAppbmRleCAwODgzNDI0Li4x
NmIxNjEzIDEwMDY0NAotLS0gYS9zcmMvbWFpbi5jcHAKKysrIGIvc3JjL21haW4uY3BwCkBAIC0y
OCw2ICsyOCw3IEBACiAgKglBcmphbiB2YW4gZGUgVmVuIDxhcmphbkBsaW51eC5pbnRlbC5jb20+
CiAgKi8KICNpbmNsdWRlIDxpb3N0cmVhbT4KKyNpbmNsdWRlIDxmc3RyZWFtPgogI2luY2x1ZGUg
PHN0ZGxpYi5oPgogI2luY2x1ZGUgPHN0ZGlvLmg+CiAjaW5jbHVkZSA8dGltZS5oPgpAQCAtMzYs
NiArMzcsNyBAQAogI2luY2x1ZGUgPGdldG9wdC5oPgogI2luY2x1ZGUgPHVuaXN0ZC5oPgogI2lu
Y2x1ZGUgPGxvY2FsZS5oPgorI2luY2x1ZGUgPHN5cy9yZXNvdXJjZS5oPgogCiAjaW5jbHVkZSAi
Y3B1L2NwdS5oIgogI2luY2x1ZGUgInByb2Nlc3MvcHJvY2Vzcy5oIgpAQCAtNjAsNiArNjIsOCBA
QAogCiAjZGVmaW5lIERFQlVHRlNfTUFHSUMgICAgICAgICAgMHg2NDYyNjcyMAogCisjZGVmaW5l
IE5SX09QRU5fREVGIDEwMjQgKiAxMDI0CisKIGludCBkZWJ1Z19sZWFybmluZyA9IDA7CiB1bnNp
Z25lZCB0aW1lX291dCA9IDIwOwogaW50IGxlYXZlX3Bvd2VydG9wID0gMDsKQEAgLTI3OCwxNiAr
MjgyLDM1IEBAIHN0YXRpYyB2b2lkIGNoZWNrcm9vdCgpIHsKIAogfQogCitzdGF0aWMgaW50IGdl
dF9ucl9vcGVuKHZvaWQpIHsKKwlpbnQgbnJfb3BlbiA9IE5SX09QRU5fREVGOworCWlmc3RyZWFt
IGZpbGU7CisKKwlmaWxlLm9wZW4oIi9wcm9jL3N5cy9mcy9ucl9vcGVuIiwgaW9zOjppbik7CisJ
aWYgKGZpbGUpIHsKKwkJZmlsZSA+PiBucl9vcGVuOworCQlpZiAoIWZpbGUpCisJCQlucl9vcGVu
ID0gTlJfT1BFTl9ERUY7CisJCWZpbGUuY2xvc2UoKTsKKwl9CisJcmV0dXJuIG5yX29wZW47Cit9
CisKIHN0YXRpYyB2b2lkIHBvd2VydG9wX2luaXQodm9pZCkKIHsKIAlzdGF0aWMgY2hhciBpbml0
aWFsaXplZCA9IDA7CiAJaW50IHJldDsKIAlzdHJ1Y3Qgc3RhdGZzIHN0X2ZzOworCXN0cnVjdCBy
bGltaXQgcmxtdDsKIAogCWlmIChpbml0aWFsaXplZCkKIAkJcmV0dXJuOwogCiAJY2hlY2tyb290
KCk7CisKKwlybG10LnJsaW1fY3VyID0gcmxtdC5ybGltX21heCA9IGdldF9ucl9vcGVuKCk7CisJ
c2V0cmxpbWl0IChSTElNSVRfTk9GSUxFLCAmcmxtdCk7CisKIAlyZXQgPSBzeXN0ZW0oIi9zYmlu
L21vZHByb2JlIGNwdWZyZXFfc3RhdHMgPiAvZGV2L251bGwgMj4mMSIpOwogCXJldCA9IHN5c3Rl
bSgiL3NiaW4vbW9kcHJvYmUgbXNyID4gL2Rldi9udWxsIDI+JjEiKTsKIAlzdGF0ZnMoIi9zeXMv
a2VybmVsL2RlYnVnIiwgJnN0X2ZzKTsK

--===============2800666760507071654==--

