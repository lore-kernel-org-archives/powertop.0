Content-Type: multipart/mixed; boundary="===============1953433423554755698=="
MIME-Version: 1.0
From: Rajagopal Venkat <rajagopal.venkat at linaro.org>
Subject: Re: [Powertop] [PATCH] fix cpuidle state name parsing
Date: Wed, 01 Aug 2012 12:56:05 +0530
Message-ID: <CA+Z25wV7bti4V1x_3f3vkmzTKuFhiL0wmdovZVkF7rHTUoDY+w@mail.gmail.com>
In-Reply-To: 54463.10.255.82.41.1343772284.squirrel@linux.jf.intel.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============1953433423554755698==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 1 August 2012 03:34, Chris Ferron <chris.e.ferron(a)linux.intel.com> wro=
te:

> > This patch fixes powertop to display cpuidle states on platforms
> > where cpuidle stateX directory name field does not contain
> > "CX" string. On some platforms, the name field contains meaningful
> > strings like WFI, Sleep, DeepSleep.
> >
> > Please review the patch.
> >
> Im not sure this is doing what you think it is, and if it is doing
> something; then i fear its an weird artifact of something else.
>
> I assume when you say "some platforms" you mean "ARM"?
> Can you detail out with data what the bug is you are having, along with
> expected results?


This patch is not specific to ARM but for any platform on which cpuidle
state name filed doesn't follow "CX" string pattern. For instance the
snowball cpuidle states are defined as follows[1]
{
        .enter                  =3D arm_cpuidle_simple_enter,
        ......
        .name                   =3D "WFI",
        .desc                   =3D "ARM WFI",
},
{
        .enter                 =3D ux500_enter_idle,
        ......
        .name                 =3D "ApIdle",
        .desc                  =3D "ARM Retention",
},

Now, while parsing for C states, powertop is using .name field(human_name)
for detecting supported cpuidle state levels. This is done with an
assumption
that, name field value contains "CX" substring, which is not true in above
case.
Infact, I could find good number of cpuidle drivers of this kind in
mainline kernel.

None of above cpuidle states should get added in insert_cstate() function.
Fortunately, the deepest idle state is added as C0 state because of
memset(state, 0, sizeof(*state));.  Hence powertop displays only one
idle state.

Parsing idle states based on directory name stateX(linux_name) is safe.
This patch does that.

 [1] arch/arm/mach-ux500/cpuidle.c<http://git.kernel.org/?p=3Dlinux/kernel/=
git/torvalds/linux.git;a=3Dblob;f=3Darch/arm/mach-ux500/cpuidle.c;h=3Db5488=
4bd254987f105d5f8ab0701b458ece1396e;hb=3DHEAD>


 What is your test platform, kernel version, etc.
