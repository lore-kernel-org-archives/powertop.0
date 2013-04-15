Content-Type: multipart/mixed; boundary="===============8596351631886255407=="
MIME-Version: 1.0
From: Srinivas Pandruvada <srinivas.pandruvada at linux.intel.com>
Subject: [Powertop] [PATCH 4/8] cpu device as parent class
Date: Mon, 15 Apr 2013 09:09:25 -0700
Message-ID: <1366042169-14523-5-git-send-email-srinivas.pandruvada@linux.intel.com>
In-Reply-To: 1366042169-14523-1-git-send-email-srinivas.pandruvada@linux.intel.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============8596351631886255407==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Added members and methods so that it can have children. Other cpu type
device can inherit and overide functionality.
If there are children, the power_usage method will not include the
power reported by children, as they will be reporting as its own device.

Signed-off-by: Srinivas Pandruvada <srinivas.pandruvada(a)linux.intel.com>
---
 src/cpu/cpudevice.cpp | 14 ++++++++++++++
 src/cpu/cpudevice.h   |  6 +++++-
 2 files changed, 19 insertions(+), 1 deletion(-)

diff --git a/src/cpu/cpudevice.cpp b/src/cpu/cpudevice.cpp
index 48fbcf5..371d8a8 100644
--- a/src/cpu/cpudevice.cpp
+++ b/src/cpu/cpudevice.cpp
@@ -40,12 +40,20 @@ cpudevice::cpudevice(const char *classname, const char =
*dev_name, class abstract
 	r_consumption_index =3D get_result_index("cpu-consumption");;
 }
 =

+const char * cpudevice::device_name(void)
+{
+	if (child_devices.size())
+		return "CPU misc";
+	else
+		return "CPU use";
+}
 =

 double cpudevice::power_usage(struct result_bundle *result, struct paramet=
er_bundle *bundle)
 {
 	double power;
 	double factor;
 	double _utilization;
+	double child_power;
 =

 	power =3D 0;
 	factor =3D get_parameter_value(wake_index, bundle);
@@ -58,6 +66,12 @@ double cpudevice::power_usage(struct result_bundle *resu=
lt, struct parameter_bun
 =

 	power +=3D _utilization * factor;
 =

+	for (unsigned int i =3D 0; i < child_devices.size(); ++i) {
+		child_power =3D child_devices[i]->power_usage(result, bundle);
+		if ((power - child_power) > 0.0)
+			power -=3D child_power;
+	}
+
 	return power;
 }
 =

diff --git a/src/cpu/cpudevice.h b/src/cpu/cpudevice.h
index 6a5636f..841a101 100644
--- a/src/cpu/cpudevice.h
+++ b/src/cpu/cpudevice.h
@@ -34,6 +34,7 @@ using namespace std;
 #include "cpu.h"
 =

 class cpudevice: public device {
+protected:
 	char _class[128];
 	char _cpuname[128];
 =

@@ -44,15 +45,18 @@ class cpudevice: public device {
 	int r_wake_index;
 	int r_consumption_index;
 =

+	vector<device *>child_devices;
+
 public:
 	cpudevice(const char *classname =3D "cpu", const char *device_name =3D "c=
pu0", class abstract_cpu *_cpu =3D NULL);
 	virtual const char * class_name(void) { return _class;};
 =

-	virtual const char * device_name(void) {return "CPU use";};
+	virtual const char * device_name(void);
 =

 	virtual double power_usage(struct result_bundle *result, struct parameter=
_bundle *bundle);
 	virtual bool show_in_list(void) {return false;};
 	virtual double	utilization(void); /* percentage */
+	void add_child(device *dev_ptr) { child_devices.push_back(dev_ptr);}
 };
 =

 =

-- =

1.7.11.7


--===============8596351631886255407==--

