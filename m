Content-Type: multipart/mixed; boundary="===============4087549555575756537=="
MIME-Version: 1.0
From: Nanley Chery <nanleychery at gmail.com>
Subject: Re: [Powertop] [PATCH 1/1] tunable: update sched_mc_power_savings
 target value
Date: Tue, 30 Sep 2014 22:56:15 -0400
Message-ID: <CAJDL4u+MvhyfNV_A=r-4VLwv77L_1=NV94L8X+N5z2bFL9MszA@mail.gmail.com>
In-Reply-To: 54150.10.24.2.106.1412117195.squirrel@linux.intel.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============4087549555575756537==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 30, 2014 at 6:46 PM, Alexandra Yates <
alexandra.yates(a)linux.intel.com> wrote:

>
> > Hi Alexandra,
> >
> > Since we're going to require a later kernel, I think we should also
> remove
> > the line that adds the (currently broken) sysfs_tunable for this feature
> > as
> > well.
> >
> > Cheers,
> > Nanley
> >
> > On Mon, Sep 29, 2014 at 1:43 PM, Alexandra Yates <
> > alexandra.yates(a)linux.intel.com> wrote:
> >
> >>
> >> > On Fri, Aug 22, 2014 at 9:10 PM, Alexandra Yates <
> >> > alexandra.yates(a)linux.intel.com> wrote:
> >> >
> >> >>
> >> >> > On Tue, Aug 19, 2014 at 7:49 AM, Sergey Senozhatsky <
> >> >> > sergey.senozhatsky(a)gmail.com> wrote:
> >> >> >
> >> >> >> On (08/13/14 21:28), Nanley Chery wrote:
> >> >> >> > Starting in kernel 2.6.29, the highest power savings level
> >> >> increased
> >> >> >> to
> >> >> >> "2".
> >> >> >> > However, in kernel 3.5, the sched power savings feature was
> >> removed
> >> >> >> altogether.
> >> >> >>
> >> >> >> hello,
> >> >> >> thanks for reporting,
> >> >> >>
> >> >> >>
> >> >> >> so, it's been removed 2 years ago (3.5 release date was 21 Jul
> >> 2012).
> >> >> >>
> >> >> >> do we need to support it at all?
> >> >> >
> >> >> >
> >> >> > Hello,
> >> >> >
> >> >> > Good question. Our README file indicates linux-kernel >=3D 2.6.38=
 to
> >> be
> >> >> a
> >> >> > build requirement. Does this mean we support power management
> >> features
> >> >> > starting from that kernel? Or does it mean that this is only a
> >> build
> >> >> > requirement and we target the latest kernels? It is not clear from
> >> the
> >> >> > current documentation.
> >> >> >
> >> >> > On a much smaller scope, supporting this feature is essentially
> >> free
> >> >> > (maintenance-wise) and would keep some of our end users on older
> >> >> kernels
> >> >> > happy. Btw, I submitted a simpler version 2 of this patch that do=
es
> >> >> not
> >> >> > check for the kernel version.
> >> >> >
> >> >> > Thanks,
> >> >> > Nanley
> >> >> > _______________________________________________
> >> >> > PowerTop mailing list
> >> >> > PowerTop(a)lists.01.org
> >> >> > https://lists.01.org/mailman/listinfo/powertop
> >> >> >
> >> >>
> >> >> From PowerTOP 2.0 and up the requirement is to run at least Linux
> >> kernel
> >> >> 2.6.38. If it is not in the supported kernel then PowerTOP does not
> >> need
> >> >> it.
> >> >>
> >> >> Thank you,
> >> >> Alexandra.
> >> >>
> >> >
> >> > Since we're supporting kernels starting from 2.6.38 (which has this
> >> power
> >> > management feature itself), please consider this patch which produces
> >> the
> >> > correct behavior.
> >> >
> >> > Thanks,
> >> > Nanley
> >> >
> >>
> >> Hi Nanley,
> >>
> >> Thank you for your patch.  However, since this feature was faced out t=
he
> >> kernel over two years ago it doesn't make sense to add it now to
> >> PowerTOP.
> >> I will update the release notes to use a later kernel.  Please excuse
> >> the
> >> confusion.
> >>
> >> Thank you,
> >> Alexandra.
> >>
> >>
> >
>
> This makes sense Nanley.  Since you have been working on this already,  Do
> you want to send a patch with this change?
>
> Sure, I just sent a patch with the change.

