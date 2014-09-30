Content-Type: multipart/mixed; boundary="===============6408188698651774057=="
MIME-Version: 1.0
From: Nanley Chery <nanleychery at gmail.com>
Subject: Re: [Powertop] [PATCH 1/1] tunable: update sched_mc_power_savings
 target value
Date: Tue, 30 Sep 2014 17:16:25 -0400
Message-ID: <CAJDL4u+By5Z76Z37g9uMVU4+U1a+ScOUf03VyW+0O17J3YMrBg@mail.gmail.com>
In-Reply-To: 50901.10.24.5.188.1412012626.squirrel@linux.intel.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============6408188698651774057==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Alexandra,

Since we're going to require a later kernel, I think we should also remove
the line that adds the (currently broken) sysfs_tunable for this feature as
well.

Cheers,
Nanley

On Mon, Sep 29, 2014 at 1:43 PM, Alexandra Yates <
alexandra.yates(a)linux.intel.com> wrote:

>
> > On Fri, Aug 22, 2014 at 9:10 PM, Alexandra Yates <
> > alexandra.yates(a)linux.intel.com> wrote:
> >
> >>
> >> > On Tue, Aug 19, 2014 at 7:49 AM, Sergey Senozhatsky <
> >> > sergey.senozhatsky(a)gmail.com> wrote:
> >> >
> >> >> On (08/13/14 21:28), Nanley Chery wrote:
> >> >> > Starting in kernel 2.6.29, the highest power savings level
> >> increased
> >> >> to
> >> >> "2".
> >> >> > However, in kernel 3.5, the sched power savings feature was remov=
ed
> >> >> altogether.
> >> >>
> >> >> hello,
> >> >> thanks for reporting,
> >> >>
> >> >>
> >> >> so, it's been removed 2 years ago (3.5 release date was 21 Jul 2012=
).
> >> >>
> >> >> do we need to support it at all?
> >> >
> >> >
> >> > Hello,
> >> >
> >> > Good question. Our README file indicates linux-kernel >=3D 2.6.38 to=
 be
> >> a
> >> > build requirement. Does this mean we support power management featur=
es
> >> > starting from that kernel? Or does it mean that this is only a build
> >> > requirement and we target the latest kernels? It is not clear from t=
he
> >> > current documentation.
> >> >
> >> > On a much smaller scope, supporting this feature is essentially free
> >> > (maintenance-wise) and would keep some of our end users on older
> >> kernels
> >> > happy. Btw, I submitted a simpler version 2 of this patch that does
> >> not
> >> > check for the kernel version.
> >> >
> >> > Thanks,
> >> > Nanley
> >> > _______________________________________________
> >> > PowerTop mailing list
> >> > PowerTop(a)lists.01.org
> >> > https://lists.01.org/mailman/listinfo/powertop
> >> >
> >>
> >> From PowerTOP 2.0 and up the requirement is to run at least Linux kern=
el
> >> 2.6.38. If it is not in the supported kernel then PowerTOP does not ne=
ed
> >> it.
> >>
> >> Thank you,
> >> Alexandra.
> >>
> >
> > Since we're supporting kernels starting from 2.6.38 (which has this pow=
er
> > management feature itself), please consider this patch which produces t=
he
> > correct behavior.
> >
> > Thanks,
> > Nanley
> >
>
> Hi Nanley,
>
> Thank you for your patch.  However, since this feature was faced out the
> kernel over two years ago it doesn't make sense to add it now to PowerTOP.
> I will update the release notes to use a later kernel.  Please excuse the
> confusion.
>
> Thank you,
> Alexandra.
>
>

