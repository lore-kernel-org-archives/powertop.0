Content-Type: multipart/mixed; boundary="===============5843284232644633372=="
MIME-Version: 1.0
From: Nanley Chery <nanleychery at gmail.com>
Subject: Re: [Powertop] [PATCH 1/1] tunable: update sched_mc_power_savings
 target value
Date: Tue, 19 Aug 2014 14:21:02 -0400
Message-ID: <CAJDL4uL73EeF5MJPApcEkHirSS69kioYzHfu+evGT8DNyU9_eA@mail.gmail.com>
In-Reply-To: 20140819114924.GC2484@swordfish
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============5843284232644633372==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 19, 2014 at 7:49 AM, Sergey Senozhatsky <
sergey.senozhatsky(a)gmail.com> wrote:

> On (08/13/14 21:28), Nanley Chery wrote:
> > Starting in kernel 2.6.29, the highest power savings level increased to
> "2".
> > However, in kernel 3.5, the sched power savings feature was removed
> altogether.
>
> hello,
> thanks for reporting,
>
>
> so, it's been removed 2 years ago (3.5 release date was 21 Jul 2012).
>
> do we need to support it at all?


Hello,

Good question. Our README file indicates linux-kernel >=3D 2.6.38 to be a
build requirement. Does this mean we support power management features
starting from that kernel? Or does it mean that this is only a build
requirement and we target the latest kernels? It is not clear from the
current documentation.

On a much smaller scope, supporting this feature is essentially free
(maintenance-wise) and would keep some of our end users on older kernels
happy. Btw, I submitted a simpler version 2 of this patch that does not
check for the kernel version.

Thanks,
Nanley

--===============5843284232644633372==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PGRpdiBkaXI9Imx0ciI+PGRpdiBjbGFzcz0iZ21haWxfZXh0cmEiPjxkaXYgY2xhc3M9ImdtYWls
X3F1b3RlIj5PbiBUdWUsIEF1ZyAxOSwgMjAxNCBhdCA3OjQ5IEFNLCBTZXJnZXkgU2Vub3poYXRz
a3kgPHNwYW4gZGlyPSJsdHIiPiZsdDs8YSBocmVmPSJtYWlsdG86c2VyZ2V5LnNlbm96aGF0c2t5
QGdtYWlsLmNvbSIgdGFyZ2V0PSJfYmxhbmsiPnNlcmdleS5zZW5vemhhdHNreUBnbWFpbC5jb208
L2E+Jmd0Ozwvc3Bhbj4gd3JvdGU6PGJyPgo8YmxvY2txdW90ZSBjbGFzcz0iZ21haWxfcXVvdGUi
IHN0eWxlPSJtYXJnaW46MHB4IDBweCAwcHggMC44ZXg7Ym9yZGVyLWxlZnQtd2lkdGg6MXB4O2Jv
cmRlci1sZWZ0LWNvbG9yOnJnYigyMDQsMjA0LDIwNCk7Ym9yZGVyLWxlZnQtc3R5bGU6c29saWQ7
cGFkZGluZy1sZWZ0OjFleCI+PGRpdiBjbGFzcz0iIj5PbiAoMDgvMTMvMTQgMjE6MjgpLCBOYW5s
ZXkgQ2hlcnkgd3JvdGU6PGJyPgoKJmd0OyBTdGFydGluZyBpbiBrZXJuZWwgMi42LjI5LCB0aGUg
aGlnaGVzdCBwb3dlciBzYXZpbmdzIGxldmVsIGluY3JlYXNlZCB0byAmcXVvdDsyJnF1b3Q7Ljxi
cj4KJmd0OyBIb3dldmVyLCBpbiBrZXJuZWwgMy41LCB0aGUgc2NoZWQgcG93ZXIgc2F2aW5ncyBm
ZWF0dXJlIHdhcyByZW1vdmVkIGFsdG9nZXRoZXIuPGJyPgo8YnI+CjwvZGl2PmhlbGxvLDxicj4K
dGhhbmtzIGZvciByZXBvcnRpbmcsPGJyPgo8YnI+Cjxicj4Kc28sIGl0JiMzOTtzIGJlZW4gcmVt
b3ZlZCAyIHllYXJzIGFnbyAoMy41IHJlbGVhc2UgZGF0ZSB3YXMgMjEgSnVsIDIwMTIpLjxicj4K
PGJyPgpkbyB3ZSBuZWVkIHRvIHN1cHBvcnQgaXQgYXQgYWxsPzwvYmxvY2txdW90ZT48ZGl2PsKg
PC9kaXY+PGRpdiBjbGFzcz0iZ21haWxfZXh0cmEiPjxkaXYgY2xhc3M9ImdtYWlsX3F1b3RlIj48
ZGl2PkhlbGxvLDwvZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+R29vZCBxdWVzdGlvbi4gT3VyIFJF
QURNRSBmaWxlIGluZGljYXRlcyBsaW51eC1rZXJuZWwgJmd0Oz0gMi42LjM4IHRvIGJlIGEgYnVp
bGQgcmVxdWlyZW1lbnQuIERvZXMgdGhpcyBtZWFuIHdlIHN1cHBvcnQgcG93ZXIgbWFuYWdlbWVu
dCBmZWF0dXJlcyBzdGFydGluZyBmcm9tIHRoYXQga2VybmVsPyBPciBkb2VzIGl0IG1lYW4gdGhh
dCB0aGlzIGlzIG9ubHkgYSBidWlsZCByZXF1aXJlbWVudCBhbmQgd2UgdGFyZ2V0IHRoZSBsYXRl
c3Qga2VybmVscz8gSXQgaXMgbm90IGNsZWFyIGZyb20gdGhlIGN1cnJlbnQgZG9jdW1lbnRhdGlv
bi48L2Rpdj4KPGRpdj48YnI+PC9kaXY+PGRpdj5PbiBhIG11Y2ggc21hbGxlciBzY29wZSwgc3Vw
cG9ydGluZyB0aGlzIGZlYXR1cmUgaXMgZXNzZW50aWFsbHkgZnJlZSAobWFpbnRlbmFuY2Utd2lz
ZSkgYW5kIHdvdWxkIGtlZXAgc29tZSBvZiBvdXIgZW5kIHVzZXJzIG9uIG9sZGVyIGtlcm5lbHMg
aGFwcHkuIEJ0dywgSSBzdWJtaXR0ZWQgYSBzaW1wbGVyIHZlcnNpb24gMiBvZiB0aGlzIHBhdGNo
IHRoYXQgZG9lcyBub3QgY2hlY2sgZm9yIHRoZSBrZXJuZWwgdmVyc2lvbi48L2Rpdj4KPC9kaXY+
PGJyPjwvZGl2PjxkaXYgY2xhc3M9ImdtYWlsX2V4dHJhIj5UaGFua3MsPC9kaXY+PGRpdj5OYW5s
ZXnCoDwvZGl2PjwvZGl2PjwvZGl2PjwvZGl2Pgo=

--===============5843284232644633372==--

