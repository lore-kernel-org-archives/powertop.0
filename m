Content-Type: multipart/mixed; boundary="===============2530735398021399385=="
MIME-Version: 1.0
From: Oleg Drokin <green at linuxhacker.ru>
Subject: [Powertop] [PATCH 2/2] Show idle processes holding devices at full
 power
Date: Sat, 18 Jun 2016 20:26:02 -0400
Message-ID: <1466295962-1181132-3-git-send-email-green@linuxhacker.ru>
In-Reply-To: 1466295962-1181132-1-git-send-email-green@linuxhacker.ru
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============2530735398021399385==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Even if process did not spend any time running but holds
a device open, it deserves its line on the "Wall of Shame".
Otherwise we get erratic "now we show it, now we don't"
behavior which is confusing.

Signed-off-by: Oleg Drokin <green(a)linuxhacker.ru>
---
 src/process/process.cpp | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/src/process/process.cpp b/src/process/process.cpp
index 25de86f..caeccec 100644
--- a/src/process/process.cpp
+++ b/src/process/process.cpp
@@ -230,7 +230,8 @@ void all_processes_to_all_power(void)
 {
 	unsigned int i;
 	for (i =3D 0; i < all_processes.size() ; i++)
-		if (all_processes[i]->accumulated_runtime)
+		if (all_processes[i]->accumulated_runtime ||
+		    all_processes[i]->power_charge)
 			all_power.push_back(all_processes[i]);
 }
 =

-- =

2.7.4


--===============2530735398021399385==--

