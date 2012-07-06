Content-Type: multipart/mixed; boundary="===============4549369868618455113=="
MIME-Version: 1.0
From: Sergey Senozhatsky <sergey.senozhatsky at gmail.com>
Subject: Re: [Powertop] [bugreport] crash on powertop --debug --html=file.html
Date: Fri, 06 Jul 2012 12:00:04 +0300
Message-ID: <20120706090004.GA4186@swordfish>
In-Reply-To: b127e9b0-82ab-46df-b76e-9347e7543867@email.android.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============4549369868618455113==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi,

Could you please give it a try? (just a bunch of suspects).
If it fails, it'd be nice to see valgrind output.

---

 src/devlist.cpp | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/src/devlist.cpp b/src/devlist.cpp
index 93f2081..e65981e 100644
--- a/src/devlist.cpp
+++ b/src/devlist.cpp
@@ -89,7 +89,6 @@ void collect_open_devices(void)
 	}
 	target->resize(0);
 =

-
 	dir =3D opendir("/proc/");
 	if (!dir)
 		return;
@@ -105,7 +104,7 @@ void collect_open_devices(void)
 		if (strcmp(entry->d_name, "self") =3D=3D 0)
 			continue;
 =

-		sprintf(filename, "/proc/%s/fd/", entry->d_name);
+		snprintf(filename, 4095, "/proc/%s/fd/", entry->d_name);
 =

 		dir2 =3D opendir(filename);
 		if (!dir2)
@@ -113,12 +112,14 @@ void collect_open_devices(void)
 		while (1) {
 			int ret;
 			struct devuser * dev;
+			std::string comm;
+
 			entry2 =3D readdir(dir2);
 			if (!entry2)
 				break;
 			if (entry2->d_name[0] =3D=3D '.')
 				continue;
-			sprintf(filename, "/proc/%s/fd/%s", entry->d_name, entry2->d_name);
+			snprintf(filename, 4095, "/proc/%s/fd/%s", entry->d_name, entry2->d_nam=
e);
 			memset(link, 0, 4096);
 			ret =3D readlink(filename, link, 4095);
 			if (ret < 0)
@@ -147,10 +148,14 @@ void collect_open_devices(void)
 					continue;
 				dev->pid =3D strtoull(entry->d_name, NULL, 10);
 				strncpy(dev->device, link, 251);
-				sprintf(filename, "/proc/%s/comm", entry->d_name);
-				strncpy(dev->comm, read_sysfs_string("/proc/%s/comm", entry->d_name).c=
_str(), 31);
+				dev->device[251] =3D 0x00;
+				comm =3D read_sysfs_string("/proc/%s/comm", entry->d_name);
+				if (comm.empty())
+					dev->comm[0] =3D 0x00;
+				else
+					strncpy(dev->comm, read_sysfs_string("/proc/%s/comm", entry->d_name).=
c_str(), 31);
+				dev->comm[31] =3D 0x00;
 				target->push_back(dev);
-
 			}
 		}
 		closedir(dir2);


--===============4549369868618455113==--

