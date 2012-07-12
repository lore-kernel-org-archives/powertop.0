Content-Type: multipart/mixed; boundary="===============8813557246006867020=="
MIME-Version: 1.0
From: Sergey Senozhatsky <sergey.senozhatsky at gmail.com>
Subject: Re: [Powertop] Display all P-states in HTML-report
Date: Thu, 12 Jul 2012 03:57:21 +0300
Message-ID: <20120712005721.GA7413@swordfish.datadirect.datadirectnet.com>
In-Reply-To: 4FFD3BE0.9090803@samsung.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============8813557246006867020==
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


OH, SILLY ME! My bad, sorry!
You initialize pstates_num within for loop (which is confusing).

Sorry for noise.

	-ss

--===============8813557246006867020==--

