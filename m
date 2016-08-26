Content-Type: multipart/mixed; boundary="===============3944224148494115984=="
MIME-Version: 1.0
From: Joe Konno <joe.konno at linux.intel.com>
Subject: Re: [Powertop] [PATCH] Fixed a dangling pointer
Date: Fri, 26 Aug 2016 08:41:04 -0700
Message-ID: <20160826084104.36dd34b3@jbkonno-cardamom.jf.intel.com>
In-Reply-To: 07192cfc-e760-4f1e-8bee-52f64e256ba3@redhat.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============3944224148494115984==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, 24 Aug 2016 14:11:51 +0200
Ond=C5=99ej Lyson=C4=9Bk <olysonek(a)redhat.com> wrote:

> ---
>  traceevent/parse-filter.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> =

> diff --git a/traceevent/parse-filter.c b/traceevent/parse-filter.c
> index 2500e75..ec308ae 100644
> --- a/traceevent/parse-filter.c
> +++ b/traceevent/parse-filter.c
> @@ -1720,7 +1720,7 @@ static const char *get_field_str(struct filter_arg =
*arg, struct pevent_record *r
>  	struct pevent *pevent;
>  	unsigned long long addr;
>  	const char *val =3D NULL;
> -	char hex[64];
> +	static char hex[64];
>  =

>  	/* If the field is not a string convert it */
>  	if (arg->str.field->flags & FIELD_IS_STRING) {

Thanks for the contribution! Commit message updated with my Acked-by. Pushe=
d.
    ea5c67865415 Fixed a dangling pointer

--===============3944224148494115984==
Content-Type: application/pgp-signature
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.sig"

LS0tLS1CRUdJTiBQR1AgU0lHTkFUVVJFLS0tLS0KVmVyc2lvbjogR251UEcgdjIuMC4yMiAoR05V
L0xpbnV4KQoKaVFJY0JBRUJBZ0FHQlFKWHdHTVFBQW9KRUkySVI5VXZTcXBtcGVVUUFLZit2ZUtN
T1NEMUJhcjZYRmJnanAwTwprL2loQ0dZeDhHSDlHeGdSYjZIMUN2VDFNcEpGcGlaQkdKcDF1UEt2
QW1UV2J3N1lqVzB1MExkN1dyYmhEempiCi9rTVdzQ3Exdy9JOHdUNXZxREFnMm1PSlBtaWRCbnNo
eU8vMmEveFBzRmlyWVFsajliUGZKQklQN3ZFZExsTHkKZmNkRW9MTVRDVkhnSUpGV1Z0ZlBXczBy
aVM4dzdQQ0k0SURKdTRJVkM3RjcxcEJUZ0JxUzdCdDRhVXVFTVR2YgpBNTllZTRHRmpaWVBDRG9l
TXMxVVhHa2dBa3FqWk1NbUdwbERPTXpFTUlKbTNqMENRRGx2S1hkMTVxZ3NIdW5TCjZ2a3E0ency
bnljeDFTdnN2ODlBaS9WcTdoVnd6SWlreHU5NGU2UEdRdkdUcGQ2MFRoNGZiUmw1b3RLWTFFV0gK
SklKdUo1NlgzS3dMUzlmNElJQlIzTmY1dUJhb3JndTFzRDJ4emJUdXpocVBkTFM2K3QrKzJCMkpY
QVozREc0dgpqa1RQb0c2MkVPTEZiVi9iVWFiditLTXFhYkdRWmxwZ0YzdkNEUVYwdHE5SDFmSHFM
K1daK292V0YzRjBNSnJjCkRqNlJvRlJFOTFISmVnd2RqbURXZ2dFcmxsT1RTYlQyQ1ZmRHMwbk1y
cjNtOGJaNkRZYTBDK2VJYy81SzVXNHcKMWVhWnNPM1JTcUZtejRSU1Z3bGJVOVRkV21DSlNIY1dp
WkFXdzVQelZuaS9WNDdOSC9Vc3UrM0I5QUI5UU1uTAp3eHdQUHhRSHZuTGJRd3JNZVE1WEErVThX
OTRuTkpnUkFDZkhTaTNtZnJKSmw2dnV6dTArUnF5NW8rTUMwblBjCjdhbW1tUFdQbytPaHJ3eVdq
bWNSCj1MMnlYCi0tLS0tRU5EIFBHUCBTSUdOQVRVUkUtLS0tLQo=

--===============3944224148494115984==--

