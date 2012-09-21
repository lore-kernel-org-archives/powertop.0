Content-Type: multipart/mixed; boundary="===============6243130429444727266=="
MIME-Version: 1.0
From: Chris Ferron <chris.e.ferron at linux.intel.com>
Subject: Re: [Powertop] [PATCH] cpu: Fix typo on freq_class
Date: Fri, 21 Sep 2012 07:50:58 -0700
Message-ID: <505C7ED2.80607@linux.intel.com>
In-Reply-To: 1348155305-3313-1-git-send-email-namhyung@gmail.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============6243130429444727266==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 09/20/2012 08:35 AM, Namhyung Kim wrote:
> s/cpu_even_req/cpu_even_freq/
>
> Signed-off-by: Namhyung Kim <namhyung(a)gmail.com>
> ---
>   src/cpu/cpu.cpp |    2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/src/cpu/cpu.cpp b/src/cpu/cpu.cpp
> index cc37748..96e3888 100644
> --- a/src/cpu/cpu.cpp
> +++ b/src/cpu/cpu.cpp
> @@ -385,7 +385,7 @@ static const char *freq_class(int line)
>   	if (line & 1) {
>   		return "cpu_odd_freq";
>   	}
> -	return "cpu_even_req";
> +	return "cpu_even_freq";
>   }
>   =

>   static int has_state_level(class abstract_cpu *acpu, int state, int lin=
e)
Your patch has been merged.
Thank You
-C


--===============6243130429444727266==--

