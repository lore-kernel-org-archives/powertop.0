Content-Type: multipart/mixed; boundary="===============4841761449847939338=="
MIME-Version: 1.0
From: Sami Kerola <kerolasa at iki.fi>
Subject: Re: [Powertop] [PATCH 07/12] move options structure to function scope
Date: Sat, 02 Aug 2014 23:20:41 +0100
Message-ID: <CAG27Bk3YC1TNt=OLOQE_jO7q6izjB3iLAjWeC3xhnXBZth9Bjg@mail.gmail.com>
In-Reply-To: 20140802134718.GA1018@swordfish
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============4841761449847939338==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 2 August 2014 14:47, Sergey Senozhatsky <sergey.senozhatsky(a)gmail.com>=
 wrote:
>> Subject: [Powertop] [PATCH 07/12] move options structure to function sco=
pe
>
> what for?

They've told me keeping variables in as narrow scope as possible is a
virtue. Even if it would not be I don't see any harm of moving
everything out of global scope when ever possible.

https://www.securecoding.cert.org/confluence/display/cplusplus/DCL07-CPP.+M=
inimize+the+scope+of+variables+and+methods

-- =

Sami Kerola
http://www.iki.fi/kerolasa/

--===============4841761449847939338==--

