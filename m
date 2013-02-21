Content-Type: multipart/mixed; boundary="===============1415785529003082680=="
MIME-Version: 1.0
From: jani.nikula at linux.intel.com
Subject: [Powertop] [PATCH] Add a more informative error message about MSR not
 found
Date: Thu, 21 Feb 2013 11:27:34 +0200
Message-ID: <1361438855-14060-1-git-send-email-jani.nikula@linux.intel.com>
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============1415785529003082680==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Jani Nikula <jani.nikula(a)intel.com>

Suggest enabling CONFIG_X86_MSR. Add \n at the end of the error message.

Signed-off-by: Jani Nikula <jani.nikula(a)intel.com>

---

Note: This breaks translations looking for msgid "msr reg not found". I'm
unsure how you want this kind of changes handled.
---
 src/cpu/intel_cpus.cpp |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/src/cpu/intel_cpus.cpp b/src/cpu/intel_cpus.cpp
index 2b78d31..30c311f 100644
--- a/src/cpu/intel_cpus.cpp
+++ b/src/cpu/intel_cpus.cpp
@@ -58,7 +58,7 @@ static uint64_t get_msr(int cpu, uint64_t offset)
 		fd =3D sprintf(msr_path, "/dev/msr%d", cpu);
 =

 		if (access(msr_path, R_OK) !=3D 0){
-			fprintf(stderr, _("msr reg not found"));
+			fprintf(stderr, _("Model-specific registers (MSR) not found (try enabli=
ng CONFIG_X86_MSR).\n"));
 			exit(-2);
 		}
 	}
-- =

1.7.9.5


--===============1415785529003082680==--

