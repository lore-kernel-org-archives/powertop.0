Content-Type: multipart/mixed; boundary="===============2128924288143948490=="
MIME-Version: 1.0
From: Kammela, Gayatri <gayatri.kammela at intel.com>
Subject: Re: [Powertop] [PATCH] wakeup_xxx.h: include limits.h
Date: Tue, 02 Jul 2019 21:48:29 +0000
Message-ID: <2824B99DC70CE746926327C52CA42F764F155528@ORSMSX111.amr.corp.intel.com>
In-Reply-To: 20190520184417.14922-1-fontaine.fabrice@gmail.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============2128924288143948490==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: PowerTop [mailto:powertop-bounces(a)lists.01.org] On Behalf Of
> Fabrice Fontaine
> Sent: Monday, May 20, 2019 11:44 AM
> To: powertop(a)lists.01.org
> Subject: [Powertop] [PATCH] wakeup_xxx.h: include limits.h
> =

> limits.h must be included to define PATH_MAX otherwise build will fail
> on:
> =

 Sorry for my delayed response. Thanks for the patch!  Perhaps it makes mor=
e sense to include limits.h file in wakeup.h as we included wakeup.h in bot=
h  wakeup_ethernet.h and wakeup_usb.h files.

Thanks,
Gayatri


--===============2128924288143948490==--

