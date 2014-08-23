Content-Type: multipart/mixed; boundary="===============1775710751789218872=="
MIME-Version: 1.0
From: Nanley Chery <nanleychery at gmail.com>
Subject: Re: [Powertop] [PATCH 1/1] tunable: update sched_mc_power_savings
 target value
Date: Sat, 23 Aug 2014 00:38:22 -0400
Message-ID: <CAJDL4uLZo9A4a_jAXKNGuLuQ+voS3TaUbr8Ljr+QaKb0TESdgQ@mail.gmail.com>
In-Reply-To: 58681.10.7.198.163.1408756247.squirrel@linux.intel.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============1775710751789218872==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 22, 2014 at 9:10 PM, Alexandra Yates <
alexandra.yates(a)linux.intel.com> wrote:

>
> > On Tue, Aug 19, 2014 at 7:49 AM, Sergey Senozhatsky <
> > sergey.senozhatsky(a)gmail.com> wrote:
> >
> >> On (08/13/14 21:28), Nanley Chery wrote:
> >> > Starting in kernel 2.6.29, the highest power savings level increased
> >> to
> >> "2".
> >> > However, in kernel 3.5, the sched power savings feature was removed
> >> altogether.
> >>
> >> hello,
> >> thanks for reporting,
> >>
> >>
> >> so, it's been removed 2 years ago (3.5 release date was 21 Jul 2012).
> >>
> >> do we need to support it at all?
> >
> >
> > Hello,
> >
> > Good question. Our README file indicates linux-kernel >=3D 2.6.38 to be=
 a
> > build requirement. Does this mean we support power management features
> > starting from that kernel? Or does it mean that this is only a build
> > requirement and we target the latest kernels? It is not clear from the
> > current documentation.
> >
> > On a much smaller scope, supporting this feature is essentially free
> > (maintenance-wise) and would keep some of our end users on older kernels
> > happy. Btw, I submitted a simpler version 2 of this patch that does not
> > check for the kernel version.
> >
> > Thanks,
> > Nanley
> > _______________________________________________
> > PowerTop mailing list
> > PowerTop(a)lists.01.org
> > https://lists.01.org/mailman/listinfo/powertop
> >
>
> From PowerTOP 2.0 and up the requirement is to run at least Linux kernel
> 2.6.38. If it is not in the supported kernel then PowerTOP does not need
> it.
>
> Thank you,
> Alexandra.
>

Since we're supporting kernels starting from 2.6.38 (which has this power
management feature itself), please consider this patch which produces the
correct behavior.

Thanks,
Nanley

