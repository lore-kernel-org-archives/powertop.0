Content-Type: multipart/mixed; boundary="===============1200085161073821818=="
MIME-Version: 1.0
From: Jaroslav Skarvada <jskarvad at redhat.com>
Subject: [Powertop] powertop-2.8 Fedora compile fix
Date: Tue, 10 Nov 2015 10:01:43 -0500
Message-ID: <1583929279.7774917.1447167703465.JavaMail.zimbra@redhat.com>
In-Reply-To: 563BFD98.6010702@linux.intel.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============1200085161073821818==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi,

thanks for the powertop-2.8 release. In Fedora we have
ImplicitDSOLinking [1], so for pthreads usage it needs to link
with the -lpthread. But the included ax_pthread.m4 macro
find -pthreads CFLAGS, not LDFLAGS. From the GCC manual page:

> -pthreads
> Add support for multithreading using the POSIX threads library.
> This option sets flags for both the preprocessor and linker.

This means that you need to add the PTHREAD_CFLAGS in order to
compile powertop on systems with ImplicitDSOLinking and recent
GCC. The attached patch do it and fixed the problem for me in Fedora

thanks & regards

Jaroslav

[1] https://fedoraproject.org/wiki/Features/ChangeInImplicitDSOLinking

--===============1200085161073821818==
Content-Type: text/x-patch
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="powertop-2.8-pthreads-cflags-fix.patch"

ZGlmZiAtLWdpdCBhL3NyYy9NYWtlZmlsZS5hbSBiL3NyYy9NYWtlZmlsZS5hbQppbmRleCBkNzEz
MmMwLi44N2Q4NDY5IDEwMDY0NAotLS0gYS9zcmMvTWFrZWZpbGUuYW0KKysrIGIvc3JjL01ha2Vm
aWxlLmFtCkBAIC0xMzMsNyArMTMzLDggQEAgcG93ZXJ0b3BfQ1hYRkxBR1MgPSBcCiAJJChHTElC
Ml9DRkxBR1MpIFwKIAkkKExJQk5MX0NGTEFHUykgXAogCSQoTkNVUlNFU19DRkxBR1MpIFwKLQkk
KFBDSVVUSUxTX0NGTEFHUykKKwkkKFBDSVVUSUxTX0NGTEFHUykgXAorCSQoUFRIUkVBRF9DRkxB
R1MpCiAKIAogcG93ZXJ0b3BfQ1BQRkxBR1MgPSBcCkBAIC0xNDIsNyArMTQzLDggQEAgcG93ZXJ0
b3BfQ1BQRkxBR1MgPSBcCiAJJChMSUJOTF9DRkxBR1MpIFwKIAkkKExJQlpfQ0ZMQUdTKSBcCiAJ
JChOQ1VSU0VTX0NGTEFHUykgXAotCSQoUENJVVRJTFNfQ0ZMQUdTKQorCSQoUENJVVRJTFNfQ0ZM
QUdTKSBcCisJJChQVEhSRUFEX0NGTEFHUykKIAogcG93ZXJ0b3BfTERBREQgPSBcCiAJLi4vdHJh
Y2VldmVudC9saWJ0cmFjZWV2bmV0LmxhCg==

--===============1200085161073821818==--

