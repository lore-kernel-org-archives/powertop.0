Content-Type: multipart/mixed; boundary="===============0974822679103091067=="
MIME-Version: 1.0
From: Sergey Senozhatsky <sergey.senozhatsky at gmail.com>
Subject: Re: [Powertop] [RFC] [PATCHv2 00/10] Code deduplication in cpu/*
Date: Mon, 24 Dec 2012 19:25:28 +0300
Message-ID: <20121224162528.GC3307@swordfish>
In-Reply-To: 1356304132-3889-1-git-send-email-intelfx100@gmail.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============0974822679103091067==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On (12/24/12 03:08), Ivan Shapovalov wrote:
> This is a resend (unchanged but rebased) of the patch series about refact=
oring code
> in cpu/* by deduplication. From this series, only the last bugfix patch h=
as been applied
> so far due to a code freeze.
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
>       Deduplication: merge go_idle()/go_unidle()/change_freq() overrides =
into abstract_cpu() class
> =


Hello Chris,
patch series looks good to me. thanks to Ivan.

please note V3 of 02 and 03 patches.


	-ss

--===============0974822679103091067==--

