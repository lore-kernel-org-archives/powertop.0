Content-Type: multipart/mixed; boundary="===============3400384603177747948=="
MIME-Version: 1.0
From: Igor Zhbanov <i.zhbanov at samsung.com>
Subject: [Powertop] Device list sort function bug
Date: Wed, 11 Jul 2012 10:11:16 +0400
Message-ID: <4FFD1904.7040804@samsung.com>
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============3400384603177747948==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello!

Sometimes PowerTOP dies with a Segmentation Fault while generating
the report. Little investigation shown that it dies while sorting
the device list. The problem is that comparison function devlist_sort
is incorrect.

The function should return true if first argument "preceeds" second.
But when strcmp() is used, it can return -1, 0 and 1. So both -1 and 1
values are silently converted to true, which is wrong. It confuses the sort=
()
function and it crosses boundary of array.

Here is the patch:
--8<--Cut-here-------------------------------------------------------------=
---
diff -purN powertop-il/src/devlist.cpp powertop-il-fix/src/devlist.cpp
--- powertop-il/src/devlist.cpp	2012-07-03 17:00:50.000000000 +0400
+++ powertop-il-fix/src/devlist.cpp	2012-07-03 20:01:05.896232845 +0400
@@ -273,7 +273,7 @@ static bool devlist_sort(struct devuser
  	if (i->pid !=3D j->pid)
  		return i->pid<  j->pid;

-	return strcmp(i->device, j->device);
+	return (strcmp(i->device, j->device)<  0);
  }

  static const char *dev_class(int line)
--8<-----------------------------------------------------------------------=
---

Thank you.

-- =

Best regards,
Igor Zhbanov,
Expert Software Engineer,
phone: +7 (495) 797 25 00 ext 3806
e-mail: i.zhbanov(a)samsung.com

ASWG, Moscow R&D center, Samsung Electronics
12 Dvintsev street, building 1
127018, Moscow, Russian Federation


--===============3400384603177747948==
Content-Type: text/x-diff
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="03-powertop-fix01.diff"

ZGlmZiAtcHVyTiBwb3dlcnRvcC1pbC9zcmMvZGV2bGlzdC5jcHAgcG93ZXJ0b3AtaWwtZml4L3Ny
Yy9kZXZsaXN0LmNwcAotLS0gcG93ZXJ0b3AtaWwvc3JjL2Rldmxpc3QuY3BwCTIwMTItMDctMDMg
MTc6MDA6NTAuMDAwMDAwMDAwICswNDAwCisrKyBwb3dlcnRvcC1pbC1maXgvc3JjL2Rldmxpc3Qu
Y3BwCTIwMTItMDctMDMgMjA6MDE6MDUuODk2MjMyODQ1ICswNDAwCkBAIC0yNzMsNyArMjczLDcg
QEAgc3RhdGljIGJvb2wgZGV2bGlzdF9zb3J0KHN0cnVjdCBkZXZ1c2VyCiAJaWYgKGktPnBpZCAh
PSBqLT5waWQpCiAJCXJldHVybiBpLT5waWQgPCBqLT5waWQ7CiAKLQlyZXR1cm4gc3RyY21wKGkt
PmRldmljZSwgai0+ZGV2aWNlKTsKKwlyZXR1cm4gKHN0cmNtcChpLT5kZXZpY2UsIGotPmRldmlj
ZSkgPCAwKTsKIH0KIAogc3RhdGljIGNvbnN0IGNoYXIgKmRldl9jbGFzcyhpbnQgbGluZSkK

--===============3400384603177747948==--

