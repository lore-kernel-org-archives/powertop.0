Content-Type: multipart/mixed; boundary="===============4596533306168348181=="
MIME-Version: 1.0
From: jani.nikula at linux.intel.com
Subject: [Powertop] [PATCH] README: add CONFIG_X86_MSR to the list of required
 kernel config options
Date: Thu, 21 Feb 2013 11:27:21 +0200
Message-ID: <1361438841-14026-1-git-send-email-jani.nikula@linux.intel.com>
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============4596533306168348181==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Jani Nikula <jani.nikula(a)intel.com>

PowerTOP fails on x86 without CONFIG_X86_MSR.

Signed-off-by: Jani Nikula <jani.nikula(a)intel.com>
---
 README |    1 +
 1 file changed, 1 insertion(+)

diff --git a/README b/README
index 7e789e0..07bbea0 100644
--- a/README
+++ b/README
@@ -43,6 +43,7 @@ CONFIG_PERF_COUNTERS
 CONFIG_TRACEPOINTS
 CONFIG_TRACING
 CONFIG_EVENT_POWER_TRACING_DEPRECATED
+CONFIG_X86_MSR
 ACPI_PROCFS_POWER
 =

 The patches in the patches/ sub-directory are required for PowerTOP to fun=
ction
-- =

1.7.9.5


--===============4596533306168348181==--

