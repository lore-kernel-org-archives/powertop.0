Content-Type: multipart/mixed; boundary="===============3239001635381086958=="
MIME-Version: 1.0
From: Sergey Senozhatsky <sergey.senozhatsky at gmail.com>
Subject: Re: [Powertop] [RFC] [PATCHv2 00/10] Code deduplication in cpu/*
Date: Mon, 24 Dec 2012 23:41:35 +0300
Message-ID: <20121224204135.GD3307@swordfish>
In-Reply-To: E351AD52FA1E154C8FFF4F9FCD2CA8431B3CD913@ORSMSX108.amr.corp.intel.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============3239001635381086958==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On (12/24/12 20:17), Ferron, Chris E wrote:
> Thanks, I will attend to outstanding patches on Wednesday (GMT+8) when I =
return to the office. =

> -Chris
>

Thanks, Merry Christmas!

	-ss

 =

> -----Original Message-----
> From: powertop-bounces(a)lists.01.org [mailto:powertop-bounces(a)lists.01=
.org] On Behalf Of Sergey Senozhatsky
> Sent: Monday, December 24, 2012 8:25 AM
> To: Chris Ferron
> Cc: powertop(a)lists.01.org
> Subject: Re: [Powertop] [RFC] [PATCHv2 00/10] Code deduplication in cpu/*
> =

> On (12/24/12 03:08), Ivan Shapovalov wrote:
> > This is a resend (unchanged but rebased) of the patch series about =

> > refactoring code in cpu/* by deduplication. From this series, only the =

> > last bugfix patch has been applied so far due to a code freeze.
> > =

> > Ivan Shapovalov (10):
> >       Fix includes: do not include intel_cpus.h inside cpu.h
> >       Deduplication: move is_turbo() function to lib
> >       Deduplication: move all instances of account_freq() to abstract_c=
pu::account_freq()
> >       Deduplication: remove nhm_cpu::account_freq() almost identical to=
 abstract_cpu::account_freq()
> >       Deduplication: remove nhm_{cpu,core,package}::change_effective_fr=
equency() identical to cpu_{linux,core,package}::change_effective_frequency=
()
> >       Deduplication: merge cpu_{core,linux,package}::change_effective_f=
requency() into abstract_cpu::change_effective_frequency()
> >       Deduplication: remove {cpu,nhm}_core::calculate_freq() identical =
to abstract_cpu::calculate_freq()
> >       Deduplication: remove nhm_package::calculate_freq() identical to =
cpu_package::calculate_freq()
> >       Deduplication: properly merge cpu_package::calculate_freq() into =
abstract_cpu::calculate_freq()
> >       Deduplication: merge go_idle()/go_unidle()/change_freq() =

> > overrides into abstract_cpu() class
> > =

> =

> Hello Chris,
> patch series looks good to me. thanks to Ivan.
> =

> please note V3 of 02 and 03 patches.
> =

> =

> 	-ss
> _______________________________________________
> PowerTop mailing list
> PowerTop(a)lists.01.org
> https://lists.01.org/mailman/listinfo/powertop
>=20

--===============3239001635381086958==--

