Content-Type: multipart/mixed; boundary="===============7121132617483186024=="
MIME-Version: 1.0
From: Joe Konno <joe.konno at linux.intel.com>
Subject: Re: [Powertop] [PATCH] Adding PID to process description.
Date: Wed, 03 Aug 2016 08:41:07 -0700
Message-ID: <20160803084107.4492d61e@jbkonno-basil.jf.intel.com>
In-Reply-To: 20160802033927.GA22138@obsidian
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============7121132617483186024==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, 2 Aug 2016 06:39:31 +0300
eSyr <evgsyr(a)gmail.com> wrote:

> Currently, multiple processes shown in overview and consumers list are
> indistinguishable in case they have the same command line. This commit
> prepends PID enclosed in square brackets to the beginning of description
> line, similarly to the interrupt ID in interrupt description.
> =

> * src/process/process.cpp (process::process): printing PID to desc,
>   adding process description after it.
> ---
>  src/process/process.cpp |   17 +++++++++++++----
>  1 file changed, 13 insertions(+), 4 deletions(-)
> =

> diff --git a/src/process/process.cpp b/src/process/process.cpp
> index caeccec..e244c5d 100644
> --- a/src/process/process.cpp
> +++ b/src/process/process.cpp
> @@ -89,6 +89,7 @@ process::process(const char *_comm, int _pid, int _tid)=
 : power_consumer()
>  {
>  	char line[4097];
>  	ifstream file;
> +	ssize_t pos;
>  =

>  	pt_strcpy(comm, _comm);
>  	pid =3D _pid;
> @@ -121,7 +122,15 @@ process::process(const char *_comm, int _pid, int _t=
id) : power_consumer()
>  	if (strncmp(_comm, "kondemand/", 10) =3D=3D 0)
>  		is_idle =3D 1;
>  =

> -	pt_strcpy(desc, comm);
> +	pos =3D snprintf(desc, sizeof(desc), "[PID %d] ", pid);
> +
> +	if (pos < 0)
> +		pos =3D 0;
> +	if ((size_t)pos > sizeof(desc))
> +		return;
> +
> +	strncpy(desc + pos, comm, sizeof(desc) - pos - 1);
> +	desc[sizeof(desc) - 1] =3D '\0';
>  =

>  	sprintf(line, "/proc/%i/cmdline", _pid);
>  	file.open(line, ios::binary);
> @@ -131,11 +140,11 @@ process::process(const char *_comm, int _pid, int _=
tid) : power_consumer()
>  		file.close();
>  		if (strlen(line) < 1) {
>  			is_kernel =3D 1;
> -			snprintf(desc, sizeof(desc), "[%s]", comm);
> +			snprintf(desc + pos, sizeof(desc) - pos, "[%s]", comm);
>  		} else {
> -			int sz =3D sizeof(desc) - 1;
> +			int sz =3D sizeof(desc) - pos - 1;
>  			cmdline_to_string(line);
> -			strncpy(desc, line, sz);
> +			strncpy(desc + pos, line, sz);
>  			desc[sz] =3D 0x00;
>  		}
>  	}

Thinking aloud: In the future I'd like to see a dedicated "ID" column in the
Overview tab. For 'Process'-type listings, it would contain the process
identifier. For 'Interrupt', its identifier. This would enforce something l=
ike
1NF discipline from the relational database camp. (That would necessitate
cleanups in other tabs, though, as well as CSV and HTML report output.) In =
the
Overview tab, the "Description" column is a bit cluttered, imho.

Having said my piece...

You have my Acked-by. Pushed, and thanks for your contribution!

commit f69d4dc45ab526b87a14a04e9dead4f9fc76f8be
Author:     eSyr <evgsyr(a)gmail.com>
AuthorDate: Tue Aug 2 06:39:31 2016 +0300
Commit:     Joe Konno <joe.konno(a)intel.com>
CommitDate: Wed Aug 3 08:27:38 2016 -0700

    Adding PID to process description.
    =

    Currently, multiple processes shown in overview and consumers list are
    indistinguishable in case they have the same command line. This commit
    prepends PID enclosed in square brackets to the beginning of description
    line, similarly to the interrupt ID in interrupt description.
    =

    * src/process/process.cpp (process::process): printing PID to desc,
      adding process description after it.
    =

    Acked-by: Joe Konno <joe.konno(a)intel.com>

--===============7121132617483186024==
Content-Type: application/pgp-signature
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.sig"

LS0tLS1CRUdJTiBQR1AgU0lHTkFUVVJFLS0tLS0KVmVyc2lvbjogR251UEcgdjIuMC4yMiAoR05V
L0xpbnV4KQoKaVFJY0JBRUJBZ0FHQlFKWG9oQ1RBQW9KRUkySVI5VXZTcXBtemQ4UUFOSVYxZklz
SWpTNEZ3WWhOZURQNmVWdwpQakVKTXdqWU1DaFhrRlhEZWg2bW55SjJQZG16dTVsTkNjOUZ1SGdC
SmlVVjVUNnBUSVNFSDIzWGxnbVA3NWlMCkhFdHVicGVXM0xZdmRiWXJteWNkUkxxZnZ5Tlp0bzYw
VVFlT1U4aldvenFiZnNteGU5M044QmhaTHFVS2p4ZCsKV2t0dXlRWmNnVllTTGJ5SC81NG1aM1Rj
cmNmUXl2bmR3SEd2NG5abjd2RllxRFU1SFVnUnN2cHJueUQxRjZLSgpCWkpteHREZkY0cEdQNmpx
QTVHL1VYSUhnbURXWWd5YXVQSk85WTM5VWZIeW1PeEljbW5iSUVOeitUZXZFTTlmCnpkNjNQSFF2
Wk5Xd0swci9HVHcyVmlud2tqektOamxXbkh5bXBXS2dRZlVxWXRtMjhyaG1mYUJrSVVYS0hXQk4K
YzZjem5CZ2MxWEtsQlZrc1FlMGt1NDdiV3B2THE3aUo0MFEybkd5bzFmeE9FYjRFbHVOZlRSQ2Fs
emE2WDl1YwpPRDZiVHZpYW9UdXErOENVSGhXRlBwZzdaSi9kTjJNMFpzMEozMWhEelVRcHphSjli
V0FiclE4dkE0Y0dYZUlHCk5FZTRmUURmVlN6L2Q0NGYydktCTElKV3U5cE90amJtYUNwUHlIcTMx
eHg1NlowK0dRRnNHdUJYMksyUnVFU0sKa1l0ZnFDZzYrbWVxQmtqOUZNOGtnWDhpT3UzMGhLdnVp
VExMSVJvOFE5UmhXTW9hS0RzOGlsNS85UXN4ZFpsMwpZeGUybzd3cmgyeWdoM1pzV1ZRUU8ycU9B
TGMvVUhiT3ZvOC9iL2ZzelpZaHc0WituS0R4OVQ1b2RTQjcvSVJmCmxaYTVKditxNGhmc2VwYzVH
bldWCj1ocTBwCi0tLS0tRU5EIFBHUCBTSUdOQVRVUkUtLS0tLQo=

--===============7121132617483186024==--

