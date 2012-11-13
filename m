Content-Type: multipart/mixed; boundary="===============9066790263062125076=="
MIME-Version: 1.0
From: Chris Ferron <chris.e.ferron at linux.intel.com>
Subject: Re: [Powertop] [RFC] [PATCH 11/11] Ignore non-P-state-enabled CPUs
 when calculating frequency.
Date: Tue, 13 Nov 2012 11:14:52 -0800
Message-ID: <50A29C2C.8020609@linux.intel.com>
In-Reply-To: 1352113953-24687-12-git-send-email-intelfx100@gmail.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============9066790263062125076==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 11/05/2012 03:12 AM, Ivan Shapovalov wrote:
> This fixes bogus reported CPU frequencies (actually, uninitialized
> values from i965_core) when i965 monitoring is used.
>
> Signed-off-by: Ivan Shapovalov <intelfx100(a)gmail.com>
> ---
>   src/cpu/abstract_cpu.cpp | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/src/cpu/abstract_cpu.cpp b/src/cpu/abstract_cpu.cpp
> index d64cb24..fea377b 100644
> --- a/src/cpu/abstract_cpu.cpp
> +++ b/src/cpu/abstract_cpu.cpp
> @@ -380,7 +380,7 @@ void abstract_cpu::calculate_freq(uint64_t time)
>   =

>   	/* calculate the maximum frequency of all children */
>   	for (i =3D 0; i < children.size(); i++)
> -		if (children[i]) {
> +		if (children[i] && children[i]->has_pstates()) {
>   			uint64_t f =3D 0;
>   			if (!children[i]->idle) {
>   				f =3D children[i]->current_frequency;
This patch for the bug fix has been merged.
Thanks,
Chris


--===============9066790263062125076==--

