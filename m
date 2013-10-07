Content-Type: multipart/mixed; boundary="===============7596391185828698366=="
MIME-Version: 1.0
From: Jaroslav Skarvada <jskarvad at redhat.com>
Subject: Re: [Powertop] patch: tell user if the system is running out of FDs
Date: Mon, 07 Oct 2013 09:12:38 -0400
Message-ID: <23016151.2470223.1381151558300.JavaMail.root@redhat.com>
In-Reply-To: 20130919204126.GB2307@swordfish
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============7596391185828698366==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



----- Original Message -----
> On (09/19/13 11:23), Jaroslav Skarvada wrote:
> > Hi,
> > =

> > complex servers can run out of FDs easily (due to perf).
> > In such case tell user that more FDs are needed instead
> > of the generic message (that kernel doesn't support
> > the perf)
> =

> Hello Jaroslav,
> Thank you for your patch.
> =

> Youquan Song proposed to change RLIMIT_NOFILE in "[PATCH] Fix running
> failure when > 69 CPUs for open file limitation" some time ago
> (v1 of the patch
> https://lists.01.org/pipermail/powertop/2013-May/000850.html)
> =

> after some thinking I've merged Youquan's patch to powertop2-next tree
> https://github.com/sergey-senozhatsky/powertop2-next/commit/4cbb957605818=
dc7e4b7932dafac0aad5ed0b87a
> =

> (not upstreamed yet).
> =

> while I don't really want to unlimit fds, at the same time from the user's
> point of view it'd better to handle it `transparently'. I think most like=
ly
> user
> will react with `ulimit -n unlimited' to any powertop rlimited fds messag=
e,
> since
> he/she really does not control (+does not care about) the number of opened
> fds.
> =

> thanks,
> 	-ss
> =


Hi,

I used Youquan's patch, but we have noticed that it can only overcome soft =
limits,
but not hard limits. E.g. on Fedora (and probably others) there is a soft l=
imit
of 1024 and a hard limit of 4096, so if powertop opens at least 15 file des=
criptors
per CPU, then this will fail on a system with >273 CPUs.

In case you think we can also temporally increase the hard limit (as we alr=
eady have
the privilege), the attached patch will do it. In case you think the hard l=
imits set by
the system administrator are untouchable (e.g. violation of system resource=
s hard limits
could result in a bad effects like explosion in a nuclear power plant :), t=
he
previously sent patch that fixes the error message needs to be also used

regards

Jaroslav

--===============7596391185828698366==
Content-Type: text/x-patch
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="powertop-2.4-unlimit-fds.patch"

ZGlmZiAtLWdpdCBhL3NyYy9tYWluLmNwcCBiL3NyYy9tYWluLmNwcAppbmRleCAwODgzNDI0Li5l
MGU4YTcxIDEwMDY0NAotLS0gYS9zcmMvbWFpbi5jcHAKKysrIGIvc3JjL21haW4uY3BwCkBAIC0z
Niw2ICszNiw4IEBACiAjaW5jbHVkZSA8Z2V0b3B0Lmg+CiAjaW5jbHVkZSA8dW5pc3RkLmg+CiAj
aW5jbHVkZSA8bG9jYWxlLmg+CisjaW5jbHVkZSA8c3lzL3Jlc291cmNlLmg+CisjaW5jbHVkZSA8
bGludXgvbGltaXRzLmg+CiAKICNpbmNsdWRlICJjcHUvY3B1LmgiCiAjaW5jbHVkZSAicHJvY2Vz
cy9wcm9jZXNzLmgiCkBAIC0yODMsMTEgKzI4NSwxNiBAQCBzdGF0aWMgdm9pZCBwb3dlcnRvcF9p
bml0KHZvaWQpCiAJc3RhdGljIGNoYXIgaW5pdGlhbGl6ZWQgPSAwOwogCWludCByZXQ7CiAJc3Ry
dWN0IHN0YXRmcyBzdF9mczsKKwlzdHJ1Y3QgcmxpbWl0IHJsbXQ7CiAKIAlpZiAoaW5pdGlhbGl6
ZWQpCiAJCXJldHVybjsKIAogCWNoZWNrcm9vdCgpOworCisJcmxtdC5ybGltX2N1ciA9IHJsbXQu
cmxpbV9tYXggPSBOUl9PUEVOOworCXNldHJsaW1pdCAoUkxJTUlUX05PRklMRSwgJnJsbXQpOwor
CiAJcmV0ID0gc3lzdGVtKCIvc2Jpbi9tb2Rwcm9iZSBjcHVmcmVxX3N0YXRzID4gL2Rldi9udWxs
IDI+JjEiKTsKIAlyZXQgPSBzeXN0ZW0oIi9zYmluL21vZHByb2JlIG1zciA+IC9kZXYvbnVsbCAy
PiYxIik7CiAJc3RhdGZzKCIvc3lzL2tlcm5lbC9kZWJ1ZyIsICZzdF9mcyk7Cg==

--===============7596391185828698366==--

