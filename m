Content-Type: multipart/mixed; boundary="===============2558871602494238417=="
MIME-Version: 1.0
From: Howard, James D <james.d.howard at intel.com>
Subject: Re: [Powertop] [Warning fixes 5/6] Fix warning: warning: this decimal
 constant is unsigned only in ISO C90 [enabled by default] by explicitely
 declaring the value as UL
Date: Fri, 24 Aug 2012 20:18:58 +0000
Message-ID: <04DD5571759C064D967CF1D07D73B628490BBEF1@fmsmsx110.amr.corp.intel.com>
In-Reply-To: 20120824173217.E3127E00D3@linda.rhrk.uni-kl.de
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============2558871602494238417==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

A change was suggested in .../cpu.cpp at or near line 975, explicitly addin=
g the "UL" suffix to the decimal integer literal:
     4294967295   -->   4294967295UL
Is that the right thing to do?  This is "ULONG_MAX" (for machines with 32-b=
it "word" size).  Would it be more correct to use the identifier ULONG_MAX?=
  In modern #include files, <limits.h> (for example) correctly provides the=
 "UL" suffix.
   =

--
james.d.howard(a)intel.com  Principal Engineer
//Intel/SSG/DRD/PAE/FACE/DCE
+1-503-712-8608

________________________________________
From: powertop-bounces(a)lists.01.org [powertop-bounces(a)lists.01.org] on =
behalf of Joerg Mayer [jmpt(a)loplof.de]
Sent: Friday, August 24, 2012 10:21
To: powertop(a)lists.01.org
Subject: [Powertop] [Warning fixes 5/6] Fix warning: warning: this decimal =
constant is unsigned only in ISO C90 [enabled by default] by explicitely de=
claring the value as UL

Signed-off-by: Joerg Mayer <jmpt(a)loplof.de>

diff --git a/src/cpu/cpu.cpp b/src/cpu/cpu.cpp
index 368d3dd..c3f0c79 100644
--- a/src/cpu/cpu.cpp
+++ b/src/cpu/cpu.cpp
@@ -975,7 +975,7 @@ void perf_power_bundle::handle_trace_point(void *trace,=
 int cpunr, uint64_t time
                         exit(-1);
                 }

-               if (val =3D=3D 4294967295)
+               if (val =3D=3D 4294967295UL)
                        cpu->go_unidle(time);
                else
                        cpu->go_idle(time);
--
1.7.7

_______________________________________________
PowerTop mailing list
PowerTop(a)lists.01.org
https://lists.01.org/mailman/listinfo/powertop

--===============2558871602494238417==--

