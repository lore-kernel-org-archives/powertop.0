Content-Type: multipart/mixed; boundary="===============5662851039365978958=="
MIME-Version: 1.0
From: =?utf-8?q?Jaroslav_=C5=A0karvada_=3Cjskarvad_at_redhat=2Ecom=3E?=
Subject: [Powertop] [PATCH] Do not call abstract_cpu::wiggle for GPU
Date: Mon, 14 Jan 2013 17:41:58 +0100
Message-ID: <1358181718-17761-1-git-send-email-jskarvad@redhat.com>
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============5662851039365978958==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

first_cpu is uninitialized there which results in:
open("/sys/devices/system/cpu/cpu1330597711/cpufreq/scaling_max_freq", O_RD=
ONLY)
---
 src/cpu/intel_cpus.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/src/cpu/intel_cpus.h b/src/cpu/intel_cpus.h
index 1949af1..752e8d0 100644
--- a/src/cpu/intel_cpus.h
+++ b/src/cpu/intel_cpus.h
@@ -158,5 +158,6 @@ public:
 	virtual char *  fill_cstate_line(int line_nr, char *buffer, const char *s=
eparator);
 	virtual int	has_pstate_level(int level) { return 0; };
 	virtual int	has_pstates(void) { return 0; };
+	virtual void	wiggle(void) { };
 =

 };
-- =

1.7.11.7


--===============5662851039365978958==--

