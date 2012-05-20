Content-Type: multipart/mixed; boundary="===============4199386868080988779=="
MIME-Version: 1.0
From: Sergey Senozhatsky <sergey.senozhatsky at gmail.com>
Subject: Re: [Powertop] segfault on Sheevaplug (ARM Kirkwood)
Date: Sun, 20 May 2012 12:34:41 +0300
Message-ID: <20120520093441.GB3515@swordfish>
In-Reply-To: 1337505562.47794.BPMail_high_noncarrier@web160306.mail.bf1.yahoo.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============4199386868080988779==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On (05/20/12 02:19), Rui DaCosta wrote:
> Sure and thanks,
> (v1.13 worked fine btw)
> Processor	: Feroceon 88FR131 rev 1 (v5l)
> BogoMIPS	: 1191.11
> Features	: swp half thumb fastmult edsp =

> CPU implementer	: 0x56
> CPU architecture: 5TE
> CPU variant	: 0x2
> CPU part	: 0x131
> CPU revision	: 1
> =

> Hardware	: Marvell SheevaPlug Reference Board
> Revision	: 0000
> Serial		: 0000000000000000
> =

> =


Thanks,

Well, that's the problem. Current cpu info parser doesn't understand your
cpuinfo format. It awaits for sane values on special places. For example, w=
ord =

"processor" should be followed by a number, not model name.

	processor	: 2
	vendor_id	: GenuineIntel
	cpu family	: 6
	model		: 37
	bogomips	: 4522.66

while cpuinfo on your system is totally different.

the following is untested patch (I'm a bit skeptical) plus I don't have =

ARM device for testing.

---

 src/cpu/cpu.cpp |   26 ++++++++++++++------------
 1 file changed, 14 insertions(+), 12 deletions(-)

diff --git a/src/cpu/cpu.cpp b/src/cpu/cpu.cpp
index 09d4a2d..143e18c 100644
--- a/src/cpu/cpu.cpp
+++ b/src/cpu/cpu.cpp
@@ -225,7 +225,7 @@ void enumerate_cpus(void)
 	ifstream file;
 	char line[1024];
 =

-	int number =3D -1;
+	int number =3D 1;
 	char vendor[128];
 	int family =3D 0;
 	int model =3D 0;
@@ -236,7 +236,6 @@ void enumerate_cpus(void)
 		return;
 =

 	while (file) {
-
 		file.getline(line, sizeof(line));
 		if (strncmp(line, "vendor_id\t",10) =3D=3D 0) {
 			char *c;
@@ -247,42 +246,45 @@ void enumerate_cpus(void)
 					c++;
 				strncpy(vendor,c, 127);
 			}
-		}
-		if (strncmp(line, "processor\t",10) =3D=3D 0) {
+		} else if (strncmp(line, "processor\t",10) =3D=3D 0) {
 			char *c;
 			c =3D strchr(line, ':');
 			if (c) {
 				c++;
 				number =3D strtoull(c, NULL, 10);
 			}
-		}
-		if (strncmp(line, "cpu family\t",11) =3D=3D 0) {
+		} else if (strncmp(line, "Processor\t",10) =3D=3D 0) {
+			char *c;
+			c =3D strchr(line, ':');
+			if (c) {
+				c++;
+				if (*c =3D=3D ' ')
+					c++;
+				strncpy(vendor, c, 127);
+			}
+		}  else if (strncmp(line, "cpu family\t",11) =3D=3D 0) {
 			char *c;
 			c =3D strchr(line, ':');
 			if (c) {
 				c++;
 				family =3D strtoull(c, NULL, 10);
 			}
-		}
-		if (strncmp(line, "model\t",6) =3D=3D 0) {
+		} else if (strncmp(line, "model\t",6) =3D=3D 0) {
 			char *c;
 			c =3D strchr(line, ':');
 			if (c) {
 				c++;
 				model =3D strtoull(c, NULL, 10);
 			}
-		}
-		if (strncasecmp(line, "bogomips\t", 9) =3D=3D 0) {
+		} else if (strncasecmp(line, "bogomips\t", 9) =3D=3D 0) {
 			handle_one_cpu(number, vendor, family, model);
 			set_max_cpu(number);
 		}
 	}
 =

-
 	file.close();
 =

 	perf_events =3D new perf_power_bundle();
-
 	if (!perf_events->add_event("power:cpu_idle")){
 		perf_events->add_event("power:power_start");
 		perf_events->add_event("power:power_end");


--===============4199386868080988779==--

