Content-Type: multipart/mixed; boundary="===============5117837805900598361=="
MIME-Version: 1.0
From: Samer Masterson <samer at samertm.com>
Subject: Re: [Powertop] corrupted double-linked list error on exit
Date: Tue, 24 Feb 2015 02:26:47 -0800
Message-ID: <1424773607.11596.2@mail.samertm.com>
In-Reply-To: 1424476238.1591.6@smtp.gmail.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============5117837805900598361==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi,

I'm running on a Dell XPS 15 9530. The issue went away after I compiled =

powertop from source, so I'm not sure where to go from there.

-samer

On Fri, Feb 20, 2015 at 3:50 PM, Alex <axfelix(a)gmail.com> wrote:
> FYI, I'm also on Arch (I think I started this thread but I can't =

> remember) and the issue has disappeared for me, I believe after =

> updating from 3.18.2 to 3.18.3. Given that it's still appearing for =

> some users it may not actually be related to the kernel, but your =

> guess is as good as mine.
> =

> -alex
> =

> On Fri, 20 Feb, 2015 at 3:47 PM, Alexandra Yates =

> <alexandra.yates(a)linux.intel.com> wrote:
>> =

>>> =

>>>>  I'm seeing the same issue on 3.18.6-1-ARCH.
>>>> =

>>>>  [samer(a)archbox ~]$ sudo powertop --auto-tune
>>>>  Loaded 34 prior measurements
>>>>  Cannot load from file =

>>>> /var/cache/powertop/saved_parameters.powertop
>>>>  RAPL device for cpu 0
>>>>  RAPL Using PowerCap Sysfs : Domain Mask f
>>>>  RAPL device for cpu 0
>>>>  RAPL Using PowerCap Sysfs : Domain Mask f
>>>>  RAPL device for cpu 0
>>>>  RAPL Using PowerCap Sysfs : Domain Mask f
>>>>  Devfreq not enabled
>>>>  Cannot load from file =

