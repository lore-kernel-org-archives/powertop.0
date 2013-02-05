Content-Type: multipart/mixed; boundary="===============4897646243842083262=="
MIME-Version: 1.0
From: Paul Menzel <paulepanter at users.sourceforge.net>
Subject: [Powertop] [PATCH v2] src/cpu/cpu.cpp: Fix typo in error message:
 freque*nc*y
Date: Tue, 05 Feb 2013 10:08:17 +0100
Message-ID: <1360055297.5004.23.camel@mattotaupa>
In-Reply-To: 20130204110258.1b7a9dc8@bluebird.jf.intel.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============4897646243842083262==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Date: Sun, 3 Feb 2013 23:31:22 +0100

The translations files under `po/` are not changed as that is
managed by Transifex.

The typo was introduced in the following commit.

        commit 1dfdb80d6333960ed310fff7b60439f79d154a84
        Author: Chris E Ferron <chris.e.ferron(a)linux.intel.com>
        Date:   Fri Apr 20 13:59:50 2012 -0700

            Added some error handling, code clean-up, comment removal, even=
t name adjustments.
---
As per Kristen=E2=80=99s reply, just change the CPP file.
 src/cpu/cpu.cpp |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/src/cpu/cpu.cpp b/src/cpu/cpu.cpp
index f875e45..1eb340c 100644
--- a/src/cpu/cpu.cpp
+++ b/src/cpu/cpu.cpp
@@ -808,7 +808,7 @@ void perf_power_bundle::handle_trace_point(void *trace,=
 int cpunr, uint64_t time
 =

 		ret =3D pevent_get_field_val(NULL, event, "state", &rec, &val, 0);
 		if (ret < 0) {
-			fprintf(stderr, _("power or cpu_frequecny event returned no state?\n"));
+			fprintf(stderr, _("power or cpu_frequency event returned no state?\n"));
 			exit(-1);
 		}
 =

-- =

1.7.10.4

--===============4897646243842083262==
Content-Type: application/pgp-signature
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="signature.asc"

LS0tLS1CRUdJTiBQR1AgU0lHTkFUVVJFLS0tLS0KVmVyc2lvbjogR251UEcgdjEuNC4xMiAoR05V
L0xpbnV4KQoKaUVZRUFCRUNBQVlGQWxFUXpBRUFDZ2tRUFgxYUsyd09IVmhacmdDZlNQRHBEaXlu
aFNsUFhhMzVpUkFidXdZYQoxUVVBblJLdEF3ZHdOUTRpaVVkL2NrZmtCWHRYOHFROAo9Z1Nkawot
LS0tLUVORCBQR1AgU0lHTkFUVVJFLS0tLS0K

--===============4897646243842083262==--

