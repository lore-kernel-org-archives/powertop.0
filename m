Content-Type: multipart/mixed; boundary="===============3629365469055001636=="
MIME-Version: 1.0
From: Sergey Senozhatsky <sergey.senozhatsky at gmail.com>
Subject: [Powertop] [PATCH 1/2] tuningsysfs: fix msg typo
Date: Tue, 26 Nov 2013 22:27:09 +0300
Message-ID: <1385494030-22556-2-git-send-email-sergey.senozhatsky@gmail.com>
In-Reply-To: 1385494030-22556-1-git-send-email-sergey.senozhatsky@gmail.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============3629365469055001636==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

fix 'Managmenet' typo.

Reported-by: Gijs Hillenius <gijs(a)hillenius.net>
Signed-off-by: Sergey Senozhatsky <sergey.senozhatsky(a)gmail.com>
---
 src/tuning/tuningsysfs.cpp | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/src/tuning/tuningsysfs.cpp b/src/tuning/tuningsysfs.cpp
index ec1ca6b..f70dc23 100644
--- a/src/tuning/tuningsysfs.cpp
+++ b/src/tuning/tuningsysfs.cpp
@@ -136,7 +136,7 @@ void add_sata_tunables(void)
 =

 		sprintf(filename, "/sys/class/scsi_host/%s/link_power_management_policy"=
, entry->d_name);
 =

-	        sprintf(msg, _("Enable SATA link power Managmenet for %s"),entry-=
>d_name);
+	        sprintf(msg, _("Enable SATA link power management for %s"),entry-=
>d_name);
 =

 		add_sysfs_tunable(msg, filename,"min_power");
 =

-- =

1.8.5.rc3.362.gdf10213.dirty


--===============3629365469055001636==--

