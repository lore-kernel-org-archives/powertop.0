Content-Type: multipart/mixed; boundary="===============6170885827780018430=="
MIME-Version: 1.0
From: Sergey Senozhatsky <sergey.senozhatsky at gmail.com>
Subject: [Powertop] [PATCH] measurement: handle multiple batteries in
 global_time_left()
Date: Tue, 05 Feb 2013 12:17:16 +0300
Message-ID: <20130205091716.GA20948@swordfish.minsk.epam.com>
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============6170885827780018430==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

global_time_left() calculates total time left by summing up time_left()s of=
 each battery. =

usually only one battery is `active', thus others have rate close to 0.0 an=
d, as a result,
`cap / rate' reaching `INF+'.

accumulate total capacity and divide by total rate instead.

Signed-off-by: Sergey Senozhatsky <sergey.senozhatsky(a)gmail.com>

---

 src/measurement/measurement.cpp | 23 ++++++++++++++---------
 1 file changed, 14 insertions(+), 9 deletions(-)

diff --git a/src/measurement/measurement.cpp b/src/measurement/measurement.=
cpp
index 4a33db9..0b68940 100644
--- a/src/measurement/measurement.cpp
+++ b/src/measurement/measurement.cpp
@@ -57,7 +57,6 @@ double power_meter::joules_consumed(void)
 double power_meter::time_left(void)
 {
 	double cap, rate;
-	double left;
 =

 	cap =3D dev_capacity();
 	rate =3D joules_consumed();
@@ -65,12 +64,13 @@ double power_meter::time_left(void)
 	if (cap < 0.001)
 		return 0.0;
 =

-	left =3D cap / rate;
+	/* return 0.0 instead of INF+ */
+	if (rate < 0.001)
+		return 0.0;
 =

-	return left;
+	return cap / rate;
 }
 =

-
 vector<class power_meter *> power_meters;
 =

 void start_power_measurement(void)
@@ -101,12 +101,17 @@ double global_joules_consumed(void)
 =

 double global_time_left(void)
 {
-	double total =3D 0.0;
+	double total_capacity =3D 0.0;
+	double total_rate =3D 0.0;
 	unsigned int i;
-	for (i =3D 0; i < power_meters.size(); i++)
-		total +=3D power_meters[i]->time_left();
-
-	return total;
+	for (i =3D 0; i < power_meters.size(); i++) {
+		total_capacity +=3D power_meters[i]->dev_capacity();
+		total_rate +=3D power_meters[i]->joules_consumed();
+	}
+	/* return 0.0 instead of INF+ */
+	if (total_rate < 0.001)
+		return 0.0;
+	return total_capacity / total_rate;
 }
 =

 void sysfs_power_meters_callback(const char *d_name)


--===============6170885827780018430==--