Cheers,
Nanley

--===============4087549555575756537==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PGRpdiBkaXI9Imx0ciI+PGRpdiBjbGFzcz0iZ21haWxfZXh0cmEiPjxkaXYgY2xhc3M9ImdtYWls
X3F1b3RlIj5PbiBUdWUsIFNlcCAzMCwgMjAxNCBhdCA2OjQ2IFBNLCBBbGV4YW5kcmEgWWF0ZXMg
PHNwYW4gZGlyPSJsdHIiPiZsdDs8YSBocmVmPSJtYWlsdG86YWxleGFuZHJhLnlhdGVzQGxpbnV4
LmludGVsLmNvbSIgdGFyZ2V0PSJfYmxhbmsiPmFsZXhhbmRyYS55YXRlc0BsaW51eC5pbnRlbC5j
b208L2E+Jmd0Ozwvc3Bhbj4gd3JvdGU6PGJyPjxibG9ja3F1b3RlIGNsYXNzPSJnbWFpbF9xdW90
ZSIgc3R5bGU9Im1hcmdpbjowIDAgMCAuOGV4O2JvcmRlci1sZWZ0OjFweCAjY2NjIHNvbGlkO3Bh
ZGRpbmctbGVmdDoxZXgiPjxkaXYgY2xhc3M9IkhPRW5aYiI+PGRpdiBjbGFzcz0iaDUiPjxicj4K
Jmd0OyBIaSBBbGV4YW5kcmEsPGJyPgomZ3Q7PGJyPgomZ3Q7IFNpbmNlIHdlJiMzOTtyZSBnb2lu
ZyB0byByZXF1aXJlIGEgbGF0ZXIga2VybmVsLCBJIHRoaW5rIHdlIHNob3VsZCBhbHNvIHJlbW92
ZTxicj4KJmd0OyB0aGUgbGluZSB0aGF0IGFkZHMgdGhlIChjdXJyZW50bHkgYnJva2VuKSBzeXNm
c190dW5hYmxlIGZvciB0aGlzIGZlYXR1cmU8YnI+CiZndDsgYXM8YnI+CiZndDsgd2VsbC48YnI+
CiZndDs8YnI+CiZndDsgQ2hlZXJzLDxicj4KJmd0OyBOYW5sZXk8YnI+CiZndDs8YnI+CiZndDsg
T24gTW9uLCBTZXAgMjksIDIwMTQgYXQgMTo0MyBQTSwgQWxleGFuZHJhIFlhdGVzICZsdDs8YnI+
CiZndDsgPGEgaHJlZj0ibWFpbHRvOmFsZXhhbmRyYS55YXRlc0BsaW51eC5pbnRlbC5jb20iPmFs
ZXhhbmRyYS55YXRlc0BsaW51eC5pbnRlbC5jb208L2E+Jmd0OyB3cm90ZTo8YnI+CiZndDs8YnI+
CiZndDsmZ3Q7PGJyPgomZ3Q7Jmd0OyAmZ3Q7IE9uIEZyaSwgQXVnIDIyLCAyMDE0IGF0IDk6MTAg
UE0sIEFsZXhhbmRyYSBZYXRlcyAmbHQ7PGJyPgomZ3Q7Jmd0OyAmZ3Q7IDxhIGhyZWY9Im1haWx0
bzphbGV4YW5kcmEueWF0ZXNAbGludXguaW50ZWwuY29tIj5hbGV4YW5kcmEueWF0ZXNAbGludXgu
aW50ZWwuY29tPC9hPiZndDsgd3JvdGU6PGJyPgomZ3Q7Jmd0OyAmZ3Q7PGJyPgomZ3Q7Jmd0OyAm
Z3Q7Jmd0Ozxicj4KJmd0OyZndDsgJmd0OyZndDsgJmd0OyBPbiBUdWUsIEF1ZyAxOSwgMjAxNCBh
dCA3OjQ5IEFNLCBTZXJnZXkgU2Vub3poYXRza3kgJmx0Ozxicj4KJmd0OyZndDsgJmd0OyZndDsg
Jmd0OyA8YSBocmVmPSJtYWlsdG86c2VyZ2V5LnNlbm96aGF0c2t5QGdtYWlsLmNvbSI+c2VyZ2V5
LnNlbm96aGF0c2t5QGdtYWlsLmNvbTwvYT4mZ3Q7IHdyb3RlOjxicj4KJmd0OyZndDsgJmd0OyZn
dDsgJmd0Ozxicj4KJmd0OyZndDsgJmd0OyZndDsgJmd0OyZndDsgT24gKDA4LzEzLzE0IDIxOjI4
KSwgTmFubGV5IENoZXJ5IHdyb3RlOjxicj4KJmd0OyZndDsgJmd0OyZndDsgJmd0OyZndDsgJmd0
OyBTdGFydGluZyBpbiBrZXJuZWwgMi42LjI5LCB0aGUgaGlnaGVzdCBwb3dlciBzYXZpbmdzIGxl
dmVsPGJyPgomZ3Q7Jmd0OyAmZ3Q7Jmd0OyBpbmNyZWFzZWQ8YnI+CiZndDsmZ3Q7ICZndDsmZ3Q7
ICZndDsmZ3Q7IHRvPGJyPgomZ3Q7Jmd0OyAmZ3Q7Jmd0OyAmZ3Q7Jmd0OyAmcXVvdDsyJnF1b3Q7
Ljxicj4KJmd0OyZndDsgJmd0OyZndDsgJmd0OyZndDsgJmd0OyBIb3dldmVyLCBpbiBrZXJuZWwg
My41LCB0aGUgc2NoZWQgcG93ZXIgc2F2aW5ncyBmZWF0dXJlIHdhczxicj4KJmd0OyZndDsgcmVt
b3ZlZDxicj4KJmd0OyZndDsgJmd0OyZndDsgJmd0OyZndDsgYWx0b2dldGhlci48YnI+CiZndDsm
Z3Q7ICZndDsmZ3Q7ICZndDsmZ3Q7PGJyPgomZ3Q7Jmd0OyAmZ3Q7Jmd0OyAmZ3Q7Jmd0OyBoZWxs
byw8YnI+CiZndDsmZ3Q7ICZndDsmZ3Q7ICZndDsmZ3Q7IHRoYW5rcyBmb3IgcmVwb3J0aW5nLDxi
cj4KJmd0OyZndDsgJmd0OyZndDsgJmd0OyZndDs8YnI+CiZndDsmZ3Q7ICZndDsmZ3Q7ICZndDsm
Z3Q7PGJyPgomZ3Q7Jmd0OyAmZ3Q7Jmd0OyAmZ3Q7Jmd0OyBzbywgaXQmIzM5O3MgYmVlbiByZW1v
dmVkIDIgeWVhcnMgYWdvICgzLjUgcmVsZWFzZSBkYXRlIHdhcyAyMSBKdWw8YnI+CiZndDsmZ3Q7
IDIwMTIpLjxicj4KJmd0OyZndDsgJmd0OyZndDsgJmd0OyZndDs8YnI+CiZndDsmZ3Q7ICZndDsm
Z3Q7ICZndDsmZ3Q7IGRvIHdlIG5lZWQgdG8gc3VwcG9ydCBpdCBhdCBhbGw/PGJyPgomZ3Q7Jmd0
OyAmZ3Q7Jmd0OyAmZ3Q7PGJyPgomZ3Q7Jmd0OyAmZ3Q7Jmd0OyAmZ3Q7PGJyPgomZ3Q7Jmd0OyAm
Z3Q7Jmd0OyAmZ3Q7IEhlbGxvLDxicj4KJmd0OyZndDsgJmd0OyZndDsgJmd0Ozxicj4KJmd0OyZn
dDsgJmd0OyZndDsgJmd0OyBHb29kIHF1ZXN0aW9uLiBPdXIgUkVBRE1FIGZpbGUgaW5kaWNhdGVz
IGxpbnV4LWtlcm5lbCAmZ3Q7PSAyLjYuMzggdG88YnI+CiZndDsmZ3Q7IGJlPGJyPgomZ3Q7Jmd0
OyAmZ3Q7Jmd0OyBhPGJyPgomZ3Q7Jmd0OyAmZ3Q7Jmd0OyAmZ3Q7IGJ1aWxkIHJlcXVpcmVtZW50
LiBEb2VzIHRoaXMgbWVhbiB3ZSBzdXBwb3J0IHBvd2VyIG1hbmFnZW1lbnQ8YnI+CiZndDsmZ3Q7
IGZlYXR1cmVzPGJyPgomZ3Q7Jmd0OyAmZ3Q7Jmd0OyAmZ3Q7IHN0YXJ0aW5nIGZyb20gdGhhdCBr
ZXJuZWw/IE9yIGRvZXMgaXQgbWVhbiB0aGF0IHRoaXMgaXMgb25seSBhPGJyPgomZ3Q7Jmd0OyBi
dWlsZDxicj4KJmd0OyZndDsgJmd0OyZndDsgJmd0OyByZXF1aXJlbWVudCBhbmQgd2UgdGFyZ2V0
IHRoZSBsYXRlc3Qga2VybmVscz8gSXQgaXMgbm90IGNsZWFyIGZyb208YnI+CiZndDsmZ3Q7IHRo
ZTxicj4KJmd0OyZndDsgJmd0OyZndDsgJmd0OyBjdXJyZW50IGRvY3VtZW50YXRpb24uPGJyPgom
Z3Q7Jmd0OyAmZ3Q7Jmd0OyAmZ3Q7PGJyPgomZ3Q7Jmd0OyAmZ3Q7Jmd0OyAmZ3Q7IE9uIGEgbXVj
aCBzbWFsbGVyIHNjb3BlLCBzdXBwb3J0aW5nIHRoaXMgZmVhdHVyZSBpcyBlc3NlbnRpYWxseTxi
cj4KJmd0OyZndDsgZnJlZTxicj4KJmd0OyZndDsgJmd0OyZndDsgJmd0OyAobWFpbnRlbmFuY2Ut
d2lzZSkgYW5kIHdvdWxkIGtlZXAgc29tZSBvZiBvdXIgZW5kIHVzZXJzIG9uIG9sZGVyPGJyPgom
Z3Q7Jmd0OyAmZ3Q7Jmd0OyBrZXJuZWxzPGJyPgomZ3Q7Jmd0OyAmZ3Q7Jmd0OyAmZ3Q7IGhhcHB5
LiBCdHcsIEkgc3VibWl0dGVkIGEgc2ltcGxlciB2ZXJzaW9uIDIgb2YgdGhpcyBwYXRjaCB0aGF0
IGRvZXM8YnI+CiZndDsmZ3Q7ICZndDsmZ3Q7IG5vdDxicj4KJmd0OyZndDsgJmd0OyZndDsgJmd0
OyBjaGVjayBmb3IgdGhlIGtlcm5lbCB2ZXJzaW9uLjxicj4KJmd0OyZndDsgJmd0OyZndDsgJmd0
Ozxicj4KJmd0OyZndDsgJmd0OyZndDsgJmd0OyBUaGFua3MsPGJyPgomZ3Q7Jmd0OyAmZ3Q7Jmd0
OyAmZ3Q7IE5hbmxleTxicj4KJmd0OyZndDsgJmd0OyZndDsgJmd0OyBfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXzxicj4KJmd0OyZndDsgJmd0OyZndDsgJmd0
OyBQb3dlclRvcCBtYWlsaW5nIGxpc3Q8YnI+CiZndDsmZ3Q7ICZndDsmZ3Q7ICZndDsgPGEgaHJl
Zj0ibWFpbHRvOlBvd2VyVG9wQGxpc3RzLjAxLm9yZyI+UG93ZXJUb3BAbGlzdHMuMDEub3JnPC9h
Pjxicj4KJmd0OyZndDsgJmd0OyZndDsgJmd0OyA8YSBocmVmPSJodHRwczovL2xpc3RzLjAxLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3Bvd2VydG9wIiB0YXJnZXQ9Il9ibGFuayI+aHR0cHM6Ly9saXN0
cy4wMS5vcmcvbWFpbG1hbi9saXN0aW5mby9wb3dlcnRvcDwvYT48YnI+CiZndDsmZ3Q7ICZndDsm
Z3Q7ICZndDs8YnI+CiZndDsmZ3Q7ICZndDsmZ3Q7PGJyPgomZ3Q7Jmd0OyAmZ3Q7Jmd0OyBGcm9t
IFBvd2VyVE9QIDIuMCBhbmQgdXAgdGhlIHJlcXVpcmVtZW50IGlzIHRvIHJ1biBhdCBsZWFzdCBM
aW51eDxicj4KJmd0OyZndDsga2VybmVsPGJyPgomZ3Q7Jmd0OyAmZ3Q7Jmd0OyAyLjYuMzguIElm
IGl0IGlzIG5vdCBpbiB0aGUgc3VwcG9ydGVkIGtlcm5lbCB0aGVuIFBvd2VyVE9QIGRvZXMgbm90
PGJyPgomZ3Q7Jmd0OyBuZWVkPGJyPgomZ3Q7Jmd0OyAmZ3Q7Jmd0OyBpdC48YnI+CiZndDsmZ3Q7
ICZndDsmZ3Q7PGJyPgomZ3Q7Jmd0OyAmZ3Q7Jmd0OyBUaGFuayB5b3UsPGJyPgomZ3Q7Jmd0OyAm
Z3Q7Jmd0OyBBbGV4YW5kcmEuPGJyPgomZ3Q7Jmd0OyAmZ3Q7Jmd0Ozxicj4KJmd0OyZndDsgJmd0
Ozxicj4KJmd0OyZndDsgJmd0OyBTaW5jZSB3ZSYjMzk7cmUgc3VwcG9ydGluZyBrZXJuZWxzIHN0
YXJ0aW5nIGZyb20gMi42LjM4ICh3aGljaCBoYXMgdGhpczxicj4KJmd0OyZndDsgcG93ZXI8YnI+
CiZndDsmZ3Q7ICZndDsgbWFuYWdlbWVudCBmZWF0dXJlIGl0c2VsZiksIHBsZWFzZSBjb25zaWRl
ciB0aGlzIHBhdGNoIHdoaWNoIHByb2R1Y2VzPGJyPgomZ3Q7Jmd0OyB0aGU8YnI+CiZndDsmZ3Q7
ICZndDsgY29ycmVjdCBiZWhhdmlvci48YnI+CiZndDsmZ3Q7ICZndDs8YnI+CiZndDsmZ3Q7ICZn
dDsgVGhhbmtzLDxicj4KJmd0OyZndDsgJmd0OyBOYW5sZXk8YnI+CiZndDsmZ3Q7ICZndDs8YnI+
CiZndDsmZ3Q7PGJyPgomZ3Q7Jmd0OyBIaSBOYW5sZXksPGJyPgomZ3Q7Jmd0Ozxicj4KJmd0OyZn
dDsgVGhhbmsgeW91IGZvciB5b3VyIHBhdGNoLsKgIEhvd2V2ZXIsIHNpbmNlIHRoaXMgZmVhdHVy
ZSB3YXMgZmFjZWQgb3V0IHRoZTxicj4KJmd0OyZndDsga2VybmVsIG92ZXIgdHdvIHllYXJzIGFn
byBpdCBkb2VzbiYjMzk7dCBtYWtlIHNlbnNlIHRvIGFkZCBpdCBub3cgdG88YnI+CiZndDsmZ3Q7
IFBvd2VyVE9QLjxicj4KJmd0OyZndDsgSSB3aWxsIHVwZGF0ZSB0aGUgcmVsZWFzZSBub3RlcyB0
byB1c2UgYSBsYXRlciBrZXJuZWwuwqAgUGxlYXNlIGV4Y3VzZTxicj4KJmd0OyZndDsgdGhlPGJy
PgomZ3Q7Jmd0OyBjb25mdXNpb24uPGJyPgomZ3Q7Jmd0Ozxicj4KJmd0OyZndDsgVGhhbmsgeW91
LDxicj4KJmd0OyZndDsgQWxleGFuZHJhLjxicj4KJmd0OyZndDs8YnI+CiZndDsmZ3Q7PGJyPgom
Z3Q7PGJyPgo8YnI+CjwvZGl2PjwvZGl2PlRoaXMgbWFrZXMgc2Vuc2UgTmFubGV5LsKgIFNpbmNl
IHlvdSBoYXZlIGJlZW4gd29ya2luZyBvbiB0aGlzIGFscmVhZHkswqAgRG88YnI+CnlvdSB3YW50
IHRvIHNlbmQgYSBwYXRjaCB3aXRoIHRoaXMgY2hhbmdlPzxicj4KPGJyPjwvYmxvY2txdW90ZT48
ZGl2PlN1cmUsIEkganVzdCBzZW50IGEgcGF0Y2ggd2l0aCB0aGUgY2hhbmdlLjwvZGl2PjxkaXY+
PGJyPjwvZGl2PjxkaXY+Q2hlZXJzLDwvZGl2PjxkaXY+TmFubGV5PC9kaXY+PC9kaXY+PC9kaXY+
PC9kaXY+Cg==

--===============4087549555575756537==--

