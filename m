Content-Type: multipart/mixed; boundary="===============0524192749033632727=="
MIME-Version: 1.0
From: Chris Ferron <chris.e.ferron at linux.intel.com>
Subject: Re: [Powertop] [PATCH] abstract_cpu: do not call total_pstate_time()
 in validate()
Date: Thu, 13 Sep 2012 08:19:00 -0700
Message-ID: <5051F964.6090103@linux.intel.com>
In-Reply-To: 20120913124129.GA4894@swordfish.minsk.epam.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============0524192749033632727==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 09/13/2012 05:41 AM, Sergey Senozhatsky wrote:
>   abstract_cpu: do not call total_pstate_time() in validate()
>
> Signed-off-by: Sergey Senozhatsky <sergey.senozhatsky(a)gmail.com>
>
> ---
>
>   src/cpu/abstract_cpu.cpp | 7 +------
>   1 file changed, 1 insertion(+), 6 deletions(-)
>
> diff --git a/src/cpu/abstract_cpu.cpp b/src/cpu/abstract_cpu.cpp
> index ebdc510..386d981 100644
> --- a/src/cpu/abstract_cpu.cpp
> +++ b/src/cpu/abstract_cpu.cpp
> @@ -414,15 +414,10 @@ uint64_t abstract_cpu::total_pstate_time(void)
>   void abstract_cpu::validate(void)
>   {
>   	unsigned int i;
> -	uint64_t my_time;
> -
> -	my_time =3D total_pstate_time();
>   =

>   	for (i =3D 0; i < children.size(); i++) {
> -
> -		if (children[i]) {
> +		if (children[i])
>   			children[i]->validate();
> -		}
>   	}
>   }
>   =

Your patch has been applied.
Thank You
-C


--===============0524192749033632727==--

