Content-Type: multipart/mixed; boundary="===============1974511109283937954=="
MIME-Version: 1.0
From: Austin Zhang <zhang.austin at gmail.com>
Subject: Re: [Powertop] [PATCH] Using std::max to handle all such kind of logic
Date: Thu, 24 Jan 2013 10:03:55 +0800
Message-ID: <CAGLu0vOHPMaWJhGRAuNx4X0mXute+vu0cdd79hNrWAWGPSOWkg@mail.gmail.com>
In-Reply-To: 1358927592.3289.31.camel@sara
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============1974511109283937954==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Magnus,

Thanks for your comments. In fact, as to this, I don't have much points
because from my limited knowledge, there was not too much
difference/benefit just from logic.

Maybe others can give some brilliant points.

Thanks.


2013/1/23 Magnus Fromreide <magfr(a)lysator.liu.se>

> On Wed, 2013-01-23 at 11:54 +0800, Austin Zhang wrote:
> > Signed-off-by: Austin Zhang <zhang.austin(a)gmail.com>
> > ---
> >  src/cpu/cpu.cpp |    5 +++--
> >  1 files changed, 3 insertions(+), 2 deletions(-)
> >
> > diff --git a/src/cpu/cpu.cpp b/src/cpu/cpu.cpp
> > index 7f3af69..38540a5 100644
> > --- a/src/cpu/cpu.cpp
> > +++ b/src/cpu/cpu.cpp
> > @@ -525,8 +525,9 @@ void report_display_cpu_pstates(void)
> >       unsigned int i, pstates_num;
> >
> >       for (i =3D 0, pstates_num =3D 0; i < all_cpus.size(); i++)
> > -             if (all_cpus[i] && all_cpus[i]->pstates.size() >
> pstates_num)
> > -                     pstates_num =3D all_cpus[i]->pstates.size();
> > +             if (all_cpus[i])
> > +                     pstates_num =3D std::max<unsigned int>(pstates_nu=
m,
> > +
> all_cpus[i]->pstates.size());
>
> There should be no need to specify the template argument if pstates_num
> is declared to the right type.
> The return type of vector<T>::size() is vector<T>::size_type.
> Thus I think this is a nicer version:
>
> vector<frequency*>::size_type pstates_num;
>
> for (i =3D 0, pstates_num =3D 0; i < all_cpus.size(); ++i)
>         if (all_cpus[i])
>                 pstates_num =3D max(pstates_num,
> all_cpus[i]->pstates.size());
>
> What do you think?
>
> /MF
>
>

