Content-Type: multipart/mixed; boundary="===============5428995029611294235=="
MIME-Version: 1.0
From: Fabrice Fontaine <fontaine.fabrice at gmail.com>
Subject: Re: [Powertop] [PATCH] wakeup_xxx.h: include limits.h
Date: Wed, 03 Jul 2019 00:00:11 +0200
Message-ID: <CAPi7W82VJZ_4i=i87DO7nD_DL0Ez67Z99m9ZvXNpYPDkEqEXfA@mail.gmail.com>
In-Reply-To: 2824B99DC70CE746926327C52CA42F764F155528@ORSMSX111.amr.corp.intel.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============5428995029611294235==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Dear Gayatri,

Le mar. 2 juil. 2019 =C3=A0 23:48, Kammela, Gayatri
<gayatri.kammela(a)intel.com> a =C3=A9crit :
>
> > -----Original Message-----
> > From: PowerTop [mailto:powertop-bounces(a)lists.01.org] On Behalf Of
> > Fabrice Fontaine
> > Sent: Monday, May 20, 2019 11:44 AM
> > To: powertop(a)lists.01.org
> > Subject: [Powertop] [PATCH] wakeup_xxx.h: include limits.h
> >
> > limits.h must be included to define PATH_MAX otherwise build will fail
> > on:
> >
>  Sorry for my delayed response. Thanks for the patch!  Perhaps it makes m=
ore sense to include limits.h file in wakeup.h as we included wakeup.h in b=
oth  wakeup_ethernet.h and wakeup_usb.h files.
Indeed, this is also acceptable.
>
> Thanks,
> Gayatri
>
Best Regards,

Fabrice

--===============5428995029611294235==--

