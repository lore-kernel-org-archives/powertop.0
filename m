Content-Type: multipart/mixed; boundary="===============4348838341269942810=="
MIME-Version: 1.0
From: Sergey Senozhatsky <sergey.senozhatsky at gmail.com>
Subject: [Powertop] [PATCH 06/10] power_supply: delete unused power_supply
 class
Date: Mon, 14 Oct 2013 11:40:53 +0300
Message-ID: <1381740057-12499-7-git-send-email-sergey.senozhatsky@gmail.com>
In-Reply-To: 1381740057-12499-1-git-send-email-sergey.senozhatsky@gmail.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============4348838341269942810==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

we use sysfs_power_meter or acpi_power_meter.

Signed-off-by: Sergey Senozhatsky <sergey.senozhatsky(a)gmail.com>
---
 Android.mk                       |   2 +-
 src/Makefile.am                  |   4 +-
 src/measurement/measurement.cpp  |  30 -------
 src/measurement/power_supply.cpp | 190 -----------------------------------=
----
 src/measurement/power_supply.h   |  46 ----------
 5 files changed, 3 insertions(+), 269 deletions(-)
 delete mode 100644 src/measurement/power_supply.cpp
 delete mode 100644 src/measurement/power_supply.h

diff --git a/Android.mk b/Android.mk
index a52ecfd..ec47c4b 100644
--- a/Android.mk
+++ b/Android.mk
@@ -34,7 +34,7 @@ LOCAL_SRC_FILES +=3D \
 	src/measurement/measurement.cpp \
 	src/measurement/acpi.cpp \
 	src/measurement/extech.cpp \
-	src/measurement/power_supply.cpp \
+	src/measurement/sysfs.cpp \
 	src/display.cpp \
 	src/report.cpp \
 	src/main.cpp \
diff --git a/src/Makefile.am b/src/Makefile.am
index 2fb1536..19950a1 100644
--- a/src/Makefile.am
+++ b/src/Makefile.am
@@ -24,9 +24,9 @@ powertop_SOURCES =3D parameters/persistent.cpp parameters=
/learn.cpp parameters/par
 		tuning/tunable.cpp tuning/nl80211.h tuning/iw.c tuning/wifi.cpp tuning/t=
uningsysfs.h \
 		tuning/tuningsysfs.cpp tuning/wifi.h tuning/runtime.cpp tuning/tunable.h=
 \
 		tuning/runtime.h tuning/tuningusb.h tuning/iw.h calibrate/calibrate.cpp \
-		calibrate/calibrate.h measurement/measurement.cpp measurement/power_supp=
ly.cpp \
+		calibrate/calibrate.h measurement/measurement.cpp \
 		measurement/measurement.h measurement/acpi.cpp measurement/sysfs.h measu=
rement/sysfs.cpp \
-		measurement/acpi.h measurement/extech.cpp measurement/power_supply.h mea=
surement/extech.h \
+		measurement/acpi.h measurement/extech.cpp measurement/extech.h \
 		report/report-maker.cpp report/report-maker.h report/report-formatter.h \
 		report/report-formatter-base.cpp report/report-formatter-base.h \
 		report/report-formatter-csv.cpp report/report-formatter-csv.h \
diff --git a/src/measurement/measurement.cpp b/src/measurement/measurement.=
cpp
index 8b63eb3..efbdc1e 100644
--- a/src/measurement/measurement.cpp
+++ b/src/measurement/measurement.cpp
@@ -25,7 +25,6 @@
 #include "measurement.h"
 #include "acpi.h"
 #include "extech.h"
-#include "power_supply.h"
 #include "sysfs.h"
 #include "../parameters/parameters.h"
 #include "../lib.h"
@@ -131,35 +130,6 @@ void acpi_power_meters_callback(const char *d_name)
 		power_meters.push_back(meter);
 }
 =

