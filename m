Content-Type: multipart/mixed; boundary="===============6068309715628189697=="
MIME-Version: 1.0
From: Ivan Shapovalov <intelfx100 at gmail.com>
Subject: [Powertop] [PATCH 2/2] Fixed errors that appear while reading ALPM
 accounting files.
Date: Sun, 13 May 2012 13:53:20 +0400
Message-ID: <1922573.UiWCqhzUhe@intelfx-laptop>
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============6068309715628189697==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

When no disks are attached to a host, reading ahci_alpm_* files fail
with "Invalid argument" (but ahci_alpm_accounting can be written, so an
instance of ahci is created).

This case is now checked by reading ahci_alpm_accounting before writing to =
it:
if reading fails, the whole SCSI host is skipped.
---
 src/devices/ahci.cpp |    8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/src/devices/ahci.cpp b/src/devices/ahci.cpp
index 26f83a3..21f9d19 100644
--- a/src/devices/ahci.cpp
+++ b/src/devices/ahci.cpp
@@ -258,12 +258,20 @@ void create_all_ahcis(void)
 	while (1) {
 		class ahci *bl;
 		ofstream file;
+		ifstream check_file;
 		entry =3D readdir(dir);
 		if (!entry)
 			break;
 		if (entry->d_name[0] =3D=3D '.')
 			continue;
 		sprintf(filename, "/sys/class/scsi_host/%s/ahci_alpm_accounting", entry-=
>d_name);
+
+		check_file.open(filename, ios::in);
+		check_file.get();
+		check_file.close();
+		if (check_file.bad())
+			continue;
+		=

 		file.open(filename, ios::in);
 		if (!file)
 			continue;
-- =

1.7.10.2



--===============6068309715628189697==--

