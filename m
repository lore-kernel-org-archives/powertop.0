Content-Type: multipart/mixed; boundary="===============3279807999715654539=="
MIME-Version: 1.0
From: Sergey Senozhatsky <sergey.senozhatsky at gmail.com>
Subject: Re: [Powertop] [BUG] powertop shows estimates only for 1st battery
 from 2
Date: Sat, 12 Oct 2013 17:14:59 +0300
Message-ID: <20131012141459.GC2238@swordfish.minsk.epam.com>
In-Reply-To: CAGbmdnUmtnXqpw6JaZpkJEf_TZ_OrVdHZ=PL4sLXpphqczvL3A@mail.gmail.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============3279807999715654539==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On (10/11/13 11:22), Maksim Melnikau wrote:
> # powertop, Overview page, when first battery discharged
> The battery reports a discharge rate of 7.54 W
> The estimated remaining time is 5 hours, 28 minutes
> =

> So, from the beginning I'm expecting to see not 2.5h estimate, and
> later 5.5h. But smth like 8h from the beginning.

v2: after some thinking, better to fix parameters.


parameters: report correct "base power" parameter

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



--===============3279807999715654539==--

