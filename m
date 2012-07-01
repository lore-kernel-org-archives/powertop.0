Content-Type: multipart/mixed; boundary="===============6969063245364258640=="
MIME-Version: 1.0
From: Sergey Senozhatsky <sergey.senozhatsky at gmail.com>
Subject: Re: [Powertop] [bugreport] crash on powertop --debug --html=file.html
Date: Sun, 01 Jul 2012 21:13:51 +0300
Message-ID: <20120701181351.GD4770@swordfish>
In-Reply-To: 201207011546.20680.dl9pf@gmx.de
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============6969063245364258640==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On (07/01/12 15:46), Jan-Simon M=C3=B6ller wrote:
> Am Mittwoch, 27. Juni 2012, 18:32:42 schrieb Sergey Senozhatsky:
> > =

> > Could you please run
> > =

> >  valgrind --tool=3Dmemcheck --leak-check=3Dfull --show-reachable=3Dyes
> > --leak-resolution=3Dhigh --track-origins=3Dyes -v
> > --log-file=3D./powertop-memcheck powertop --debug --html=3Dfile.html
> > =

> > and provide powertop-memcheck file?
> > =

> > =

> > 	-ss
> =

> Attached.

Thanks, I'll take a look.

Meanwhile, could you please try the following patch?

---

 src/devlist.cpp | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/src/devlist.cpp b/src/devlist.cpp
index 93f2081..9f06b92 100644
--- a/src/devlist.cpp
+++ b/src/devlist.cpp
@@ -146,11 +146,12 @@ void collect_open_devices(void)
 				if (!dev)
 					continue;
 				dev->pid =3D strtoull(entry->d_name, NULL, 10);
-				strncpy(dev->device, link, 251);
+				strncpy(dev->device, link, 250);
+				dev->device[251] =3D 0x00;
 				sprintf(filename, "/proc/%s/comm", entry->d_name);
-				strncpy(dev->comm, read_sysfs_string("/proc/%s/comm", entry->d_name).c=
_str(), 31);
+				strncpy(dev->comm, read_sysfs_string("/proc/%s/comm", entry->d_name).c=
_str(), 30);
+				dev->comm[31] =3D 0x00;
 				target->push_back(dev);
-
 			}
 		}
 		closedir(dir2);


--===============6969063245364258640==--

