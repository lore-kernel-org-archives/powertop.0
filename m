Content-Type: multipart/mixed; boundary="===============5435235129905598132=="
MIME-Version: 1.0
From: Joe Konno <joe.konno at linux.intel.com>
Subject: Re: [Powertop] Some settings can not be set back from "Good" to "Bad"
Date: Tue, 26 Apr 2016 13:13:54 -0700
Message-ID: <20160426201354.GA19746@jbkonno-anise.jf.intel.com>
In-Reply-To: 1794735.5a5bPLbTgx@tacticalops
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============5435235129905598132==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Martin,

It is possible-- it's just a matter of time and scarcity thereof (in
my case, anyway). If you'd like to file a bug report (doesn't have to be
elaborate), we could see how the community may be able to help:

https://app.devzing.com/powertopbugs/bugzilla

Cheers, hth

On Sun, Apr 24, 2016 at 12:33:59AM +0200, Martin Walch wrote:
> Hi,
> =

> it is possible to toggle some settings like "Enable Audio codec power =

> management" from "Bad" to "Good" and back again. However, when exiting =

> powertop while it is set to "Good", and then re-running powertop, the val=
ue is =

> stuck at "Good", i.e. it is not possible to toggle it to "Bad". When tryi=
ng to =

> do so, the status line only shows ">> (null)" instead of something like "=
echo =

> '' > '/sys/module/snd_hda_intel/parameters/power_save';".
> =

> This is probably because sysfs_tunable::bad_value is initialized with "\0=
" and =

> does not change its value if it is already set to "Good" when starting up =

> powertop. When now calling sysfs_tunable::toggle(void), strlen(bad_value)=
 is 0 =

> and the write_sysfs line is not executed.
> =

> Is it possible to fix this?
> =

> Regards,
> Martin Walch
> -- =

> =

> _______________________________________________
> PowerTop mailing list
> PowerTop(a)lists.01.org
> https://lists.01.org/mailman/listinfo/powertop

--===============5435235129905598132==
Content-Type: application/pgp-signature
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="signature.asc"

LS0tLS1CRUdJTiBQR1AgU0lHTkFUVVJFLS0tLS0KVmVyc2lvbjogR251UEcgdjIKCmlRSWNCQUVC
Q0FBR0JRSlhIOHY3QUFvSkVJMklSOVV2U3FwbW5Oa1AvMkxzeWUzdy9zam0wYnhYeGVqV3N1eHAK
WkUwanVBaEJ4TEozdzJ2VGxSb243RkdVYmVnRzhnNTBvSlpJTk53V2VTZ0lXOUJIVENoc1k1OU1X
L2c3VndlRQpxTk51M1dVUDd1YnZDdXkzUjlORTMzbHZlV2wxV0xkNk1vWis0U3hSV3JNQjZyWEtJ
c3JWOWZvdEtpbHNxajBpCm5kU0lXUVBhbWlnWWRzOUNnVktrQXEyS0pDWXQ3Q3ZGVDhYNEJiR2tB
bWdZSFZmTWhkTnlTWGFtN2sydmMzMjMKa3hWWGoyZGp6VXNJaEhnVHVueS9sYzk5ajFhSDFEemtX
dittR0NxUGlDSWVJRTcwcnd0eXd3Ri85TjN6eUF1ZwpYVC9aVHVwZ3hJZVZGeFpHVWluWW52SjhV
TmxuWG5sZGU3U1BSZEFSb1VCN1YwbDJ5OE5tRy9sakdWWEp2VnRGClhTL253S2hQbUlYcmU1NWdT
SXhnTDdCeHVndE1OYWxkZlpRRW1KWXlaeUF0cVpEOFJBc1lLSlU5d1ppQWx6cWoKaHBxRGpreVkw
dDIxR3N5Z0ZiRExZL05aWHpkY3R5d1NkYUY0Qk13MEJPMU9ZM2w3WHBQcDh5QXVDeHBxZTNnZgpk
SFI1ZGpPcTFnU2lqZlNYc0pvT3QybkRmUk5sZW12UUxOMy9CSkVQcHJ5eGdaS1NtcStCRlU4N09E
ckZQWTBFCmhNM2s0cGZxSUkyc3N5WUFMLzVHQUxVbTY4T0p3a3pJQk1IcCtDWS9vNkNNdkpDY3pJ
bUEySmZSZkwveEp2SUcKMjBjcE00MHh3NWFURm9ZK2t0T1dWdTYrblM0aTRTVkc0SFJ6YlY3R1NK
RWQ3Yml3RnovY0t2SVV5WjhnQjhCeQpDMk5Ganpac2l4NXBHYUlsQ1NoMAo9VXJBMwotLS0tLUVO
RCBQR1AgU0lHTkFUVVJFLS0tLS0K

--===============5435235129905598132==--

