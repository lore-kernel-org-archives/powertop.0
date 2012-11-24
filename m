Content-Type: multipart/mixed; boundary="===============7538441208586026629=="
MIME-Version: 1.0
From: Sergey Senozhatsky <sergey.senozhatsky at gmail.com>
Subject: Re: [Powertop] Multiple Batteries
Date: Sat, 24 Nov 2012 17:41:21 +0300
Message-ID: <20121124144120.GC7100@swordfish>
In-Reply-To: CAKZK7uy6QP7xHvUpbhzz-Yh+SK2rBdzVNDcsBTgHG+=eiqGp4w@mail.gmail.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============7538441208586026629==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On (11/23/12 22:55), Justin Brown wrote:
>    Hello,
>    I'm using Powertop 2.1, and I've noticed a somewhat minor bug. (I coul=
dn't
>    find a public bug tracker, but would be more than happy to move this
>    discussion to one if someone could send me a URL.)
>    I have two batteries in my laptop, but Powertop does not recognize both
>    when calculating battery life remaining. For example Gnome-Shell repor=
ts
>    that my batteries are at 66% and 100% (85% combined) giving me 10 hours
>    and 11 minutes of estimated time remaining. On the other hand, Powertop
>    reports just 3 hours 17 =EF=BF=BDminutes of time. Both programs are re=
porting the
>    proper discharge rate. It just seems like Powertop is only using my
>    smaller battery (the currently active one).
>    I'm not sure if this issue has been reported, or if the developers even
>    have equipment with which to test. I'm more than willing to provide any
>    sort of debugging output or testing as needed. I could also probably
>    create a patch, but that's likely to take a lot longer for me to get s=
etup
>    with development on this project.=EF=BF=BD
>    It may be as simple as iterating over a directory in /sys/ or /proc to
>    gather stats on multiple batteries. An experienced dev might be able to
>    fix it quickly.
>    Cheers,
>    Justin


after a cup of coffee,
please ignore previous patch. let's start with this one.


Signed-off-by: Sergey Senozhatsky <sergey.senozhatsky(a)gmail.com>

---

 src/measurement/measurement.cpp | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/src/measurement/measurement.cpp b/src/measurement/measurement.=
cpp
index 4a33db9..dcb9b65 100644
--- a/src/measurement/measurement.cpp
+++ b/src/measurement/measurement.cpp
@@ -65,12 +65,13 @@ double power_meter::time_left(void)
 	if (cap < 0.001)
 		return 0.0;
 =

-	left =3D cap / rate;
+	if (rate < 0.001)
+		rate =3D 1.0;
 =

+	left =3D cap / rate;
 	return left;
 }
 =

-
 vector<class power_meter *> power_meters;
 =

 void start_power_measurement(void)
@@ -101,12 +102,18 @@ double global_joules_consumed(void)
 =

 double global_time_left(void)
 {
-	double total =3D 0.0;
+	double total_capacity =3D 0.0;
+	double total_rate =3D 0.0;
 	unsigned int i;
-	for (i =3D 0; i < power_meters.size(); i++)
-		total +=3D power_meters[i]->time_left();
+	for (i =3D 0; i < power_meters.size(); i++) {
+		total_capacity +=3D power_meters[i]->dev_capacity();
+		total_rate +=3D power_meters[i]->joules_consumed();
+	}
 =

-	return total;
+	if (total_rate < 0.001)
+		total_rate =3D 1.0;
+
+	return total_capacity/total_rate;
 }
 =

 void sysfs_power_meters_callback(const char *d_name)


--===============7538441208586026629==--

