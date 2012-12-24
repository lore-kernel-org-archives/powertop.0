Content-Type: multipart/mixed; boundary="===============3956594586167474172=="
MIME-Version: 1.0
From: Ferron, Chris E <chris.e.ferron at intel.com>
Subject: Re: [Powertop] [RFC] [PATCHv2 00/10] Code deduplication in cpu/*
Date: Mon, 24 Dec 2012 20:17:54 +0000
Message-ID: <E351AD52FA1E154C8FFF4F9FCD2CA8431B3CD913@ORSMSX108.amr.corp.intel.com>
In-Reply-To: 20121224162528.GC3307@swordfish
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============3956594586167474172==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Thanks, I will attend to outstanding patches on Wednesday (GMT+8) when I re=
turn to the office. =

-Chris

-----Original Message-----
From: powertop-bounces(a)lists.01.org [mailto:powertop-bounces(a)lists.01.o=
rg] On Behalf Of Sergey Senozhatsky
Sent: Monday, December 24, 2012 8:25 AM
To: Chris Ferron
Cc: powertop(a)lists.01.org
Subject: Re: [Powertop] [RFC] [PATCHv2 00/10] Code deduplication in cpu/*

On (12/24/12 03:08), Ivan Shapovalov wrote:
> This is a resend (unchanged but rebased) of the patch series about =

> refactoring code in cpu/* by deduplication. From this series, only the =

> last bugfix patch has been applied so far due to a code freeze.
> =

> Ivan Shapovalov (10):
>       Fix includes: do not include intel_cpus.h inside cpu.h
>       Deduplication: move is_turbo() function to lib
>       Deduplication: move all instances of account_freq() to abstract_cpu=
::account_freq()
>       Deduplication: remove nhm_cpu::account_freq() almost identical to a=
bstract_cpu::account_freq()
>       Deduplication: remove nhm_{cpu,core,package}::change_effective_freq=
uency() identical to cpu_{linux,core,package}::change_effective_frequency()
>       Deduplication: merge cpu_{core,linux,package}::change_effective_fre=
quency() into abstract_cpu::change_effective_frequency()
>       Deduplication: remove {cpu,nhm}_core::calculate_freq() identical to=
 abstract_cpu::calculate_freq()
>       Deduplication: remove nhm_package::calculate_freq() identical to cp=
u_package::calculate_freq()
>       Deduplication: properly merge cpu_package::calculate_freq() into ab=
stract_cpu::calculate_freq()
>       Deduplication: merge go_idle()/go_unidle()/change_freq() =

> overrides into abstract_cpu() class
> =


Hello Chris,
patch series looks good to me. thanks to Ivan.

please note V3 of 02 and 03 patches.


	-ss
_______________________________________________
PowerTop mailing list
PowerTop(a)lists.01.org
https://lists.01.org/mailman/listinfo/powertop

--===============3956594586167474172==--

