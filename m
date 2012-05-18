Content-Type: multipart/mixed; boundary="===============0065423364838570102=="
MIME-Version: 1.0
From: Lekensteyn <lekensteyn at gmail.com>
Subject: Re: [Powertop] [PATCH] catch fstream exceptions in lib routines
Date: Fri, 18 May 2012 12:58:10 +0200
Message-ID: <1403259.dDrcVdOxix@penguin>
In-Reply-To: 20120518101739.GB3074@swordfish
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============0065423364838570102==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Friday 18 May 2012 13:17:39 Sergey Senozhatsky wrote:
Hi,

> @@ -187,10 +192,17 @@ int read_sysfs(const string &filename, bool *ok)
>  			*ok =3D false;
>  		return 0;
>  	}
> -	file >> i;
> +	try
> +	{
> +		file >> i;
> +		if (ok)
> +			*ok =3D true;
> +	} catch (std::exception &exc) {
> +		if (ok)
> +			*ok =3D "false";
I have changed this to false (without quotes), I guess that is what you mea=
nt.

With that change,
Tested-by: Lekensteyn <lekensteyn(a)gmail.com>

Thanks,
Peter

--===============0065423364838570102==--

