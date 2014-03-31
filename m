Content-Type: multipart/mixed; boundary="===============6067416332041762186=="
MIME-Version: 1.0
From: Bill Vyzas <vizasb at gmail.com>
Subject: Re: [Powertop] Why C++ is the language of implementation?
Date: Mon, 31 Mar 2014 16:54:25 +0100
Message-ID: <CADy9ZNCDwf9+uNnqKVE1rjEdzJKgTw=VrTPGERggv6rxCfZ7og@mail.gmail.com>
In-Reply-To: 53398E60.50904@linux.intel.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============6067416332041762186==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

What the physical things will be in the case of powertop? Are we talking
about device drivers and cpu measurements?

Thanks


On 31 March 2014 16:48, Arjan van de Ven <arjan(a)linux.intel.com> wrote:

> On 3/31/2014 8:43 AM, Bill Vyzas wrote:
>
>> Hi all,
>>
>> I am curious to know why PowerTOP is using C++ as the language of
>> implementation but the majority of the program is written with the C
>> standards. I checked also some other
>> open source programs like the Gnome Power Manager and its doing the same
>> thing.
>>
>> I know that C++ can also call C and I also know that there are couple of
>> classes on the program but why use C++ for a few classes when you can ha=
ve
>> structs, which are
>> basically classes, instead.
>>
>
>
> C++ and objects are a very useful paradigm for certain things (especially
> if they map
> to actual physical things)... and powertop uses that.
>
> I'm not one of those people who goes overboard and sees objects for things
> that are not
> really objects, just pieces of data.
>
>

--===============6067416332041762186==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PGRpdiBkaXI9Imx0ciI+PGRpdj5XaGF0IHRoZSBwaHlzaWNhbCB0aGluZ3Mgd2lsbCBiZSBpbiB0
aGUgY2FzZSBvZiBwb3dlcnRvcD8gQXJlIHdlIHRhbGtpbmcgYWJvdXQgZGV2aWNlIGRyaXZlcnMg
YW5kIGNwdSBtZWFzdXJlbWVudHM/IDxicj48YnI+PC9kaXY+VGhhbmtzPGJyPjwvZGl2PjxkaXYg
Y2xhc3M9ImdtYWlsX2V4dHJhIj48YnI+PGJyPjxkaXYgY2xhc3M9ImdtYWlsX3F1b3RlIj4KT24g
MzEgTWFyY2ggMjAxNCAxNjo0OCwgQXJqYW4gdmFuIGRlIFZlbiA8c3BhbiBkaXI9Imx0ciI+Jmx0
OzxhIGhyZWY9Im1haWx0bzphcmphbkBsaW51eC5pbnRlbC5jb20iIHRhcmdldD0iX2JsYW5rIj5h
cmphbkBsaW51eC5pbnRlbC5jb208L2E+Jmd0Ozwvc3Bhbj4gd3JvdGU6PGJyPjxibG9ja3F1b3Rl
IGNsYXNzPSJnbWFpbF9xdW90ZSIgc3R5bGU9Im1hcmdpbjowIDAgMCAuOGV4O2JvcmRlci1sZWZ0
OjFweCAjY2NjIHNvbGlkO3BhZGRpbmctbGVmdDoxZXgiPgo8ZGl2IGNsYXNzPSJIT0VuWmIiPjxk
aXYgY2xhc3M9Img1Ij5PbiAzLzMxLzIwMTQgODo0MyBBTSwgQmlsbCBWeXphcyB3cm90ZTo8YnI+
CjxibG9ja3F1b3RlIGNsYXNzPSJnbWFpbF9xdW90ZSIgc3R5bGU9Im1hcmdpbjowIDAgMCAuOGV4
O2JvcmRlci1sZWZ0OjFweCAjY2NjIHNvbGlkO3BhZGRpbmctbGVmdDoxZXgiPgpIaSBhbGwsPGJy
Pgo8YnI+CkkgYW0gY3VyaW91cyB0byBrbm93IHdoeSBQb3dlclRPUCBpcyB1c2luZyBDKysgYXMg
dGhlIGxhbmd1YWdlIG9mIGltcGxlbWVudGF0aW9uIGJ1dCB0aGUgbWFqb3JpdHkgb2YgdGhlIHBy
b2dyYW0gaXMgd3JpdHRlbiB3aXRoIHRoZSBDIHN0YW5kYXJkcy4gSSBjaGVja2VkIGFsc28gc29t
ZSBvdGhlcjxicj4Kb3BlbiBzb3VyY2UgcHJvZ3JhbXMgbGlrZSB0aGUgR25vbWUgUG93ZXIgTWFu
YWdlciBhbmQgaXRzIGRvaW5nIHRoZSBzYW1lIHRoaW5nLjxicj4KPGJyPgpJIGtub3cgdGhhdCBD
KysgY2FuIGFsc28gY2FsbCBDIGFuZCBJIGFsc28ga25vdyB0aGF0IHRoZXJlIGFyZSBjb3VwbGUg
b2YgY2xhc3NlcyBvbiB0aGUgcHJvZ3JhbSBidXQgd2h5IHVzZSBDKysgZm9yIGEgZmV3IGNsYXNz
ZXMgd2hlbiB5b3UgY2FuIGhhdmUgc3RydWN0cywgd2hpY2ggYXJlPGJyPgpiYXNpY2FsbHkgY2xh
c3NlcywgaW5zdGVhZC48YnI+CjwvYmxvY2txdW90ZT4KPGJyPgo8YnI+PC9kaXY+PC9kaXY+CkMr
KyBhbmQgb2JqZWN0cyBhcmUgYSB2ZXJ5IHVzZWZ1bCBwYXJhZGlnbSBmb3IgY2VydGFpbiB0aGlu
Z3MgKGVzcGVjaWFsbHkgaWYgdGhleSBtYXA8YnI+CnRvIGFjdHVhbCBwaHlzaWNhbCB0aGluZ3Mp
Li4uIGFuZCBwb3dlcnRvcCB1c2VzIHRoYXQuPGJyPgo8YnI+CkkmIzM5O20gbm90IG9uZSBvZiB0
aG9zZSBwZW9wbGUgd2hvIGdvZXMgb3ZlcmJvYXJkIGFuZCBzZWVzIG9iamVjdHMgZm9yIHRoaW5n
cyB0aGF0IGFyZSBub3Q8YnI+CnJlYWxseSBvYmplY3RzLCBqdXN0IHBpZWNlcyBvZiBkYXRhLjxi
cj4KPGJyPgo8L2Jsb2NrcXVvdGU+PC9kaXY+PGJyPjwvZGl2Pgo=

--===============6067416332041762186==--

