Content-Type: multipart/mixed; boundary="===============7011477401149593834=="
MIME-Version: 1.0
From: Kristen Carlson Accardi <kristen at linux.intel.com>
Subject: Re: [Powertop] [RFC] [PATCHv2 00/10] Code deduplication in cpu/*
Date: Thu, 31 Jan 2013 14:25:47 -0800
Message-ID: <20130131142547.04f4b6f5@bluebird.jf.intel.com>
In-Reply-To: 1356304132-3889-1-git-send-email-intelfx100@gmail.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============7011477401149593834==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, 24 Dec 2012 03:08:42 +0400
Ivan Shapovalov <intelfx100(a)gmail.com> wrote:

> This is a resend (unchanged but rebased) of the patch series about
> refactoring code in cpu/* by deduplication. From this series, only
> the last bugfix patch has been applied so far due to a code freeze.
> =

> Ivan Shapovalov (10):
>       Fix includes: do not include intel_cpus.h inside cpu.h
>       Deduplication: move is_turbo() function to lib
>       Deduplication: move all instances of account_freq() to
> abstract_cpu::account_freq() Deduplication: remove
> nhm_cpu::account_freq() almost identical to
> abstract_cpu::account_freq() Deduplication: remove
> nhm_{cpu,core,package}::change_effective_frequency() identical to
> cpu_{linux,core,package}::change_effective_frequency() Deduplication:
> merge cpu_{core,linux,package}::change_effective_frequency() into
> abstract_cpu::change_effective_frequency() Deduplication: remove
> {cpu,nhm}_core::calculate_freq() identical to
> abstract_cpu::calculate_freq() Deduplication: remove
> nhm_package::calculate_freq() identical to
> cpu_package::calculate_freq() Deduplication: properly merge
> cpu_package::calculate_freq() into abstract_cpu::calculate_freq()
> Deduplication: merge go_idle()/go_unidle()/change_freq() overrides
> into abstract_cpu() class
> _______________________________________________ PowerTop mailing list
> PowerTop(a)lists.01.org https://lists.01.org/mailman/listinfo/powertop

Hi, I applied your patches.  Thanks for the cleanup.

Kristen

--===============7011477401149593834==--

