Content-Type: multipart/mixed; boundary="===============1392163414713275588=="
MIME-Version: 1.0
From: Alex <axfelix at gmail.com>
Subject: Re: [Powertop] corrupted double-linked list error on exit
Date: Fri, 20 Feb 2015 15:50:38 -0800
Message-ID: <1424476238.1591.6@smtp.gmail.com>
In-Reply-To: 39535.10.7.198.102.1424476058.squirrel@linux.intel.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============1392163414713275588==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

FYI, I'm also on Arch (I think I started this thread but I can't =

remember) and the issue has disappeared for me, I believe after =

updating from 3.18.2 to 3.18.3. Given that it's still appearing for =

some users it may not actually be related to the kernel, but your guess =

is as good as mine.

-alex

On Fri, 20 Feb, 2015 at 3:47 PM, Alexandra Yates =

<alexandra.yates(a)linux.intel.com> wrote:
> =

>> =

>>>  I'm seeing the same issue on 3.18.6-1-ARCH.
>>> =

>>>  [samer(a)archbox ~]$ sudo powertop --auto-tune
>>>  Loaded 34 prior measurements
>>>  Cannot load from file /var/cache/powertop/saved_parameters.powertop
>>>  RAPL device for cpu 0
>>>  RAPL Using PowerCap Sysfs : Domain Mask f
>>>  RAPL device for cpu 0
>>>  RAPL Using PowerCap Sysfs : Domain Mask f
>>>  RAPL device for cpu 0
>>>  RAPL Using PowerCap Sysfs : Domain Mask f
>>>  Devfreq not enabled
>>>  Cannot load from file /var/cache/powertop/saved_parameters.powertop
>>>     unknown op '{'
>>>  To show power estimates do 263 measurement(s) connected to battery
>>>  onlyLeaving PowerTOP
>>>  *** Error in `powertop': corrupted double-linked list:
>>>  0x0000000000fbceb0 ***
>>> =

>>>  Any idea what's causing this?
>>> =

>>>  _______________________________________________
>>>  PowerTop mailing list
>>>  PowerTop(a)lists.01.org
>>>  https://lists.01.org/mailman/listinfo/powertop
>>> =

> =

> =

>  Hi Samer,
> =

> Thank you for reporting this issue.  I'm not sure what is causing it. =

>  But
> I'm investigating, meanwhile. Can you give me more details on the =

> platform
> you are running?
> =

> Thank you,
>  Alexandra.
> =

> =

> Thank you,
> Alexandra.
> _______________________________________________
> PowerTop mailing list
> PowerTop(a)lists.01.org
> https://lists.01.org/mailman/listinfo/powertop

--===============1392163414713275588==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

RllJLCBJJ20gYWxzbyBvbiBBcmNoIChJIHRoaW5rIEkgc3RhcnRlZCB0aGlzIHRocmVhZCBidXQg
SSBjYW4ndCByZW1lbWJlcikgYW5kIHRoZSBpc3N1ZSBoYXMgZGlzYXBwZWFyZWQgZm9yIG1lLCBJ
IGJlbGlldmUgYWZ0ZXIgdXBkYXRpbmcgZnJvbSAzLjE4LjIgdG8gMy4xOC4zLiBHaXZlbiB0aGF0
IGl0J3Mgc3RpbGwgYXBwZWFyaW5nIGZvciBzb21lIHVzZXJzIGl0IG1heSBub3QgYWN0dWFsbHkg
YmUgcmVsYXRlZCB0byB0aGUga2VybmVsLCBidXQgeW91ciBndWVzcyBpcyBhcyBnb29kIGFzIG1p
bmUuPGJyPjxicj4tYWxleAoKPGJyPjxicj5PbiBGcmksIDIwIEZlYiwgMjAxNSBhdCAzOjQ3IFBN
LCBBbGV4YW5kcmEgWWF0ZXMgJmx0O2FsZXhhbmRyYS55YXRlc0BsaW51eC5pbnRlbC5jb20mZ3Q7
IHdyb3RlOjxicj4KPGJsb2NrcXVvdGUgdHlwZT0iY2l0ZSI+PGRpdiBjbGFzcz0icGxhaW50ZXh0
IiBzdHlsZT0id2hpdGUtc3BhY2U6IHByZS13cmFwOyI+CjxibG9ja3F1b3RlPgo8YmxvY2txdW90
ZT4gSSdtIHNlZWluZyB0aGUgc2FtZSBpc3N1ZSBvbiAzLjE4LjYtMS1BUkNILgoKIFtzYW1lckBh
cmNoYm94IH5dJCBzdWRvIHBvd2VydG9wIC0tYXV0by10dW5lCiBMb2FkZWQgMzQgcHJpb3IgbWVh
c3VyZW1lbnRzCiBDYW5ub3QgbG9hZCBmcm9tIGZpbGUgL3Zhci9jYWNoZS9wb3dlcnRvcC9zYXZl
ZF9wYXJhbWV0ZXJzLnBvd2VydG9wCiBSQVBMIGRldmljZSBmb3IgY3B1IDAKIFJBUEwgVXNpbmcg
UG93ZXJDYXAgU3lzZnMgOiBEb21haW4gTWFzayBmCiBSQVBMIGRldmljZSBmb3IgY3B1IDAKIFJB
UEwgVXNpbmcgUG93ZXJDYXAgU3lzZnMgOiBEb21haW4gTWFzayBmCiBSQVBMIGRldmljZSBmb3Ig
Y3B1IDAKIFJBUEwgVXNpbmcgUG93ZXJDYXAgU3lzZnMgOiBEb21haW4gTWFzayBmCiBEZXZmcmVx
IG5vdCBlbmFibGVkCiBDYW5ub3QgbG9hZCBmcm9tIGZpbGUgL3Zhci9jYWNoZS9wb3dlcnRvcC9z
YXZlZF9wYXJhbWV0ZXJzLnBvd2VydG9wCiAgICB1bmtub3duIG9wICd7JwogVG8gc2hvdyBwb3dl
ciBlc3RpbWF0ZXMgZG8gMjYzIG1lYXN1cmVtZW50KHMpIGNvbm5lY3RlZCB0byBiYXR0ZXJ5CiBv
bmx5TGVhdmluZyBQb3dlclRPUAogKioqIEVycm9yIGluIGBwb3dlcnRvcCc6IGNvcnJ1cHRlZCBk
b3VibGUtbGlua2VkIGxpc3Q6CiAweDAwMDAwMDAwMDBmYmNlYjAgKioqCgogQW55IGlkZWEgd2hh
dCdzIGNhdXNpbmcgdGhpcz8KCiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwogUG93ZXJUb3AgbWFpbGluZyBsaXN0CiA8YSBocmVmPSJtYWlsdG86UG93ZXJU
b3BAbGlzdHMuMDEub3JnIj5Qb3dlclRvcEBsaXN0cy4wMS5vcmc8L2E+CiA8YSBocmVmPSJodHRw
czovL2xpc3RzLjAxLm9yZy9tYWlsbWFuL2xpc3RpbmZvL3Bvd2VydG9wIj5odHRwczovL2xpc3Rz
LjAxLm9yZy9tYWlsbWFuL2xpc3RpbmZvL3Bvd2VydG9wPC9hPgoKPC9ibG9ja3F1b3RlPjwvYmxv
Y2txdW90ZT4KCiBIaSBTYW1lciwKClRoYW5rIHlvdSBmb3IgcmVwb3J0aW5nIHRoaXMgaXNzdWUu
ICBJJ20gbm90IHN1cmUgd2hhdCBpcyBjYXVzaW5nIGl0LiAgQnV0CkknbSBpbnZlc3RpZ2F0aW5n
LCBtZWFud2hpbGUuIENhbiB5b3UgZ2l2ZSBtZSBtb3JlIGRldGFpbHMgb24gdGhlIHBsYXRmb3Jt
CnlvdSBhcmUgcnVubmluZz8KClRoYW5rIHlvdSwKIEFsZXhhbmRyYS4KCgpUaGFuayB5b3UsCkFs
ZXhhbmRyYS4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
UG93ZXJUb3AgbWFpbGluZyBsaXN0CjxhIGhyZWY9Im1haWx0bzpQb3dlclRvcEBsaXN0cy4wMS5v
cmciPlBvd2VyVG9wQGxpc3RzLjAxLm9yZzwvYT4KPGEgaHJlZj0iaHR0cHM6Ly9saXN0cy4wMS5v
cmcvbWFpbG1hbi9saXN0aW5mby9wb3dlcnRvcCI+aHR0cHM6Ly9saXN0cy4wMS5vcmcvbWFpbG1h
bi9saXN0aW5mby9wb3dlcnRvcDwvYT4KPC9kaXY+PC9ibG9ja3F1b3RlPg==
--===============1392163414713275588==--

