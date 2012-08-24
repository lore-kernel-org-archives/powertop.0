Content-Type: multipart/mixed; boundary="===============6366888087038351134=="
MIME-Version: 1.0
From: Joerg Mayer <jmpt at loplof.de>
Subject: [Powertop] [Warning fixes 5/6] Fix warning: warning: this decimal
 constant is unsigned only in ISO C90 [enabled by default] by explicitely
 declaring the value as UL
Date: Fri, 24 Aug 2012 19:21:13 +0200
Message-ID: <20120824173217.E3127E00D3@linda.rhrk.uni-kl.de>
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============6366888087038351134==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Joerg Mayer <jmpt(a)loplof.de>

diff --git a/src/cpu/cpu.cpp b/src/cpu/cpu.cpp
index 368d3dd..c3f0c79 100644
--- a/src/cpu/cpu.cpp
+++ b/src/cpu/cpu.cpp
@@ -975,7 +975,7 @@ void perf_power_bundle::handle_trace_point(void *trace,=
 int cpunr, uint64_t time
                         exit(-1);
                 }
 =

-		if (val =3D=3D 4294967295)
+		if (val =3D=3D 4294967295UL)
 			cpu->go_unidle(time);
 		else
 			cpu->go_idle(time);
-- =

1.7.7


--===============6366888087038351134==--

