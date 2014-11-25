Content-Type: multipart/mixed; boundary="===============4390471060650084505=="
MIME-Version: 1.0
From: Sami Kerola <kerolasa at iki.fi>
Subject: [Powertop] [PATCH v3 09/15] move variables to protected scope
Date: Tue, 25 Nov 2014 21:16:22 +0000
Message-ID: <1416950188-16616-10-git-send-email-kerolasa@iki.fi>
In-Reply-To: 1416950188-16616-1-git-send-email-kerolasa@iki.fi
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============4390471060650084505==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

This fixes series of issues reported by clang++ compiler the same way.

cpu/rapl/rapl_interface.h:37:6: error: private field
'measurment_interval' is not used [-Werror,-Wunused-private-field]
        int measurment_interval;

The measurment_interval() in relation to first_cpu() is moved to avoid
following compiler warning.

make[3]: Entering directory '/home/src/powertop/src'
  CXX      cpu/rapl/powertop-rapl_interface.o
cpu/rapl/rapl_interface.cpp:78:2: warning: field 'measurment_interval' will=
 be initialized after field 'first_cpu' [-Wreorder]
        measurment_interval(def_sampling_interval),

Signed-off-by: Sami Kerola <kerolasa(a)iki.fi>
---
 src/cpu/rapl/rapl_interface.cpp | 2 +-
 src/cpu/rapl/rapl_interface.h   | 9 +++++----
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/src/cpu/rapl/rapl_interface.cpp b/src/cpu/rapl/rapl_interface.=
cpp
index ab8e8ce..2fc55b1 100644
--- a/src/cpu/rapl/rapl_interface.cpp
+++ b/src/cpu/rapl/rapl_interface.cpp
@@ -75,8 +75,8 @@ c_rapl_interface::c_rapl_interface(const char *dev_name, =
int cpu) :
 	powercap_core_path(),
 	powercap_uncore_path(),
 	powercap_dram_path(),
-	measurment_interval(def_sampling_interval),
 	first_cpu(cpu),
+	measurment_interval(def_sampling_interval),
 	last_pkg_energy_status(0.0),
 	last_dram_energy_status(0.0),
 	last_pp0_energy_status(0.0),
diff --git a/src/cpu/rapl/rapl_interface.h b/src/cpu/rapl/rapl_interface.h
index 744f595..c8e9683 100644
--- a/src/cpu/rapl/rapl_interface.h
+++ b/src/cpu/rapl/rapl_interface.h
@@ -34,21 +34,22 @@ private:
 	string powercap_dram_path;
 =

 	unsigned char rapl_domains;
-	int measurment_interval;
 	int first_cpu;
 =

 	double power_units;
 	double energy_status_units;
 	double time_units;
 =

+	int read_msr(int cpu, unsigned int idx, uint64_t *val);
+	int write_msr(int cpu, unsigned int idx, uint64_t val);
+
+protected:
+	int measurment_interval;
 	double last_pkg_energy_status;
 	double last_dram_energy_status;
 	double last_pp0_energy_status;
 	double last_pp1_energy_status;
 =

-	int read_msr(int cpu, unsigned int idx, uint64_t *val);
-	int write_msr(int cpu, unsigned int idx, uint64_t val);
-
 public:
 	c_rapl_interface(const char *dev_name =3D "package-0", int cpu =3D 0);
 =

-- =

2.1.3


--===============4390471060650084505==--

