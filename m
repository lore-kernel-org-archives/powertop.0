Content-Type: multipart/mixed; boundary="===============0994562233502700061=="
MIME-Version: 1.0
From: Sergey Senozhatsky <sergey.senozhatsky at gmail.com>
Subject: Re: [Powertop] [Discuss] [PATCH] iw: handle HAVE_LIBNL20 properly
Date: Fri, 18 May 2012 13:26:13 +0300
Message-ID: <20120518102612.GC3074@swordfish>
In-Reply-To: 4FB606A9.9000404@freemail.hu
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============0994562233502700061==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On (05/18/12 10:22), N=C3=A9meth M=C3=A1rton wrote:
>
> Hi,
>

Hello,
 =

Cc powertop(a)lists.01.org list


> starting with the commit b0d2854861de2f15671e633da11f42207d4357df
> I get the following compile time error:
> =


Well, that's strange, since commit itself doesn't change much....

how about the following one

-------8<---------8<----------

Re-organize iw header includes.

Reported-by: N=C3=A9meth M=C3=A1rton <nm127(a)freemail.hu>
Signed-off-by: Sergey Senozhatsky <sergey.senozhatsky(a)gmail.com>

---

 src/tuning/iw.c |    1 +
 src/tuning/iw.h |    6 ------
 2 files changed, 1 insertion(+), 6 deletions(-)

diff --git a/src/tuning/iw.c b/src/tuning/iw.c
index aeba3fd..9e7508b 100644
--- a/src/tuning/iw.c
+++ b/src/tuning/iw.c
@@ -39,6 +39,7 @@ OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFT=
WARE.
 #include <unistd.h>
 #include <stdbool.h>
 =

+#include <linux/nl80211.h>
 #include <netlink/genl/genl.h>
 #include <netlink/genl/family.h>
 #include <netlink/genl/ctrl.h>
diff --git a/src/tuning/iw.h b/src/tuning/iw.h
index acf132d..6ea5a3d 100644
--- a/src/tuning/iw.h
+++ b/src/tuning/iw.h
@@ -33,12 +33,6 @@ OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOF=
TWARE.
 */
 =

 #include <stdbool.h>
-#include <netlink/netlink.h>
-#include <netlink/genl/genl.h>
-#include <netlink/genl/family.h>
-#include <netlink/genl/ctrl.h>
-
-#include <linux/nl80211.h>
 =

 #define ETH_ALEN 6
=20

--===============0994562233502700061==--

