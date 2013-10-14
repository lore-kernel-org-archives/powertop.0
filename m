Content-Type: multipart/mixed; boundary="===============4306739040207042890=="
MIME-Version: 1.0
From: Sergey Senozhatsky <sergey.senozhatsky at gmail.com>
Subject: [Powertop] [PATCH 07/10] parameters: report correct "base power"
 parameter
Date: Mon, 14 Oct 2013 11:40:54 +0300
Message-ID: <1381740057-12499-8-git-send-email-sergey.senozhatsky@gmail.com>
In-Reply-To: 1381740057-12499-1-git-send-email-sergey.senozhatsky@gmail.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============4306739040207042890==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Reported-by: Maksim Melnikau <maxposedon(a)gmail.com>
Signed-off-by: Sergey Senozhatsky <sergey.senozhatsky(a)gmail.com>
---
 src/parameters/parameters.cpp | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/src/parameters/parameters.cpp b/src/parameters/parameters.cpp
index 936d789..8ffda16 100644
--- a/src/parameters/parameters.cpp
+++ b/src/parameters/parameters.cpp
@@ -188,18 +188,14 @@ double compute_bundle(struct parameter_bundle *parame=
ters, struct result_bundle
 	if (!bpi)
 		bpi =3D get_param_index("base power");
 =

-	power =3D parameters->parameters[bpi];
-
-	for (i =3D 0; i < all_devices.size(); i++) {
-
+	for (i =3D 0; i < all_devices.size(); i++)
 		power +=3D all_devices[i]->power_usage(results, parameters);
-	}
-//	printf("result power is %6.2f  guessed is %6.2f\n", results->power, pow=
er);
+
 	parameters->actual_power =3D results->power;
 	parameters->guessed_power =3D power;
 	/* scale the squared error by the actual power so that non-idle data poin=
ts weigh heavier */
 	parameters->score +=3D results->power * (power - results->power) * (power=
 - results->power);
-
+	parameters->parameters[bpi] =3D power;
 	return power;
 }
 =

-- =

1.8.4.679.g0a1a803


--===============4306739040207042890==--