-void power_supply_callback(const char *d_name)
-{
-	char filename[4096];
-	char line[4096];
-	ifstream file;
-	bool discharging =3D false;
-
-	sprintf(filename, "/sys/class/power_supply/%s/uevent", d_name);
-	file.open(filename, ios::in);
-	if (!file)
-		return;
-
-	while (file) {
-		file.getline(line, 4096);
-
-		if (strstr(line, "POWER_SUPPLY_STATUS") && strstr(line, "Discharging"))
-		      discharging =3D true;
-	}
-	file.close();
-
-	if (!discharging)
-	    return;
-
-	class power_supply *power;
-	power =3D new(std::nothrow) class power_supply(d_name);
-	if (power)
-		power_meters.push_back(power);
-}
-
 void detect_power_meters(void)
 {
 	process_directory("/sys/class/power_supply", sysfs_power_meters_callback);
diff --git a/src/measurement/power_supply.cpp b/src/measurement/power_suppl=
y.cpp
deleted file mode 100644
index f514740..0000000
--- a/src/measurement/power_supply.cpp
+++ /dev/null
@@ -1,190 +0,0 @@
-/*
- * Copyright 2011, Intel Corporation
- *
- * This file is part of PowerTOP
- *
- * This program file is free software; you can redistribute it and/or modi=
fy it
- * under the terms of the GNU General Public License as published by the
- * Free Software Foundation; version 2 of the License.
- *
- * This program is distributed in the hope that it will be useful, but WIT=
HOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
- * for more details.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program in a file named COPYING; if not, write to the
- * Free Software Foundation, Inc,
- * 51 Franklin Street, Fifth Floor,
- * Boston, MA 02110-1301 USA
- * or just google for it.
- *
- * Authors:
- *	John Mathew <johnx.mathew(a)intel.com>
- */
-#include "measurement.h"
-#include "power_supply.h"
-#include <iostream>
-#include <fstream>
-#include <string.h>
-#include <stdio.h>
-#include <stdlib.h>
-
-using namespace std;
-
-power_supply::power_supply(const char *supply_name)
-{
-	rate =3D 0.0;
-	capacity =3D 0.0;
-	voltage =3D 0.0;
-	strncpy(battery_name, supply_name, sizeof(battery_name));
-}
-
-/*
-POWER_SUPPLY_NAME=3Dmsic-battery
-POWER_SUPPLY_STATUS=3DDischarging
-POWER_SUPPLY_HEALTH=3DCold
-POWER_SUPPLY_PRESENT=3D1
-POWER_SUPPLY_TECHNOLOGY=3DLi-ion
-POWER_SUPPLY_VOLTAGE_MAX_DESIGN=3D4200000
-POWER_SUPPLY_VOLTAGE_NOW=3D4119000
-POWER_SUPPLY_CURRENT_NOW=3D-290000
-POWER_SUPPLY_CHARGE_NOW=3D1503000
-POWER_SUPPLY_CHARGE_COUNTER=3D-254923
-POWER_SUPPLY_CHARGE_FULL_DESIGN=3D1500000
-POWER_SUPPLY_CHARGE_FULL=3D1500000
-POWER_SUPPLY_CHARGE_AVG=3D32762000
-POWER_SUPPLY_ENERGY_FULL=3D6300000
-POWER_SUPPLY_ENERGY_NOW=3D6235000
-POWER_SUPPLY_CAPACITY_LEVEL=3DFull
-POWER_SUPPLY_CAPACITY=3D100
-POWER_SUPPLY_TEMP=3D-340
-POWER_SUPPLY_MODEL_NAME=3DCDK0
-POWER_SUPPLY_MANUFACTURER=3DIN
-
-Quoting include/linux/power_supply.h:
-
-All voltages, currents, charges, energies, time and temperatures in =C2=B5=
V,
-=C2=B5A, =C2=B5Ah, =C2=B5Wh, seconds and tenths of degree Celsius unless o=
therwise
-stated. It's driver's job to convert its raw values to units in which
-this class operates.
-*/
-
-void power_supply::measure(void)
-{
-	char filename[4096];
-	char line[4096];
-	ifstream file;
-
-	double _power_rate =3D 0;
-	double _current_rate =3D 0;
-	double _capacity =3D 0;
-	double _voltage =3D 0;
-
-	rate =3D 0;
-	voltage =3D 0;
-	capacity =3D 0;
-
-	sprintf(filename, "/sys/class/power_supply/%s/uevent", battery_name);
-
-	file.open(filename, ios::in);
-	if (!file)
-		return;
-
-	while (file) {
-		char *c;
-		file.getline(line, 4096);
-
-		if (strstr(line, "PRESENT")) {
-			c =3D strchr(line, '=3D');
-			c++;
-			if(*c =3D=3D '0'){
-				printf ("Battery not present");
-				return;
-			}
-		}
-		if (strstr(line, "CURRENT_NOW")) {
-			c =3D strchr(line, '=3D');
-			c++;
-			if(*c =3D=3D '-') c++; // ignoring the negative sign
-			_current_rate =3D strtoull(c, NULL, 10);
-			if (c) {
-				//printf ("CURRENT: %f. \n",_current_rate);
-			} else {
-				_current_rate =3D 0;
-			}
-		}
-		if (strstr(line, "POWER_NOW")) {
-			c =3D strchr(line, '=3D');
-			c++;
-			_power_rate =3D strtoull(c, NULL, 10);
-			if (c) {
-				//printf ("POWER: %f. \n",_power_rate);
-			} else {
-				_power_rate =3D 0;
-			}
-		}
-		if (strstr(line, "CAPACITY=3D")) {
-			c =3D strchr(line, '=3D');
-			c++;
-			_capacity =3D strtoull(c, NULL, 10);
-			if (c) {
-				//printf ("CAPACITY: %f. \n",_capacity);
-			} else {
-				_capacity =3D 0;
-			}
-		}
-		if (strstr(line, "VOLTAGE_NOW")) {
-			c =3D strchr(line, '=3D');
-			c++;
-			while (*c =3D=3D ' ') c++;
-			_voltage =3D strtoull(c, NULL, 10);
-			if (c) {
-				//printf ("VOLTAGE_NOW: %f. \n",_voltage);
-			} else {
-				_voltage =3D 0;
-			}
-		}
-	}
-	file.close();
-
-	if(_voltage) {
-		_voltage =3D _voltage / 1000.0;
-		voltage =3D _voltage;
-	} else {
-		voltage =3D 0.0;
-	}
-
-	if(_power_rate)
-	{
-		rate =3D _power_rate / 1000000.0;
-	}
-	else if(_current_rate) {
-		_current_rate =3D _current_rate / 1000.0;
-		rate =3D _current_rate * _voltage;
-	} else {
-		rate =3D 0.0;
-	}
-
-	if(_capacity)
-		capacity =3D _capacity;
-	else
-		capacity =3D 0.0;
-}
-
-
-void power_supply::end_measurement(void)
-{
-	measure();
-}
-
-void power_supply::start_measurement(void)
-{
-	/* ACPI battery state is a lagging indication, lets only measure at the e=
nd */
-}
-
-
-double power_supply::joules_consumed(void)
-{
-	return rate;
-}
diff --git a/src/measurement/power_supply.h b/src/measurement/power_supply.h
deleted file mode 100644
index 5ad776e..0000000
--- a/src/measurement/power_supply.h
+++ /dev/null
@@ -1,46 +0,0 @@
-/*
- * Copyright 2011, Intel Corporation
- *
- * This file is part of PowerTOP
- *
- * This program file is free software; you can redistribute it and/or modi=
fy it
- * under the terms of the GNU General Public License as published by the
- * Free Software Foundation; version 2 of the License.
- *
- * This program is distributed in the hope that it will be useful, but WIT=
HOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
- * for more details.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program in a file named COPYING; if not, write to the
- * Free Software Foundation, Inc,
- * 51 Franklin Street, Fifth Floor,
- * Boston, MA 02110-1301 USA
- * or just google for it.
- *
- * Authors:
- *	John Mathew <johnx.mathew(a)intel.com>
- */
-#ifndef __INCLUDE_GUARD_POWER_SUPPLY_H
-#define __INCLUDE_GUARD_POWER_SUPPLY_H
-
-#include "measurement.h"
-
-class power_supply:public power_meter {
-	char battery_name[256];
-
-	double capacity;
-	double rate;
-	double voltage;
-	void measure(void);
-public:
-	power_supply(const char *_battery_name);
-	virtual void start_measurement(void);
-	virtual void end_measurement(void);
-
-	virtual double joules_consumed(void);
-	virtual double dev_capacity(void) { return capacity; };
-};
-
-#endif
-- =

1.8.4.679.g0a1a803


--===============4348838341269942810==--

