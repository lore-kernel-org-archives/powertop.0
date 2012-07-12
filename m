Content-Type: multipart/mixed; boundary="===============2254187062977315391=="
MIME-Version: 1.0
From: Sergey Senozhatsky <sergey.senozhatsky at gmail.com>
Subject: Re: [Powertop] Display all P-states in HTML-report
Date: Thu, 12 Jul 2012 03:54:01 +0300
Message-ID: <20120712005401.GA3311@swordfish.datadirect.datadirectnet.com>
In-Reply-To: 4FFD3BE0.9090803@samsung.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============2254187062977315391==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On (07/11/12 12:40), Igor Zhbanov wrote:
>
> +	unsigned int i, pstates_num;
> +
> +	for (i =3D 0, pstates_num =3D 0; i<  all_cpus.size(); i++)
> +		if (all_cpus[i]&&  all_cpus[i]->pstates.size()>  pstates_num)
> +			pstates_num =3D all_cpus[i]->pstates.size();
> =


nack

That will not work correctly, I'm afraid.

pstates_num initialized with stack garbage and is free to have value (e.g. =
0x7fffffff)
which will never satisfy "all_cpus[i]->pstates.size()>  pstates_num" condit=
ion.
In that case our loop will spin "0x7fffffff - actual_pstates_number" useles=
s cycles.



BTW, could you please put white space before operators and remove extra one=
 after?

E.g.

    "all_cpus[i] && all_cpus[i]->pstates.size() > pstates_num"

vs.

    "all_cpus[i]&&  all_cpus[i]->pstates.size()>  pstates_num"
               ^^^^^^                          ^^^^^

	-ss

--===============2254187062977315391==--