>>>> /var/cache/powertop/saved_parameters.powertop
>>>>     unknown op '{'
>>>>  To show power estimates do 263 measurement(s) connected to battery
>>>>  onlyLeaving PowerTOP
>>>>  *** Error in `powertop': corrupted double-linked list:
>>>>  0x0000000000fbceb0 ***
>>>> =

>>>>  Any idea what's causing this?
>>>> =

>>>>  _______________________________________________
>>>>  PowerTop mailing list
>>>>  PowerTop(a)lists.01.org
>>>>  https://lists.01.org/mailman/listinfo/powertop
>>>> =

>> =

>> =

>>  Hi Samer,
>> =

>> Thank you for reporting this issue.  I'm not sure what is causing =

>> it.  But
>> I'm investigating, meanwhile. Can you give me more details on the =

>> platform
>> you are running?
>> =

>> Thank you,
>>  Alexandra.
>> =

>> =

>> Thank you,
>> Alexandra.
>> _______________________________________________
>> PowerTop mailing list
>> PowerTop(a)lists.01.org
>> https://lists.01.org/mailman/listinfo/powertop

--===============5117837805900598361==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

CgpIaSw8ZGl2Pjxicj48L2Rpdj48ZGl2PkknbSBydW5uaW5nIG9uIGEgRGVsbCBYUFMgMTUmbmJz
cDs5NTMwLiBUaGUgaXNzdWUgd2VudCBhd2F5IGFmdGVyIEkgY29tcGlsZWQgcG93ZXJ0b3AgZnJv
bSBzb3VyY2UsIHNvIEknbSBub3Qgc3VyZSB3aGVyZSB0byBnbyBmcm9tIHRoZXJlLjwvZGl2Pjxk
aXY+PGJyPjwvZGl2PjxkaXY+LXNhbWVyPC9kaXY+PGRpdj48YnI+PC9kaXY+T24gRnJpLCBGZWIg
MjAsIDIwMTUgYXQgMzo1MCBQTSwgQWxleCAmbHQ7YXhmZWxpeEBnbWFpbC5jb20mZ3Q7IHdyb3Rl
Ojxicj4KPGJsb2NrcXVvdGUgdHlwZT0iY2l0ZSI+RllJLCBJJ20gYWxzbyBvbiBBcmNoIChJIHRo
aW5rIEkgc3RhcnRlZCB0aGlzIHRocmVhZCBidXQgSSBjYW4ndCByZW1lbWJlcikgYW5kIHRoZSBp
c3N1ZSBoYXMgZGlzYXBwZWFyZWQgZm9yIG1lLCBJIGJlbGlldmUgYWZ0ZXIgdXBkYXRpbmcgZnJv
bSAzLjE4LjIgdG8gMy4xOC4zLiBHaXZlbiB0aGF0IGl0J3Mgc3RpbGwgYXBwZWFyaW5nIGZvciBz
b21lIHVzZXJzIGl0IG1heSBub3QgYWN0dWFsbHkgYmUgcmVsYXRlZCB0byB0aGUga2VybmVsLCBi
dXQgeW91ciBndWVzcyBpcyBhcyBnb29kIGFzIG1pbmUuPGJyPjxicj4tYWxleAoKPGJyPjxicj5P
biBGcmksIDIwIEZlYiwgMjAxNSBhdCAzOjQ3IFBNLCBBbGV4YW5kcmEgWWF0ZXMgJmx0O2FsZXhh
bmRyYS55YXRlc0BsaW51eC5pbnRlbC5jb20mZ3Q7IHdyb3RlOjxicj4KPGJsb2NrcXVvdGUgdHlw
ZT0iY2l0ZSI+PGRpdiBjbGFzcz0icGxhaW50ZXh0IiBzdHlsZT0id2hpdGUtc3BhY2U6IHByZS13
cmFwOyI+CjxibG9ja3F1b3RlPgo8YmxvY2txdW90ZT4gSSdtIHNlZWluZyB0aGUgc2FtZSBpc3N1
ZSBvbiAzLjE4LjYtMS1BUkNILgoKIFtzYW1lckBhcmNoYm94IH5dJCBzdWRvIHBvd2VydG9wIC0t
YXV0by10dW5lCiBMb2FkZWQgMzQgcHJpb3IgbWVhc3VyZW1lbnRzCiBDYW5ub3QgbG9hZCBmcm9t
IGZpbGUgL3Zhci9jYWNoZS9wb3dlcnRvcC9zYXZlZF9wYXJhbWV0ZXJzLnBvd2VydG9wCiBSQVBM
IGRldmljZSBmb3IgY3B1IDAKIFJBUEwgVXNpbmcgUG93ZXJDYXAgU3lzZnMgOiBEb21haW4gTWFz
ayBmCiBSQVBMIGRldmljZSBmb3IgY3B1IDAKIFJBUEwgVXNpbmcgUG93ZXJDYXAgU3lzZnMgOiBE
b21haW4gTWFzayBmCiBSQVBMIGRldmljZSBmb3IgY3B1IDAKIFJBUEwgVXNpbmcgUG93ZXJDYXAg
U3lzZnMgOiBEb21haW4gTWFzayBmCiBEZXZmcmVxIG5vdCBlbmFibGVkCiBDYW5ub3QgbG9hZCBm
cm9tIGZpbGUgL3Zhci9jYWNoZS9wb3dlcnRvcC9zYXZlZF9wYXJhbWV0ZXJzLnBvd2VydG9wCiAg
ICB1bmtub3duIG9wICd7JwogVG8gc2hvdyBwb3dlciBlc3RpbWF0ZXMgZG8gMjYzIG1lYXN1cmVt
ZW50KHMpIGNvbm5lY3RlZCB0byBiYXR0ZXJ5CiBvbmx5TGVhdmluZyBQb3dlclRPUAogKioqIEVy
cm9yIGluIGBwb3dlcnRvcCc6IGNvcnJ1cHRlZCBkb3VibGUtbGlua2VkIGxpc3Q6CiAweDAwMDAw
MDAwMDBmYmNlYjAgKioqCgogQW55IGlkZWEgd2hhdCdzIGNhdXNpbmcgdGhpcz8KCiBfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwogUG93ZXJUb3AgbWFpbGlu
ZyBsaXN0CiA8YSBocmVmPSJtYWlsdG86UG93ZXJUb3BAbGlzdHMuMDEub3JnIj5Qb3dlclRvcEBs
aXN0cy4wMS5vcmc8L2E+CiA8YSBocmVmPSJodHRwczovL2xpc3RzLjAxLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3Bvd2VydG9wIj5odHRwczovL2xpc3RzLjAxLm9yZy9tYWlsbWFuL2xpc3RpbmZvL3Bv
d2VydG9wPC9hPgoKPC9ibG9ja3F1b3RlPjwvYmxvY2txdW90ZT4KCiBIaSBTYW1lciwKClRoYW5r
IHlvdSBmb3IgcmVwb3J0aW5nIHRoaXMgaXNzdWUuICBJJ20gbm90IHN1cmUgd2hhdCBpcyBjYXVz
aW5nIGl0LiAgQnV0CkknbSBpbnZlc3RpZ2F0aW5nLCBtZWFud2hpbGUuIENhbiB5b3UgZ2l2ZSBt
ZSBtb3JlIGRldGFpbHMgb24gdGhlIHBsYXRmb3JtCnlvdSBhcmUgcnVubmluZz8KClRoYW5rIHlv
dSwKIEFsZXhhbmRyYS4KCgpUaGFuayB5b3UsCkFsZXhhbmRyYS4KX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KUG93ZXJUb3AgbWFpbGluZyBsaXN0CjxhIGhy
ZWY9Im1haWx0bzpQb3dlclRvcEBsaXN0cy4wMS5vcmciPlBvd2VyVG9wQGxpc3RzLjAxLm9yZzwv
YT4KPGEgaHJlZj0iaHR0cHM6Ly9saXN0cy4wMS5vcmcvbWFpbG1hbi9saXN0aW5mby9wb3dlcnRv
cCI+aHR0cHM6Ly9saXN0cy4wMS5vcmcvbWFpbG1hbi9saXN0aW5mby9wb3dlcnRvcDwvYT4KPC9k
aXY+PC9ibG9ja3F1b3RlPjwvYmxvY2txdW90ZT4=
--===============5117837805900598361==--

