Content-Type: multipart/mixed; boundary="===============6993848939132764347=="
MIME-Version: 1.0
From: Srinivas Pandruvada <srinivas.pandruvada at linux.intel.com>
Subject: Re: [Powertop] Why C++ is the language of implementation?
Date: Mon, 31 Mar 2014 09:05:37 -0700
Message-ID: <53399251.9050903@linux.intel.com>
In-Reply-To: CADy9ZNA_1wW69nyNNS=yqL0iqoWZZB=UiTt2BCkft=nqwZP5Sg@mail.gmail.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============6993848939132764347==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 03/31/2014 08:43 AM, Bill Vyzas wrote:
> Hi all,
>
> I am curious to know why PowerTOP is using C++ as the language of
> implementation but the majority of the program is written with the C
> standards. I checked also some other open source programs like the Gnome
> Power Manager and its doing the same thing.
>
> I know that C++ can also call C and I also know that there are couple of
> classes on the program but why use C++ for a few classes when you can have
> structs, which are basically classes, instead.
It is because of ease of implementation using inheritance and polymorphism.
For example you can have a common device class and other device CPUs are
expanding the capability of a basic device. Also for common code all =

objects are
devices, if it happens to be a CPU, then cpu specific methods can be called.
Also it provides a very easy path for enhancements, without touching the =

core
functionality.
You can do in C with struct and function pointers, but implementing in =

C++ is easy.

Thanks,
Srinivas

> Thanks,
> Bill
>
>
>
> _______________________________________________
> PowerTop mailing list
> PowerTop(a)lists.01.org
> https://lists.01.org/mailman/listinfo/powertop


