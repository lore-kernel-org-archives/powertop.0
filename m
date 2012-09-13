Content-Type: multipart/mixed; boundary="===============0767249440049313065=="
MIME-Version: 1.0
From: Sergey Senozhatsky <sergey.senozhatsky at gmail.com>
Subject: [Powertop] [PATCH] abstract_cpu: do not call total_pstate_time() in
 validate()
Date: Thu, 13 Sep 2012 15:41:29 +0300
Message-ID: <20120913124129.GA4894@swordfish.minsk.epam.com>
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============0767249440049313065==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

 abstract_cpu: do not call total_pstate_time() in validate()

Signed-off-by: Sergey Senozhatsky <sergey.senozhatsky(a)gmail.com>

---

 src/cpu/abstract_cpu.cpp | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/src/cpu/abstract_cpu.cpp b/src/cpu/abstract_cpu.cpp
index ebdc510..386d981 100644
--- a/src/cpu/abstract_cpu.cpp
+++ b/src/cpu/abstract_cpu.cpp
@@ -414,15 +414,10 @@ uint64_t abstract_cpu::total_pstate_time(void)
 void abstract_cpu::validate(void)
 {
 	unsigned int i;
-	uint64_t my_time;
-
-	my_time =3D total_pstate_time();
 =

 	for (i =3D 0; i < children.size(); i++) {
-
-		if (children[i]) {
+		if (children[i])
 			children[i]->validate();
-		}
 	}
 }
=20

--===============0767249440049313065==--

