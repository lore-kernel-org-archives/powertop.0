Content-Type: multipart/mixed; boundary="===============3234594647374037460=="
MIME-Version: 1.0
From: Joerg Mayer <jmpt at loplof.de>
Subject: Re: [Powertop] Powertop crashes with 'powertop --auto-tune'
Date: Fri, 23 Jan 2015 00:32:57 +0100
Message-ID: <20150122233257.GB20149@rhrk.uni-kl.de>
In-Reply-To: 7af62d87104ff4decf61d783207ba917@smtp.hushmail.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============3234594647374037460==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hmm, it looks like nobody reacted to (and thus duplicated the work of):

Date: Mon, 22 Dec 2014 02:27:26 +0100                                      =
                       =

From: Joerg Mayer <jmpt(a)loplof.de>                                       =
                         =

To: powertop(a)ml01.01.org                                                 =
                         =

In-Reply-To: <549762B4.3090108(a)linux.intel.com>                          =
                         =


Which contains the first part of the patch (the one causing the crash) but
not the second (which isn't *strictly* required but makes sense from a
"good style" point of view).

Did anyone but me actually see that message? I verified that I did receive =
it
back via the list (receive headers).

Thanks
   J=C3=B6rg

On Thu, Jan 22, 2015 at 04:50:10PM -0500, Michael Mullin wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA256
> =

> Please see the following patch to address the reported crash
> - ---
> - From e994a414f619410877023fce35ade12d1cfce68d Mon Sep 17 00:00:00 2001
> From: Michael Mullin <masmullin(a)hush.com>
> Date: Thu, 22 Jan 2015 16:33:31 -0500
> Subject: [PATCH] If "dir" is closed early inside create_add_devfreq_devic=
es()
>  then there is a potential double free due to a second close during the
>  cleanup phase in clear_all_devfreq()
> =

> Signed-off-by: Michael Mullin <masmullin(a)hush.com>
> =

> - ---
>  src/devices/devfreq.cpp | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> =

> diff --git a/src/devices/devfreq.cpp b/src/devices/devfreq.cpp
> index d2e56e3..f652a57 100644
> - --- a/src/devices/devfreq.cpp
> +++ b/src/devices/devfreq.cpp
> @@ -247,6 +247,7 @@ void create_all_devfreq_devices(void)
>  		fprintf(stderr, "Devfreq not enabled\n");
>  		is_enabled =3D false;
>  		closedir(dir);
> +		dir =3D NULL;
>  		return;
>  	}
> =

> @@ -327,6 +328,8 @@ void clear_all_devfreq()
>  	}
>  	all_devfreq.clear();
>  	/* close /sys/class/devfreq */
> - -	if (dir !=3D NULL)
> +	if (dir !=3D NULL) {
>  		closedir(dir);
> +		dir =3D NULL;
> +	}
>  }
> - -- =

> 2.2.2
> =

> =

> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v2
> =

> iQEcBAEBCAAGBQJUwXCLAAoJEJHz7fmWOTHsR2YH/3ASltE3MVMu7V6HoKYvGHFL
> VsjQNenXTEYLSSiVMZfbZHaypHnH8SdhfJTBMHF1+v2fS2LzuEA/qFfleS39+L9S
> E/EZGdCWXnrK56pa+Lu6JWguwCNmyhNyOQ+nnaU6v9jH0YmQGx5hMPZu/aPhlZTU
> LWHxj0Knch1WGUATlofOy98XCbhY9yDICQxMDfJicun6cOAahlQminqJcLTSyGbY
> t5lVWR2E1ybnpojlot8t2BRmCYR210VmB+Pbpralk+nSRtX2rx4yT/Hx5B3wBbwJ
> msNs+6+6WKG20EVhxxbTSqLAar9ZMf8w+K8Qsz8Zqg4yzaGra3u6kl80Wr/ElqA=3D
> =3DObTH
> -----END PGP SIGNATURE-----
> =

> _______________________________________________
> PowerTop mailing list
> PowerTop(a)lists.01.org
> https://lists.01.org/mailman/listinfo/powertop

-- =

Joerg Mayer                                           <jmayer(a)loplof.de>
We are stuck with technology when what we really want is just stuff that
works. Some say that should read Microsoft instead of technology.

--===============3234594647374037460==--

