Content-Type: multipart/mixed; boundary="===============7650672188864184307=="
MIME-Version: 1.0
From: Rajagopal Venkat <rajagopal.venkat at linaro.org>
Subject: [Powertop] [PATCH v1] Allow frequency stats when cpuidle is not
 enabled
Date: Tue, 04 Dec 2012 11:37:31 +0530
Message-ID: <1354601251-5722-1-git-send-email-rajagopal.venkat@linaro.org>
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============7650672188864184307==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Powertop fails to display frequency stats when cpuidle subsystem
is not enabled. Fix it.

Signed-off-by: Rajagopal Venkat <rajagopal.venkat(a)linaro.org>
---
 src/cpu/cpu.h         |  7 ++++++-
 src/cpu/cpu_linux.cpp | 36 +++++++++++++++++++++++++++---------
 2 files changed, 33 insertions(+), 10 deletions(-)

diff --git a/src/cpu/cpu.h b/src/cpu/cpu.h
index 4480b11..781e33c 100644
--- a/src/cpu/cpu.h
+++ b/src/cpu/cpu.h
@@ -159,7 +159,12 @@ extern vector<class abstract_cpu *> all_cpus;
 class cpu_linux: public abstract_cpu
 {
 =

-	void		account_freq(uint64_t frequency, uint64_t duration);
+	void	account_freq(uint64_t frequency, uint64_t duration);
+	void 	parse_pstates_start(void);
+	void 	parse_cstates_start(void);
+	void 	parse_pstates_end(void);
+	void 	parse_cstates_end(void);
+
 public:
 	virtual void	measurement_start(void);
 	virtual void	measurement_end(void);
diff --git a/src/cpu/cpu_linux.cpp b/src/cpu/cpu_linux.cpp
index d6caf45..e7a3d37 100644
--- a/src/cpu/cpu_linux.cpp
+++ b/src/cpu/cpu_linux.cpp
@@ -47,17 +47,13 @@ static int is_turbo(uint64_t freq, uint64_t max, uint64=
_t maxmo)
 	return 1;
 }
 =

-void cpu_linux::measurement_start(void)
+void cpu_linux::parse_cstates_start(void)
 {
 	ifstream file;
-
 	DIR *dir;
 	struct dirent *entry;
 	char filename[256];
 	int len;
-	unsigned int i;
-
-	abstract_cpu::measurement_start();
 =

 	len =3D sprintf(filename, "/sys/devices/system/cpu/cpu%i/cpuidle", number=
);
 =

@@ -111,9 +107,16 @@ void cpu_linux::measurement_start(void)
 =

 	}
 	closedir(dir);
+}
 =

-	last_stamp =3D 0;
 =

+void cpu_linux::parse_pstates_start(void)
+{
+	ifstream file;
+	char filename[256];
+	unsigned int i;
+
+	last_stamp =3D 0;
 	for (i =3D 0; i < children.size(); i++)
 		if (children[i])
 			children[i]->wiggle();
@@ -136,8 +139,14 @@ void cpu_linux::measurement_start(void)
 	account_freq(0, 0);
 }
 =

+void cpu_linux::measurement_start(void)
+{
+	abstract_cpu::measurement_start();
+	parse_cstates_start();
+	parse_pstates_start();
+}
 =

-void cpu_linux::measurement_end(void)
+void cpu_linux::parse_cstates_end(void)
 {
 	DIR *dir;
 	struct dirent *entry;
@@ -187,6 +196,12 @@ void cpu_linux::measurement_end(void)
 =

 	}
 	closedir(dir);
+}
+
+void cpu_linux::parse_pstates_end(void)
+{
+	char filename[256];
+	ifstream file;
 =

 	sprintf(filename, "/sys/devices/system/cpu/cpu%i/cpufreq/stats/time_in_st=
ate", number);
 =

@@ -216,12 +231,15 @@ void cpu_linux::measurement_end(void)
 		}
 		file.close();
 	}
+}
 =

-
+void cpu_linux::measurement_end(void)
+{
+	parse_cstates_end();
+	parse_pstates_end();
 	abstract_cpu::measurement_end();
 }
 =

-
 char * cpu_linux::fill_cstate_line(int line_nr, char *buffer, const char *=
separator)
 {
 	unsigned int i;
-- =

1.7.11.3


--===============7650672188864184307==--