--===============1775710751789218872==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PGRpdiBkaXI9Imx0ciI+PGRpdiBjbGFzcz0iZ21haWxfZXh0cmEiPjxkaXYgY2xhc3M9ImdtYWls
X3F1b3RlIj5PbiBGcmksIEF1ZyAyMiwgMjAxNCBhdCA5OjEwIFBNLCBBbGV4YW5kcmEgWWF0ZXMg
PHNwYW4gZGlyPSJsdHIiPiZsdDs8YSBocmVmPSJtYWlsdG86YWxleGFuZHJhLnlhdGVzQGxpbnV4
LmludGVsLmNvbSIgdGFyZ2V0PSJfYmxhbmsiPmFsZXhhbmRyYS55YXRlc0BsaW51eC5pbnRlbC5j
b208L2E+Jmd0Ozwvc3Bhbj4gd3JvdGU6PGJyPgo8YmxvY2txdW90ZSBjbGFzcz0iZ21haWxfcXVv
dGUiIHN0eWxlPSJtYXJnaW46MCAwIDAgLjhleDtib3JkZXItbGVmdDoxcHggI2NjYyBzb2xpZDtw
YWRkaW5nLWxlZnQ6MWV4Ij48ZGl2IGNsYXNzPSJIT0VuWmIiPjxkaXYgY2xhc3M9Img1Ij48YnI+
CiZndDsgT24gVHVlLCBBdWcgMTksIDIwMTQgYXQgNzo0OSBBTSwgU2VyZ2V5IFNlbm96aGF0c2t5
ICZsdDs8YnI+CiZndDsgPGEgaHJlZj0ibWFpbHRvOnNlcmdleS5zZW5vemhhdHNreUBnbWFpbC5j
b20iPnNlcmdleS5zZW5vemhhdHNreUBnbWFpbC5jb208L2E+Jmd0OyB3cm90ZTo8YnI+CiZndDs8
YnI+CiZndDsmZ3Q7IE9uICgwOC8xMy8xNCAyMToyOCksIE5hbmxleSBDaGVyeSB3cm90ZTo8YnI+
CiZndDsmZ3Q7ICZndDsgU3RhcnRpbmcgaW4ga2VybmVsIDIuNi4yOSwgdGhlIGhpZ2hlc3QgcG93
ZXIgc2F2aW5ncyBsZXZlbCBpbmNyZWFzZWQ8YnI+CiZndDsmZ3Q7IHRvPGJyPgomZ3Q7Jmd0OyAm
cXVvdDsyJnF1b3Q7Ljxicj4KJmd0OyZndDsgJmd0OyBIb3dldmVyLCBpbiBrZXJuZWwgMy41LCB0
aGUgc2NoZWQgcG93ZXIgc2F2aW5ncyBmZWF0dXJlIHdhcyByZW1vdmVkPGJyPgomZ3Q7Jmd0OyBh
bHRvZ2V0aGVyLjxicj4KJmd0OyZndDs8YnI+CiZndDsmZ3Q7IGhlbGxvLDxicj4KJmd0OyZndDsg
dGhhbmtzIGZvciByZXBvcnRpbmcsPGJyPgomZ3Q7Jmd0Ozxicj4KJmd0OyZndDs8YnI+CiZndDsm
Z3Q7IHNvLCBpdCYjMzk7cyBiZWVuIHJlbW92ZWQgMiB5ZWFycyBhZ28gKDMuNSByZWxlYXNlIGRh
dGUgd2FzIDIxIEp1bCAyMDEyKS48YnI+CiZndDsmZ3Q7PGJyPgomZ3Q7Jmd0OyBkbyB3ZSBuZWVk
IHRvIHN1cHBvcnQgaXQgYXQgYWxsPzxicj4KJmd0Ozxicj4KJmd0Ozxicj4KJmd0OyBIZWxsbyw8
YnI+CiZndDs8YnI+CiZndDsgR29vZCBxdWVzdGlvbi4gT3VyIFJFQURNRSBmaWxlIGluZGljYXRl
cyBsaW51eC1rZXJuZWwgJmd0Oz0gMi42LjM4IHRvIGJlIGE8YnI+CiZndDsgYnVpbGQgcmVxdWly
ZW1lbnQuIERvZXMgdGhpcyBtZWFuIHdlIHN1cHBvcnQgcG93ZXIgbWFuYWdlbWVudCBmZWF0dXJl
czxicj4KJmd0OyBzdGFydGluZyBmcm9tIHRoYXQga2VybmVsPyBPciBkb2VzIGl0IG1lYW4gdGhh
dCB0aGlzIGlzIG9ubHkgYSBidWlsZDxicj4KJmd0OyByZXF1aXJlbWVudCBhbmQgd2UgdGFyZ2V0
IHRoZSBsYXRlc3Qga2VybmVscz8gSXQgaXMgbm90IGNsZWFyIGZyb20gdGhlPGJyPgomZ3Q7IGN1
cnJlbnQgZG9jdW1lbnRhdGlvbi48YnI+CiZndDs8YnI+CiZndDsgT24gYSBtdWNoIHNtYWxsZXIg
c2NvcGUsIHN1cHBvcnRpbmcgdGhpcyBmZWF0dXJlIGlzIGVzc2VudGlhbGx5IGZyZWU8YnI+CiZn
dDsgKG1haW50ZW5hbmNlLXdpc2UpIGFuZCB3b3VsZCBrZWVwIHNvbWUgb2Ygb3VyIGVuZCB1c2Vy
cyBvbiBvbGRlciBrZXJuZWxzPGJyPgomZ3Q7IGhhcHB5LiBCdHcsIEkgc3VibWl0dGVkIGEgc2lt
cGxlciB2ZXJzaW9uIDIgb2YgdGhpcyBwYXRjaCB0aGF0IGRvZXMgbm90PGJyPgomZ3Q7IGNoZWNr
IGZvciB0aGUga2VybmVsIHZlcnNpb24uPGJyPgomZ3Q7PGJyPgomZ3Q7IFRoYW5rcyw8YnI+CiZn
dDsgTmFubGV5PGJyPgo8L2Rpdj48L2Rpdj48ZGl2IGNsYXNzPSIiPiZndDsgX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX188YnI+CiZndDsgUG93ZXJUb3AgbWFp
bGluZyBsaXN0PGJyPgomZ3Q7IDxhIGhyZWY9Im1haWx0bzpQb3dlclRvcEBsaXN0cy4wMS5vcmci
PlBvd2VyVG9wQGxpc3RzLjAxLm9yZzwvYT48YnI+CiZndDsgPGEgaHJlZj0iaHR0cHM6Ly9saXN0
cy4wMS5vcmcvbWFpbG1hbi9saXN0aW5mby9wb3dlcnRvcCIgdGFyZ2V0PSJfYmxhbmsiPmh0dHBz
Oi8vbGlzdHMuMDEub3JnL21haWxtYW4vbGlzdGluZm8vcG93ZXJ0b3A8L2E+PGJyPgomZ3Q7PGJy
Pgo8YnI+CjwvZGl2PkZyb20gUG93ZXJUT1AgMi4wIGFuZCB1cCB0aGUgcmVxdWlyZW1lbnQgaXMg
dG8gcnVuIGF0IGxlYXN0IExpbnV4IGtlcm5lbDxicj4KMi42LjM4LiBJZiBpdCBpcyBub3QgaW4g
dGhlIHN1cHBvcnRlZCBrZXJuZWwgdGhlbiBQb3dlclRPUCBkb2VzIG5vdCBuZWVkPGJyPgppdC48
YnI+Cjxicj4KVGhhbmsgeW91LDxicj4KQWxleGFuZHJhLjxicj48L2Jsb2NrcXVvdGU+PGRpdj7C
oDwvZGl2PjwvZGl2PlNpbmNlIHdlJiMzOTtyZSBzdXBwb3J0aW5nIGtlcm5lbHMgc3RhcnRpbmcg
ZnJvbSAyLjYuMzggKHdoaWNoIGhhcyB0aGlzIHBvd2VyIG1hbmFnZW1lbnQgZmVhdHVyZSBpdHNl
bGYpLCBwbGVhc2UgY29uc2lkZXIgdGhpcyBwYXRjaCB3aGljaCBwcm9kdWNlcyB0aGUgY29ycmVj
dCBiZWhhdmlvci48L2Rpdj4KPGRpdiBjbGFzcz0iZ21haWxfZXh0cmEiPjxicj48L2Rpdj48ZGl2
IGNsYXNzPSJnbWFpbF9leHRyYSI+VGhhbmtzLDwvZGl2PjxkaXYgY2xhc3M9ImdtYWlsX2V4dHJh
Ij5OYW5sZXk8L2Rpdj48L2Rpdj4K

--===============1775710751789218872==--

