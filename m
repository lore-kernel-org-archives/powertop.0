Content-Type: multipart/mixed; boundary="===============2811062037160080411=="
MIME-Version: 1.0
From: Sergey Senozhatsky <sergey.senozhatsky at gmail.com>
Subject: [Powertop] [PATCH 05/10] power_meter: introduce discharging member
 measurement: report total global_time_left()
Date: Mon, 14 Oct 2013 11:40:52 +0300
Message-ID: <1381740057-12499-6-git-send-email-sergey.senozhatsky@gmail.com>
In-Reply-To: 1381740057-12499-1-git-send-email-sergey.senozhatsky@gmail.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============2811062037160080411==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

report total capacity and discahrge rate if at least one power_meter
reports that is's discharging. previously we reported only discharging
power_meters, thus user was not aware of total time left in case of
N batteries. this is the reason why power_meter discharging member
(with getter and setter one-liners were introduced) -- we need
capacity and rate for every power_meter, regardless the fact whether
its /sys/class/power_supply/*/status reports "Discharging" or not.
report total "The battery discharge rate" and "The estimated remaining
time" back to user when at least one power_meter is discharging.

Reported-and-tested-by: Maksim Melnikau <maxposedon(a)gmail.com>
Signed-off-by: Sergey Senozhatsky <sergey.senozhatsky(a)gmail.com>
---
 src/measurement/measurement.cpp | 32 ++++++++++++++------------------
 src/measurement/measurement.h   | 24 +++++++++++++++++-------
 src/measurement/sysfs.cpp       |  7 ++++---
 3 files changed, 35 insertions(+), 28 deletions(-)

diff --git a/src/measurement/measurement.cpp b/src/measurement/measurement.=
cpp
index 0b68940..8b63eb3 100644
--- a/src/measurement/measurement.cpp
+++ b/src/measurement/measurement.cpp
@@ -54,23 +54,6 @@ double power_meter::joules_consumed(void)
 	return 0.0;
 }
 =

-double power_meter::time_left(void)
-{
-	double cap, rate;
-
-	cap =3D dev_capacity();
-	rate =3D joules_consumed();
-
-	if (cap < 0.001)
-		return 0.0;
-
-	/* return 0.0 instead of INF+ */
-	if (rate < 0.001)
-		return 0.0;
-
-	return cap / rate;
-}
-
 vector<class power_meter *> power_meters;
 =

 void start_power_measurement(void)
@@ -88,10 +71,17 @@ void end_power_measurement(void)
 =

 double global_joules_consumed(void)
 {
+	bool global_discharging =3D false;
 	double total =3D 0.0;
 	unsigned int i;
-	for (i =3D 0; i < power_meters.size(); i++)
+
+	for (i =3D 0; i < power_meters.size(); i++) {
+		global_discharging |=3D power_meters[i]->is_discharging();
 		total +=3D power_meters[i]->joules_consumed();
+	}
+	/* report global time left if at least one battery is discharging */
+	if (!global_discharging)
+		return 0.0;
 =

 	all_results.power =3D total;
 	if (total < min_power && total > 0.01)
@@ -101,13 +91,19 @@ double global_joules_consumed(void)
 =

 double global_time_left(void)
 {
+	bool global_discharging =3D false;
 	double total_capacity =3D 0.0;
 	double total_rate =3D 0.0;
 	unsigned int i;
 	for (i =3D 0; i < power_meters.size(); i++) {
+		global_discharging |=3D power_meters[i]->is_discharging();
 		total_capacity +=3D power_meters[i]->dev_capacity();
 		total_rate +=3D power_meters[i]->joules_consumed();
 	}
+	/* report global time left if at least one battery is discharging */
+	if (!global_discharging)
+		return 0.0;
+
 	/* return 0.0 instead of INF+ */
 	if (total_rate < 0.001)
 		return 0.0;
diff --git a/src/measurement/measurement.h b/src/measurement/measurement.h
index 5bcd8e2..83ffc34 100644
--- a/src/measurement/measurement.h
+++ b/src/measurement/measurement.h
@@ -30,18 +30,29 @@
 using namespace std;
 =

 class power_meter {
+	bool discharging;
 public:
+	virtual ~power_meter() {};
+
 	virtual void start_measurement(void);
 	virtual void end_measurement(void);
-
 	virtual double joules_consumed(void);
-	virtual double dev_capacity(void) { return 0.0;};  /* in Joules */
 =

-	virtual double time_left(void);
+	virtual double dev_capacity(void)
+	{
+		return 0.0; /* in Joules */
+	}
 =

-	virtual ~power_meter() {};
-};
+	virtual void set_discharging(bool d)
+	{
+		discharging =3D d;
+	}
 =

+	virtual bool is_discharging()
+	{
+		return discharging;
+	}
+};
 =

 extern vector<class power_meter *> power_meters;
 =

@@ -53,7 +64,6 @@ extern double global_time_left(void);
 extern void detect_power_meters(void);
 extern void extech_power_meter(const char *devnode);
 =

-
 extern double min_power;
 =

-#endif
\ No newline at end of file
+#endif
diff --git a/src/measurement/sysfs.cpp b/src/measurement/sysfs.cpp
index 66cb1cd..ed42ed4 100644
--- a/src/measurement/sysfs.cpp
+++ b/src/measurement/sysfs.cpp
@@ -126,11 +126,13 @@ void sysfs_power_meter::measure()
 =

 	rate =3D 0.0;
 	capacity =3D 0.0;
+	this->set_discharging(false);
 =

 	if (!is_present())
 		return;
-	if (read_sysfs_string("/sys/class/power_supply/%s/status", name) !=3D "Di=
scharging")
-		return;
+	/** do not jump over. we may have discharging battery */
+	if (read_sysfs_string("/sys/class/power_supply/%s/status", name) =3D=3D "=
Discharging")
+		this->set_discharging(true);
 =

 	got_rate =3D set_rate_from_power();
 	got_capacity =3D set_capacity_from_energy();
@@ -146,7 +148,6 @@ void sysfs_power_meter::measure()
 	}
 }
 =

-
 void sysfs_power_meter::end_measurement(void)
 {
 	measure();
-- =

1.8.4.679.g0a1a803


--===============2811062037160080411==--

