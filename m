Content-Type: multipart/mixed; boundary="===============6752986559035388166=="
MIME-Version: 1.0
From: Srinivas Pandruvada <srinivas.pandruvada at linux.intel.com>
Subject: [Powertop] [PATCH 5/8] Interface to get first cpu
Date: Mon, 15 Apr 2013 09:09:26 -0700
Message-ID: <1366042169-14523-6-git-send-email-srinivas.pandruvada@linux.intel.com>
In-Reply-To: 1366042169-14523-1-git-send-email-srinivas.pandruvada@linux.intel.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============6752986559035388166==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Added get interface to get the first cpu number for this
cpu device.

Signed-off-by: Srinivas Pandruvada <srinivas.pandruvada(a)linux.intel.com>
---
 src/cpu/cpu.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/src/cpu/cpu.h b/src/cpu/cpu.h
index a863b49..18ebeb7 100644
--- a/src/cpu/cpu.h
+++ b/src/cpu/cpu.h
@@ -105,6 +105,7 @@ public:
 	class abstract_cpu *parent;
 =

 =

+	int	get_first_cpu() { return first_cpu; }
 	void	set_number(int _number, int cpu) {this->number =3D _number; this->fi=
rst_cpu =3D cpu;};
 	void	set_type(const char* _name) {this->name =3D _name;};
 	int	get_number(void) { return number; };
-- =

1.7.11.7


--===============6752986559035388166==--

