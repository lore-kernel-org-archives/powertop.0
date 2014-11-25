Content-Type: multipart/mixed; boundary="===============7126305950073457974=="
MIME-Version: 1.0
From: Sami Kerola <kerolasa at iki.fi>
Subject: [Powertop] [PATCH v3 15/15] textual: add new line to a message
Date: Tue, 25 Nov 2014 21:16:28 +0000
Message-ID: <1416950188-16616-16-git-send-email-kerolasa@iki.fi>
In-Reply-To: 1416950188-16616-1-git-send-email-kerolasa@iki.fi
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============7126305950073457974==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Earlier message was not quite right as seen below.

$ sudo ./src/powertop --auto
Loaded 244 prior measurements
[...]
To show power estimates do 20 measurement(s) connected to battery onlyLeavi=
ng PowerTOP

Signed-off-by: Sami Kerola <kerolasa(a)iki.fi>
---
 src/parameters/parameters.cpp | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/src/parameters/parameters.cpp b/src/parameters/parameters.cpp
index 1843342..ec119b6 100644
--- a/src/parameters/parameters.cpp
+++ b/src/parameters/parameters.cpp
@@ -439,7 +439,7 @@ int global_power_valid(void)
 		return 1;
 =

 	if (past_results.size() > 0 && global_run_times < 1){
-		printf("To show power estimates do %ld measurement(s) connected to batte=
ry only",
+		printf("To show power estimates do %ld measurement(s) connected to batte=
ry only\n",
 			(3 * all_parameters.parameters.size()) - past_results.size());
 		global_run_times +=3D 1; =

 	}
-- =

2.1.3


--===============7126305950073457974==--

