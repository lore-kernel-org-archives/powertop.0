Content-Type: multipart/mixed; boundary="===============7553862953038117042=="
MIME-Version: 1.0
From: Rajagopal Venkat <rajagopal.venkat at linaro.org>
Subject: Re: [Powertop] [PATCH 2/4] Make the "which C state line" logic better
Date: Mon, 06 Aug 2012 18:58:43 +0530
Message-ID: <CA+Z25wXVuuj9Q+VmJLqLPtkrNSddeyiSpv75qxpOhrX+Gyam8Q@mail.gmail.com>
In-Reply-To: 501FC50A.2060503@linux.intel.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============7553862953038117042==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 6 August 2012 18:52, Arjan van de Ven <arjan(a)linux.intel.com> wrote:

> On 8/6/2012 12:19 AM, Rajagopal Venkat wrote:
> >
> > On 5 August 2012 22:43, Arjan van de Ven <arjan(a)linux.intel.com <mail=
to:
> arjan(a)linux.intel.com>> wrote:
> >
> >     From 2e88a61859db0592707d1a0a35e33408a0327951 Mon Sep 17 00:00:00
> 2001
> >     From: Arjan van de Ven <arjan(a)linux.intel.com <mailto:
> arjan(a)linux.intel.com>>
> >     Date: Sun, 5 Aug 2012 09:57:49 -0700
> >     Subject: [PATCH 2/4] Make the "which C state line" logic better
> >
> >     the ARM guys complained that their human-readable C state names
> didn't have
> >     numbers in them, and that as a result, the output is all messed up.
> >     Using the "linux_name" instead is only a partial solution; it messes
> up the x86
> >     side of the logic.
> >
> >
> > I fail to understand how using "linux_name" for parsing C states would
> mess up
> > x86 logic. Each supported C state will have corresponding 'stateX'
> directory
> > (linux_name) which contain numbers in them. Also there are few hard cod=
ed
> > states in intel_cpus.cpp file, in which linux_name contains numbers in
> them
> > as well. In both the cases linux_name contains numbers and hence safe to
> > parse. Please let me know if I am missing something here.
>
> it contains numbers, but not the right ones
> so on x86, the package, core and cpu states do not line up properly if I
> only use linux_name.
> (e.g. package C6 and core C6 are on a different line than CPU C6)
> with this patch that is kept correctly, while hopefully also fixing your
> issue.
>
>
Ok. Thanks for the clarification. Yes, this patch fixes my problem as well.

-- =

Regards,
Rajagopal