> By your comment of what fields contents, I am betting there is more work
> to be done here
> then just what you sent regardless.
> Im not going to take this patch at this time, until I understand the full
> details.
>
> Please be verbose, I have no ARM platforms to experiment or test with.
>
> -Chris
>
>
> > On 23 June 2012 00:08, Rajagopal Venkat <rajagopal.venkat(a)linaro.org>
> > wrote:
> >
> >> parse cpuidle C state based on sysfs file entry(stateX)
> >> instead of state name/description
> >>
> >> Signed-off-by: Rajagopal Venkat <rajagopal.venkat(a)linaro.org>
> >> ---
> >>  src/cpu/abstract_cpu.cpp |    2 +-
> >>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/src/cpu/abstract_cpu.cpp b/src/cpu/abstract_cpu.cpp
> >> index cd4eba0..72969fc 100644
> >> --- a/src/cpu/abstract_cpu.cpp
> >> +++ b/src/cpu/abstract_cpu.cpp
> >> @@ -147,7 +147,7 @@ void abstract_cpu::insert_cstate(const char
> >> *linux_name, const char *human_name,
> >>         strcpy(state->linux_name, linux_name);
> >>         strcpy(state->human_name, human_name);
> >>
> >> -       c =3D human_name;
> >> +       c =3D linux_name;
> >>         while (*c) {
> >>                 if (strcmp(linux_name, "active")=3D=3D0) {
> >>                         state->line_level =3D LEVEL_C0;
> >> --
> >> 1.7.9.5
> >>
> >>
> > _______________________________________________
> > PowerTop mailing list
> > PowerTop(a)lists.01.org
> > https://lists.01.org/mailman/listinfo/powertop
> >
>
>


-- =

Regards,
Rajagopal

--===============1953433423554755698==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PGJyPjxicj48ZGl2IGNsYXNzPSJnbWFpbF9xdW90ZSI+T24gMSBBdWd1c3QgMjAxMiAwMzozNCwg
Q2hyaXMgRmVycm9uIDxzcGFuIGRpcj0ibHRyIj4mbHQ7PGEgaHJlZj0ibWFpbHRvOmNocmlzLmUu
ZmVycm9uQGxpbnV4LmludGVsLmNvbSIgdGFyZ2V0PSJfYmxhbmsiPmNocmlzLmUuZmVycm9uQGxp
bnV4LmludGVsLmNvbTwvYT4mZ3Q7PC9zcGFuPiB3cm90ZTo8YnI+PGJsb2NrcXVvdGUgY2xhc3M9
ImdtYWlsX3F1b3RlIiBzdHlsZT0ibWFyZ2luOjAgMCAwIC44ZXg7Ym9yZGVyLWxlZnQ6MXB4ICNj
Y2Mgc29saWQ7cGFkZGluZy1sZWZ0OjFleCI+CgoKPGRpdj4mZ3Q7IFRoaXMgcGF0Y2ggZml4ZXMg
cG93ZXJ0b3AgdG8gZGlzcGxheSBjcHVpZGxlIHN0YXRlcyBvbiBwbGF0Zm9ybXM8YnI+CiZndDsg
d2hlcmUgY3B1aWRsZSBzdGF0ZVggZGlyZWN0b3J5IG5hbWUgZmllbGQgZG9lcyBub3QgY29udGFp
bjxicj4KJmd0OyAmcXVvdDtDWCZxdW90OyBzdHJpbmcuIE9uIHNvbWUgcGxhdGZvcm1zLCB0aGUg
bmFtZSBmaWVsZCBjb250YWlucyBtZWFuaW5nZnVsPGJyPgomZ3Q7IHN0cmluZ3MgbGlrZSBXRkks
IFNsZWVwLCBEZWVwU2xlZXAuPGJyPgomZ3Q7PGJyPgomZ3Q7IFBsZWFzZSByZXZpZXcgdGhlIHBh
dGNoLjxicj4KJmd0Ozxicj4KPC9kaXY+SW0gbm90IHN1cmUgdGhpcyBpcyBkb2luZyB3aGF0IHlv
dSB0aGluayBpdCBpcywgYW5kIGlmIGl0IGlzIGRvaW5nPGJyPgpzb21ldGhpbmc7IHRoZW4gaSBm
ZWFyIGl0cyBhbiB3ZWlyZCBhcnRpZmFjdCBvZiBzb21ldGhpbmcgZWxzZS48YnI+Cjxicj4KSSBh
c3N1bWUgd2hlbiB5b3Ugc2F5ICZxdW90O3NvbWUgcGxhdGZvcm1zJnF1b3Q7IHlvdSBtZWFuICZx
dW90O0FSTSZxdW90Oz88YnI+CkNhbiB5b3UgZGV0YWlsIG91dCB3aXRoIGRhdGEgd2hhdCB0aGUg
YnVnIGlzIHlvdSBhcmUgaGF2aW5nLCBhbG9uZyB3aXRoPGJyPgpleHBlY3RlZCByZXN1bHRzP6A8
L2Jsb2NrcXVvdGU+PGRpdj48YnI+VGhpcyBwYXRjaCBpcyBub3Qgc3BlY2lmaWMgdG8gQVJNIGJ1
dCBmb3IgYW55IHBsYXRmb3JtIG9uIHdoaWNoIGNwdWlkbGU8YnI+c3RhdGUgbmFtZSBmaWxlZCBk
b2VzbiYjMzk7dCBmb2xsb3cgJnF1b3Q7Q1gmcXVvdDsgc3RyaW5nIHBhdHRlcm4uIEZvciBpbnN0
YW5jZSB0aGU8YnI+c25vd2JhbGwgY3B1aWRsZSBzdGF0ZXMgYXJlIGRlZmluZWQgYXMgZm9sbG93
c1sxXTxicj4KCns8YnI+oKCgoKCgoCAuZW50ZXKgoKCgoKCgoKCgoKCgoKCgoCA9IGFybV9jcHVp
ZGxlX3NpbXBsZV9lbnRlciw8YnI+oKCgoKCgoCAuLi4uLi48YnI+oKCgoKCgoCAubmFtZaCgoKCg
oKCgoKCgoKCgoKCgoCA9ICZxdW90O1dGSSZxdW90Oyw8YnI+oKCgoKCgoCAuZGVzY6CgoKCgoKCg
oKCgoKCgoKCgoCA9ICZxdW90O0FSTSBXRkkmcXVvdDssPGJyPn0sPGJyPns8YnI+oKCgoKCgoCAu
ZW50ZXIgoCCgIKAgoCCgIKCgoKCgID0gdXg1MDBfZW50ZXJfaWRsZSw8YnI+CgqgoKCgoKCgIC4u
Li4uLjxicj6goKCgoKCgIC5uYW1lIKAgoCCgIKAgoCCgoKCgoCA9ICZxdW90O0FwSWRsZSZxdW90
Oyw8YnI+oKCgoKCgoCAuZGVzYyCgIKAgoCCgIKAgoKCgoKCgID0gJnF1b3Q7QVJNIFJldGVudGlv
biZxdW90Oyw8YnI+fSw8YnI+PGJyPk5vdywgd2hpbGUgcGFyc2luZyBmb3IgQyBzdGF0ZXMsIHBv
d2VydG9wIGlzIHVzaW5nIC5uYW1lIGZpZWxkKGh1bWFuX25hbWUpPGJyPgpmb3IgZGV0ZWN0aW5n
IHN1cHBvcnRlZCBjcHVpZGxlIHN0YXRlIGxldmVscy4gVGhpcyBpcyBkb25lIHdpdGggYW4gYXNz
dW1wdGlvbjxicj50aGF0LCBuYW1lIGZpZWxkIHZhbHVlIGNvbnRhaW5zICZxdW90O0NYJnF1b3Q7
IHN1YnN0cmluZywgd2hpY2ggaXMgbm90IHRydWUgaW4gYWJvdmUgY2FzZS48YnI+CkluZmFjdCwg
SSBjb3VsZCBmaW5kIGdvb2QgbnVtYmVyIG9mIGNwdWlkbGUgZHJpdmVycyBvZiB0aGlzIGtpbmQg
aW4gbWFpbmxpbmUga2VybmVsLjxicj48YnI+Tm9uZSBvZiBhYm92ZSBjcHVpZGxlIHN0YXRlcyBz
aG91bGQgZ2V0IGFkZGVkIGluIGluc2VydF9jc3RhdGUoKSBmdW5jdGlvbi48YnI+Rm9ydHVuYXRl
bHksIHRoZSBkZWVwZXN0IGlkbGUgc3RhdGUgaXMgYWRkZWQgYXMgQzAgc3RhdGUgYmVjYXVzZSBv
Zjxicj4KCm1lbXNldChzdGF0ZSwgMCwgc2l6ZW9mKCpzdGF0ZSkpOy6gIEhlbmNlIHBvd2VydG9w
IGRpc3BsYXlzIG9ubHkgb25lPGJyPmlkbGUgc3RhdGUuPGJyPjxicj5QYXJzaW5nIGlkbGUgc3Rh
dGVzIGJhc2VkIG9uIGRpcmVjdG9yeSBuYW1lIHN0YXRlWChsaW51eF9uYW1lKSBpcyBzYWZlLjxi
cj5UaGlzIHBhdGNoIGRvZXMgdGhhdC48YnI+PGJyPqBbMV2gPGEgaHJlZj0iaHR0cDovL2dpdC5r
ZXJuZWwub3JnLz9wPWxpbnV4L2tlcm5lbC9naXQvdG9ydmFsZHMvbGludXguZ2l0O2E9YmxvYjtm
PWFyY2gvYXJtL21hY2gtdXg1MDAvY3B1aWRsZS5jO2g9YjU0ODg0YmQyNTQ5ODdmMTA1ZDVmOGFi
MDcwMWI0NThlY2UxMzk2ZTtoYj1IRUFEIiB0YXJnZXQ9Il9ibGFuayI+YXJjaC9hcm0vbWFjaC11
eDUwMC9jcHVpZGxlLmM8L2E+PGJyPgo8YnI+PGJyPgo8L2Rpdj48YmxvY2txdW90ZSBjbGFzcz0i
Z21haWxfcXVvdGUiIHN0eWxlPSJtYXJnaW46MHB4IDBweCAwcHggMC44ZXg7Ym9yZGVyLWxlZnQ6
MXB4IHNvbGlkIHJnYigyMDQsMjA0LDIwNCk7cGFkZGluZy1sZWZ0OjFleCI+CldoYXQgaXMgeW91
ciB0ZXN0IHBsYXRmb3JtLCBrZXJuZWwgdmVyc2lvbiwgZXRjLjxicj4KQnkgeW91ciBjb21tZW50
IG9mIHdoYXQgZmllbGRzIGNvbnRlbnRzLCBJIGFtIGJldHRpbmcgdGhlcmUgaXMgbW9yZSB3b3Jr
PGJyPgp0byBiZSBkb25lIGhlcmU8YnI+CnRoZW4ganVzdCB3aGF0IHlvdSBzZW50IHJlZ2FyZGxl
c3MuPGJyPgpJbSBub3QgZ29pbmcgdG8gdGFrZSB0aGlzIHBhdGNoIGF0IHRoaXMgdGltZSwgdW50
aWwgSSB1bmRlcnN0YW5kIHRoZSBmdWxsPGJyPgpkZXRhaWxzLjxicj4KPGJyPgpQbGVhc2UgYmUg
dmVyYm9zZSwgSSBoYXZlIG5vIEFSTSBwbGF0Zm9ybXMgdG8gZXhwZXJpbWVudCBvciB0ZXN0IHdp
dGguPGJyPgo8YnI+Ci1DaHJpczxicj4KPGRpdj48YnI+Cjxicj4KJmd0OyBPbiAyMyBKdW5lIDIw
MTIgMDA6MDgsIFJhamFnb3BhbCBWZW5rYXQgJmx0OzxhIGhyZWY9Im1haWx0bzpyYWphZ29wYWwu
dmVua2F0QGxpbmFyby5vcmciIHRhcmdldD0iX2JsYW5rIj5yYWphZ29wYWwudmVua2F0QGxpbmFy
by5vcmc8L2E+Jmd0Ozxicj4KJmd0OyB3cm90ZTo8YnI+CiZndDs8YnI+CiZndDsmZ3Q7IHBhcnNl
IGNwdWlkbGUgQyBzdGF0ZSBiYXNlZCBvbiBzeXNmcyBmaWxlIGVudHJ5KHN0YXRlWCk8YnI+CiZn
dDsmZ3Q7IGluc3RlYWQgb2Ygc3RhdGUgbmFtZS9kZXNjcmlwdGlvbjxicj4KJmd0OyZndDs8YnI+
CiZndDsmZ3Q7IFNpZ25lZC1vZmYtYnk6IFJhamFnb3BhbCBWZW5rYXQgJmx0OzxhIGhyZWY9Im1h
aWx0bzpyYWphZ29wYWwudmVua2F0QGxpbmFyby5vcmciIHRhcmdldD0iX2JsYW5rIj5yYWphZ29w
YWwudmVua2F0QGxpbmFyby5vcmc8L2E+Jmd0Ozxicj4KJmd0OyZndDsgLS0tPGJyPgomZ3Q7Jmd0
OyCgc3JjL2NwdS9hYnN0cmFjdF9jcHUuY3BwIHwgoCCgMiArLTxicj4KJmd0OyZndDsgoDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKTxicj4KJmd0OyZndDs8YnI+
CiZndDsmZ3Q7IGRpZmYgLS1naXQgYS9zcmMvY3B1L2Fic3RyYWN0X2NwdS5jcHAgYi9zcmMvY3B1
L2Fic3RyYWN0X2NwdS5jcHA8YnI+CiZndDsmZ3Q7IGluZGV4IGNkNGViYTAuLjcyOTY5ZmMgMTAw
NjQ0PGJyPgomZ3Q7Jmd0OyAtLS0gYS9zcmMvY3B1L2Fic3RyYWN0X2NwdS5jcHA8YnI+CiZndDsm
Z3Q7ICsrKyBiL3NyYy9jcHUvYWJzdHJhY3RfY3B1LmNwcDxicj4KJmd0OyZndDsgQEAgLTE0Nyw3
ICsxNDcsNyBAQCB2b2lkIGFic3RyYWN0X2NwdTo6aW5zZXJ0X2NzdGF0ZShjb25zdCBjaGFyPGJy
PgomZ3Q7Jmd0OyAqbGludXhfbmFtZSwgY29uc3QgY2hhciAqaHVtYW5fbmFtZSw8YnI+CiZndDsm
Z3Q7IKAgoCCgIKAgc3RyY3B5KHN0YXRlLSZndDtsaW51eF9uYW1lLCBsaW51eF9uYW1lKTs8YnI+
CiZndDsmZ3Q7IKAgoCCgIKAgc3RyY3B5KHN0YXRlLSZndDtodW1hbl9uYW1lLCBodW1hbl9uYW1l
KTs8YnI+CiZndDsmZ3Q7PGJyPgomZ3Q7Jmd0OyAtIKAgoCCgIGMgPSBodW1hbl9uYW1lOzxicj4K
Jmd0OyZndDsgKyCgIKAgoCBjID0gbGludXhfbmFtZTs8YnI+CiZndDsmZ3Q7IKAgoCCgIKAgd2hp
bGUgKCpjKSB7PGJyPgomZ3Q7Jmd0OyCgIKAgoCCgIKAgoCCgIKAgaWYgKHN0cmNtcChsaW51eF9u
YW1lLCAmcXVvdDthY3RpdmUmcXVvdDspPT0wKSB7PGJyPgomZ3Q7Jmd0OyCgIKAgoCCgIKAgoCCg
IKAgoCCgIKAgoCBzdGF0ZS0mZ3Q7bGluZV9sZXZlbCA9IExFVkVMX0MwOzxicj4KJmd0OyZndDsg
LS08YnI+CiZndDsmZ3Q7IDEuNy45LjU8YnI+CiZndDsmZ3Q7PGJyPgomZ3Q7Jmd0Ozxicj4KPC9k
aXY+Jmd0OyBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXzxi
cj4KJmd0OyBQb3dlclRvcCBtYWlsaW5nIGxpc3Q8YnI+CiZndDsgPGEgaHJlZj0ibWFpbHRvOlBv
d2VyVG9wQGxpc3RzLjAxLm9yZyIgdGFyZ2V0PSJfYmxhbmsiPlBvd2VyVG9wQGxpc3RzLjAxLm9y
ZzwvYT48YnI+CiZndDsgPGEgaHJlZj0iaHR0cHM6Ly9saXN0cy4wMS5vcmcvbWFpbG1hbi9saXN0
aW5mby9wb3dlcnRvcCIgdGFyZ2V0PSJfYmxhbmsiPmh0dHBzOi8vbGlzdHMuMDEub3JnL21haWxt
YW4vbGlzdGluZm8vcG93ZXJ0b3A8L2E+PGJyPgomZ3Q7PGJyPgo8YnI+CjwvYmxvY2txdW90ZT48
L2Rpdj48YnI+PGJyIGNsZWFyPSJhbGwiPjxicj4tLSA8YnI+UmVnYXJkcyw8YnI+UmFqYWdvcGFs
PGJyPjxicj4K

--===============1953433423554755698==--

