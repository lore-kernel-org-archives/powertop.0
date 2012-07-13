Content-Type: multipart/mixed; boundary="===============2657137484057038648=="
MIME-Version: 1.0
From: Rajagopal Venkat <rajagopal.venkat at linaro.org>
Subject: Re: [Powertop] [PATCH v3] conditionally disable pci if not supported
Date: Fri, 13 Jul 2012 12:05:31 +0530
Message-ID: <CA+Z25wX+sL99ZQhEFeysO6THfEh+7ciC_zhwTDw=C4W2ZrT8+Q@mail.gmail.com>
In-Reply-To: CAJ3BMm=++CxR52FHicG-u0wLjfciMAwpBNT_K2vL_TDNv3On6A@mail.gmail.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============2657137484057038648==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 13 July 2012 11:03, Ricardo Salveti <ricardo.salveti(a)linaro.org> wrote:

> On Fri, Jul 13, 2012 at 2:02 AM, Rajagopal Venkat
> <rajagopal.venkat(a)linaro.org> wrote:
> > Can someone consider this patch for merge?
>
> As we will have libpci available at most distros by default, isn't
> there a way of doing run-time detection instead of disabling it at
> build time?
>

This patch disables powertop PCI support only when libpci is not
available on a system. Nothing specific to ARM platforms.

I don't think it can be done at run-time. Without this patch if libpci
is not available, powertop compilation itself will fail.


> This is just because we'll be getting more and more ARM boards which
> have PCI-e as well, so we'll need to handle systems with and without
> any PCI available.
>
>
Cheers,
> --
> Ricardo Salveti de Araujo
>

--===============2657137484057038648==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PGJyPjxicj48ZGl2IGNsYXNzPSJnbWFpbF9xdW90ZSI+T24gMTMgSnVseSAyMDEyIDExOjAzLCBS
aWNhcmRvIFNhbHZldGkgPHNwYW4gZGlyPSJsdHIiPiZsdDs8YSBocmVmPSJtYWlsdG86cmljYXJk
by5zYWx2ZXRpQGxpbmFyby5vcmciIHRhcmdldD0iX2JsYW5rIj5yaWNhcmRvLnNhbHZldGlAbGlu
YXJvLm9yZzwvYT4mZ3Q7PC9zcGFuPiB3cm90ZTo8YnI+PGJsb2NrcXVvdGUgY2xhc3M9ImdtYWls
X3F1b3RlIiBzdHlsZT0ibWFyZ2luOjAgMCAwIC44ZXg7Ym9yZGVyLWxlZnQ6MXB4ICNjY2Mgc29s
aWQ7cGFkZGluZy1sZWZ0OjFleCI+CjxkaXYgY2xhc3M9ImltIj5PbiBGcmksIEp1bCAxMywgMjAx
MiBhdCAyOjAyIEFNLCBSYWphZ29wYWwgVmVua2F0PGJyPgombHQ7PGEgaHJlZj0ibWFpbHRvOnJh
amFnb3BhbC52ZW5rYXRAbGluYXJvLm9yZyI+cmFqYWdvcGFsLnZlbmthdEBsaW5hcm8ub3JnPC9h
PiZndDsgd3JvdGU6PGJyPgomZ3Q7IENhbiBzb21lb25lIGNvbnNpZGVyIHRoaXMgcGF0Y2ggZm9y
IG1lcmdlPzxicj4KPGJyPgo8L2Rpdj5BcyB3ZSB3aWxsIGhhdmUgbGlicGNpIGF2YWlsYWJsZSBh
dCBtb3N0IGRpc3Ryb3MgYnkgZGVmYXVsdCwgaXNuJiMzOTt0PGJyPgp0aGVyZSBhIHdheSBvZiBk
b2luZyBydW4tdGltZSBkZXRlY3Rpb24gaW5zdGVhZCBvZiBkaXNhYmxpbmcgaXQgYXQ8YnI+CmJ1
aWxkIHRpbWU/PGJyPgqgPC9ibG9ja3F1b3RlPjxkaXY+VGhpcyBwYXRjaCBkaXNhYmxlcyBwb3dl
cnRvcCBQQ0kgc3VwcG9ydCBvbmx5IHdoZW4gbGlicGNpIGlzIG5vdCA8YnI+YXZhaWxhYmxlIG9u
IGEgc3lzdGVtLiBOb3RoaW5nIHNwZWNpZmljIHRvIEFSTSBwbGF0Zm9ybXMuIDxicj48YnI+SSBk
b24mIzM5O3QgdGhpbmsgaXQgY2FuIGJlIGRvbmUgYXQgcnVuLXRpbWUuIFdpdGhvdXQgdGhpcyBw
YXRjaCBpZiBsaWJwY2k8YnI+CmlzIG5vdCBhdmFpbGFibGUsIHBvd2VydG9wIGNvbXBpbGF0aW9u
IGl0c2VsZiB3aWxsIGZhaWwuIDxicj6gPGJyPjwvZGl2PjxibG9ja3F1b3RlIGNsYXNzPSJnbWFp
bF9xdW90ZSIgc3R5bGU9Im1hcmdpbjowcHggMHB4IDBweCAwLjhleDtib3JkZXItbGVmdDoxcHgg
c29saWQgcmdiKDIwNCwyMDQsMjA0KTtwYWRkaW5nLWxlZnQ6MWV4Ij4KVGhpcyBpcyBqdXN0IGJl
Y2F1c2Ugd2UmIzM5O2xsIGJlIGdldHRpbmcgbW9yZSBhbmQgbW9yZSBBUk0gYm9hcmRzIHdoaWNo
PGJyPgpoYXZlIFBDSS1lIGFzIHdlbGwsIHNvIHdlJiMzOTtsbCBuZWVkIHRvIGhhbmRsZSBzeXN0
ZW1zIHdpdGggYW5kIHdpdGhvdXQ8YnI+CmFueSBQQ0kgYXZhaWxhYmxlLjxicj4KoKA8YnI+PC9i
bG9ja3F1b3RlPjxibG9ja3F1b3RlIGNsYXNzPSJnbWFpbF9xdW90ZSIgc3R5bGU9Im1hcmdpbjow
cHggMHB4IDBweCAwLjhleDtib3JkZXItbGVmdDoxcHggc29saWQgcmdiKDIwNCwyMDQsMjA0KTtw
YWRkaW5nLWxlZnQ6MWV4Ij4KQ2hlZXJzLDxicj4KPHNwYW4gY2xhc3M9IkhPRW5aYiI+PGZvbnQg
Y29sb3I9IiM4ODg4ODgiPi0tPGJyPgpSaWNhcmRvIFNhbHZldGkgZGUgQXJhdWpvPGJyPgo8L2Zv
bnQ+PC9zcGFuPjwvYmxvY2txdW90ZT48L2Rpdj48YnI+Cg==

--===============2657137484057038648==--