--===============6408188698651774057==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PGRpdiBkaXI9Imx0ciI+SGkgQWxleGFuZHJhLDxkaXY+PGJyPjwvZGl2PjxkaXY+U2luY2Ugd2Um
IzM5O3JlIGdvaW5nIHRvIHJlcXVpcmUgYSBsYXRlciBrZXJuZWwsIEkgdGhpbmsgd2Ugc2hvdWxk
IGFsc28gcmVtb3ZlIHRoZSBsaW5lIHRoYXQgYWRkcyB0aGUgKGN1cnJlbnRseSBicm9rZW4pwqA8
c3BhbiBzdHlsZT0iY29sb3I6cmdiKDAsMCwwKTt3aGl0ZS1zcGFjZTpwcmUtd3JhcCI+c3lzZnNf
dHVuYWJsZSBmb3IgdGhpcyBmZWF0dXJlIGFzIHdlbGwuPC9zcGFuPjwvZGl2PjxkaXY+PHNwYW4g
c3R5bGU9ImNvbG9yOnJnYigwLDAsMCk7d2hpdGUtc3BhY2U6cHJlLXdyYXAiPjxicj48L3NwYW4+
PC9kaXY+PGRpdj48c3BhbiBzdHlsZT0iY29sb3I6cmdiKDAsMCwwKTt3aGl0ZS1zcGFjZTpwcmUt
d3JhcCI+Q2hlZXJzLDwvc3Bhbj48L2Rpdj48ZGl2PjxzcGFuIHN0eWxlPSJjb2xvcjpyZ2IoMCww
LDApO3doaXRlLXNwYWNlOnByZS13cmFwIj5OYW5sZXk8L3NwYW4+PC9kaXY+PC9kaXY+PGRpdiBj
bGFzcz0iZ21haWxfZXh0cmEiPjxicj48ZGl2IGNsYXNzPSJnbWFpbF9xdW90ZSI+T24gTW9uLCBT
ZXAgMjksIDIwMTQgYXQgMTo0MyBQTSwgQWxleGFuZHJhIFlhdGVzIDxzcGFuIGRpcj0ibHRyIj4m
bHQ7PGEgaHJlZj0ibWFpbHRvOmFsZXhhbmRyYS55YXRlc0BsaW51eC5pbnRlbC5jb20iIHRhcmdl
dD0iX2JsYW5rIj5hbGV4YW5kcmEueWF0ZXNAbGludXguaW50ZWwuY29tPC9hPiZndDs8L3NwYW4+
IHdyb3RlOjxicj48YmxvY2txdW90ZSBjbGFzcz0iZ21haWxfcXVvdGUiIHN0eWxlPSJtYXJnaW46
MCAwIDAgLjhleDtib3JkZXItbGVmdDoxcHggI2NjYyBzb2xpZDtwYWRkaW5nLWxlZnQ6MWV4Ij48
ZGl2IGNsYXNzPSJIT0VuWmIiPjxkaXYgY2xhc3M9Img1Ij48YnI+CiZndDsgT24gRnJpLCBBdWcg
MjIsIDIwMTQgYXQgOToxMCBQTSwgQWxleGFuZHJhIFlhdGVzICZsdDs8YnI+CiZndDsgPGEgaHJl
Zj0ibWFpbHRvOmFsZXhhbmRyYS55YXRlc0BsaW51eC5pbnRlbC5jb20iPmFsZXhhbmRyYS55YXRl
c0BsaW51eC5pbnRlbC5jb208L2E+Jmd0OyB3cm90ZTo8YnI+CiZndDs8YnI+CiZndDsmZ3Q7PGJy
PgomZ3Q7Jmd0OyAmZ3Q7IE9uIFR1ZSwgQXVnIDE5LCAyMDE0IGF0IDc6NDkgQU0sIFNlcmdleSBT
ZW5vemhhdHNreSAmbHQ7PGJyPgomZ3Q7Jmd0OyAmZ3Q7IDxhIGhyZWY9Im1haWx0bzpzZXJnZXku
c2Vub3poYXRza3lAZ21haWwuY29tIj5zZXJnZXkuc2Vub3poYXRza3lAZ21haWwuY29tPC9hPiZn
dDsgd3JvdGU6PGJyPgomZ3Q7Jmd0OyAmZ3Q7PGJyPgomZ3Q7Jmd0OyAmZ3Q7Jmd0OyBPbiAoMDgv
MTMvMTQgMjE6MjgpLCBOYW5sZXkgQ2hlcnkgd3JvdGU6PGJyPgomZ3Q7Jmd0OyAmZ3Q7Jmd0OyAm
Z3Q7IFN0YXJ0aW5nIGluIGtlcm5lbCAyLjYuMjksIHRoZSBoaWdoZXN0IHBvd2VyIHNhdmluZ3Mg
bGV2ZWw8YnI+CiZndDsmZ3Q7IGluY3JlYXNlZDxicj4KJmd0OyZndDsgJmd0OyZndDsgdG88YnI+
CiZndDsmZ3Q7ICZndDsmZ3Q7ICZxdW90OzImcXVvdDsuPGJyPgomZ3Q7Jmd0OyAmZ3Q7Jmd0OyAm
Z3Q7IEhvd2V2ZXIsIGluIGtlcm5lbCAzLjUsIHRoZSBzY2hlZCBwb3dlciBzYXZpbmdzIGZlYXR1
cmUgd2FzIHJlbW92ZWQ8YnI+CiZndDsmZ3Q7ICZndDsmZ3Q7IGFsdG9nZXRoZXIuPGJyPgomZ3Q7
Jmd0OyAmZ3Q7Jmd0Ozxicj4KJmd0OyZndDsgJmd0OyZndDsgaGVsbG8sPGJyPgomZ3Q7Jmd0OyAm
Z3Q7Jmd0OyB0aGFua3MgZm9yIHJlcG9ydGluZyw8YnI+CiZndDsmZ3Q7ICZndDsmZ3Q7PGJyPgom
Z3Q7Jmd0OyAmZ3Q7Jmd0Ozxicj4KJmd0OyZndDsgJmd0OyZndDsgc28sIGl0JiMzOTtzIGJlZW4g
cmVtb3ZlZCAyIHllYXJzIGFnbyAoMy41IHJlbGVhc2UgZGF0ZSB3YXMgMjEgSnVsIDIwMTIpLjxi
cj4KJmd0OyZndDsgJmd0OyZndDs8YnI+CiZndDsmZ3Q7ICZndDsmZ3Q7IGRvIHdlIG5lZWQgdG8g
c3VwcG9ydCBpdCBhdCBhbGw/PGJyPgomZ3Q7Jmd0OyAmZ3Q7PGJyPgomZ3Q7Jmd0OyAmZ3Q7PGJy
PgomZ3Q7Jmd0OyAmZ3Q7IEhlbGxvLDxicj4KJmd0OyZndDsgJmd0Ozxicj4KJmd0OyZndDsgJmd0
OyBHb29kIHF1ZXN0aW9uLiBPdXIgUkVBRE1FIGZpbGUgaW5kaWNhdGVzIGxpbnV4LWtlcm5lbCAm
Z3Q7PSAyLjYuMzggdG8gYmU8YnI+CiZndDsmZ3Q7IGE8YnI+CiZndDsmZ3Q7ICZndDsgYnVpbGQg
cmVxdWlyZW1lbnQuIERvZXMgdGhpcyBtZWFuIHdlIHN1cHBvcnQgcG93ZXIgbWFuYWdlbWVudCBm
ZWF0dXJlczxicj4KJmd0OyZndDsgJmd0OyBzdGFydGluZyBmcm9tIHRoYXQga2VybmVsPyBPciBk
b2VzIGl0IG1lYW4gdGhhdCB0aGlzIGlzIG9ubHkgYSBidWlsZDxicj4KJmd0OyZndDsgJmd0OyBy
ZXF1aXJlbWVudCBhbmQgd2UgdGFyZ2V0IHRoZSBsYXRlc3Qga2VybmVscz8gSXQgaXMgbm90IGNs
ZWFyIGZyb20gdGhlPGJyPgomZ3Q7Jmd0OyAmZ3Q7IGN1cnJlbnQgZG9jdW1lbnRhdGlvbi48YnI+
CiZndDsmZ3Q7ICZndDs8YnI+CiZndDsmZ3Q7ICZndDsgT24gYSBtdWNoIHNtYWxsZXIgc2NvcGUs
IHN1cHBvcnRpbmcgdGhpcyBmZWF0dXJlIGlzIGVzc2VudGlhbGx5IGZyZWU8YnI+CiZndDsmZ3Q7
ICZndDsgKG1haW50ZW5hbmNlLXdpc2UpIGFuZCB3b3VsZCBrZWVwIHNvbWUgb2Ygb3VyIGVuZCB1
c2VycyBvbiBvbGRlcjxicj4KJmd0OyZndDsga2VybmVsczxicj4KJmd0OyZndDsgJmd0OyBoYXBw
eS4gQnR3LCBJIHN1Ym1pdHRlZCBhIHNpbXBsZXIgdmVyc2lvbiAyIG9mIHRoaXMgcGF0Y2ggdGhh
dCBkb2VzPGJyPgomZ3Q7Jmd0OyBub3Q8YnI+CiZndDsmZ3Q7ICZndDsgY2hlY2sgZm9yIHRoZSBr
ZXJuZWwgdmVyc2lvbi48YnI+CiZndDsmZ3Q7ICZndDs8YnI+CiZndDsmZ3Q7ICZndDsgVGhhbmtz
LDxicj4KJmd0OyZndDsgJmd0OyBOYW5sZXk8YnI+CiZndDsmZ3Q7ICZndDsgX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX188YnI+CiZndDsmZ3Q7ICZndDsgUG93
ZXJUb3AgbWFpbGluZyBsaXN0PGJyPgomZ3Q7Jmd0OyAmZ3Q7IDxhIGhyZWY9Im1haWx0bzpQb3dl
clRvcEBsaXN0cy4wMS5vcmciPlBvd2VyVG9wQGxpc3RzLjAxLm9yZzwvYT48YnI+CiZndDsmZ3Q7
ICZndDsgPGEgaHJlZj0iaHR0cHM6Ly9saXN0cy4wMS5vcmcvbWFpbG1hbi9saXN0aW5mby9wb3dl
cnRvcCIgdGFyZ2V0PSJfYmxhbmsiPmh0dHBzOi8vbGlzdHMuMDEub3JnL21haWxtYW4vbGlzdGlu
Zm8vcG93ZXJ0b3A8L2E+PGJyPgomZ3Q7Jmd0OyAmZ3Q7PGJyPgomZ3Q7Jmd0Ozxicj4KJmd0OyZn
dDsgRnJvbSBQb3dlclRPUCAyLjAgYW5kIHVwIHRoZSByZXF1aXJlbWVudCBpcyB0byBydW4gYXQg
bGVhc3QgTGludXgga2VybmVsPGJyPgomZ3Q7Jmd0OyAyLjYuMzguIElmIGl0IGlzIG5vdCBpbiB0
aGUgc3VwcG9ydGVkIGtlcm5lbCB0aGVuIFBvd2VyVE9QIGRvZXMgbm90IG5lZWQ8YnI+CiZndDsm
Z3Q7IGl0Ljxicj4KJmd0OyZndDs8YnI+CiZndDsmZ3Q7IFRoYW5rIHlvdSw8YnI+CiZndDsmZ3Q7
IEFsZXhhbmRyYS48YnI+CiZndDsmZ3Q7PGJyPgomZ3Q7PGJyPgomZ3Q7IFNpbmNlIHdlJiMzOTty
ZSBzdXBwb3J0aW5nIGtlcm5lbHMgc3RhcnRpbmcgZnJvbSAyLjYuMzggKHdoaWNoIGhhcyB0aGlz
IHBvd2VyPGJyPgomZ3Q7IG1hbmFnZW1lbnQgZmVhdHVyZSBpdHNlbGYpLCBwbGVhc2UgY29uc2lk
ZXIgdGhpcyBwYXRjaCB3aGljaCBwcm9kdWNlcyB0aGU8YnI+CiZndDsgY29ycmVjdCBiZWhhdmlv
ci48YnI+CiZndDs8YnI+CiZndDsgVGhhbmtzLDxicj4KJmd0OyBOYW5sZXk8YnI+CiZndDs8YnI+
Cjxicj4KPC9kaXY+PC9kaXY+SGkgTmFubGV5LDxicj4KPGJyPgpUaGFuayB5b3UgZm9yIHlvdXIg
cGF0Y2guwqAgSG93ZXZlciwgc2luY2UgdGhpcyBmZWF0dXJlIHdhcyBmYWNlZCBvdXQgdGhlPGJy
PgprZXJuZWwgb3ZlciB0d28geWVhcnMgYWdvIGl0IGRvZXNuJiMzOTt0IG1ha2Ugc2Vuc2UgdG8g
YWRkIGl0IG5vdyB0byBQb3dlclRPUC48YnI+Ckkgd2lsbCB1cGRhdGUgdGhlIHJlbGVhc2Ugbm90
ZXMgdG8gdXNlIGEgbGF0ZXIga2VybmVsLsKgIFBsZWFzZSBleGN1c2UgdGhlPGJyPgpjb25mdXNp
b24uPGJyPgo8YnI+ClRoYW5rIHlvdSw8YnI+CkFsZXhhbmRyYS48YnI+Cjxicj4KPC9ibG9ja3F1
b3RlPjwvZGl2Pjxicj48L2Rpdj4K

--===============6408188698651774057==--

