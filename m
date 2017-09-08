Content-Type: multipart/mixed; boundary="===============0363423430247926463=="
MIME-Version: 1.0
From: Joe Konno <joe.konno at linux.intel.com>
Subject: [Powertop] [PATCH 4/4 v1] tuning: complete tunable result switch
Date: Fri, 08 Sep 2017 15:36:51 -0700
Message-ID: <20170908223651.27979-5-joe.konno@linux.intel.com>
In-Reply-To: 20170908223651.27979-1-joe.konno@linux.intel.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============0363423430247926463==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Joe Konno <joe.konno(a)intel.com>

After implementing the tunable_state enum, compiler warning showed switch
statement within tunable result code was incomplete. Put another way, not a=
ll
possible enum values were checked for. Fix the code so the compiler warning
goes away.

Signed-off-by: Joe Konno <joe.konno(a)intel.com>
---
 src/tuning/tunable.h | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/src/tuning/tunable.h b/src/tuning/tunable.h
index 5ea7cdfb5389..afb789d6f4a7 100644
--- a/src/tuning/tunable.h
+++ b/src/tuning/tunable.h
@@ -59,14 +59,20 @@ public:
 =

 	virtual char *result_string(void)
 	{
+		char *result =3D NULL;
+
 		switch (good_bad()) {
 		case TUNE_GOOD:
-			return good_string;
+			result =3D good_string;
 		case TUNE_BAD:
 		case TUNE_UNFIXABLE:
-			return bad_string;
+			result =3D bad_string;
+		case TUNE_NEUTRAL:
+		case TUNE_UNKNOWN:
+			result =3D neutral_string;
 		}
-		return neutral_string;
+
+		return result;
 	}
 =

 =

-- =

2.13.5


--===============0363423430247926463==--

