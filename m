Content-Type: multipart/mixed; boundary="===============7227388449556376934=="
MIME-Version: 1.0
From: Michael Mullin <masmullin at hush.com>
Subject: Re: [Powertop] Powertop crashes with 'powertop --auto-tune'
Date: Thu, 22 Jan 2015 16:50:10 -0500
Message-ID: <7af62d87104ff4decf61d783207ba917@smtp.hushmail.com>
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============7227388449556376934==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Please see the following patch to address the reported crash
- ---
- From e994a414f619410877023fce35ade12d1cfce68d Mon Sep 17 00:00:00 2001
From: Michael Mullin <masmullin(a)hush.com>
Date: Thu, 22 Jan 2015 16:33:31 -0500
Subject: [PATCH] If "dir" is closed early inside create_add_devfreq_devices=
()
 then there is a potential double free due to a second close during the
 cleanup phase in clear_all_devfreq()

Signed-off-by: Michael Mullin <masmullin(a)hush.com>

- ---
 src/devices/devfreq.cpp | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/src/devices/devfreq.cpp b/src/devices/devfreq.cpp
index d2e56e3..f652a57 100644
- --- a/src/devices/devfreq.cpp
+++ b/src/devices/devfreq.cpp
@@ -247,6 +247,7 @@ void create_all_devfreq_devices(void)
 		fprintf(stderr, "Devfreq not enabled\n");
 		is_enabled =3D false;
 		closedir(dir);
+		dir =3D NULL;
 		return;
 	}

@@ -327,6 +328,8 @@ void clear_all_devfreq()
 	}
 	all_devfreq.clear();
 	/* close /sys/class/devfreq */
- -	if (dir !=3D NULL)
+	if (dir !=3D NULL) {
 		closedir(dir);
+		dir =3D NULL;
+	}
 }
- -- =

2.2.2


-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJUwXCLAAoJEJHz7fmWOTHsR2YH/3ASltE3MVMu7V6HoKYvGHFL
VsjQNenXTEYLSSiVMZfbZHaypHnH8SdhfJTBMHF1+v2fS2LzuEA/qFfleS39+L9S
E/EZGdCWXnrK56pa+Lu6JWguwCNmyhNyOQ+nnaU6v9jH0YmQGx5hMPZu/aPhlZTU
LWHxj0Knch1WGUATlofOy98XCbhY9yDICQxMDfJicun6cOAahlQminqJcLTSyGbY
t5lVWR2E1ybnpojlot8t2BRmCYR210VmB+Pbpralk+nSRtX2rx4yT/Hx5B3wBbwJ
msNs+6+6WKG20EVhxxbTSqLAar9ZMf8w+K8Qsz8Zqg4yzaGra3u6kl80Wr/ElqA=3D
=3DObTH
-----END PGP SIGNATURE-----


--===============7227388449556376934==--

