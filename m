Content-Type: multipart/mixed; boundary="===============4773389293183613745=="
MIME-Version: 1.0
From: Joe Konno <joe.konno at linux.intel.com>
Subject: [Powertop] [PATCH v2 6/8] Stop buffer overflow
Date: Tue, 14 Oct 2014 11:09:17 -0700
Message-ID: <1413310159-30577-7-git-send-email-joe.konno@linux.intel.com>
In-Reply-To: 1413310159-30577-1-git-send-email-joe.konno@linux.intel.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============4773389293183613745==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Dan Kalowsky <daniel.kalowsky(a)intel.com>

On some builds of Android, we are seeing entries that overrun this
buffer causing some ill-advised effects.  Limiting the buffer copies to
the size of the allocated buffer solves this issue.

v2: rebased atop 41c54e8

Signed-off-by: Joe Konno <joe.konno(a)intel.com>
---
 src/process/do_process.cpp | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/src/process/do_process.cpp b/src/process/do_process.cpp
index dd7d982..2b5a327 100644
--- a/src/process/do_process.cpp
+++ b/src/process/do_process.cpp
@@ -856,8 +856,8 @@ void process_update_display(void)
 =

 		format_watts(all_power[i]->Witts(), power, 10);
 		if (!show_power)
-			strcpy(power, "          ");
-		sprintf(name, "%s", all_power[i]->type());
+			strncpy(power, "          ", 16);
+		snprintf(name, 20, "%s", all_power[i]->type());
 =

 		align_string(name, 14, 20);
 =

@@ -867,9 +867,9 @@ void process_update_display(void)
 		usage[0] =3D 0;
 		if (all_power[i]->usage_units()) {
 			if (all_power[i]->usage() < 1000)
-				sprintf(usage, "%5.1f%s", all_power[i]->usage(), all_power[i]->usage_u=
nits());
+				snprintf(usage, 20, "%5.1f%s", all_power[i]->usage(), all_power[i]->us=
age_units());
 			else
-				sprintf(usage, "%5i%s", (int)all_power[i]->usage(), all_power[i]->usag=
e_units());
+				snprintf(usage, 20, "%5i%s", (int)all_power[i]->usage(), all_power[i]-=
>usage_units());
 		}
 =

 		align_string(usage, 14, 20);
@@ -878,7 +878,7 @@ void process_update_display(void)
 		if (!all_power[i]->show_events())
 			events[0] =3D 0;
 		else if (all_power[i]->events() <=3D 0.3)
-			sprintf(events, "%5.2f", all_power[i]->events());
+			snprintf(events, 20, "%5.2f", all_power[i]->events());
 =

 		align_string(events, 12, 20);
 		wprintw(win, "%s  %s %s %s %s\n", power, usage, events, name, pretty_pri=
nt(all_power[i]->description(), descr, 128));
-- =

2.1.2


--===============4773389293183613745==--

