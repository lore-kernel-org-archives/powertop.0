Content-Type: multipart/mixed; boundary="===============3415550252479657673=="
MIME-Version: 1.0
From: Jaroslav Skarvada <jskarvad at redhat.com>
Subject: [Powertop] Segfault on ppc64
Date: Tue, 04 Jun 2019 10:01:17 -0400
Message-ID: <1068529415.9789856.1559656877115.JavaMail.zimbra@redhat.com>
In-Reply-To: 1497495027.9778940.1559655311590.JavaMail.zimbra@redhat.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============3415550252479657673==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

PowerTOP crashes on ppc64 machine with 1 idle state, reproducer:
# powertop -t 1 --html

Parameters of the machine are attached.

It seems the problem is caused by the report_display_cpu_cstates()
function from the src/cpu/cpu.cpp file.

On https://github.com/fenrus75/powertop/blob/e8765b5475b22b7a2b6e9e8a031c68=
a268a0b0b3/src/cpu/cpu.cpp#L494
it allocates table 2x1, but the table should be 2x2 (header + 1 state), so =
it
later crashes on
https://github.com/fenrus75/powertop/blob/e8765b5475b22b7a2b6e9e8a031c68a26=
8a0b0b3/src/cpu/cpu.cpp#L580
where it tries to fill the table.

Unfortunately, the whole reporting code is quite unclear, so I am not sure =
how
to correctly fix it and not break anything else. The attached patch fixes
the problem for me, but it can have side-effects - feel free to propose
better fix

thanks & regards

Jaroslav


Machine parameters:

# cpupower idle-info
CPUidle driver: pseries_idle
CPUidle governor: menu
analyzing CPU 0:

Number of idle states: 1
Available idle states: Shared Cede
Shared Cede:
Flags/Description: Shared Cede
Latency: 0
Usage: 1188350
Duration: 14152220333

# cat /proc/cpuinfo
processor	: 0
cpu		: POWER8E (raw), altivec supported
clock		: 3425.000000MHz
revision	: 2.1 (pvr 004b 0201)

processor	: 1
cpu		: POWER8E (raw), altivec supported
clock		: 3425.000000MHz
revision	: 2.1 (pvr 004b 0201)

processor	: 2
cpu		: POWER8E (raw), altivec supported
clock		: 3425.000000MHz
revision	: 2.1 (pvr 004b 0201)

processor	: 3
cpu		: POWER8E (raw), altivec supported
clock		: 3425.000000MHz
revision	: 2.1 (pvr 004b 0201)

processor	: 4
cpu		: POWER8E (raw), altivec supported
clock		: 3425.000000MHz
revision	: 2.1 (pvr 004b 0201)

processor	: 5
cpu		: POWER8E (raw), altivec supported
clock		: 3425.000000MHz
revision	: 2.1 (pvr 004b 0201)

processor	: 6
cpu		: POWER8E (raw), altivec supported
clock		: 3425.000000MHz
revision	: 2.1 (pvr 004b 0201)

processor	: 7
cpu		: POWER8E (raw), altivec supported
clock		: 3425.000000MHz
revision	: 2.1 (pvr 004b 0201)

timebase	: 512000000
platform	: pSeries
model		: IBM pSeries (emulated by qemu)
machine		: CHRP IBM pSeries (emulated by qemu)

--===============3415550252479657673==
Content-Type: text/x-patch
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="powertop-2.10-ppc64-crash-fix.patch"

ZGlmZiAtLWdpdCBhL3NyYy9jcHUvY3B1LmNwcCBiL3NyYy9jcHUvY3B1LmNwcAppbmRleCAyOGFm
YzRmLi4wNjNmMmNhIDEwMDY0NAotLS0gYS9zcmMvY3B1L2NwdS5jcHAKKysrIGIvc3JjL2NwdS9j
cHUuY3BwCkBAIC00ODksNyArNDg5LDcgQEAgdm9pZCByZXBvcnRfZGlzcGxheV9jcHVfY3N0YXRl
cyh2b2lkKQogCQlzdHJpbmcgKnBrZ19kYXRhID0gbmV3IHN0cmluZ1twa2dfdGJsX3NpemUuY29s
cyAqIHBrZ190Ymxfc2l6ZS5yb3dzXTsKIAogCQljb3JlX3RibF9zaXplLmNvbHM9MjsKLQkJY29y
ZV90Ymxfc2l6ZS5yb3dzPShjc3RhdGVzX251bSAqX3BhY2thZ2UtPmNoaWxkcmVuLnNpemUoKSkK
KwkJY29yZV90Ymxfc2l6ZS5yb3dzPSgoY3N0YXRlc19udW0gKyAxKSAqIF9wYWNrYWdlLT5jaGls
ZHJlbi5zaXplKCkpCiAJCQkJKyBfcGFja2FnZS0+Y2hpbGRyZW4uc2l6ZSgpOwogCQlzdHJpbmcg
KmNvcmVfZGF0YSA9IG5ldyBzdHJpbmdbY29yZV90Ymxfc2l6ZS5jb2xzICogY29yZV90Ymxfc2l6
ZS5yb3dzXTsKIAkJaW50IG51bV9jcHVzPTAsIG51bV9jb3Jlcz0wOwo=

--===============3415550252479657673==--

