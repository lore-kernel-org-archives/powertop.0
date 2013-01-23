Content-Type: multipart/mixed; boundary="===============0205519820713470764=="
MIME-Version: 1.0
From: Sergey Senozhatsky <sergey.senozhatsky at gmail.com>
Subject: Re: [Powertop] [PATCH] Using std::max to handle all such kind of logic
Date: Wed, 23 Jan 2013 10:11:43 +0300
Message-ID: <20130123071143.GA2461@swordfish.minsk.epam.com>
In-Reply-To: 1358913287-8694-1-git-send-email-zhang.austin@gmail.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============0205519820713470764==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On (01/23/13 11:54), Austin Zhang wrote:
> Date: Wed, 23 Jan 2013 11:54:47 +0800
> From: Austin Zhang <zhang.austin(a)gmail.com>
> To: powertop(a)lists.01.org
> Cc: sergey.senozhatsky(a)gmail.com, i.zhbanov(a)samsung.com, Austin Zhang
>  <zhang.austin(a)gmail.com>
> Subject: [PATCH] Using std::max to handle all such kind of logic
> X-Mailer: git-send-email 1.7.5.4
> =

> Signed-off-by: Austin Zhang <zhang.austin(a)gmail.com>
> ---
>  src/cpu/cpu.cpp |    5 +++--
>  1 files changed, 3 insertions(+), 2 deletions(-)
>

looks good to me.

	-ss
 =

> diff --git a/src/cpu/cpu.cpp b/src/cpu/cpu.cpp
> index 7f3af69..38540a5 100644
> --- a/src/cpu/cpu.cpp
> +++ b/src/cpu/cpu.cpp
> @@ -525,8 +525,9 @@ void report_display_cpu_pstates(void)
>  	unsigned int i, pstates_num;
>  =

>  	for (i =3D 0, pstates_num =3D 0; i < all_cpus.size(); i++)
> -		if (all_cpus[i] && all_cpus[i]->pstates.size() > pstates_num)
> -			pstates_num =3D all_cpus[i]->pstates.size();
> +		if (all_cpus[i])
> +			pstates_num =3D std::max<unsigned int>(pstates_num,
> +								all_cpus[i]->pstates.size());
>  =

>  	report.begin_section(SECTION_CPUFREQ);
>  	report.add_header("Processor Frequency Report");
> -- =

> 1.7.5.4
>=20

--===============0205519820713470764==--

