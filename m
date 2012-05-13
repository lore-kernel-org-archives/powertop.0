Content-Type: multipart/mixed; boundary="===============0216392191299159557=="
MIME-Version: 1.0
From: corrupt <corrupt at gmail.com>
Subject: Re: [Powertop] Any way to show HH:MM for time left instead of just
 minutes?
Date: Sat, 12 May 2012 19:07:58 -0700
Message-ID: <CAEoL4DPSsmxeCL6ubn7ao9_+22QsNDfSqkpJGvthK8mFwKfvyA@mail.gmail.com>
In-Reply-To: CABsxX9LquOEQPs3uPPA8dB16jasfc-=MUFCk9z3rNrb-xXVBQw@mail.gmail.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============0216392191299159557==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

You're absolutely right.
I don't know C++ very well, but I was able to make an amateur patch that
does this.

If anyone wants the patch, here it is (it converts time left to HH:MM on
the display): http://pastebin.com/raw.php?i=3DDf2ttb9e

On Sat, May 12, 2012 at 6:03 PM, Kok, Auke-jan H
<auke-jan.h.kok(a)intel.com>wrote:

>
>
> On Sat, May 12, 2012 at 5:58 PM, corrupt <corrupt(a)gmail.com> wrote:
>
>> I just upgraded to Powertop 2.0 and I'm frankly I'm disappointed with the
>> new interface.
>>
>> It shows how many minutes there is left on my battery (267 minutes),
>> which is kind of odd that it's not in HH:MM format like the previous
>> versions.
>>
>> Any way to change this?
>>
>
> You could write a patch that divides the amount of minutes by 60, and
> changes the display!
>
> Cheers,
>
> Auke
>
>
>

--===============0216392191299159557==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

WW91JiMzOTtyZSBhYnNvbHV0ZWx5IHJpZ2h0LiCgPGRpdj5JIGRvbiYjMzk7dCBrbm93IEMrKyB2
ZXJ5IHdlbGwsIGJ1dCBJIHdhcyBhYmxlIHRvIG1ha2UgYW6gYW1hdGV1cqBwYXRjaCB0aGF0IGRv
ZXMgdGhpcy48ZGl2Pjxicj48L2Rpdj48ZGl2PklmIGFueW9uZSB3YW50cyB0aGUgcGF0Y2gsIGhl
cmUgaXQgaXMgKGl0IGNvbnZlcnRzIHRpbWUgbGVmdCB0byBISDpNTSBvbiB0aGUgZGlzcGxheSk6
oDxhIGhyZWY9Imh0dHA6Ly9wYXN0ZWJpbi5jb20vcmF3LnBocD9pPURmMnR0YjllIj5odHRwOi8v
cGFzdGViaW4uY29tL3Jhdy5waHA/aT1EZjJ0dGI5ZTwvYT48YnI+Cgo8YnI+PGRpdiBjbGFzcz0i
Z21haWxfcXVvdGUiPk9uIFNhdCwgTWF5IDEyLCAyMDEyIGF0IDY6MDMgUE0sIEtvaywgQXVrZS1q
YW4gSCA8c3BhbiBkaXI9Imx0ciI+Jmx0OzxhIGhyZWY9Im1haWx0bzphdWtlLWphbi5oLmtva0Bp
bnRlbC5jb20iIHRhcmdldD0iX2JsYW5rIj5hdWtlLWphbi5oLmtva0BpbnRlbC5jb208L2E+Jmd0
Ozwvc3Bhbj4gd3JvdGU6PGJyPjxibG9ja3F1b3RlIGNsYXNzPSJnbWFpbF9xdW90ZSIgc3R5bGU9
Im1hcmdpbjowIDAgMCAuOGV4O2JvcmRlci1sZWZ0OjFweCAjY2NjIHNvbGlkO3BhZGRpbmctbGVm
dDoxZXgiPgoKPGJyPjxicj48ZGl2IGNsYXNzPSJnbWFpbF9xdW90ZSI+PGRpdj48ZGl2IGNsYXNz
PSJoNSI+T24gU2F0LCBNYXkgMTIsIDIwMTIgYXQgNTo1OCBQTSwgY29ycnVwdCA8c3BhbiBkaXI9
Imx0ciI+Jmx0OzxhIGhyZWY9Im1haWx0bzpjb3JydXB0QGdtYWlsLmNvbSIgdGFyZ2V0PSJfYmxh
bmsiPmNvcnJ1cHRAZ21haWwuY29tPC9hPiZndDs8L3NwYW4+IHdyb3RlOjxicj48YmxvY2txdW90
ZSBjbGFzcz0iZ21haWxfcXVvdGUiIHN0eWxlPSJtYXJnaW46MCAwIDAgLjhleDtib3JkZXItbGVm
dDoxcHggI2NjYyBzb2xpZDtwYWRkaW5nLWxlZnQ6MWV4Ij4KCgo8ZGl2PkkganVzdCB1cGdyYWRl
ZCB0byBQb3dlcnRvcCAyLjAgYW5kIEkmIzM5O20gZnJhbmtseSBJJiMzOTttIGRpc2FwcG9pbnRl
ZCB3aXRoIHRoZSBuZXcgaW50ZXJmYWNlLjwvZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+SXQgc2hv
d3MgaG93IG1hbnkgbWludXRlcyB0aGVyZSBpcyBsZWZ0IG9uIG15IGJhdHRlcnkgKDI2NyBtaW51
dGVzKSwgd2hpY2ggaXMga2luZCBvZiBvZGQgdGhhdCBpdCYjMzk7cyBub3QgaW4gSEg6TU0gZm9y
bWF0IGxpa2UgdGhlIHByZXZpb3VzIHZlcnNpb25zLjwvZGl2PgoKCgoKPGRpdj48YnI+PC9kaXY+
PGRpdj5Bbnkgd2F5IHRvIGNoYW5nZSB0aGlzPzwvZGl2PjwvYmxvY2txdW90ZT48ZGl2PqA8L2Rp
dj48L2Rpdj48L2Rpdj48ZGl2PllvdSBjb3VsZCB3cml0ZSBhIHBhdGNoIHRoYXQgZGl2aWRlcyB0
aGUgYW1vdW50IG9mIG1pbnV0ZXMgYnkgNjAsIGFuZCBjaGFuZ2VzIHRoZSBkaXNwbGF5ITwvZGl2
PjxkaXY+PGJyPjwvZGl2PjxkaXY+Q2hlZXJzLDwvZGl2PgoKPGRpdj48YnI+PC9kaXY+CjxkaXY+
QXVrZTwvZGl2PjxkaXY+PGJyPjwvZGl2PjwvZGl2Pjxicj4KPC9ibG9ja3F1b3RlPjwvZGl2Pjxi
cj48L2Rpdj48L2Rpdj4K

--===============0216392191299159557==--

