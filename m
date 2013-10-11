Content-Type: multipart/mixed; boundary="===============8520410136298624723=="
MIME-Version: 1.0
From: Sergey Senozhatsky <sergey.senozhatsky at gmail.com>
Subject: Re: [Powertop] [BUG] powertop shows estimates only for 1st battery
 from 2
Date: Fri, 11 Oct 2013 12:17:35 +0300
Message-ID: <20131011091735.GC2781@swordfish.minsk.epam.com>
In-Reply-To: CAGbmdnUmtnXqpw6JaZpkJEf_TZ_OrVdHZ=PL4sLXpphqczvL3A@mail.gmail.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============8520410136298624723==
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

v2. fix joules consumed reporting (didn't notice this in v1).

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


--===============8520410136298624723==--

