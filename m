Content-Type: multipart/mixed; boundary="===============2969238177385127019=="
MIME-Version: 1.0
From: Sergey Senozhatsky <sergey.senozhatsky at gmail.com>
Subject: Re: [Powertop] [BUG] powertop shows estimates only for 1st battery
 from 2
Date: Sat, 12 Oct 2013 15:14:21 +0300
Message-ID: <20131012121421.GB2238@swordfish.minsk.epam.com>
In-Reply-To: CAGbmdnUmtnXqpw6JaZpkJEf_TZ_OrVdHZ=PL4sLXpphqczvL3A@mail.gmail.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============2969238177385127019==
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

and here is one for baseline power
--------8<---------8<---------

devices: report correct system baseline power

Reported-by: Maksim Melnikau <maxposedon(a)gmail.com>
Signed-off-by: Sergey Senozhatsky <sergey.senozhatsky(a)gmail.com>

---

 src/devices/device.cpp        |  4 ++--
 src/main.cpp                  |  2 --
 src/parameters/parameters.cpp |  2 --
 src/process/do_process.cpp    | 14 --------------
 4 files changed, 2 insertions(+), 20 deletions(-)

diff --git a/src/devices/device.cpp b/src/devices/device.cpp
index 00ec5e6..89add8d 100644
--- a/src/devices/device.cpp
+++ b/src/devices/device.cpp
@@ -175,7 +175,7 @@ void report_devices(void)
 	if (show_power) {
 		char buf[32];
 		wprintw(win, _("System baseline power is estimated at %sW\n"),
-				fmt_prefix(get_parameter_value("base power"), buf));
+				fmt_prefix(compute_bundle(), buf));
 	}
 =

 	if (pw > 0.0001 || show_power)
@@ -240,7 +240,7 @@ void show_report_devices(void)
 =

 		report.begin_paragraph();
 		report.addf("System baseline power is estimated at %sW",
-			    fmt_prefix(get_parameter_value("base power"), buf));
+			    fmt_prefix(compute_bundle(), buf));
 	}
 =

 	report.begin_table(TABLE_WIDE);
diff --git a/src/main.cpp b/src/main.cpp
index 4e34ee6..043eb7d 100644
--- a/src/main.cpp
+++ b/src/main.cpp
@@ -225,8 +225,6 @@ void one_measurement(int seconds, char *workload)
 	end_process_data();
 =

 	global_joules_consumed();
-	compute_bundle();
-
 	show_report_devices();
 	report_show_open_devices();
 =

diff --git a/src/parameters/parameters.cpp b/src/parameters/parameters.cpp
index 936d789..1b8cb38 100644
--- a/src/parameters/parameters.cpp
+++ b/src/parameters/parameters.cpp
@@ -176,8 +176,6 @@ void report_utilization(int index, double value, struct=
 result_bundle *bundle)
 	set_result_value(index, value, bundle);
 }
 =

-
-
 double compute_bundle(struct parameter_bundle *parameters, struct result_b=
undle *results)
 {
 	double power =3D 0;
diff --git a/src/process/do_process.cpp b/src/process/do_process.cpp
index d81a2a9..d81d27c 100644
--- a/src/process/do_process.cpp
+++ b/src/process/do_process.cpp
@@ -802,22 +802,8 @@ void process_update_display(void)
 		return;
 =

 	wclear(win);
-
 	wmove(win, 1,0);
 =

-#if 0
-	double sum;
-	calculate_params();
-	sum =3D 0.0;
-	sum +=3D get_parameter_value("base power");
-	for (i =3D 0; i < all_power.size(); i++) {
-		sum +=3D all_power[i]->Witts();
-	}
-
-	wprintw(win, _("Estimated power: %5.1f    Measured power: %5.1f    Sum: %=
5.1f\n\n"),
-				all_parameters.guessed_power, global_joules_consumed(), sum);
-#endif
-
 	pw =3D global_joules_consumed();
 	tl =3D global_time_left() / 60;
 	tlt =3D (tl /60);


--===============2969238177385127019==--

