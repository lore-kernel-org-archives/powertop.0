Content-Type: multipart/mixed; boundary="===============0550310857349582468=="
MIME-Version: 1.0
From: Colin King <colin.king at canonical.com>
Subject: [Powertop] [PATCH 2/4] cpu: abstract_cpu: Fix typo in comment
Date: Sat, 22 Sep 2012 19:33:07 +0100
Message-ID: <1348338789-16252-3-git-send-email-colin.king@canonical.com>
In-Reply-To: 1348338789-16252-1-git-send-email-colin.king@canonical.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============0550310857349582468==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Colin Ian King <colin.king(a)canonical.com>

thier =3D=3D> their

Signed-off-by: Colin Ian King <colin.king(a)canonical.com>
---
 src/cpu/abstract_cpu.cpp |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/src/cpu/abstract_cpu.cpp b/src/cpu/abstract_cpu.cpp
index 386d981..e159877 100644
--- a/src/cpu/abstract_cpu.cpp
+++ b/src/cpu/abstract_cpu.cpp
@@ -162,7 +162,7 @@ void abstract_cpu::insert_cstate(const char *linux_name=
, const char *human_name,
 		c++;
 	}
 =

-	/* some architectures (ARM) don't have good numbers in thier human name..=
 fall back to the linux name for those */
+	/* some architectures (ARM) don't have good numbers in their human name..=
 fall back to the linux name for those */
 	c =3D linux_name;
 	while (*c && state->line_level < 0) {
 		if (*c >=3D '0' && *c <=3D'9') {
-- =

1.7.10.4


--===============0550310857349582468==--

