Content-Type: multipart/mixed; boundary="===============5289324255204156637=="
MIME-Version: 1.0
From: Magnus Fromreide <magfr at lysator.liu.se>
Subject: Re: [Powertop] [PATCH] Using std::max to handle all such kind of logic
Date: Wed, 23 Jan 2013 08:53:12 +0100
Message-ID: <1358927592.3289.31.camel@sara>
In-Reply-To: 1358913287-8694-1-git-send-email-zhang.austin@gmail.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============5289324255204156637==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, 2013-01-23 at 11:54 +0800, Austin Zhang wrote:
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
> -		if (all_cpus[i] && all_cpus[i]->pstates.size() > pstates_num)
> -			pstates_num =3D all_cpus[i]->pstates.size();
> +		if (all_cpus[i])
> +			pstates_num =3D std::max<unsigned int>(pstates_num,
> +								all_cpus[i]->pstates.size());

There should be no need to specify the template argument if pstates_num
is declared to the right type.
The return type of vector<T>::size() is vector<T>::size_type.
Thus I think this is a nicer version:

vector<frequency*>::size_type pstates_num;

for (i =3D 0, pstates_num =3D 0; i < all_cpus.size(); ++i)
	if (all_cpus[i])
		pstates_num =3D max(pstates_num, all_cpus[i]->pstates.size());

What do you think?

/MF


--===============5289324255204156637==--