--===============1974511109283937954==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PGRpdiBkaXI9Imx0ciI+TWFnbnVzLKA8ZGl2Pjxicj48L2Rpdj48ZGl2IHN0eWxlPlRoYW5rcyBm
b3IgeW91ciBjb21tZW50cy4gSW4gZmFjdCwgYXMgdG8gdGhpcywgSSBkb24mIzM5O3QgaGF2ZSBt
dWNoIHBvaW50cyBiZWNhdXNlIGZyb20gbXkgbGltaXRlZCBrbm93bGVkZ2UsIHRoZXJlIHdhcyBu
b3QgdG9vIG11Y2ggZGlmZmVyZW5jZS9iZW5lZml0IGp1c3QgZnJvbSBsb2dpYy6gPC9kaXY+Cjxk
aXYgc3R5bGU+PGJyPjwvZGl2PjxkaXYgc3R5bGU+TWF5YmUgb3RoZXJzIGNhbiBnaXZlIHNvbWWg
YnJpbGxpYW50IHBvaW50cy48L2Rpdj48ZGl2IHN0eWxlPjxicj48L2Rpdj48ZGl2IHN0eWxlPlRo
YW5rcy4goDwvZGl2PjwvZGl2PjxkaXYgY2xhc3M9ImdtYWlsX2V4dHJhIj48YnI+PGJyPjxkaXYg
Y2xhc3M9ImdtYWlsX3F1b3RlIj4yMDEzLzEvMjMgTWFnbnVzIEZyb21yZWlkZSA8c3BhbiBkaXI9
Imx0ciI+Jmx0OzxhIGhyZWY9Im1haWx0bzptYWdmckBseXNhdG9yLmxpdS5zZSIgdGFyZ2V0PSJf
YmxhbmsiPm1hZ2ZyQGx5c2F0b3IubGl1LnNlPC9hPiZndDs8L3NwYW4+PGJyPgo8YmxvY2txdW90
ZSBjbGFzcz0iZ21haWxfcXVvdGUiIHN0eWxlPSJtYXJnaW46MCAwIDAgLjhleDtib3JkZXItbGVm
dDoxcHggI2NjYyBzb2xpZDtwYWRkaW5nLWxlZnQ6MWV4Ij48ZGl2IGNsYXNzPSJpbSI+T24gV2Vk
LCAyMDEzLTAxLTIzIGF0IDExOjU0ICswODAwLCBBdXN0aW4gWmhhbmcgd3JvdGU6PGJyPgomZ3Q7
IFNpZ25lZC1vZmYtYnk6IEF1c3RpbiBaaGFuZyAmbHQ7PGEgaHJlZj0ibWFpbHRvOnpoYW5nLmF1
c3RpbkBnbWFpbC5jb20iPnpoYW5nLmF1c3RpbkBnbWFpbC5jb208L2E+Jmd0Ozxicj4KJmd0OyAt
LS08YnI+CiZndDsgoHNyYy9jcHUvY3B1LmNwcCB8IKAgoDUgKysrLS08YnI+CiZndDsgoDEgZmls
ZXMgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKTxicj4KJmd0Ozxicj4K
Jmd0OyBkaWZmIC0tZ2l0IGEvc3JjL2NwdS9jcHUuY3BwIGIvc3JjL2NwdS9jcHUuY3BwPGJyPgom
Z3Q7IGluZGV4IDdmM2FmNjkuLjM4NTQwYTUgMTAwNjQ0PGJyPgomZ3Q7IC0tLSBhL3NyYy9jcHUv
Y3B1LmNwcDxicj4KJmd0OyArKysgYi9zcmMvY3B1L2NwdS5jcHA8YnI+CiZndDsgQEAgLTUyNSw4
ICs1MjUsOSBAQCB2b2lkIHJlcG9ydF9kaXNwbGF5X2NwdV9wc3RhdGVzKHZvaWQpPGJyPgomZ3Q7
IKAgoCCgIHVuc2lnbmVkIGludCBpLCBwc3RhdGVzX251bTs8YnI+CiZndDs8YnI+CiZndDsgoCCg
IKAgZm9yIChpID0gMCwgcHN0YXRlc19udW0gPSAwOyBpICZsdDsgYWxsX2NwdXMuc2l6ZSgpOyBp
KyspPGJyPgomZ3Q7IC0goCCgIKAgoCCgIKAgaWYgKGFsbF9jcHVzW2ldICZhbXA7JmFtcDsgYWxs
X2NwdXNbaV0tJmd0O3BzdGF0ZXMuc2l6ZSgpICZndDsgcHN0YXRlc19udW0pPGJyPgomZ3Q7IC0g
oCCgIKAgoCCgIKAgoCCgIKAgoCBwc3RhdGVzX251bSA9IGFsbF9jcHVzW2ldLSZndDtwc3RhdGVz
LnNpemUoKTs8YnI+CiZndDsgKyCgIKAgoCCgIKAgoCBpZiAoYWxsX2NwdXNbaV0pPGJyPgomZ3Q7
ICsgoCCgIKAgoCCgIKAgoCCgIKAgoCBwc3RhdGVzX251bSA9IHN0ZDo6bWF4Jmx0O3Vuc2lnbmVk
IGludCZndDsocHN0YXRlc19udW0sPGJyPgomZ3Q7ICsgoCCgIKAgoCCgIKAgoCCgIKAgoCCgIKAg
oCCgIKAgoCCgIKAgoCCgIKAgoCCgIKAgoCCgIKAgoCCgIKAgYWxsX2NwdXNbaV0tJmd0O3BzdGF0
ZXMuc2l6ZSgpKTs8YnI+Cjxicj4KPC9kaXY+VGhlcmUgc2hvdWxkIGJlIG5vIG5lZWQgdG8gc3Bl
Y2lmeSB0aGUgdGVtcGxhdGUgYXJndW1lbnQgaWYgcHN0YXRlc19udW08YnI+CmlzIGRlY2xhcmVk
IHRvIHRoZSByaWdodCB0eXBlLjxicj4KVGhlIHJldHVybiB0eXBlIG9mIHZlY3RvciZsdDtUJmd0
Ozo6c2l6ZSgpIGlzIHZlY3RvciZsdDtUJmd0Ozo6c2l6ZV90eXBlLjxicj4KVGh1cyBJIHRoaW5r
IHRoaXMgaXMgYSBuaWNlciB2ZXJzaW9uOjxicj4KPGJyPgp2ZWN0b3ImbHQ7ZnJlcXVlbmN5KiZn
dDs6OnNpemVfdHlwZSBwc3RhdGVzX251bTs8YnI+Cjxicj4KZm9yIChpID0gMCwgcHN0YXRlc19u
dW0gPSAwOyBpICZsdDsgYWxsX2NwdXMuc2l6ZSgpOyArK2kpPGJyPgqgIKAgoCCgIGlmIChhbGxf
Y3B1c1tpXSk8YnI+CqAgoCCgIKAgoCCgIKAgoCBwc3RhdGVzX251bSA9IG1heChwc3RhdGVzX251
bSwgYWxsX2NwdXNbaV0tJmd0O3BzdGF0ZXMuc2l6ZSgpKTs8YnI+Cjxicj4KV2hhdCBkbyB5b3Ug
dGhpbms/PGJyPgo8c3BhbiBjbGFzcz0iSE9FblpiIj48Zm9udCBjb2xvcj0iIzg4ODg4OCI+PGJy
PgovTUY8YnI+Cjxicj4KPC9mb250Pjwvc3Bhbj48L2Jsb2NrcXVvdGU+PC9kaXY+PGJyPjwvZGl2
Pgo=

--===============1974511109283937954==--

