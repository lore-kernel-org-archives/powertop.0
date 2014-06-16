Content-Type: multipart/mixed; boundary="===============4801676123563643862=="
MIME-Version: 1.0
From: Alexandra Yates <alexandra.yates at linux.intel.com>
Subject: [Powertop] [PATCH] Bug-fix: for html & csv value for CPU Information
Date: Mon, 16 Jun 2014 12:28:22 -0700
Message-ID: <1402946904-20472-2-git-send-email-alexandra.yates@linux.intel.com>
In-Reply-To: 1402946904-20472-1-git-send-email-alexandra.yates@linux.intel.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============4801676123563643862==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Added cast from long-int to string to correct printout for
"CPU Information" field on html and csv report.

Signed-off-by: Alexandra Yates <alexandra.yates(a)linux.intel.com>
---
 src/report/report.cpp |    4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/src/report/report.cpp b/src/report/report.cpp
index 9e94607..6eb2b63 100644
--- a/src/report/report.cpp
+++ b/src/report/report.cpp
@@ -136,7 +136,9 @@ static void system_info(void)
 	system_data[5].append(str.c_str());
 	str =3D cpu_model();
 	system_data[6]=3D__("CPU Information");
-	system_data[7]=3D sysconf(_SC_NPROCESSORS_ONLN);
+	stringstream n_proc;;
+	n_proc << sysconf(_SC_NPROCESSORS_ONLN);
+	system_data[7]=3D n_proc.str();
 	system_data[7].append(str.c_str());
 =

 	str =3D read_sysfs_string("/etc/system-release");
-- =

1.7.9.5


--===============4801676123563643862==--

