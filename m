Content-Type: multipart/mixed; boundary="===============5481483901702968939=="
MIME-Version: 1.0
From: Namhyung Kim <namhyung at gmail.com>
Subject: [Powertop] [PATCH] devices: Fix processing /proc/net/dev file
Date: Mon, 15 Oct 2012 23:33:36 +0900
Message-ID: <1350311616-9770-1-git-send-email-namhyung@gmail.com>
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============5481483901702968939==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

The do_proc_net_dev() reads the /proc/net/dev file and counts tx/rx
packets for each interface.  However index for rx packet (1) is not
match to the file:

$ cat /proc/net/dev
Inter-|   Receive                                                |  Transmit
 face |bytes    packets errs drop fifo frame compressed multicast|bytes    =
packets errs drop fifo colls carrier compressed
       (1)      (2)     (3)  (4)  (5)  (6)   (7)        (8)       (9)      =
(10)    (11) (12) (13) (14)  (15)    (16)

Change the index to 2 to match to the number of receive packets.

Signed-off-by: Namhyung Kim <namhyung(a)gmail.com>
---
 src/devices/network.cpp |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/src/devices/network.cpp b/src/devices/network.cpp
index b8a5c9c..3b67610 100644
--- a/src/devices/network.cpp
+++ b/src/devices/network.cpp
@@ -114,7 +114,7 @@ static void do_proc_net_dev(void)
 			c2 =3D c;
 			val =3D strtoull(c, &c, 10);
 			i++;
-			if (i =3D=3D 1 || i =3D=3D 10)
+			if (i =3D=3D 2 || i =3D=3D 10)
 				pkt +=3D val;
 =

 		}
-- =

1.7.9.2


--===============5481483901702968939==--

