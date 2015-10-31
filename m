Content-Type: multipart/mixed; boundary="===============5454603554474463361=="
MIME-Version: 1.0
From: Nivedita Swaminathan <nivedita.swaminathan at intel.com>
Subject: [Powertop] [PATCH] Additional message printed to the powertop output
Date: Fri, 30 Oct 2015 17:05:13 -0700
Message-ID: <1446249913-11474-1-git-send-email-nivedita.swaminathan@intel.com>
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============5454603554474463361==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Adding an additional message to the powertop output to let the
users know that the saved_parameters.powertop file gets generated
only when minimum number of measurements are taken when connected
to the battery.

Signed-off-by: Nivedita Swaminathan <nivedita.swaminathan(a)intel.com>
---
 src/parameters/persistent.cpp | 1 +
 1 file changed, 1 insertion(+)

diff --git a/src/parameters/persistent.cpp b/src/parameters/persistent.cpp
index 9a5688a..0711b4d 100644
--- a/src/parameters/persistent.cpp
+++ b/src/parameters/persistent.cpp
@@ -178,6 +178,7 @@ void load_parameters(const char *filename)
 	file.open(pathname, ios::in);
 	if (!file) {
 		cout << _("Cannot load from file") << " " << pathname << "\n";
+		cout << _("File will be loaded after taking minimum number of measuremen=
t(s) with battery only \n");
 		return;
 	}
 =

-- =

2.1.4


--===============5454603554474463361==--

