Content-Type: multipart/mixed; boundary="===============4586200201809937702=="
MIME-Version: 1.0
From: Jaroslav Skarvada <jskarvad at redhat.com>
Subject: [Powertop] [PATCH] Fix vertical scrolling in powertop-2.10
Date: Thu, 21 Mar 2019 12:13:00 -0400
Message-ID: <718243314.14463242.1553184780440.JavaMail.zimbra@redhat.com>
In-Reply-To: 304227599.14463032.1553184675742.JavaMail.zimbra@redhat.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============4586200201809937702==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi,

it seems there is an regression in powertop-2.10 causing
that the vertical scrolling is not working, e.g. you cannot
scroll in the overview tab. The attached patch should fix it

thanks & regards

Jaroslav

--===============4586200201809937702==
Content-Type: text/x-patch
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="powertop-2.10-fix-vert-scrolling.patch"

ZGlmZiAtLWdpdCBhL3NyYy9kaXNwbGF5LmNwcCBiL3NyYy9kaXNwbGF5LmNwcAppbmRleCAwNzIy
N2M1Li43YjNhN2EyIDEwMDY0NAotLS0gYS9zcmMvZGlzcGxheS5jcHAKKysrIGIvc3JjL2Rpc3Bs
YXkuY3BwCkBAIC0yNDQsNyArMjQ0LDcgQEAgdm9pZCBjdXJzb3JfZG93bih2b2lkKQogCXcgPSB0
YWJfd2luZG93c1t0YWJfbmFtZXNbY3VycmVudF90YWJdXTsKIAlpZiAodykgewogCQlpZiAody0+
eXBhZF9wb3MgPCAxMDAwKSB7Ci0JCQlpZiAodGFiX25hbWVzW2N1cnJlbnRfdGFiXSA9PSAiVHVu
YWJsZXMiIHx8ICJXYWtlVXAiKSB7CisJCQlpZiAodGFiX25hbWVzW2N1cnJlbnRfdGFiXSA9PSAi
VHVuYWJsZXMiIHx8IHRhYl9uYW1lc1tjdXJyZW50X3RhYl0gPT0gIldha2VVcCIpIHsKIAkJICAg
ICAgICAgICAgICAgIGlmICgody0+Y3Vyc29yX3BvcyArIDcpID49IExJTkVTKSB7IAogCQkJCQlw
cmVmcmVzaCh3LT53aW4sICsrdy0+eXBhZF9wb3MsIHctPnhwYWRfcG9zLCAKIAkJCQkJCTEsIDAs
IExJTkVTIC0gMywgQ09MUyAtIDEpOwo=

--===============4586200201809937702==--

