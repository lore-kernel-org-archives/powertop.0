Content-Type: multipart/mixed; boundary="===============3358510767768573950=="
MIME-Version: 1.0
From: Michael Mullin <masmullin at hush.com>
Subject: Re: [Powertop] Powertop crashes with 'powertop --auto-tune'
Date: Thu, 22 Jan 2015 18:43:08 -0500
Message-ID: <df44fda28c5657fc5c7d58cef333ae45@smtp.hushmail.com>
In-Reply-To: 20150122233257.GB20149@rhrk.uni-kl.de
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============3358510767768573950==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

I did not see your change before I posted the patch below.  However, I do s=
ee it now.
https://lists.01.org/pipermail/powertop/2014-December/001730.html

Joerg found it first.  Please take my patch as a verification of his.

On 01/22/2015 06:32 PM, Joerg Mayer wrote:
> Hmm, it looks like nobody reacted to (and thus duplicated the work of):
> =

> Date: Mon, 22 Dec 2014 02:27:26 +0100 From: Joerg Mayer <jmpt(a)loplof.de=
> To: powertop(a)ml01.01.org In-Reply-To: <549762B4.3090108(a)linux.intel.c=
om>
> =

> Which contains the first part of the patch (the one causing the crash) bu=
t not the second (which isn't *strictly* required but makes sense from a "g=
ood style" point of view).
> =

> Did anyone but me actually see that message? I verified that I did receiv=
e it back via the list (receive headers).
> =

> Thanks J=C3=B6rg
> =

> On Thu, Jan 22, 2015 at 04:50:10PM -0500, Michael Mullin wrote: Please se=
e the following patch to address the reported crash --- From e994a414f61941=
0877023fce35ade12d1cfce68d Mon Sep 17 00:00:00 2001 From: Michael Mullin <m=
asmullin(a)hush.com> Date: Thu, 22 Jan 2015 16:33:31 -0500 Subject: [PATCH]=
 If "dir" is closed early inside create_add_devfreq_devices() then there is=
 a potential double free due to a second close during the cleanup phase in =
clear_all_devfreq()
> =

> Signed-off-by: Michael Mullin <masmullin(a)hush.com>
> =

> --- src/devices/devfreq.cpp | 5 ++++- 1 file changed, 4 insertions(+), 1 =
deletion(-)
> =

> diff --git a/src/devices/devfreq.cpp b/src/devices/devfreq.cpp index d2e5=
6e3..f652a57 100644 --- a/src/devices/devfreq.cpp +++ b/src/devices/devfreq=
.cpp @@ -247,6 +247,7 @@ void create_all_devfreq_devices(void) fprintf(stde=
rr, "Devfreq not enabled\n"); is_enabled =3D false; closedir(dir); +		dir =
=3D NULL; return; }
> =

> @@ -327,6 +328,8 @@ void clear_all_devfreq() } all_devfreq.clear(); /* cl=
ose /sys/class/devfreq */ -	if (dir !=3D NULL) +	if (dir !=3D NULL) { close=
dir(dir); +		dir =3D NULL; +	} }
>> =

>> _______________________________________________ PowerTop mailing list Po=
werTop(a)lists.01.org https://lists.01.org/mailman/listinfo/powertop
> =

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJUwYsGAAoJEJHz7fmWOTHsKyAH/jlGevaIUil2FlGvkkGo4Y+U
xeQNfkVKQbtzpvYW8jKvp+3e08AfNpZIfHrhcholOA9YimV4QDCTLeMc56L89IIZ
CF1xXf+Li09cb9d52sdctHhwGuGAr9a951HqSumns3uyFVjYkhLDvrJQajOBONaI
m+h7qffm6R3VkBfieTHEAw+ywp74aVK5jnGeZGK/z2R2w2LE6aFR0tM2ABvUFARL
XenaceU0rFBYiSHd8LipKX4Y/qC3Nk0ExSGMMnXuLZ/pZ304wmogwqpT1ccr7s4n
iSFj+Jo3xYyW2OgceL/kw8N9V4kG4P6wXn1ACRX1Uo09ACsMCEcnx0xWopunpiU=3D
=3D0HBf
-----END PGP SIGNATURE-----


--===============3358510767768573950==--

