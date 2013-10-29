Content-Type: multipart/mixed; boundary="===============8366555293467565319=="
MIME-Version: 1.0
From: =?utf-8?q?Jes=C3=BAs_D_=3Cjesus=2Ediaz=2Evico_at_gmail=2Ecom=3E?=
Subject: Re: [Powertop] How does powertop deal with multiple executions
Date: Tue, 29 Oct 2013 08:23:48 +0100
Message-ID: <CAA3v608roAC6tWo6DQ+NU6fyvptFw_weCw=PWhsykeqrfVYo1w@mail.gmail.com>
In-Reply-To: 526F1B6E.4080000@linux.intel.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============8366555293467565319==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Thank you, Arjan.

But my question is how does powertop group programs with the same name.

Unless I'm doing something wrong, I doubt that it is just adding the power
consumption of all the independent executions. I say this because powertop
estimates a consumption of 335 mW for 500 executions, and a consumption of
364 mW for 5000. I am configuring the monitorization time with the --time
parameter (with a value long enough to cover all the 500 or 5000
executions).

Is it calculating an average then?


On Tue, Oct 29, 2013 at 3:20 AM, Arjan van de Ven <arjan(a)linux.intel.com>=
wrote:

> On 10/28/2013 4:37 PM, Jes=C3=BAs D=C3=ADaz Vico wrote:
>
>> Hello,
>>
>> I'm trying to estimate the power consumption (besides some other
>> properties) of a custom program. During my tests, I execute my program
>> several times (it is not a
>> background process) with powertop running. My doubt is: how does powertop
>> deal with these multiple executions?
>>
>> I'd guess that it averages over the number of executions, because I'm
>> obtaining very similar power consumption measurements for both 500 and 5=
000
>> executions of my program
>> (335 mW and 364 mW, respectively). Still, there is the possibility that
>> powertop only keeps the estimation corresponding to the last execution...
>>
>> Thanks.
>>
>
> by default, powertop will group programs with the same name into one
> bucket for display purposes.
>
>
>


-- =

Jes=C3=BAs D=C3=ADaz Vico

