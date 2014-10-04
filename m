Content-Type: multipart/mixed; boundary="===============0048912206986765586=="
MIME-Version: 1.0
From: Sami Kerola <kerolasa at iki.fi>
Subject: Re: [Powertop] [PATCH v3 05/15] fix clang++ compilation errors
Date: Sat, 04 Oct 2014 15:19:01 +0100
Message-ID: <alpine.LNX.2.03.1410041517020.3874@iki.fi>
In-Reply-To: alpine.LNX.2.03.1410041513550.3874@iki.fi
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============0048912206986765586==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sat, 4 Oct 2014, Sami Kerola wrote:

> -AM_INIT_AUTOMAKE([-Wall foreign])
> +AM_INIT_AUTOMAKE([
> +	-Wall
> +	1.11.2
> +	foreign
> +])

Uh oh... I meant

s/1.11.2/1.11.1/

But then again even the 1.11.2 is not crazy bleeding edge, so it would =

probably be a fine pick as well.

-- =

Sami Kerola
http://www.iki.fi/kerolasa/

--===============0048912206986765586==--

