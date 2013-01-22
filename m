Content-Type: multipart/mixed; boundary="===============0420228654512969977=="
MIME-Version: 1.0
From: Austin Zhang <zhang.austin at gmail.com>
Subject: Re: [Powertop] [PATCH] Fix C states and P states presentation issue.
Date: Tue, 22 Jan 2013 19:45:27 +0800
Message-ID: <CAGLu0vNT9reBmAY9C3ye2MNM90HgE+PwcPS3hgbT6BJpdpHdDg@mail.gmail.com>
In-Reply-To: 20130122105456.GA2353@swordfish.minsk.epam.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============0420228654512969977==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi, list,

Just find I just click 'reply-to' to ss, and doesn't cc/to
powertop(a)lists.01.org in this thread for those before feedback, sorry for
this.

Copy to here so that maybe Igor has comments also:

>Hm, I'm sure I've seen this before. Was it the same patch from you?
No, I didn't watch those patches from mailling list, just found this issue
in my daily working and then work out this patch. And I also didn't send it
before.

>Ok, I found it: "Display all P-states in HTML-report"
(http://lists.01.org/pipermail/powertop/2012-July/000161.html).
Thanks, just read it, it is only for pstates and this patch is learning the
same way from the mentioned codes. Seemed Igor and I encounter the same
situation for ARM and IA respectively :-)
Is the 2 patches conflict? I use the latest codes base from github.
Or the same fixing from igor is pending in the pool?

>but I'm not sure that CPUs with more than 10 C-states exists.
Yes, I am not sure the ARM case like igor is facing, for IA, yes.


2013/1/22 Sergey Senozhatsky <sergey.senozhatsky(a)gmail.com>

> On (01/22/13 18:40), Austin Zhang wrote:
> > Date: Tue, 22 Jan 2013 18:40:03 +0800
> > From: Austin Zhang <zhang.austin(a)gmail.com>
> > To: Sergey Senozhatsky <sergey.senozhatsky(a)gmail.com>
> > Subject: Re: [Powertop] [PATCH] Fix C states and P states presentation
> >  issue.
> >
> >    Sergey,
> >    Thanks for your review and comments, I will send out V2 by this. =EF=
=BF=BD
> >
>
> thank you,
>
>         -ss
>
>
> >    2013/1/22 Sergey Senozhatsky <[1]sergey.senozhatsky(a)gmail.com>
> >
> >      On (01/15/13 19:05), Austin Zhang wrote:
> >      > Date: Tue, 15 Jan 2013 19:05:18 +0800
> >      > From: Austin Zhang <[2]zhang.austin(a)gmail.com>
> >      > To: [3]powertop(a)lists.01.org
> >      > Subject: [Powertop] [PATCH] Fix C states and P states presentati=
on
> >      issue.
> >      > X-Mailer: git-send-email 1.7.5.4
> >      >
> >      > If using '10' in this 'for' loop, for P states, once the process=
or
> >      > provides more than 10 P states, those additional ones cannot been
> >      > presented; and for C states, once the processor provides maximize
> >      > C states level more than 9, for example, it only has POLL, C1, C=
3,
> >      > C6, C10, the additional one like C10 also cannot be presented.
> >      >
> >      > Now we get the loop numbers from the system information we had g=
ot
> >      > before.
> >      >
> >      > Signed-off-by: Austin Zhang <[4]zhang.austin(a)gmail.com>
> >      > ---
> >      > =EF=BF=BDsrc/cpu/cpu.cpp | =EF=BF=BD 35 ++++++++++++++++++++++++=
+++++------
> >      > =EF=BF=BD1 files changed, 29 insertions(+), 6 deletions(-)
> >      >
> >      > diff --git a/src/cpu/cpu.cpp b/src/cpu/cpu.cpp
> >      > index 7f3af69..28f77b7 100644
> >      > --- a/src/cpu/cpu.cpp
> >      > +++ b/src/cpu/cpu.cpp
> >      > @@ -404,6 +404,15 @@ void report_display_cpu_cstates(void)
> >      > =EF=BF=BD =EF=BF=BD =EF=BF=BD unsigned int package, core, cpu;
> >      > =EF=BF=BD =EF=BF=BD =EF=BF=BD int line;
> >      > =EF=BF=BD =EF=BF=BD =EF=BF=BD class abstract_cpu *_package, * _c=
ore, * _cpu;
> >      > + =EF=BF=BD =EF=BF=BD unsigned int i, j, cstates_num;
> >      > +
> >      > + =EF=BF=BD =EF=BF=BD for (i =3D 0, cstates_num =3D 0; i < all_c=
pus.size(); i++) {
> >      > + =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD if=
 (all_cpus[i])
> >      > + =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =
=EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD for (j =3D 0; j < all_cpus[i]->csta=
tes.size();
> >      j++)
> >      > + =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =
=EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=
=BF=BD if
> >      ((all_cpus[i]->cstates[j])->line_level >=3D 0 &&
> >      > + =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =
=EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=
=BF=BD =EF=BF=BD =EF=BF=BD
> >      (all_cpus[i]->cstates[j])->line_level > cstates_num)
> >      > + =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =
=EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=
=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD cstates_num =3D
> >      (all_cpus[i]->cstates[j])->line_level;
> >      > + =EF=BF=BD =EF=BF=BD }
> >      >
> >
> >      how about removing this `if' condition?
> >      =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD for (j =3D 0; j < all_cpus=
[i]->cstates.size(); j++)
> >      =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=
=BD =EF=BF=BD cstates_num =3D std::max(cstates_num,
> >      (all_cpus[i]->cstates[j])->line_level);
> >
> >      > =EF=BF=BD =EF=BF=BD =EF=BF=BD report.begin_section(SECTION_CPUID=
LE);
> >      > =EF=BF=BD =EF=BF=BD =EF=BF=BD report.add_header("Processor Idle =
state report");
> >      > @@ -421,7 +430,7 @@ void report_display_cpu_cstates(void)
> >      > =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=
=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD if (!_core)
> >      > =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=
=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=
=BD =EF=BF=BD continue;
> >      >
> >      > - =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =
=EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD for (line =3D LEVEL_HEADER; line < =
10;
> line++) {
> >      > + =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =
=EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD for (line =3D LEVEL_HEADER; line <=
=3D
> >      (int)cstates_num; line++) {
> >      > =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=
=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=
=BD =EF=BF=BD bool first_cpu =3D true;
> >      >
> >      > =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=
=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=
=BD =EF=BF=BD if
> (!_package->has_cstate_level(line))
> >      > @@ -628,14 +637,29 @@ void impl_w_display_cpu_states(int state)
> >      > =EF=BF=BD =EF=BF=BD =EF=BF=BD char buffer[128];
> >      > =EF=BF=BD =EF=BF=BD =EF=BF=BD char linebuf[1024];
> >      > =EF=BF=BD =EF=BF=BD =EF=BF=BD unsigned int package, core, cpu;
> >      > - =EF=BF=BD =EF=BF=BD int line;
> >      > + =EF=BF=BD =EF=BF=BD int line, loop;
> >      > =EF=BF=BD =EF=BF=BD =EF=BF=BD class abstract_cpu *_package, * _c=
ore, * _cpu;
> >      > =EF=BF=BD =EF=BF=BD =EF=BF=BD int ctr =3D 0;
> >      > + =EF=BF=BD =EF=BF=BD unsigned int i, j, cstates_num, pstates_nu=
m;
> >      > +
> >      > + =EF=BF=BD =EF=BF=BD for (i =3D 0, cstates_num =3D 0, pstates_n=
um =3D 0; i <
> >      all_cpus.size(); i++) {
> >
> >      we have two all_cpus[i] checks in one for loop, let's change to
> single
> >      `if (!all_cpus[i]) continue;'
> >
> >      > + =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD if=
 (all_cpus[i] && all_cpus[i]->pstates.size() >
> >      pstates_num)
> >      > + =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =
=EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD pstates_num =3D all_cpus[i]->pstate=
s.size();
> >      >
> >
> >      =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD pstates_num =3D std::max(p=
states_num,
> all_cpus[i]->pstates.size())
> >
> >      > - =EF=BF=BD =EF=BF=BD if (state =3D=3D PSTATE)
> >      > + =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD if=
 (all_cpus[i])
