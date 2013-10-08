Content-Type: multipart/mixed; boundary="===============3264344332252678648=="
MIME-Version: 1.0
From: Sergey Senozhatsky <sergey.senozhatsky at gmail.com>
Subject: Re: [Powertop] patch: tell user if the system is running out of FDs
Date: Tue, 08 Oct 2013 16:21:37 +0300
Message-ID: <20131008132137.GB2452@swordfish.minsk.epam.com>
In-Reply-To: 988443702.3413079.1381237003703.JavaMail.root@redhat.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============3264344332252678648==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On (10/08/13 08:56), Jaroslav Skarvada wrote:
> Date: Tue, 8 Oct 2013 08:56:43 -0400 (EDT)
> From: Jaroslav Skarvada <jskarvad(a)redhat.com>
> To: Sergey Senozhatsky <sergey.senozhatsky(a)gmail.com>
> Cc: powertop(a)ml01.01.org
> Subject: Re: [Powertop] patch: tell user if the system is running out of =
FDs
> X-Mailer: Zimbra 8.0.3_GA_5664 (ZimbraWebClient - FF24
>  (Linux)/8.0.3_GA_5664)
> =

> =

> =

> ----- Original Message -----
> > On (10/08/13 08:08), Jaroslav Skarvada wrote:
> > > > Hello,
> > > > =

> > > > > I used Youquan's patch, but we have noticed that it can only over=
come
> > > > > soft
> > > > > limits,
> > > > > but not hard limits. E.g. on Fedora (and probably others) there i=
s a
> > > > > soft
> > > > > limit
> > > > > of 1024 and a hard limit of 4096, so if powertop opens at least 1=
5 file
> > > > > descriptors
> > > > > per CPU, then this will fail on a system with >273 CPUs.
> > > > =

> > > > that's a pretty big system
> > > > =

> > > > > In case you think we can also temporally increase the hard limit =
(as we
> > > > > already have
> > > > > the privilege), the attached patch will do it. In case you think =
the
> > > > > hard
> > > > > limits set by
> > > > > the system administrator are untouchable (e.g. violation of system
> > > > > resources hard limits
> > > > > could result in a bad effects like explosion in a nuclear power p=
lant
> > > > > :),
> > > > > the
> > > > > previously sent patch that fixes the error message needs to be al=
so
> > > > > used
> > > > =

> > > > hm, need to think about this for a moment. both your patches make s=
ense.
> > > > I'd probably go with `temporally increase the hard limit' solution,=
 to
> > > > make
> > > > someones life easier. what do you, guys, think?
> > > > =

> > > > =

> > > > 	-ss
> > > > =

> > > > > regards
> > > > > =

> > > > > Jaroslav
> > > > =

> > > > > diff --git a/src/main.cpp b/src/main.cpp
> > > > > index 0883424..e0e8a71 100644
> > > > > --- a/src/main.cpp
> > > > > +++ b/src/main.cpp
> > > > > @@ -36,6 +36,8 @@
> > > > >  #include <getopt.h>
> > > > >  #include <unistd.h>
> > > > >  #include <locale.h>
> > > > > +#include <sys/resource.h>
> > > > > +#include <linux/limits.h>
> > > > >  =

> > > > >  #include "cpu/cpu.h"
> > > > >  #include "process/process.h"
> > > > > @@ -283,11 +285,16 @@ static void powertop_init(void)
> > > > >  	static char initialized =3D 0;
> > > > >  	int ret;
> > > > >  	struct statfs st_fs;
> > > > > +	struct rlimit rlmt;
> > > > >  =

> > > > >  	if (initialized)
> > > > >  		return;
> > > > >  =

> > > > >  	checkroot();
> > > > > +
> > > > > +	rlmt.rlim_cur =3D rlmt.rlim_max =3D NR_OPEN;
> > > =

> > > This seems to be wrong. On my system NR_OPEN is 1024, but
> > > /proc/sys/fs/nr_open gives me 1048576. It seems the linux kernel
> > > hardcodes 1024 * 1024 as the default kernel limit. This default
> > > limit can be raised to:
> > > =

> > > sysctl_nr_open_max =3D min((size_t)INT_MAX, ~(size_t)0/sizeof(void *)=
) &
> > >   -BITS_PER_LONG;
> > > =

> > > which is 2 Gi - 63 on my 64 bit system. I think we shouldn't
> > > touch/increase this. It seems there is no header definition for these
> > > limits.
> > > =

> > > I am proposing new patch, which reads the current kernel limit from t=
he
> > > /proc. I am not sure about the portability, but at least it shouldn't
> > > break anything.
> > > =

> > > Finally I think, the first patch could be applied together with this =
patch
> > > (probably with the changed message) to notify user that he/she reached
> > > the FDs limit, because there is still some limit. This could also
> > > occur if some process would decrease the /proc/sys/fs/nr_open after
> > > it is read by powertop and before the ulimit is set
> > > =

> > > regards
> > > =

> > > Jaroslav
> > =

> > > diff --git a/src/main.cpp b/src/main.cpp
> > > index 0883424..16b1613 100644
> > > --- a/src/main.cpp
> > > +++ b/src/main.cpp
> > > @@ -28,6 +28,7 @@
> > >   *	Arjan van de Ven <arjan(a)linux.intel.com>
> > >   */
> > >  #include <iostream>
> > > +#include <fstream>
> > >  #include <stdlib.h>
> > >  #include <stdio.h>
> > >  #include <time.h>
> > > @@ -36,6 +37,7 @@
> > >  #include <getopt.h>
> > >  #include <unistd.h>
> > >  #include <locale.h>
> > > +#include <sys/resource.h>
> > >  =

> > >  #include "cpu/cpu.h"
> > >  #include "process/process.h"
> > > @@ -60,6 +62,8 @@
> > >  =

> > >  #define DEBUGFS_MAGIC          0x64626720
> > >  =

> > > +#define NR_OPEN_DEF 1024 * 1024
> > >  int debug_learning =3D 0;
> > >  unsigned time_out =3D 20;
> > >  int leave_powertop =3D 0;
> > > @@ -278,16 +282,35 @@ static void checkroot() {
> > >  =

> > >  }
> > >  =

> > > +static int get_nr_open(void) {
> > > +	int nr_open =3D NR_OPEN_DEF;
> > > +	ifstream file;
> > > +
> > > +	file.open("/proc/sys/fs/nr_open", ios::in);
> > > +	if (file) {
> > > +		file >> nr_open;
> > > +		if (!file)
> > > +			nr_open =3D NR_OPEN_DEF;
> > =

> > =

> > what if /proc/sys/fs/nr_open is less than 4096 or (NR_OPEN_DEF)?
> > you probaly want max()?
> =

> I think you cannot set ulimit beyond /proc/sys/fs/nr_open. You
> need to increase /proc/sys/fs/nr_open first, which is something
> we should avoid

fair enough. I'm gonna apply it through the -next tree (the
patch requires some modification to apply).

thanks.

	-ss

--===============3264344332252678648==--

