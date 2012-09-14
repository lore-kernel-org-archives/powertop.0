Content-Type: multipart/mixed; boundary="===============1360308557028216176=="
MIME-Version: 1.0
From: Paul Menzel <paulepanter at users.sourceforge.net>
Subject: Re: [Powertop] [PATCH] abstract_cpu: do not call total_pstate_time()
 in validate()
Date: Fri, 14 Sep 2012 12:00:56 +0200
Message-ID: <1347616856.6783.11.camel@mattotaupa>
In-Reply-To: 20120913124129.GA4894@swordfish.minsk.epam.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============1360308557028216176==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Dear Sergey,


Am Donnerstag, den 13.09.2012, 15:41 +0300 schrieb Sergey Senozhatsky:
> abstract_cpu: do not call total_pstate_time() in validate()

copying the commit summary into the commit message body is not useful.

Maybe also describe why this was a problem.

> Signed-off-by: Sergey Senozhatsky <sergey.senozhatsky(a)gmail.com>
> =

> ---
> =

>  src/cpu/abstract_cpu.cpp | 7 +------
>  1 file changed, 1 insertion(+), 6 deletions(-)

[=E2=80=A6]


Thanks,

Paul

--===============1360308557028216176==
Content-Type: application/pgp-signature
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="signature.asc"

LS0tLS1CRUdJTiBQR1AgU0lHTkFUVVJFLS0tLS0KVmVyc2lvbjogR251UEcgdjEuNC4xMiAoR05V
L0xpbnV4KQoKaUVZRUFCRUNBQVlGQWxCVEFGa0FDZ2tRUFgxYUsyd09IVmg5QVFDZmZ4cnhiR1lX
azdsOE1FQ3l5alovNTNSOAo2R0FBb0lDTlprbUcwRWJPbjB3Y2NHZ21zSUdhYStwawo9U1pjOQot
LS0tLUVORCBQR1AgU0lHTkFUVVJFLS0tLS0K

--===============1360308557028216176==--

