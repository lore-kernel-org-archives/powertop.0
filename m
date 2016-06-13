Content-Type: multipart/mixed; boundary="===============8353257920191725910=="
MIME-Version: 1.0
From: Joe Konno <joe.konno at linux.intel.com>
Subject: [Powertop] [PATCH 1/2] intel_cpus: frequency: clarify average clock
 speed
Date: Mon, 13 Jun 2016 09:00:33 -0700
Message-ID: <20160613160034.29283-2-joe.konno@linux.intel.com>
In-Reply-To: 20160613160034.29283-1-joe.konno@linux.intel.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============8353257920191725910==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Joe Konno <joe.konno(a)intel.com>

Depending on the sample time (-t sample_time_in_secs), on Intel CPUs the
average frequency is computed for the sample time. Therefore, let's
change the label to "Average" so as not to confuse the end-user.

Previously, the UI and report printed the "actual" frequency-- at least,
that's how it was labeled. This is not strictly true, as the actual cpu
frequency of the platform may change at any point during the sample time
for a variety of reasons.

Signed-off-by: Joe Konno <joe.konno(a)intel.com>
---
 src/cpu/intel_cpus.cpp | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/src/cpu/intel_cpus.cpp b/src/cpu/intel_cpus.cpp
index 7cb9d45297ef..8151292238ec 100644
--- a/src/cpu/intel_cpus.cpp
+++ b/src/cpu/intel_cpus.cpp
@@ -573,7 +573,7 @@ void nhm_cpu::measurement_end(void)
 char * nhm_cpu::fill_pstate_name(int line_nr, char *buffer)
 {
 	if (line_nr =3D=3D LEVEL_C0) {
-		sprintf(buffer, _("Actual"));
+		sprintf(buffer, _("Average"));
 		return buffer;
 	}
 	return cpu_linux::fill_pstate_name(line_nr, buffer);
-- =

2.8.3


--===============8353257920191725910==--