> >      > + =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =
=EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD for (j =3D 0; j < all_cpus[i]->csta=
tes.size();
> >      j++)
> >      > + =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =
=EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=
=BF=BD if
> >      ((all_cpus[i]->cstates[j])->line_level >=3D 0 &&
> >      > + =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =
=EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=
=BF=BD =EF=BF=BD =EF=BF=BD
> >      (all_cpus[i]->cstates[j])->line_level > cstates_num)
> >      > + =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =
=EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=
=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD cstates_num =3D
> >      (all_cpus[i]->cstates[j])->line_level;
> >
> >      =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD for (j =3D 0; j < all_cpus=
[i]->cstates.size(); j++)
> >      =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=
=BD =EF=BF=BD cstates_num =3D std::max(cstates_num,
> >      (all_cpus[i]->cstates[j])->line_level)
> >
> >      =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD -ss
> >
> >      > + =EF=BF=BD =EF=BF=BD }
> >      > +
> >      > + =EF=BF=BD =EF=BF=BD if (state =3D=3D PSTATE) {
> >      > =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=
=BF=BD win =3D get_ncurses_win("Frequency stats");
> >      > - =EF=BF=BD =EF=BF=BD else
> >      > + =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD lo=
op =3D (int)pstates_num;
> >      > + =EF=BF=BD =EF=BF=BD } else {
> >      > =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=
=BF=BD win =3D get_ncurses_win("Idle stats");
> >      > + =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD lo=
op =3D (int)cstates_num;
> >      > + =EF=BF=BD =EF=BF=BD }
> >      >
> >      > =EF=BF=BD =EF=BF=BD =EF=BF=BD if (!win)
> >      > =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=
=BF=BD return;
> >      > @@ -656,8 +680,7 @@ void impl_w_display_cpu_states(int state)
> >      > =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=
=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD if (!_core->has_pstates() &&=
 state =3D=3D
> PSTATE)
> >      > =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=
=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=
=BD =EF=BF=BD continue;
> >      >
> >      > -
> >      > - =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =
=EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD for (line =3D LEVEL_HEADER; line < =
10;
> line++) {
> >      > + =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =
=EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD for (line =3D LEVEL_HEADER; line <=
=3D loop;
> line++)
> >      {
> >      > =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=
=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=
=BD =EF=BF=BD int first =3D 1;
> >      > =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=
=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=
=BD =EF=BF=BD ctr =3D 0;
> >      > =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=
=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=
=BD =EF=BF=BD linebuf[0] =3D 0;
> >      > --
> >      > 1.7.5.4
> >      >
> >      > _______________________________________________
> >      > PowerTop mailing list
> >      > [5]PowerTop(a)lists.01.org
> >      > [6]https://lists.01.org/mailman/listinfo/powertop
> >      >
> >
> > References
> >
> >    Visible links
> >    1. mailto:sergey.senozhatsky(a)gmail.com
> >    2. mailto:zhang.austin(a)gmail.com
> >    3. mailto:powertop(a)lists.01.org
> >    4. mailto:zhang.austin(a)gmail.com
> >    5. mailto:PowerTop(a)lists.01.org
> >    6. https://lists.01.org/mailman/listinfo/powertop
>

--===============0420228654512969977==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PGRpdiBkaXI9Imx0ciI+SGksIGxpc3QsPGRpdj48YnI+PC9kaXY+PGRpdj5KdXN0IGZpbmQgSSBq
dXN0IGNsaWNrICYjMzk7cmVwbHktdG8mIzM5OyB0byBzcywgYW5kIGRvZXNuJiMzOTt0IGNjL3Rv
IDxhIGhyZWY9Im1haWx0bzpwb3dlcnRvcEBsaXN0cy4wMS5vcmciPnBvd2VydG9wQGxpc3RzLjAx
Lm9yZzwvYT4gaW4gdGhpcyB0aHJlYWQgZm9yIHRob3NlIGJlZm9yZSBmZWVkYmFjaywgc29ycnkg
Zm9yIHRoaXMuPC9kaXY+CjxkaXY+PGJyPjwvZGl2PjxkaXYgc3R5bGU+Q29weSB0byBoZXJlIHNv
IHRoYXQgbWF5YmUgSWdvciBoYXMgY29tbWVudHMgYWxzbzo8L2Rpdj48ZGl2IHN0eWxlPjxicj48
L2Rpdj48ZGl2IHN0eWxlPjxkaXYgY2xhc3M9ImltIiBzdHlsZT0iZm9udC1mYW1pbHk6YXJpYWws
c2Fucy1zZXJpZjtmb250LXNpemU6MTRweCI+Jmd0O0htLCBJJiMzOTttIHN1cmUgSSYjMzk7dmUg
c2VlbiB0aGlzIGJlZm9yZS4gV2FzIGl0IHRoZSBzYW1lIHBhdGNoIGZyb23CoHlvdT88L2Rpdj4K
PGRpdiBzdHlsZT0iZm9udC1mYW1pbHk6YXJpYWwsc2Fucy1zZXJpZjtmb250LXNpemU6MTRweCI+
Tm8sIEkgZGlkbiYjMzk7dCB3YXRjaCB0aG9zZSBwYXRjaGVzIGZyb20gbWFpbGxpbmcgbGlzdCwg
anVzdCBmb3VuZCB0aGlzIGlzc3VlIGluIG15IGRhaWx5IHdvcmtpbmcgYW5kIHRoZW4gd29yayBv
dXQgdGhpcyBwYXRjaC4gQW5kIEkgYWxzbyBkaWRuJiMzOTt0IHNlbmQgaXQgYmVmb3JlLsKgPC9k
aXY+CjxkaXYgY2xhc3M9ImltIiBzdHlsZT0iZm9udC1mYW1pbHk6YXJpYWwsc2Fucy1zZXJpZjtm
b250LXNpemU6MTRweCI+PGRpdj48YnI+PC9kaXY+PGRpdj4mZ3Q7T2ssIEkgZm91bmQgaXQ6ICZx
dW90O0Rpc3BsYXkgYWxsIFAtc3RhdGVzIGluIEhUTUwtcmVwb3J0JnF1b3Q7PC9kaXY+KDxhIGhy
ZWY9Imh0dHA6Ly9saXN0cy4wMS5vcmcvcGlwZXJtYWlsL3Bvd2VydG9wLzIwMTItSnVseS8wMDAx
NjEuaHRtbCIgdGFyZ2V0PSJfYmxhbmsiPmh0dHA6Ly9saXN0cy4wMS5vcmcvcGlwZXJtYWlsL3Bv
d2VydG9wLzIwMTItSnVseS8wMDAxNjEuaHRtbDwvYT4pLjwvZGl2Pgo8ZGl2IHN0eWxlPSJmb250
LWZhbWlseTphcmlhbCxzYW5zLXNlcmlmO2ZvbnQtc2l6ZToxNHB4Ij48Zm9udCBmYWNlPSJhcmlh
bCwgc2Fucy1zZXJpZiI+VGhhbmtzLCBqdXN0IHJlYWQgaXQsIGl0IGlzIG9ubHkgZm9yIHBzdGF0
ZXMgYW5kIHRoaXMgcGF0Y2ggaXMgbGVhcm5pbmcgdGhlIHNhbWUgd2F5IGZyb20gdGhlIG1lbnRp
b25lZCBjb2Rlcy4gU2VlbWVkIElnb3IgYW5kIEkgZW5jb3VudGVyIHRoZSBzYW1lIHNpdHVhdGlv
biBmb3IgQVJNIGFuZCBJQcKgcmVzcGVjdGl2ZWx5wqA6LSnCoDwvZm9udD48L2Rpdj4KPGRpdiBz
dHlsZT0iZm9udC1mYW1pbHk6YXJpYWwsc2Fucy1zZXJpZjtmb250LXNpemU6MTRweCI+SXMgdGhl
IDIgcGF0Y2hlcyBjb25mbGljdD8gSSB1c2UgdGhlIGxhdGVzdCBjb2RlcyBiYXNlIGZyb20gZ2l0
aHViLjwvZGl2PjxkaXYgc3R5bGU9ImZvbnQtZmFtaWx5OmFyaWFsLHNhbnMtc2VyaWY7Zm9udC1z
aXplOjE0cHgiPk9yIHRoZSBzYW1lIGZpeGluZyBmcm9tIGlnb3IgaXMgcGVuZGluZyBpbiB0aGUg
cG9vbD88L2Rpdj4KPGRpdiBjbGFzcz0iaW0iIHN0eWxlPSJmb250LWZhbWlseTphcmlhbCxzYW5z
LXNlcmlmO2ZvbnQtc2l6ZToxNHB4Ij48ZGl2Pjxicj48L2Rpdj48ZGl2PiZndDtidXQgSSYjMzk7
bSBub3Qgc3VyZSB0aGF0IENQVXMgd2l0aCBtb3JlIHRoYW4gMTAgQy1zdGF0ZXMgZXhpc3RzLsKg
PGJyPjwvZGl2PjwvZGl2PjxkaXYgc3R5bGU9ImZvbnQtZmFtaWx5OmFyaWFsLHNhbnMtc2VyaWY7
Zm9udC1zaXplOjE0cHgiPgpZZXMsIEkgYW0gbm90IHN1cmUgdGhlIEFSTSBjYXNlIGxpa2UgaWdv
ciBpcyBmYWNpbmcsIGZvciBJQSwgeWVzLsKgPC9kaXY+PC9kaXY+PC9kaXY+PGRpdiBjbGFzcz0i
Z21haWxfZXh0cmEiPjxicj48YnI+PGRpdiBjbGFzcz0iZ21haWxfcXVvdGUiPjIwMTMvMS8yMiBT
ZXJnZXkgU2Vub3poYXRza3kgPHNwYW4gZGlyPSJsdHIiPiZsdDs8YSBocmVmPSJtYWlsdG86c2Vy
Z2V5LnNlbm96aGF0c2t5QGdtYWlsLmNvbSIgdGFyZ2V0PSJfYmxhbmsiPnNlcmdleS5zZW5vemhh
dHNreUBnbWFpbC5jb208L2E+Jmd0Ozwvc3Bhbj48YnI+CjxibG9ja3F1b3RlIGNsYXNzPSJnbWFp
bF9xdW90ZSIgc3R5bGU9Im1hcmdpbjowIDAgMCAuOGV4O2JvcmRlci1sZWZ0OjFweCAjY2NjIHNv
bGlkO3BhZGRpbmctbGVmdDoxZXgiPk9uICgwMS8yMi8xMyAxODo0MCksIEF1c3RpbiBaaGFuZyB3
cm90ZTo8YnI+CiZndDsgRGF0ZTogVHVlLCAyMiBKYW4gMjAxMyAxODo0MDowMyArMDgwMDxicj4K
Jmd0OyBGcm9tOiBBdXN0aW4gWmhhbmcgJmx0OzxhIGhyZWY9Im1haWx0bzp6aGFuZy5hdXN0aW5A
Z21haWwuY29tIj56aGFuZy5hdXN0aW5AZ21haWwuY29tPC9hPiZndDs8YnI+CiZndDsgVG86IFNl
cmdleSBTZW5vemhhdHNreSAmbHQ7PGEgaHJlZj0ibWFpbHRvOnNlcmdleS5zZW5vemhhdHNreUBn
bWFpbC5jb20iPnNlcmdleS5zZW5vemhhdHNreUBnbWFpbC5jb208L2E+Jmd0Ozxicj4KJmd0OyBT
dWJqZWN0OiBSZTogW1Bvd2VydG9wXSBbUEFUQ0hdIEZpeCBDIHN0YXRlcyBhbmQgUCBzdGF0ZXMg
cHJlc2VudGF0aW9uPGJyPgomZ3Q7IMKgaXNzdWUuPGJyPgomZ3Q7PGJyPgomZ3Q7IMKgIMKgU2Vy
Z2V5LDxicj4KJmd0OyDCoCDCoFRoYW5rcyBmb3IgeW91ciByZXZpZXcgYW5kIGNvbW1lbnRzLCBJ
IHdpbGwgc2VuZCBvdXQgVjIgYnkgdGhpcy4g77+9PGJyPgomZ3Q7PGJyPgo8YnI+CnRoYW5rIHlv
dSw8YnI+Cjxicj4KwqAgwqAgwqAgwqAgLXNzPGJyPgo8YnI+Cjxicj4KJmd0OyDCoCDCoDIwMTMv
MS8yMiBTZXJnZXkgU2Vub3poYXRza3kgJmx0O1sxXTxhIGhyZWY9Im1haWx0bzpzZXJnZXkuc2Vu
b3poYXRza3lAZ21haWwuY29tIj5zZXJnZXkuc2Vub3poYXRza3lAZ21haWwuY29tPC9hPiZndDs8
YnI+CjxkaXYgY2xhc3M9ImltIj4mZ3Q7PGJyPgomZ3Q7IMKgIMKgIMKgT24gKDAxLzE1LzEzIDE5
OjA1KSwgQXVzdGluIFpoYW5nIHdyb3RlOjxicj4KJmd0OyDCoCDCoCDCoCZndDsgRGF0ZTogVHVl
LCAxNSBKYW4gMjAxMyAxOTowNToxOCArMDgwMDxicj4KPC9kaXY+Jmd0OyDCoCDCoCDCoCZndDsg
RnJvbTogQXVzdGluIFpoYW5nICZsdDtbMl08YSBocmVmPSJtYWlsdG86emhhbmcuYXVzdGluQGdt
YWlsLmNvbSI+emhhbmcuYXVzdGluQGdtYWlsLmNvbTwvYT4mZ3Q7PGJyPgomZ3Q7IMKgIMKgIMKg
Jmd0OyBUbzogWzNdPGEgaHJlZj0ibWFpbHRvOnBvd2VydG9wQGxpc3RzLjAxLm9yZyI+cG93ZXJ0
b3BAbGlzdHMuMDEub3JnPC9hPjxicj4KPGRpdiBjbGFzcz0iaW0iPiZndDsgwqAgwqAgwqAmZ3Q7
IFN1YmplY3Q6IFtQb3dlcnRvcF0gW1BBVENIXSBGaXggQyBzdGF0ZXMgYW5kIFAgc3RhdGVzIHBy
ZXNlbnRhdGlvbjxicj4KJmd0OyDCoCDCoCDCoGlzc3VlLjxicj4KJmd0OyDCoCDCoCDCoCZndDsg
WC1NYWlsZXI6IGdpdC1zZW5kLWVtYWlsIDEuNy41LjQ8YnI+CiZndDsgwqAgwqAgwqAmZ3Q7PGJy
PgomZ3Q7IMKgIMKgIMKgJmd0OyBJZiB1c2luZyAmIzM5OzEwJiMzOTsgaW4gdGhpcyAmIzM5O2Zv
ciYjMzk7IGxvb3AsIGZvciBQIHN0YXRlcywgb25jZSB0aGUgcHJvY2Vzc29yPGJyPgomZ3Q7IMKg
IMKgIMKgJmd0OyBwcm92aWRlcyBtb3JlIHRoYW4gMTAgUCBzdGF0ZXMsIHRob3NlIGFkZGl0aW9u
YWwgb25lcyBjYW5ub3QgYmVlbjxicj4KJmd0OyDCoCDCoCDCoCZndDsgcHJlc2VudGVkOyBhbmQg
Zm9yIEMgc3RhdGVzLCBvbmNlIHRoZSBwcm9jZXNzb3IgcHJvdmlkZXMgbWF4aW1pemU8YnI+CiZn
dDsgwqAgwqAgwqAmZ3Q7IEMgc3RhdGVzIGxldmVsIG1vcmUgdGhhbiA5LCBmb3IgZXhhbXBsZSwg
aXQgb25seSBoYXMgUE9MTCwgQzEsIEMzLDxicj4KJmd0OyDCoCDCoCDCoCZndDsgQzYsIEMxMCwg
dGhlIGFkZGl0aW9uYWwgb25lIGxpa2UgQzEwIGFsc28gY2Fubm90IGJlIHByZXNlbnRlZC48YnI+
CiZndDsgwqAgwqAgwqAmZ3Q7PGJyPgomZ3Q7IMKgIMKgIMKgJmd0OyBOb3cgd2UgZ2V0IHRoZSBs
b29wIG51bWJlcnMgZnJvbSB0aGUgc3lzdGVtIGluZm9ybWF0aW9uIHdlIGhhZCBnb3Q8YnI+CiZn
dDsgwqAgwqAgwqAmZ3Q7IGJlZm9yZS48YnI+CiZndDsgwqAgwqAgwqAmZ3Q7PGJyPgo8L2Rpdj4m
Z3Q7IMKgIMKgIMKgJmd0OyBTaWduZWQtb2ZmLWJ5OiBBdXN0aW4gWmhhbmcgJmx0O1s0XTxhIGhy
ZWY9Im1haWx0bzp6aGFuZy5hdXN0aW5AZ21haWwuY29tIj56aGFuZy5hdXN0aW5AZ21haWwuY29t
PC9hPiZndDs8YnI+CjxkaXY+PGRpdiBjbGFzcz0iaDUiPiZndDsgwqAgwqAgwqAmZ3Q7IC0tLTxi
cj4KJmd0OyDCoCDCoCDCoCZndDsg77+9c3JjL2NwdS9jcHUuY3BwIHwg77+9IDM1ICsrKysrKysr
KysrKysrKysrKysrKysrKysrKysrLS0tLS0tPGJyPgomZ3Q7IMKgIMKgIMKgJmd0OyDvv70xIGZp
bGVzIGNoYW5nZWQsIDI5IGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pPGJyPgomZ3Q7IMKg
IMKgIMKgJmd0Ozxicj4KJmd0OyDCoCDCoCDCoCZndDsgZGlmZiAtLWdpdCBhL3NyYy9jcHUvY3B1
LmNwcCBiL3NyYy9jcHUvY3B1LmNwcDxicj4KJmd0OyDCoCDCoCDCoCZndDsgaW5kZXggN2YzYWY2
OS4uMjhmNzdiNyAxMDA2NDQ8YnI+CiZndDsgwqAgwqAgwqAmZ3Q7IC0tLSBhL3NyYy9jcHUvY3B1
LmNwcDxicj4KJmd0OyDCoCDCoCDCoCZndDsgKysrIGIvc3JjL2NwdS9jcHUuY3BwPGJyPgomZ3Q7
IMKgIMKgIMKgJmd0OyBAQCAtNDA0LDYgKzQwNCwxNSBAQCB2b2lkIHJlcG9ydF9kaXNwbGF5X2Nw
dV9jc3RhdGVzKHZvaWQpPGJyPgomZ3Q7IMKgIMKgIMKgJmd0OyDvv70g77+9IO+/vSB1bnNpZ25l
ZCBpbnQgcGFja2FnZSwgY29yZSwgY3B1Ozxicj4KJmd0OyDCoCDCoCDCoCZndDsg77+9IO+/vSDv
v70gaW50IGxpbmU7PGJyPgomZ3Q7IMKgIMKgIMKgJmd0OyDvv70g77+9IO+/vSBjbGFzcyBhYnN0
cmFjdF9jcHUgKl9wYWNrYWdlLCAqIF9jb3JlLCAqIF9jcHU7PGJyPgomZ3Q7IMKgIMKgIMKgJmd0
OyArIO+/vSDvv70gdW5zaWduZWQgaW50IGksIGosIGNzdGF0ZXNfbnVtOzxicj4KJmd0OyDCoCDC
oCDCoCZndDsgKzxicj4KJmd0OyDCoCDCoCDCoCZndDsgKyDvv70g77+9IGZvciAoaSA9IDAsIGNz
dGF0ZXNfbnVtID0gMDsgaSAmbHQ7IGFsbF9jcHVzLnNpemUoKTsgaSsrKSB7PGJyPgomZ3Q7IMKg
IMKgIMKgJmd0OyArIO+/vSDvv70g77+9IO+/vSDvv70g77+9IGlmIChhbGxfY3B1c1tpXSk8YnI+
CiZndDsgwqAgwqAgwqAmZ3Q7ICsg77+9IO+/vSDvv70g77+9IO+/vSDvv70g77+9IO+/vSDvv70g
77+9IGZvciAoaiA9IDA7IGogJmx0OyBhbGxfY3B1c1tpXS0mZ3Q7Y3N0YXRlcy5zaXplKCk7PGJy
PgomZ3Q7IMKgIMKgIMKgaisrKTxicj4KJmd0OyDCoCDCoCDCoCZndDsgKyDvv70g77+9IO+/vSDv
v70g77+9IO+/vSDvv70g77+9IO+/vSDvv70g77+9IO+/vSDvv70g77+9IGlmPGJyPgomZ3Q7IMKg
IMKgIMKgKChhbGxfY3B1c1tpXS0mZ3Q7Y3N0YXRlc1tqXSktJmd0O2xpbmVfbGV2ZWwgJmd0Oz0g
MCAmYW1wOyZhbXA7PGJyPgomZ3Q7IMKgIMKgIMKgJmd0OyArIO+/vSDvv70g77+9IO+/vSDvv70g
77+9IO+/vSDvv70g77+9IO+/vSDvv70g77+9IO+/vSDvv70g77+9IO+/vTxicj4KJmd0OyDCoCDC
oCDCoChhbGxfY3B1c1tpXS0mZ3Q7Y3N0YXRlc1tqXSktJmd0O2xpbmVfbGV2ZWwgJmd0OyBjc3Rh
dGVzX251bSk8YnI+CiZndDsgwqAgwqAgwqAmZ3Q7ICsg77+9IO+/vSDvv70g77+9IO+/vSDvv70g
77+9IO+/vSDvv70g77+9IO+/vSDvv70g77+9IO+/vSDvv70g77+9IO+/vSDvv70gY3N0YXRlc19u
dW0gPTxicj4KJmd0OyDCoCDCoCDCoChhbGxfY3B1c1tpXS0mZ3Q7Y3N0YXRlc1tqXSktJmd0O2xp
bmVfbGV2ZWw7PGJyPgomZ3Q7IMKgIMKgIMKgJmd0OyArIO+/vSDvv70gfTxicj4KJmd0OyDCoCDC
oCDCoCZndDs8YnI+CiZndDs8YnI+CiZndDsgwqAgwqAgwqBob3cgYWJvdXQgcmVtb3ZpbmcgdGhp
cyBgaWYmIzM5OyBjb25kaXRpb24/PGJyPgomZ3Q7IMKgIMKgIMKg77+9IO+/vSDvv70g77+9IGZv
ciAoaiA9IDA7IGogJmx0OyBhbGxfY3B1c1tpXS0mZ3Q7Y3N0YXRlcy5zaXplKCk7IGorKyk8YnI+
CiZndDsgwqAgwqAgwqDvv70g77+9IO+/vSDvv70g77+9IO+/vSDvv70g77+9IGNzdGF0ZXNfbnVt
ID0gc3RkOjptYXgoY3N0YXRlc19udW0sPGJyPgomZ3Q7IMKgIMKgIMKgKGFsbF9jcHVzW2ldLSZn
dDtjc3RhdGVzW2pdKS0mZ3Q7bGluZV9sZXZlbCk7PGJyPgomZ3Q7PGJyPgomZ3Q7IMKgIMKgIMKg
Jmd0OyDvv70g77+9IO+/vSByZXBvcnQuYmVnaW5fc2VjdGlvbihTRUNUSU9OX0NQVUlETEUpOzxi
cj4KJmd0OyDCoCDCoCDCoCZndDsg77+9IO+/vSDvv70gcmVwb3J0LmFkZF9oZWFkZXIoJnF1b3Q7
UHJvY2Vzc29yIElkbGUgc3RhdGUgcmVwb3J0JnF1b3Q7KTs8YnI+CiZndDsgwqAgwqAgwqAmZ3Q7
IEBAIC00MjEsNyArNDMwLDcgQEAgdm9pZCByZXBvcnRfZGlzcGxheV9jcHVfY3N0YXRlcyh2b2lk
KTxicj4KJmd0OyDCoCDCoCDCoCZndDsg77+9IO+/vSDvv70g77+9IO+/vSDvv70g77+9IO+/vSDv
v70g77+9IO+/vSBpZiAoIV9jb3JlKTxicj4KJmd0OyDCoCDCoCDCoCZndDsg77+9IO+/vSDvv70g
77+9IO+/vSDvv70g77+9IO+/vSDvv70g77+9IO+/vSDvv70g77+9IO+/vSDvv70gY29udGludWU7
PGJyPgomZ3Q7IMKgIMKgIMKgJmd0Ozxicj4KJmd0OyDCoCDCoCDCoCZndDsgLSDvv70g77+9IO+/
vSDvv70g77+9IO+/vSDvv70g77+9IO+/vSDvv70gZm9yIChsaW5lID0gTEVWRUxfSEVBREVSOyBs
aW5lICZsdDsgMTA7IGxpbmUrKykgezxicj4KJmd0OyDCoCDCoCDCoCZndDsgKyDvv70g77+9IO+/
vSDvv70g77+9IO+/vSDvv70g77+9IO+/vSDvv70gZm9yIChsaW5lID0gTEVWRUxfSEVBREVSOyBs
aW5lICZsdDs9PGJyPgomZ3Q7IMKgIMKgIMKgKGludCljc3RhdGVzX251bTsgbGluZSsrKSB7PGJy
PgomZ3Q7IMKgIMKgIMKgJmd0OyDvv70g77+9IO+/vSDvv70g77+9IO+/vSDvv70g77+9IO+/vSDv
v70g77+9IO+/vSDvv70g77+9IO+/vSBib29sIGZpcnN0X2NwdSA9IHRydWU7PGJyPgomZ3Q7IMKg
IMKgIMKgJmd0Ozxicj4KJmd0OyDCoCDCoCDCoCZndDsg77+9IO+/vSDvv70g77+9IO+/vSDvv70g
77+9IO+/vSDvv70g77+9IO+/vSDvv70g77+9IO+/vSDvv70gaWYgKCFfcGFja2FnZS0mZ3Q7aGFz
X2NzdGF0ZV9sZXZlbChsaW5lKSk8YnI+CiZndDsgwqAgwqAgwqAmZ3Q7IEBAIC02MjgsMTQgKzYz
NywyOSBAQCB2b2lkIGltcGxfd19kaXNwbGF5X2NwdV9zdGF0ZXMoaW50IHN0YXRlKTxicj4KJmd0
OyDCoCDCoCDCoCZndDsg77+9IO+/vSDvv70gY2hhciBidWZmZXJbMTI4XTs8YnI+CiZndDsgwqAg
wqAgwqAmZ3Q7IO+/vSDvv70g77+9IGNoYXIgbGluZWJ1ZlsxMDI0XTs8YnI+CiZndDsgwqAgwqAg
wqAmZ3Q7IO+/vSDvv70g77+9IHVuc2lnbmVkIGludCBwYWNrYWdlLCBjb3JlLCBjcHU7PGJyPgom
Z3Q7IMKgIMKgIMKgJmd0OyAtIO+/vSDvv70gaW50IGxpbmU7PGJyPgomZ3Q7IMKgIMKgIMKgJmd0
OyArIO+/vSDvv70gaW50IGxpbmUsIGxvb3A7PGJyPgomZ3Q7IMKgIMKgIMKgJmd0OyDvv70g77+9
IO+/vSBjbGFzcyBhYnN0cmFjdF9jcHUgKl9wYWNrYWdlLCAqIF9jb3JlLCAqIF9jcHU7PGJyPgom
Z3Q7IMKgIMKgIMKgJmd0OyDvv70g77+9IO+/vSBpbnQgY3RyID0gMDs8YnI+CiZndDsgwqAgwqAg
wqAmZ3Q7ICsg77+9IO+/vSB1bnNpZ25lZCBpbnQgaSwgaiwgY3N0YXRlc19udW0sIHBzdGF0ZXNf
bnVtOzxicj4KJmd0OyDCoCDCoCDCoCZndDsgKzxicj4KJmd0OyDCoCDCoCDCoCZndDsgKyDvv70g
77+9IGZvciAoaSA9IDAsIGNzdGF0ZXNfbnVtID0gMCwgcHN0YXRlc19udW0gPSAwOyBpICZsdDs8
YnI+CiZndDsgwqAgwqAgwqBhbGxfY3B1cy5zaXplKCk7IGkrKykgezxicj4KJmd0Ozxicj4KJmd0
OyDCoCDCoCDCoHdlIGhhdmUgdHdvIGFsbF9jcHVzW2ldIGNoZWNrcyBpbiBvbmUgZm9yIGxvb3As
IGxldCYjMzk7cyBjaGFuZ2UgdG8gc2luZ2xlPGJyPgomZ3Q7IMKgIMKgIMKgYGlmICghYWxsX2Nw
dXNbaV0pIGNvbnRpbnVlOyYjMzk7PGJyPgomZ3Q7PGJyPgomZ3Q7IMKgIMKgIMKgJmd0OyArIO+/
vSDvv70g77+9IO+/vSDvv70g77+9IGlmIChhbGxfY3B1c1tpXSAmYW1wOyZhbXA7IGFsbF9jcHVz
W2ldLSZndDtwc3RhdGVzLnNpemUoKSAmZ3Q7PGJyPgomZ3Q7IMKgIMKgIMKgcHN0YXRlc19udW0p
PGJyPgomZ3Q7IMKgIMKgIMKgJmd0OyArIO+/vSDvv70g77+9IO+/vSDvv70g77+9IO+/vSDvv70g
77+9IO+/vSBwc3RhdGVzX251bSA9IGFsbF9jcHVzW2ldLSZndDtwc3RhdGVzLnNpemUoKTs8YnI+
CiZndDsgwqAgwqAgwqAmZ3Q7PGJyPgomZ3Q7PGJyPgomZ3Q7IMKgIMKgIMKg77+9IO+/vSDvv70g
77+9IHBzdGF0ZXNfbnVtID0gc3RkOjptYXgocHN0YXRlc19udW0sIGFsbF9jcHVzW2ldLSZndDtw
c3RhdGVzLnNpemUoKSk8YnI+CiZndDs8YnI+CiZndDsgwqAgwqAgwqAmZ3Q7IC0g77+9IO+/vSBp
ZiAoc3RhdGUgPT0gUFNUQVRFKTxicj4KJmd0OyDCoCDCoCDCoCZndDsgKyDvv70g77+9IO+/vSDv
v70g77+9IO+/vSBpZiAoYWxsX2NwdXNbaV0pPGJyPgomZ3Q7IMKgIMKgIMKgJmd0OyArIO+/vSDv
v70g77+9IO+/vSDvv70g77+9IO+/vSDvv70g77+9IO+/vSBmb3IgKGogPSAwOyBqICZsdDsgYWxs
X2NwdXNbaV0tJmd0O2NzdGF0ZXMuc2l6ZSgpOzxicj4KJmd0OyDCoCDCoCDCoGorKyk8YnI+CiZn
dDsgwqAgwqAgwqAmZ3Q7ICsg77+9IO+/vSDvv70g77+9IO+/vSDvv70g77+9IO+/vSDvv70g77+9
IO+/vSDvv70g77+9IO+/vSBpZjxicj4KJmd0OyDCoCDCoCDCoCgoYWxsX2NwdXNbaV0tJmd0O2Nz
dGF0ZXNbal0pLSZndDtsaW5lX2xldmVsICZndDs9IDAgJmFtcDsmYW1wOzxicj4KJmd0OyDCoCDC
oCDCoCZndDsgKyDvv70g77+9IO+/vSDvv70g77+9IO+/vSDvv70g77+9IO+/vSDvv70g77+9IO+/
vSDvv70g77+9IO+/vSDvv708YnI+CiZndDsgwqAgwqAgwqAoYWxsX2NwdXNbaV0tJmd0O2NzdGF0
ZXNbal0pLSZndDtsaW5lX2xldmVsICZndDsgY3N0YXRlc19udW0pPGJyPgomZ3Q7IMKgIMKgIMKg
Jmd0OyArIO+/vSDvv70g77+9IO+/vSDvv70g77+9IO+/vSDvv70g77+9IO+/vSDvv70g77+9IO+/
vSDvv70g77+9IO+/vSDvv70g77+9IGNzdGF0ZXNfbnVtID08YnI+CiZndDsgwqAgwqAgwqAoYWxs
X2NwdXNbaV0tJmd0O2NzdGF0ZXNbal0pLSZndDtsaW5lX2xldmVsOzxicj4KJmd0Ozxicj4KJmd0
OyDCoCDCoCDCoO+/vSDvv70g77+9IO+/vSBmb3IgKGogPSAwOyBqICZsdDsgYWxsX2NwdXNbaV0t
Jmd0O2NzdGF0ZXMuc2l6ZSgpOyBqKyspPGJyPgomZ3Q7IMKgIMKgIMKg77+9IO+/vSDvv70g77+9
IO+/vSDvv70g77+9IO+/vSBjc3RhdGVzX251bSA9IHN0ZDo6bWF4KGNzdGF0ZXNfbnVtLDxicj4K
Jmd0OyDCoCDCoCDCoChhbGxfY3B1c1tpXS0mZ3Q7Y3N0YXRlc1tqXSktJmd0O2xpbmVfbGV2ZWwp
PGJyPgomZ3Q7PGJyPgomZ3Q7IMKgIMKgIMKg77+9IO+/vSDvv70g77+9IC1zczxicj4KJmd0Ozxi
cj4KJmd0OyDCoCDCoCDCoCZndDsgKyDvv70g77+9IH08YnI+CiZndDsgwqAgwqAgwqAmZ3Q7ICs8
YnI+CiZndDsgwqAgwqAgwqAmZ3Q7ICsg77+9IO+/vSBpZiAoc3RhdGUgPT0gUFNUQVRFKSB7PGJy
PgomZ3Q7IMKgIMKgIMKgJmd0OyDvv70g77+9IO+/vSDvv70g77+9IO+/vSDvv70gd2luID0gZ2V0
X25jdXJzZXNfd2luKCZxdW90O0ZyZXF1ZW5jeSBzdGF0cyZxdW90Oyk7PGJyPgomZ3Q7IMKgIMKg
IMKgJmd0OyAtIO+/vSDvv70gZWxzZTxicj4KJmd0OyDCoCDCoCDCoCZndDsgKyDvv70g77+9IO+/
vSDvv70g77+9IO+/vSBsb29wID0gKGludClwc3RhdGVzX251bTs8YnI+CiZndDsgwqAgwqAgwqAm
Z3Q7ICsg77+9IO+/vSB9IGVsc2Ugezxicj4KJmd0OyDCoCDCoCDCoCZndDsg77+9IO+/vSDvv70g
77+9IO+/vSDvv70g77+9IHdpbiA9IGdldF9uY3Vyc2VzX3dpbigmcXVvdDtJZGxlIHN0YXRzJnF1
b3Q7KTs8YnI+CiZndDsgwqAgwqAgwqAmZ3Q7ICsg77+9IO+/vSDvv70g77+9IO+/vSDvv70gbG9v
cCA9IChpbnQpY3N0YXRlc19udW07PGJyPgomZ3Q7IMKgIMKgIMKgJmd0OyArIO+/vSDvv70gfTxi
cj4KJmd0OyDCoCDCoCDCoCZndDs8YnI+CiZndDsgwqAgwqAgwqAmZ3Q7IO+/vSDvv70g77+9IGlm
ICghd2luKTxicj4KJmd0OyDCoCDCoCDCoCZndDsg77+9IO+/vSDvv70g77+9IO+/vSDvv70g77+9
IHJldHVybjs8YnI+CiZndDsgwqAgwqAgwqAmZ3Q7IEBAIC02NTYsOCArNjgwLDcgQEAgdm9pZCBp
bXBsX3dfZGlzcGxheV9jcHVfc3RhdGVzKGludCBzdGF0ZSk8YnI+CiZndDsgwqAgwqAgwqAmZ3Q7
IO+/vSDvv70g77+9IO+/vSDvv70g77+9IO+/vSDvv70g77+9IO+/vSDvv70gaWYgKCFfY29yZS0m
Z3Q7aGFzX3BzdGF0ZXMoKSAmYW1wOyZhbXA7IHN0YXRlID09IFBTVEFURSk8YnI+CiZndDsgwqAg
wqAgwqAmZ3Q7IO+/vSDvv70g77+9IO+/vSDvv70g77+9IO+/vSDvv70g77+9IO+/vSDvv70g77+9
IO+/vSDvv70g77+9IGNvbnRpbnVlOzxicj4KJmd0OyDCoCDCoCDCoCZndDs8YnI+CiZndDsgwqAg
wqAgwqAmZ3Q7IC08YnI+CiZndDsgwqAgwqAgwqAmZ3Q7IC0g77+9IO+/vSDvv70g77+9IO+/vSDv
v70g77+9IO+/vSDvv70g77+9IGZvciAobGluZSA9IExFVkVMX0hFQURFUjsgbGluZSAmbHQ7IDEw
OyBsaW5lKyspIHs8YnI+CiZndDsgwqAgwqAgwqAmZ3Q7ICsg77+9IO+/vSDvv70g77+9IO+/vSDv
v70g77+9IO+/vSDvv70g77+9IGZvciAobGluZSA9IExFVkVMX0hFQURFUjsgbGluZSAmbHQ7PSBs
b29wOyBsaW5lKyspPGJyPgomZ3Q7IMKgIMKgIMKgezxicj4KJmd0OyDCoCDCoCDCoCZndDsg77+9
IO+/vSDvv70g77+9IO+/vSDvv70g77+9IO+/vSDvv70g77+9IO+/vSDvv70g77+9IO+/vSDvv70g
aW50IGZpcnN0ID0gMTs8YnI+CiZndDsgwqAgwqAgwqAmZ3Q7IO+/vSDvv70g77+9IO+/vSDvv70g
77+9IO+/vSDvv70g77+9IO+/vSDvv70g77+9IO+/vSDvv70g77+9IGN0ciA9IDA7PGJyPgomZ3Q7
IMKgIMKgIMKgJmd0OyDvv70g77+9IO+/vSDvv70g77+9IO+/vSDvv70g77+9IO+/vSDvv70g77+9
IO+/vSDvv70g77+9IO+/vSBsaW5lYnVmWzBdID0gMDs8YnI+CiZndDsgwqAgwqAgwqAmZ3Q7IC0t
PGJyPgomZ3Q7IMKgIMKgIMKgJmd0OyAxLjcuNS40PGJyPgomZ3Q7IMKgIMKgIMKgJmd0Ozxicj4K
Jmd0OyDCoCDCoCDCoCZndDsgX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX188YnI+CiZndDsgwqAgwqAgwqAmZ3Q7IFBvd2VyVG9wIG1haWxpbmcgbGlzdDxicj4K
PC9kaXY+PC9kaXY+PGRpdiBjbGFzcz0iaW0iPiZndDsgwqAgwqAgwqAmZ3Q7IFs1XTxhIGhyZWY9
Im1haWx0bzpQb3dlclRvcEBsaXN0cy4wMS5vcmciPlBvd2VyVG9wQGxpc3RzLjAxLm9yZzwvYT48
YnI+CiZndDsgwqAgwqAgwqAmZ3Q7IFs2XTxhIGhyZWY9Imh0dHBzOi8vbGlzdHMuMDEub3JnL21h
aWxtYW4vbGlzdGluZm8vcG93ZXJ0b3AiIHRhcmdldD0iX2JsYW5rIj5odHRwczovL2xpc3RzLjAx
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3Bvd2VydG9wPC9hPjxicj4KJmd0OyDCoCDCoCDCoCZndDs8
YnI+CiZndDs8YnI+CiZndDsgUmVmZXJlbmNlczxicj4KJmd0Ozxicj4KJmd0OyDCoCDCoFZpc2li
bGUgbGlua3M8YnI+CjwvZGl2PiZndDsgwqAgwqAxLiBtYWlsdG86PGEgaHJlZj0ibWFpbHRvOnNl
cmdleS5zZW5vemhhdHNreUBnbWFpbC5jb20iPnNlcmdleS5zZW5vemhhdHNreUBnbWFpbC5jb208
L2E+PGJyPgomZ3Q7IMKgIMKgMi4gbWFpbHRvOjxhIGhyZWY9Im1haWx0bzp6aGFuZy5hdXN0aW5A
Z21haWwuY29tIj56aGFuZy5hdXN0aW5AZ21haWwuY29tPC9hPjxicj4KJmd0OyDCoCDCoDMuIG1h
aWx0bzo8YSBocmVmPSJtYWlsdG86cG93ZXJ0b3BAbGlzdHMuMDEub3JnIj5wb3dlcnRvcEBsaXN0
cy4wMS5vcmc8L2E+PGJyPgo8ZGl2IGNsYXNzPSJIT0VuWmIiPjxkaXYgY2xhc3M9Img1Ij4mZ3Q7
IMKgIMKgNC4gbWFpbHRvOjxhIGhyZWY9Im1haWx0bzp6aGFuZy5hdXN0aW5AZ21haWwuY29tIj56
aGFuZy5hdXN0aW5AZ21haWwuY29tPC9hPjxicj4KJmd0OyDCoCDCoDUuIG1haWx0bzo8YSBocmVm
PSJtYWlsdG86UG93ZXJUb3BAbGlzdHMuMDEub3JnIj5Qb3dlclRvcEBsaXN0cy4wMS5vcmc8L2E+
PGJyPgomZ3Q7IMKgIMKgNi4gPGEgaHJlZj0iaHR0cHM6Ly9saXN0cy4wMS5vcmcvbWFpbG1hbi9s
aXN0aW5mby9wb3dlcnRvcCIgdGFyZ2V0PSJfYmxhbmsiPmh0dHBzOi8vbGlzdHMuMDEub3JnL21h
aWxtYW4vbGlzdGluZm8vcG93ZXJ0b3A8L2E+PGJyPgo8L2Rpdj48L2Rpdj48L2Jsb2NrcXVvdGU+
PC9kaXY+PGJyPjwvZGl2Pgo=

--===============0420228654512969977==--

