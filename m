Content-Type: multipart/mixed; boundary="===============7327841798899416847=="
MIME-Version: 1.0
From: Srinivas Pandruvada <srinivas.pandruvada at linux.intel.com>
Subject: [Powertop] [PATCH 3/3] Update README with configs
Date: Wed, 04 Jun 2014 17:35:23 -0700
Message-ID: <1401928523-3378-3-git-send-email-srinivas.pandruvada@linux.intel.com>
In-Reply-To: 1401928523-3378-1-git-send-email-srinivas.pandruvada@linux.intel.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============7327841798899416847==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Update powercap sysfs and Intel RAPL driver config entries as
suggested configs.
---
 README | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/README b/README
index 135bd6f..cd38cc5 100644
--- a/README
+++ b/README
@@ -47,6 +47,10 @@ CONFIG_X86_MSR
 ACPI_PROCFS_POWER
 CONFIG_DEBUG_FS
 =

+Use these configs from linux-3.13.rc1
+CONFIG_POWERCAP
+CONFIG_INTEL_RAPL
+
 The patches in the patches/ sub-directory are required for PowerTOP to fun=
ction
 fully.
 =

-- =

1.7.11.7


--===============7327841798899416847==--