--===============7553862953038117042==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PGJyPjxicj48ZGl2IGNsYXNzPSJnbWFpbF9xdW90ZSI+T24gNiBBdWd1c3QgMjAxMiAxODo1Miwg
QXJqYW4gdmFuIGRlIFZlbiA8c3BhbiBkaXI9Imx0ciI+Jmx0OzxhIGhyZWY9Im1haWx0bzphcmph
bkBsaW51eC5pbnRlbC5jb20iIHRhcmdldD0iX2JsYW5rIj5hcmphbkBsaW51eC5pbnRlbC5jb208
L2E+Jmd0Ozwvc3Bhbj4gd3JvdGU6PGJyPjxibG9ja3F1b3RlIGNsYXNzPSJnbWFpbF9xdW90ZSIg
c3R5bGU9Im1hcmdpbjowIDAgMCAuOGV4O2JvcmRlci1sZWZ0OjFweCAjY2NjIHNvbGlkO3BhZGRp
bmctbGVmdDoxZXgiPgpPbiA4LzYvMjAxMiAxMjoxOSBBTSwgUmFqYWdvcGFsIFZlbmthdCB3cm90
ZTo8YnI+CjxkaXYgY2xhc3M9ImltIj4mZ3Q7PGJyPgomZ3Q7IE9uIDUgQXVndXN0IDIwMTIgMjI6
NDMsIEFyamFuIHZhbiBkZSBWZW4gJmx0OzxhIGhyZWY9Im1haWx0bzphcmphbkBsaW51eC5pbnRl
bC5jb20iPmFyamFuQGxpbnV4LmludGVsLmNvbTwvYT4gJmx0O21haWx0bzo8YSBocmVmPSJtYWls
dG86YXJqYW5AbGludXguaW50ZWwuY29tIj5hcmphbkBsaW51eC5pbnRlbC5jb208L2E+Jmd0OyZn
dDsgd3JvdGU6PGJyPgomZ3Q7PGJyPgomZ3Q7IKAgoCBGcm9tIDJlODhhNjE4NTlkYjA1OTI3MDdk
MWEwYTM1ZTMzNDA4YTAzMjc5NTEgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxPGJyPgo8L2Rpdj4m
Z3Q7IKAgoCBGcm9tOiBBcmphbiB2YW4gZGUgVmVuICZsdDs8YSBocmVmPSJtYWlsdG86YXJqYW5A
bGludXguaW50ZWwuY29tIj5hcmphbkBsaW51eC5pbnRlbC5jb208L2E+ICZsdDttYWlsdG86PGEg
aHJlZj0ibWFpbHRvOmFyamFuQGxpbnV4LmludGVsLmNvbSI+YXJqYW5AbGludXguaW50ZWwuY29t
PC9hPiZndDsmZ3Q7PGJyPgo8ZGl2IGNsYXNzPSJpbSI+Jmd0OyCgIKAgRGF0ZTogU3VuLCA1IEF1
ZyAyMDEyIDA5OjU3OjQ5IC0wNzAwPGJyPgomZ3Q7IKAgoCBTdWJqZWN0OiBbUEFUQ0ggMi80XSBN
YWtlIHRoZSAmcXVvdDt3aGljaCBDIHN0YXRlIGxpbmUmcXVvdDsgbG9naWMgYmV0dGVyPGJyPgom
Z3Q7PGJyPgomZ3Q7IKAgoCB0aGUgQVJNIGd1eXMgY29tcGxhaW5lZCB0aGF0IHRoZWlyIGh1bWFu
LXJlYWRhYmxlIEMgc3RhdGUgbmFtZXMgZGlkbiYjMzk7dCBoYXZlPGJyPgomZ3Q7IKAgoCBudW1i
ZXJzIGluIHRoZW0sIGFuZCB0aGF0IGFzIGEgcmVzdWx0LCB0aGUgb3V0cHV0IGlzIGFsbCBtZXNz
ZWQgdXAuPGJyPgomZ3Q7IKAgoCBVc2luZyB0aGUgJnF1b3Q7bGludXhfbmFtZSZxdW90OyBpbnN0
ZWFkIGlzIG9ubHkgYSBwYXJ0aWFsIHNvbHV0aW9uOyBpdCBtZXNzZXMgdXAgdGhlIHg4Njxicj4K
Jmd0OyCgIKAgc2lkZSBvZiB0aGUgbG9naWMuPGJyPgomZ3Q7PGJyPgomZ3Q7PGJyPgomZ3Q7IEkg
ZmFpbCB0byB1bmRlcnN0YW5kIGhvdyB1c2luZyAmcXVvdDtsaW51eF9uYW1lJnF1b3Q7IGZvciBw
YXJzaW5nIEMgc3RhdGVzIHdvdWxkIG1lc3MgdXA8YnI+CiZndDsgeDg2IGxvZ2ljLiBFYWNoIHN1
cHBvcnRlZCBDIHN0YXRlIHdpbGwgaGF2ZSBjb3JyZXNwb25kaW5nICYjMzk7c3RhdGVYJiMzOTsg
ZGlyZWN0b3J5PGJyPgomZ3Q7IChsaW51eF9uYW1lKSB3aGljaCBjb250YWluIG51bWJlcnMgaW4g
dGhlbS4gQWxzbyB0aGVyZSBhcmUgZmV3IGhhcmQgY29kZWQ8YnI+CiZndDsgc3RhdGVzIGluIGlu
dGVsX2NwdXMuY3BwIGZpbGUsIGluIHdoaWNoIGxpbnV4X25hbWUgY29udGFpbnMgbnVtYmVycyBp
biB0aGVtPGJyPgomZ3Q7IGFzIHdlbGwuIEluIGJvdGggdGhlIGNhc2VzIGxpbnV4X25hbWUgY29u
dGFpbnMgbnVtYmVycyBhbmQgaGVuY2Ugc2FmZSB0bzxicj4KJmd0OyBwYXJzZS4gUGxlYXNlIGxl
dCBtZSBrbm93IGlmIEkgYW0gbWlzc2luZyBzb21ldGhpbmcgaGVyZS48YnI+Cjxicj4KPC9kaXY+
aXQgY29udGFpbnMgbnVtYmVycywgYnV0IG5vdCB0aGUgcmlnaHQgb25lczxicj4Kc28gb24geDg2
LCB0aGUgcGFja2FnZSwgY29yZSBhbmQgY3B1IHN0YXRlcyBkbyBub3QgbGluZSB1cCBwcm9wZXJs
eSBpZiBJIG9ubHkgdXNlIGxpbnV4X25hbWUuPGJyPgooZS5nLiBwYWNrYWdlIEM2IGFuZCBjb3Jl
IEM2IGFyZSBvbiBhIGRpZmZlcmVudCBsaW5lIHRoYW4gQ1BVIEM2KTxicj4Kd2l0aCB0aGlzIHBh
dGNoIHRoYXQgaXMga2VwdCBjb3JyZWN0bHksIHdoaWxlIGhvcGVmdWxseSBhbHNvIGZpeGluZyB5
b3VyIGlzc3VlLjxicj4KPGJyPjwvYmxvY2txdW90ZT48ZGl2Pjxicj5Pay4gVGhhbmtzIGZvciB0
aGUgY2xhcmlmaWNhdGlvbi4gWWVzLCB0aGlzIHBhdGNoIGZpeGVzIG15IHByb2JsZW0gYXMgd2Vs
bC48YnI+PGJyPjwvZGl2PjwvZGl2Pi0tIDxicj5SZWdhcmRzLDxicj5SYWphZ29wYWw8YnI+PGJy
Pgo=

--===============7553862953038117042==--