--===============6993848939132764347==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PGh0bWw+CiAgPGhlYWQ+CiAgICA8bWV0YSBjb250ZW50PSJ0ZXh0L2h0bWw7IGNoYXJzZXQ9SVNP
LTg4NTktMSIKICAgICAgaHR0cC1lcXVpdj0iQ29udGVudC1UeXBlIj4KICA8L2hlYWQ+CiAgPGJv
ZHkgYmdjb2xvcj0iI0ZGRkZGRiIgdGV4dD0iIzAwMDAwMCI+CiAgICA8ZGl2IGNsYXNzPSJtb3ot
Y2l0ZS1wcmVmaXgiPk9uIDAzLzMxLzIwMTQgMDg6NDMgQU0sIEJpbGwgVnl6YXMKICAgICAgd3Jv
dGU6PGJyPgogICAgPC9kaXY+CiAgICA8YmxvY2txdW90ZQpjaXRlPSJtaWQ6Q0FEeTlaTkFfMXdX
NjlueU5OUz15cUwwaXFvV1paQj1VaVR0MkJDa2Z0PW5xd1pQNVNnQG1haWwuZ21haWwuY29tIgog
ICAgICB0eXBlPSJjaXRlIj4KICAgICAgPHByZSB3cmFwPSIiPkhpIGFsbCwKCkkgYW0gY3VyaW91
cyB0byBrbm93IHdoeSBQb3dlclRPUCBpcyB1c2luZyBDKysgYXMgdGhlIGxhbmd1YWdlIG9mCmlt
cGxlbWVudGF0aW9uIGJ1dCB0aGUgbWFqb3JpdHkgb2YgdGhlIHByb2dyYW0gaXMgd3JpdHRlbiB3
aXRoIHRoZSBDCnN0YW5kYXJkcy4gSSBjaGVja2VkIGFsc28gc29tZSBvdGhlciBvcGVuIHNvdXJj
ZSBwcm9ncmFtcyBsaWtlIHRoZSBHbm9tZQpQb3dlciBNYW5hZ2VyIGFuZCBpdHMgZG9pbmcgdGhl
IHNhbWUgdGhpbmcuCgpJIGtub3cgdGhhdCBDKysgY2FuIGFsc28gY2FsbCBDIGFuZCBJIGFsc28g
a25vdyB0aGF0IHRoZXJlIGFyZSBjb3VwbGUgb2YKY2xhc3NlcyBvbiB0aGUgcHJvZ3JhbSBidXQg
d2h5IHVzZSBDKysgZm9yIGEgZmV3IGNsYXNzZXMgd2hlbiB5b3UgY2FuIGhhdmUKc3RydWN0cywg
d2hpY2ggYXJlIGJhc2ljYWxseSBjbGFzc2VzLCBpbnN0ZWFkLgo8L3ByZT4KICAgIDwvYmxvY2tx
dW90ZT4KICAgIEl0IGlzIGJlY2F1c2Ugb2YgZWFzZSBvZiBpbXBsZW1lbnRhdGlvbiB1c2luZyBp
bmhlcml0YW5jZSBhbmQKICAgIHBvbHltb3JwaGlzbS48YnI+CiAgICBGb3IgZXhhbXBsZSB5b3Ug
Y2FuIGhhdmUgYSBjb21tb24gZGV2aWNlIGNsYXNzIGFuZCBvdGhlciBkZXZpY2UgQ1BVcwogICAg
YXJlPGJyPgogICAgZXhwYW5kaW5nIHRoZSBjYXBhYmlsaXR5IG9mIGEgYmFzaWMgZGV2aWNlLiBB
bHNvIGZvciBjb21tb24gY29kZSBhbGwKICAgIG9iamVjdHMgYXJlPGJyPgogICAgZGV2aWNlcywg
aWYgaXQgaGFwcGVucyB0byBiZSBhIENQVSwgdGhlbiBjcHUgc3BlY2lmaWMgbWV0aG9kcyBjYW4g
YmUKICAgIGNhbGxlZC48YnI+CiAgICBBbHNvIGl0IHByb3ZpZGVzIGEgdmVyeSBlYXN5IHBhdGgg
Zm9yIGVuaGFuY2VtZW50cywgd2l0aG91dCB0b3VjaGluZwogICAgdGhlIGNvcmU8YnI+CiAgICBm
dW5jdGlvbmFsaXR5Ljxicj4KICAgIFlvdSBjYW4gZG8gaW4gQyB3aXRoIHN0cnVjdCBhbmQgZnVu
Y3Rpb24gcG9pbnRlcnMsIGJ1dCBpbXBsZW1lbnRpbmcKICAgIGluIEMrKyBpcyBlYXN5Ljxicj4K
ICAgIDxicj4KICAgIFRoYW5rcyw8YnI+CiAgICBTcmluaXZhczxicj4KICAgIDxicj4KICAgIDxi
bG9ja3F1b3RlCmNpdGU9Im1pZDpDQUR5OVpOQV8xd1c2OW55Tk5TPXlxTDBpcW9XWlpCPVVpVHQy
QkNrZnQ9bnF3WlA1U2dAbWFpbC5nbWFpbC5jb20iCiAgICAgIHR5cGU9ImNpdGUiPgogICAgICA8
cHJlIHdyYXA9IiI+ClRoYW5rcywKQmlsbAoKPC9wcmU+CiAgICAgIDxicj4KICAgICAgPGZpZWxk
c2V0IGNsYXNzPSJtaW1lQXR0YWNobWVudEhlYWRlciI+PC9maWVsZHNldD4KICAgICAgPGJyPgog
ICAgICA8cHJlIHdyYXA9IiI+X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KUG93ZXJUb3AgbWFpbGluZyBsaXN0CjxhIGNsYXNzPSJtb3otdHh0LWxpbmstYWJi
cmV2aWF0ZWQiIGhyZWY9Im1haWx0bzpQb3dlclRvcEBsaXN0cy4wMS5vcmciPlBvd2VyVG9wQGxp
c3RzLjAxLm9yZzwvYT4KPGEgY2xhc3M9Im1vei10eHQtbGluay1mcmVldGV4dCIgaHJlZj0iaHR0
cHM6Ly9saXN0cy4wMS5vcmcvbWFpbG1hbi9saXN0aW5mby9wb3dlcnRvcCI+aHR0cHM6Ly9saXN0
cy4wMS5vcmcvbWFpbG1hbi9saXN0aW5mby9wb3dlcnRvcDwvYT4KPC9wcmU+CiAgICA8L2Jsb2Nr
cXVvdGU+CiAgICA8YnI+CiAgPC9ib2R5Pgo8L2h0bWw+Cg==

--===============6993848939132764347==--