--===============8366555293467565319==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PGRpdiBkaXI9Imx0ciI+PGRpdj5UaGFuayB5b3UsIEFyamFuLjxicj48YnI+QnV0IG15IHF1ZXN0
aW9uIGlzIGhvdyBkb2VzIHBvd2VydG9wIGdyb3VwIHByb2dyYW1zIHdpdGggdGhlIHNhbWUgbmFt
ZS4gPGJyPjxicj5Vbmxlc3MgSSYjMzk7bSBkb2luZyBzb21ldGhpbmcgd3JvbmcsIEkgZG91YnQg
dGhhdCBpdCBpcyBqdXN0IGFkZGluZyB0aGUgcG93ZXIgY29uc3VtcHRpb24gb2YgYWxsIHRoZSBp
bmRlcGVuZGVudCBleGVjdXRpb25zLiBJIHNheSB0aGlzIGJlY2F1c2UgcG93ZXJ0b3AgZXN0aW1h
dGVzIGEgY29uc3VtcHRpb24gb2YgMzM1IG1XIGZvciA1MDAgZXhlY3V0aW9ucywgYW5kIGEgY29u
c3VtcHRpb24gb2YgMzY0IG1XIGZvciA1MDAwLiBJIGFtIGNvbmZpZ3VyaW5nIHRoZSBtb25pdG9y
aXphdGlvbiB0aW1lIHdpdGggdGhlIC0tdGltZSBwYXJhbWV0ZXIgKHdpdGggYSB2YWx1ZSBsb25n
IGVub3VnaCB0byBjb3ZlciBhbGwgdGhlIDUwMCBvciA1MDAwIGV4ZWN1dGlvbnMpLjxicj4KPGJy
PjwvZGl2PjxkaXY+SXMgaXQgY2FsY3VsYXRpbmcgYW4gYXZlcmFnZSB0aGVuPzxicj48L2Rpdj48
L2Rpdj48ZGl2IGNsYXNzPSJnbWFpbF9leHRyYSI+PGJyPjxicj48ZGl2IGNsYXNzPSJnbWFpbF9x
dW90ZSI+T24gVHVlLCBPY3QgMjksIDIwMTMgYXQgMzoyMCBBTSwgQXJqYW4gdmFuIGRlIFZlbiA8
c3BhbiBkaXI9Imx0ciI+Jmx0OzxhIGhyZWY9Im1haWx0bzphcmphbkBsaW51eC5pbnRlbC5jb20i
IHRhcmdldD0iX2JsYW5rIj5hcmphbkBsaW51eC5pbnRlbC5jb208L2E+Jmd0Ozwvc3Bhbj4gd3Jv
dGU6PGJyPgo8YmxvY2txdW90ZSBjbGFzcz0iZ21haWxfcXVvdGUiIHN0eWxlPSJtYXJnaW46MCAw
IDAgLjhleDtib3JkZXItbGVmdDoxcHggI2NjYyBzb2xpZDtwYWRkaW5nLWxlZnQ6MWV4Ij48ZGl2
IGNsYXNzPSJIT0VuWmIiPjxkaXYgY2xhc3M9Img1Ij5PbiAxMC8yOC8yMDEzIDQ6MzcgUE0sIEpl
c/pzIETtYXogVmljbyB3cm90ZTo8YnI+CjxibG9ja3F1b3RlIGNsYXNzPSJnbWFpbF9xdW90ZSIg
c3R5bGU9Im1hcmdpbjowIDAgMCAuOGV4O2JvcmRlci1sZWZ0OjFweCAjY2NjIHNvbGlkO3BhZGRp
bmctbGVmdDoxZXgiPgpIZWxsbyw8YnI+Cjxicj4KSSYjMzk7bSB0cnlpbmcgdG8gZXN0aW1hdGUg
dGhlIHBvd2VyIGNvbnN1bXB0aW9uIChiZXNpZGVzIHNvbWUgb3RoZXIgcHJvcGVydGllcykgb2Yg
YSBjdXN0b20gcHJvZ3JhbS4gRHVyaW5nIG15IHRlc3RzLCBJIGV4ZWN1dGUgbXkgcHJvZ3JhbSBz
ZXZlcmFsIHRpbWVzIChpdCBpcyBub3QgYTxicj4KYmFja2dyb3VuZCBwcm9jZXNzKSB3aXRoIHBv
d2VydG9wIHJ1bm5pbmcuIE15IGRvdWJ0IGlzOiBob3cgZG9lcyBwb3dlcnRvcCBkZWFsIHdpdGgg
dGhlc2UgbXVsdGlwbGUgZXhlY3V0aW9ucz88YnI+Cjxicj4KSSYjMzk7ZCBndWVzcyB0aGF0IGl0
IGF2ZXJhZ2VzIG92ZXIgdGhlIG51bWJlciBvZiBleGVjdXRpb25zLCBiZWNhdXNlIEkmIzM5O20g
b2J0YWluaW5nIHZlcnkgc2ltaWxhciBwb3dlciBjb25zdW1wdGlvbiBtZWFzdXJlbWVudHMgZm9y
IGJvdGggNTAwIGFuZCA1MDAwIGV4ZWN1dGlvbnMgb2YgbXkgcHJvZ3JhbTxicj4KKDMzNSBtVyBh
bmQgMzY0IG1XLCByZXNwZWN0aXZlbHkpLiBTdGlsbCwgdGhlcmUgaXMgdGhlIHBvc3NpYmlsaXR5
IHRoYXQgcG93ZXJ0b3Agb25seSBrZWVwcyB0aGUgZXN0aW1hdGlvbiBjb3JyZXNwb25kaW5nIHRv
IHRoZSBsYXN0IGV4ZWN1dGlvbi4uLjxicj4KPGJyPgpUaGFua3MuPGJyPgo8L2Jsb2NrcXVvdGU+
Cjxicj48L2Rpdj48L2Rpdj4KYnkgZGVmYXVsdCwgcG93ZXJ0b3Agd2lsbCBncm91cCBwcm9ncmFt
cyB3aXRoIHRoZSBzYW1lIG5hbWUgaW50byBvbmUgYnVja2V0IGZvciBkaXNwbGF5IHB1cnBvc2Vz
Ljxicj4KPGJyPgo8YnI+CjwvYmxvY2txdW90ZT48L2Rpdj48YnI+PGJyIGNsZWFyPSJhbGwiPjxi
cj4tLSA8YnI+SmVz+nMgRO1heiBWaWNvCjwvZGl2Pgo=

--===============8366555293467565319==--

