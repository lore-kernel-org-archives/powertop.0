Content-Type: multipart/mixed; boundary="===============5248069999520878557=="
MIME-Version: 1.0
From: Arjan van de Ven <arjan at linux.intel.com>
Subject: [Powertop] [PATCH 1/4] Use AM_SILENT_RULES
Date: Sun, 05 Aug 2012 10:09:56 -0700
Message-ID: <501EA8E4.4030207@linux.intel.com>
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============5248069999520878557==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

>From 20f2a40280847d3f0f8e9cfe8ff565638b3bb923 Mon Sep 17 00:00:00 2001
From: Arjan van de Ven <arjan(a)linux.intel.com>
Date: Sun, 5 Aug 2012 09:55:42 -0700
Subject: [PATCH 1/4] Use AM_SILENT_RULES

AM_SILENT_RULES makes the output for "make" much more readable; it also
allows us to see warnings much more clearly.
---
 configure.ac |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/configure.ac b/configure.ac
index 552626c..d675616 100644
--- a/configure.ac
+++ b/configure.ac
@@ -11,6 +11,7 @@ AC_CONFIG_MACRO_DIR([m4])
 AC_CONFIG_HEADERS([config.h])
 GETTEXT_PACKAGE=3Dpowertop
 AC_SUBST(GETTEXT_PACKAGE)
+AM_SILENT_RULES([yes])
 AM_GNU_GETTEXT([external])
 AM_GNU_GETTEXT_VERSION([0.18])

-- =

1.7.7.6


--===============5248069999520878557==--

