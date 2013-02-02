Content-Type: multipart/mixed; boundary="===============4976679293753909881=="
MIME-Version: 1.0
From: Paul Menzel <paulepanter at users.sourceforge.net>
Subject: Re: [Powertop] [PATCH] V2: Fix C states and P states presentation
 issue.
Date: Sat, 02 Feb 2013 23:11:28 +0100
Message-ID: <1359843088.5545.13.camel@mattotaupa>
In-Reply-To: 20130131153927.7a7e1aca@bluebird.jf.intel.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============4976679293753909881==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Dear Kristen, dear Austin,


Austin, thank you for the patch and Kristen, thank you for committing
it.

Am Donnerstag, den 31.01.2013, 15:39 -0800 schrieb Kristen Carlson Accardi:
> On Tue, 22 Jan 2013 19:43:32 +0800
> Austin Zhang <zhang.austin(a)gmail.com> wrote:

Austin, when sending patch iterations, please make sure to include the
version into the brackets: [PATCH v2]. Otherwise `git am` will not
remove it.

[=E2=80=A6]

> > @@ -656,8 +679,7 @@ void impl_w_display_cpu_states(int state)
> >  			if (!_core->has_pstates() && state =3D=3D PSTATE)
> >  				continue;
> >  =

> > -
> > -			for (line =3D LEVEL_HEADER; line < 10; line++)
> > {
> > +			for (line =3D LEVEL_HEADER; line <=3D loop;
> > line++) { int first =3D 1;
> >  				ctr =3D 0;
> >  				linebuf[0] =3D 0;

Kristen, please do not line wrap replies (at least code pastes) for
better legibility.

> Applied, thanks.

Kristen, please double check when applying a patch. As know the commit
history contains that =C2=BBV2:=C2=AB confusing people looking at the commi=
t log.
That would be great.


Thanks,

Paul

--===============4976679293753909881==
Content-Type: application/pgp-signature
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="signature.asc"

LS0tLS1CRUdJTiBQR1AgU0lHTkFUVVJFLS0tLS0KVmVyc2lvbjogR251UEcgdjEuNC4xMiAoR05V
L0xpbnV4KQoKaUVZRUFCRUNBQVlGQWxFTmp4QUFDZ2tRUFgxYUsyd09IVmdlK3dDZmRoUG1HVlJk
a3lBdmtEOTJjL1YybUYycAp2QlFBbmlKL1k0RVdyRWU2MHJ5MUZMYU9xcVhiMXlsUAo9K0dWdwot
LS0tLUVORCBQR1AgU0lHTkFUVVJFLS0tLS0K

--===============4976679293753909881==--

