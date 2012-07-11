Content-Type: multipart/mixed; boundary="===============2335110553206159786=="
MIME-Version: 1.0
From: Igor Zhbanov <i.zhbanov at samsung.com>
Subject: Re: [Powertop] Device list sort function bug
Date: Wed, 11 Jul 2012 12:16:33 +0400
Message-ID: <4FFD3661.7020202@samsung.com>
In-Reply-To: 201207110955.10925.dl9pf@gmx.de
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============2335110553206159786==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

So here is the formatted version:

 From 5d284137a6035bab65717fbacd98423b96d862cf Mon Sep 17 00:00:00 2001
From: Igor Zhbanov<i.zhbanov(a)samsung.com>
Date: Wed, 11 Jul 2012 12:08:21 +0400
Subject: [PATCH] Device list sort function bug

Sometimes PowerTOP dies with a Segmentation Fault while generating
the report. Little investigation shown that it dies while sorting
the device list. The problem is that comparison function devlist_sort
is incorrect.

The function should return true if first argument "preceeds" second.
But when strcmp() is used, it can return -1, 0 and 1. So both -1 and 1
values are silently converted to true, which is wrong. It confuses the sort=
()
function and it crosses boundary of array.
---
  src/devlist.cpp |    2 +-
  1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/src/devlist.cpp b/src/devlist.cpp
index 93f2081..cd5b5d8 100644
--- a/src/devlist.cpp
+++ b/src/devlist.cpp
@@ -273,7 +273,7 @@ static bool devlist_sort(struct devuser * i, struct dev=
user * j)
  	if (i->pid !=3D j->pid)
  		return i->pid<  j->pid;

-	return strcmp(i->device, j->device);
+	return (strcmp(i->device, j->device)<  0);
  }

  static const char *dev_class(int line)
-- =

1.7.5.4

Jan-Simon M=C3=B6ller wrote:
> Yes, in an hour or so.
> Best,
> JS
> Am Mittwoch, 11. Juli 2012, 09:33:42 schrieb Sergey Senozhatsky:
>> On (07/11/12 10:11), Igor Zhbanov wrote:
>>> Sometimes PowerTOP dies with a Segmentation Fault while generating
>>> the report. Little investigation shown that it dies while sorting
>>> the device list. The problem is that comparison function devlist_sort
>>> is incorrect.
>>>
>>> The function should return true if first argument "preceeds" second.
>>> But when strcmp() is used, it can return -1, 0 and 1. So both -1 and 1
>>> values are silently converted to true, which is wrong. It confuses the
>>> sort() function and it crosses boundary of array.
>> Jan, could you please test this one?
>>
>> Thanks in advance,
>>
>> 	-ss
-- =

Best regards,
Igor Zhbanov,
Expert Software Engineer,
phone: +7 (495) 797 25 00 ext 3806
e-mail: i.zhbanov(a)samsung.com

ASWG, Moscow R&D center, Samsung Electronics
12 Dvintsev street, building 1
127018, Moscow, Russian Federation


--===============2335110553206159786==--

