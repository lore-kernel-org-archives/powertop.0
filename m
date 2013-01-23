Content-Type: multipart/mixed; boundary="===============0698010837398512435=="
MIME-Version: 1.0
From: Austin Zhang <zhang.austin at gmail.com>
Subject: [Powertop] [PATCH] Using std::max to handle all such kind of logic
Date: Wed, 23 Jan 2013 11:54:47 +0800
Message-ID: <1358913287-8694-1-git-send-email-zhang.austin@gmail.com>
In-Reply-To: 20130122170926.GB2320@swordfish
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============0698010837398512435==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Austin Zhang <zhang.austin(a)gmail.com>
---
 src/cpu/cpu.cpp |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/src/cpu/cpu.cpp b/src/cpu/cpu.cpp
index 7f3af69..38540a5 100644
--- a/src/cpu/cpu.cpp
+++ b/src/cpu/cpu.cpp
@@ -525,8 +525,9 @@ void report_display_cpu_pstates(void)
 	unsigned int i, pstates_num;
 =

 	for (i =3D 0, pstates_num =3D 0; i < all_cpus.size(); i++)
-		if (all_cpus[i] && all_cpus[i]->pstates.size() > pstates_num)
-			pstates_num =3D all_cpus[i]->pstates.size();
+		if (all_cpus[i])
+			pstates_num =3D std::max<unsigned int>(pstates_num,
+								all_cpus[i]->pstates.size());
 =

 	report.begin_section(SECTION_CPUFREQ);
 	report.add_header("Processor Frequency Report");
-- =

1.7.5.4


--===============0698010837398512435==--

