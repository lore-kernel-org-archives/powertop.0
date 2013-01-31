Content-Type: multipart/mixed; boundary="===============1393633388078089384=="
MIME-Version: 1.0
From: Kristen Carlson Accardi <kristen at linux.intel.com>
Subject: Re: [Powertop] [PATCH] Using std::max to handle all such kind of logic
Date: Thu, 31 Jan 2013 15:39:50 -0800
Message-ID: <20130131153950.6f2d0548@bluebird.jf.intel.com>
In-Reply-To: 1358913287-8694-1-git-send-email-zhang.austin@gmail.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============1393633388078089384==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, 23 Jan 2013 11:54:47 +0800
Austin Zhang <zhang.austin(a)gmail.com> wrote:

> Signed-off-by: Austin Zhang <zhang.austin(a)gmail.com>
> ---
>  src/cpu/cpu.cpp |    5 +++--
>  1 files changed, 3 insertions(+), 2 deletions(-)
> =

> diff --git a/src/cpu/cpu.cpp b/src/cpu/cpu.cpp
> index 7f3af69..38540a5 100644
> --- a/src/cpu/cpu.cpp
> +++ b/src/cpu/cpu.cpp
> @@ -525,8 +525,9 @@ void report_display_cpu_pstates(void)
>  	unsigned int i, pstates_num;
>  =

>  	for (i =3D 0, pstates_num =3D 0; i < all_cpus.size(); i++)
> -		if (all_cpus[i] && all_cpus[i]->pstates.size() >
> pstates_num)
> -			pstates_num =3D all_cpus[i]->pstates.size();
> +		if (all_cpus[i])
> +			pstates_num =3D std::max<unsigned
> int>(pstates_num,
> +
> all_cpus[i]->pstates.size()); =

>  	report.begin_section(SECTION_CPUFREQ);
>  	report.add_header("Processor Frequency Report");

Applied, thanks.

Kristen

--===============1393633388078089384==--

