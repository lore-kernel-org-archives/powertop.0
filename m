Content-Type: multipart/mixed; boundary="===============3274090015560299792=="
MIME-Version: 1.0
From: Joe Konno <joe.konno at linux.intel.com>
Subject: [Powertop] [PATCH 2/4 v1] lib: have check_pci_access() scan the
 entire bus
Date: Fri, 08 Sep 2017 15:36:49 -0700
Message-ID: <20170908223651.27979-3-joe.konno@linux.intel.com>
In-Reply-To: 20170908223651.27979-1-joe.konno@linux.intel.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============3274090015560299792==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Joe Konno <joe.konno(a)intel.com>

Signed-off-by: Joe Konno <joe.konno(a)intel.com>
---
 src/lib.cpp | 1 +
 1 file changed, 1 insertion(+)

diff --git a/src/lib.cpp b/src/lib.cpp
index 2b95e64f427b..d2a9de71e7aa 100644
--- a/src/lib.cpp
+++ b/src/lib.cpp
@@ -301,6 +301,7 @@ static void check_pci_access(void)
 	if (!pci_access) {
 		pci_access =3D pci_alloc();
 		pci_init(pci_access);
+		pci_scan_bus(pci_access);
 	}
 }
 =

-- =

2.13.5


--===============3274090015560299792==--

