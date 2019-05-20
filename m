Content-Type: multipart/mixed; boundary="===============2772946852480157089=="
MIME-Version: 1.0
From: Fabrice Fontaine <fontaine.fabrice at gmail.com>
Subject: [Powertop] [PATCH] wakeup_xxx.h: include limits.h
Date: Mon, 20 May 2019 20:44:17 +0200
Message-ID: <20190520184417.14922-1-fontaine.fabrice@gmail.com>
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============2772946852480157089==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

limits.h must be included to define PATH_MAX otherwise build will fail
on:

In file included from wakeup/wakeup_ethernet.cpp:45:0:
wakeup/wakeup_ethernet.h:35:16: error: 'PATH_MAX' was not declared in this =
scope
  char eth_path[PATH_MAX];

In file included from wakeup/wakeup_usb.cpp:45:0:
wakeup/wakeup_usb.h:35:16: error: 'PATH_MAX' was not declared in this scope
  char usb_path[PATH_MAX];

Fixes:
 - http://autobuild.buildroot.org/results/a0b3337cf4a827e6566f8b15b6bb180f0=
dcef7a3

Signed-off-by: Fabrice Fontaine <fontaine.fabrice(a)gmail.com>
---
 src/wakeup/wakeup_ethernet.h | 1 +
 src/wakeup/wakeup_usb.h      | 1 +
 2 files changed, 2 insertions(+)

diff --git a/src/wakeup/wakeup_ethernet.h b/src/wakeup/wakeup_ethernet.h
index 682bf95..e0fa628 100644
--- a/src/wakeup/wakeup_ethernet.h
+++ b/src/wakeup/wakeup_ethernet.h
@@ -25,6 +25,7 @@
 #ifndef _INCLUDE_GUARD_ETHERNET_WAKEUP_H
 #define _INCLUDE_GUARD_ETHERNET_WAKEUP_H
 =

+#include <limits.h>
 #include <vector>
 =

 #include "wakeup.h"
diff --git a/src/wakeup/wakeup_usb.h b/src/wakeup/wakeup_usb.h
index f7a1f7e..15898e3 100644
--- a/src/wakeup/wakeup_usb.h
+++ b/src/wakeup/wakeup_usb.h
@@ -25,6 +25,7 @@
 #ifndef _INCLUDE_GUARD_USB_WAKEUP_H
 #define _INCLUDE_GUARD_USB_WAKEUP_H
 =

+#include <limits.h>
 #include <vector>
 =

 #include "wakeup.h"
-- =

2.20.1


--===============2772946852480157089==--

