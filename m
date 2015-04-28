Content-Type: multipart/mixed; boundary="===============3709349642615805301=="
MIME-Version: 1.0
From: Kok, Auke-jan H <auke-jan.h.kok at intel.com>
Subject: Re: [Powertop] Too much memory consumption by powertop
Date: Tue, 28 Apr 2015 14:29:06 -0700
Message-ID: <CABsxX9KpabXDAds_1ZOs5BRnAyVb6bLv-k+QOGaAzUAJh28nHQ@mail.gmail.com>
In-Reply-To: 55290.10.24.5.14.1430241257.squirrel@linux.intel.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============3709349642615805301==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 28, 2015 at 10:14 AM, Alexandra Yates <
alexandra.yates(a)linux.intel.com> wrote:

>
> > As powertop list is for subscribers only, here Takashi's
> > findings concerning a big memory waste fowarded:
> >
> > ----------  Forwarded Message  ----------
> >
> > Subject: Too much memory consumption by powertop
> > Date: Tuesday, April 28, 2015, 05:32:41 PM
> > From: Takashi Iwai <tiwai(a)suse.de>
> > To: powertop(a)lists.01.org
> > CC: trenn(a)suse.de
> >
> > Hi,
> >
> > I noticed that powertop consumes way too much memory than needed.  It
> > constantly takes over 170MB RES, sometimes over 200MB.
> >
> > Then I looked at profile, and it showed that most of memory is
> > allocated for newpad_sp().  Indeed, the current code allocates a pad
> > of the fixed size of 1000x1000 (!) for each tab, and we have five
> > tabs, so five times of that.  No wonder that such a small neat CUI
> > program is so hungry.
> >
> > For example, a hack like below already reduces the memory footprint
> > to around 20MB, 90% cut.  Not bad.
> >
> > --- a/src/display.cpp
> > +++ b/src/display.cpp
> > @@ -48,7 +48,7 @@ void create_tab(const string &name, cons
> >         if (!w)
> >                 w =3D new(class tab_window);
> >
> > -       w->win =3D newpad(1000,1000);
> > +       w->win =3D newpad(80,160); // XXX FIXME XXX
> >         tab_names.push_back(name);
> >         tab_windows[name] =3D w;
> >         tab_translations[name] =3D translation;
> >
> > Can anyone look into this and give a better / smarter solution?
>
> To avoid the high memory consumption on testing run it on HTML mode so
> that the powertop.html report is generated in the background.


Right, but if you do want to run it in a terminal, 80x160 would limit the
size of the viewport to just a standard 80cols worth, which isn't very wide.

Maybe a more sensible 250x250 size would be a good default, as I seem to be
able to fill a 1080p screen with just under 250 columns, and it would give
some scrolling overhead?

that's at least a 16x reduction already compared to 1000x1000.

You could dynamically calculate the number based on the terminal
properties, but that would likely break on terminal resizes.

Cheers,

Auke

--===============3709349642615805301==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PGRpdiBkaXI9Imx0ciI+PGJyPjxkaXYgY2xhc3M9ImdtYWlsX2V4dHJhIj48YnI+PGRpdiBjbGFz
cz0iZ21haWxfcXVvdGUiPk9uIFR1ZSwgQXByIDI4LCAyMDE1IGF0IDEwOjE0IEFNLCBBbGV4YW5k
cmEgWWF0ZXMgPHNwYW4gZGlyPSJsdHIiPiZsdDs8YSBocmVmPSJtYWlsdG86YWxleGFuZHJhLnlh
dGVzQGxpbnV4LmludGVsLmNvbSIgdGFyZ2V0PSJfYmxhbmsiPmFsZXhhbmRyYS55YXRlc0BsaW51
eC5pbnRlbC5jb208L2E+Jmd0Ozwvc3Bhbj4gd3JvdGU6PGJyPjxibG9ja3F1b3RlIGNsYXNzPSJn
bWFpbF9xdW90ZSIgc3R5bGU9Im1hcmdpbjowIDAgMCAuOGV4O2JvcmRlci1sZWZ0OjFweCAjY2Nj
IHNvbGlkO3BhZGRpbmctbGVmdDoxZXgiPjxkaXYgY2xhc3M9IkhPRW5aYiI+PGRpdiBjbGFzcz0i
aDUiPjxicj4KJmd0OyBBcyBwb3dlcnRvcCBsaXN0IGlzIGZvciBzdWJzY3JpYmVycyBvbmx5LCBo
ZXJlIFRha2FzaGkmIzM5O3M8YnI+CiZndDsgZmluZGluZ3MgY29uY2VybmluZyBhIGJpZyBtZW1v
cnkgd2FzdGUgZm93YXJkZWQ6PGJyPgomZ3Q7PGJyPgomZ3Q7IC0tLS0tLS0tLS3CoCBGb3J3YXJk
ZWQgTWVzc2FnZcKgIC0tLS0tLS0tLS08YnI+CiZndDs8YnI+CiZndDsgU3ViamVjdDogVG9vIG11
Y2ggbWVtb3J5IGNvbnN1bXB0aW9uIGJ5IHBvd2VydG9wPGJyPgomZ3Q7IERhdGU6IFR1ZXNkYXks
IEFwcmlsIDI4LCAyMDE1LCAwNTozMjo0MSBQTTxicj4KJmd0OyBGcm9tOiBUYWthc2hpIEl3YWkg
Jmx0OzxhIGhyZWY9Im1haWx0bzp0aXdhaUBzdXNlLmRlIj50aXdhaUBzdXNlLmRlPC9hPiZndDs8
YnI+CiZndDsgVG86IDxhIGhyZWY9Im1haWx0bzpwb3dlcnRvcEBsaXN0cy4wMS5vcmciPnBvd2Vy
dG9wQGxpc3RzLjAxLm9yZzwvYT48YnI+CiZndDsgQ0M6IDxhIGhyZWY9Im1haWx0bzp0cmVubkBz
dXNlLmRlIj50cmVubkBzdXNlLmRlPC9hPjxicj4KJmd0Ozxicj4KJmd0OyBIaSw8YnI+CiZndDs8
YnI+CiZndDsgSSBub3RpY2VkIHRoYXQgcG93ZXJ0b3AgY29uc3VtZXMgd2F5IHRvbyBtdWNoIG1l
bW9yeSB0aGFuIG5lZWRlZC7CoCBJdDxicj4KJmd0OyBjb25zdGFudGx5IHRha2VzIG92ZXIgMTcw
TUIgUkVTLCBzb21ldGltZXMgb3ZlciAyMDBNQi48YnI+CiZndDs8YnI+CiZndDsgVGhlbiBJIGxv
b2tlZCBhdCBwcm9maWxlLCBhbmQgaXQgc2hvd2VkIHRoYXQgbW9zdCBvZiBtZW1vcnkgaXM8YnI+
CiZndDsgYWxsb2NhdGVkIGZvciBuZXdwYWRfc3AoKS7CoCBJbmRlZWQsIHRoZSBjdXJyZW50IGNv
ZGUgYWxsb2NhdGVzIGEgcGFkPGJyPgomZ3Q7IG9mIHRoZSBmaXhlZCBzaXplIG9mIDEwMDB4MTAw
MCAoISkgZm9yIGVhY2ggdGFiLCBhbmQgd2UgaGF2ZSBmaXZlPGJyPgomZ3Q7IHRhYnMsIHNvIGZp
dmUgdGltZXMgb2YgdGhhdC7CoCBObyB3b25kZXIgdGhhdCBzdWNoIGEgc21hbGwgbmVhdCBDVUk8
YnI+CiZndDsgcHJvZ3JhbSBpcyBzbyBodW5ncnkuPGJyPgomZ3Q7PGJyPgomZ3Q7IEZvciBleGFt
cGxlLCBhIGhhY2sgbGlrZSBiZWxvdyBhbHJlYWR5IHJlZHVjZXMgdGhlIG1lbW9yeSBmb290cHJp
bnQ8YnI+CiZndDsgdG8gYXJvdW5kIDIwTUIsIDkwJSBjdXQuwqAgTm90IGJhZC48YnI+CiZndDs8
YnI+CiZndDsgLS0tIGEvc3JjL2Rpc3BsYXkuY3BwPGJyPgomZ3Q7ICsrKyBiL3NyYy9kaXNwbGF5
LmNwcDxicj4KJmd0OyBAQCAtNDgsNyArNDgsNyBAQCB2b2lkIGNyZWF0ZV90YWIoY29uc3Qgc3Ry
aW5nICZhbXA7bmFtZSwgY29uczxicj4KJmd0O8KgIMKgIMKgIMKgIMKgaWYgKCF3KTxicj4KJmd0
O8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgdyA9IG5ldyhjbGFzcyB0YWJfd2luZG93KTs8YnI+
CiZndDs8YnI+CiZndDsgLcKgIMKgIMKgIMKgdy0mZ3Q7d2luID0gbmV3cGFkKDEwMDAsMTAwMCk7
PGJyPgomZ3Q7ICvCoCDCoCDCoCDCoHctJmd0O3dpbiA9IG5ld3BhZCg4MCwxNjApOyAvLyBYWFgg
RklYTUUgWFhYPGJyPgomZ3Q7wqAgwqAgwqAgwqAgwqB0YWJfbmFtZXMucHVzaF9iYWNrKG5hbWUp
Ozxicj4KJmd0O8KgIMKgIMKgIMKgIMKgdGFiX3dpbmRvd3NbbmFtZV0gPSB3Ozxicj4KJmd0O8Kg
IMKgIMKgIMKgIMKgdGFiX3RyYW5zbGF0aW9uc1tuYW1lXSA9IHRyYW5zbGF0aW9uOzxicj4KJmd0
Ozxicj4KJmd0OyBDYW4gYW55b25lIGxvb2sgaW50byB0aGlzIGFuZCBnaXZlIGEgYmV0dGVyIC8g
c21hcnRlciBzb2x1dGlvbj88YnI+Cjxicj4KPC9kaXY+PC9kaXY+VG8gYXZvaWQgdGhlIGhpZ2gg
bWVtb3J5IGNvbnN1bXB0aW9uIG9uIHRlc3RpbmcgcnVuIGl0IG9uIEhUTUwgbW9kZSBzbzxicj4K
dGhhdCB0aGUgcG93ZXJ0b3AuaHRtbCByZXBvcnQgaXMgZ2VuZXJhdGVkIGluIHRoZSBiYWNrZ3Jv
dW5kLjwvYmxvY2txdW90ZT48ZGl2Pjxicj48L2Rpdj48ZGl2PlJpZ2h0LCBidXQgaWYgeW91IGRv
IHdhbnQgdG8gcnVuIGl0IGluIGEgdGVybWluYWwsIDgweDE2MCB3b3VsZCBsaW1pdCB0aGUgc2l6
ZSBvZiB0aGUgdmlld3BvcnQgdG8ganVzdCBhIHN0YW5kYXJkIDgwY29scyB3b3J0aCwgd2hpY2gg
aXNuJiMzOTt0IHZlcnkgd2lkZS48L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2Pk1heWJlIGEgbW9y
ZSBzZW5zaWJsZSAyNTB4MjUwIHNpemUgd291bGQgYmUgYSBnb29kIGRlZmF1bHQsIGFzIEkgc2Vl
bSB0byBiZSBhYmxlIHRvIGZpbGwgYSAxMDgwcCBzY3JlZW4gd2l0aCBqdXN0IHVuZGVyIDI1MCBj
b2x1bW5zLCBhbmQgaXQgd291bGQgZ2l2ZSBzb21lIHNjcm9sbGluZyBvdmVyaGVhZD88L2Rpdj48
ZGl2Pjxicj48L2Rpdj48ZGl2PnRoYXQmIzM5O3MgYXQgbGVhc3QgYSAxNnggcmVkdWN0aW9uIGFs
cmVhZHkgY29tcGFyZWQgdG8gMTAwMHgxMDAwLjwvZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+WW91
IGNvdWxkIGR5bmFtaWNhbGx5IGNhbGN1bGF0ZSB0aGUgbnVtYmVyIGJhc2VkIG9uIHRoZSB0ZXJt
aW5hbCBwcm9wZXJ0aWVzLCBidXQgdGhhdCB3b3VsZCBsaWtlbHkgYnJlYWsgb24gdGVybWluYWwg
cmVzaXplcy48L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2PkNoZWVycyw8L2Rpdj48ZGl2Pjxicj48
L2Rpdj48ZGl2PkF1a2U8L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2Pjxicj48L2Rpdj48L2Rpdj48
L2Rpdj48L2Rpdj4K

--===============3709349642615805301==--

