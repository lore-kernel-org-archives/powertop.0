Content-Type: multipart/mixed; boundary="===============3088343387930964922=="
MIME-Version: 1.0
From: Sergey Senozhatsky <sergey.senozhatsky at gmail.com>
Subject: [Powertop] [PATCH] READER: add CONFIG_DEBUG_FS to Kernel Parameters
Date: Tue, 11 Jun 2013 19:31:08 +0300
Message-ID: <20130611163108.GA2218@swordfish.datadirectnet.com>
In-Reply-To: CABB=jmFJXnTzmPBKr2Qq73EWLyKcyqA+b=j7OWzvWsT0sNCxNg@mail.gmail.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============3088343387930964922==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Add CONFIG_DEBUG_FS to the Kernel Parameters README section.

Signed-off-by: Sergey Senozhatsky <sergey.senozhatsky(a)gmail.com>

---

 README | 1 +
 1 file changed, 1 insertion(+)

diff --git a/README b/README
index 07bbea0..2961eba 100644
--- a/README
+++ b/README
@@ -45,6 +45,7 @@ CONFIG_TRACING
 CONFIG_EVENT_POWER_TRACING_DEPRECATED
 CONFIG_X86_MSR
 ACPI_PROCFS_POWER
+CONFIG_DEBUG_FS
 =

 The patches in the patches/ sub-directory are required for PowerTOP to fun=
ction
 fully.



--===============3088343387930964922==--

