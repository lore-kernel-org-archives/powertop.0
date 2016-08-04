Content-Type: multipart/mixed; boundary="===============4215607215160685410=="
MIME-Version: 1.0
From: Joe Konno <joe.konno at linux.intel.com>
Subject: [Powertop] [PATCH v2 05/19] .gitignore: ignnore m4/pkg.m4
Date: Wed, 03 Aug 2016 17:59:15 -0700
Message-ID: <1470272369-218664-6-git-send-email-joe.konno@linux.intel.com>
In-Reply-To: 1470272369-218664-1-git-send-email-joe.konno@linux.intel.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============4215607215160685410==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Joe Konno <joe.konno(a)intel.com>

With ACLOCAL_AMFLAGS +=3D --install, an additional m4 script is copied in
at configure time from the host's gettext installation. Let's not track
it.

Signed-off-by: Joe Konno <joe.konno(a)intel.com>
---
 .gitignore | 1 +
 1 file changed, 1 insertion(+)

diff --git a/.gitignore b/.gitignore
index de3c3b1670cf..7eb138a094ce 100644
--- a/.gitignore
+++ b/.gitignore
@@ -59,6 +59,7 @@ Makefile.in
 /m4/ltversion.m4
 /m4/lt~obsolete.m4
 /m4/nls.m4
+/m4/pkg.m4
 /m4/po.m4
 /m4/printf-posix.m4
 /m4/progtest.m4
-- =

1.8.3.1


--===============4215607215160685410==--

