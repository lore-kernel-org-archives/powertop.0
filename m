Content-Type: multipart/mixed; boundary="===============8488255760254845823=="
MIME-Version: 1.0
From: Wout Mertens <wout.mertens at gmail.com>
Subject: Re: [Powertop] [PATCH] use pkg-config to find ncurses
Date: Tue, 06 May 2014 06:57:32 +0200
Message-ID: <CAO3V83JaYKrJPYT1Zd07dn64voGFdwkRBX+k=nWs18KD7cNNaw@mail.gmail.com>
In-Reply-To: 52818.10.24.6.59.1399331998.squirrel@linux.intel.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============8488255760254845823==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

I'm confused, how does requiring a pkgconfig file break the tool?

If a user somehow finds them in a situation where they need to build a
recent powertop but can't build a recent ncurses, they can manually add the
file... Or use an older version of powertop...
On May 6, 2014 1:20 AM, "Alexandra Yates" <alexandra.yates(a)linux.intel.co=
m>
wrote:

>
> > -----BEGIN PGP SIGNED MESSAGE-----
> > Hash: SHA1
> >
> > On 04/25/2014 07:58 PM, Alexandra Yates wrote:
> >> Hi Zero,
> >>
> >> Based on Sergey's feedback can you send a revision for your patches?
> >>
> >> thank you,
> >> Alex
> >> On 04/16/2014 03:54 PM, Sergey Senozhatsky wrote:
> >>>>> On (04/16/14 12:41), Kok, Auke-jan H wrote:
> >>>>>> ncurses by itself does not provide a pkgconfig check, it is however
> >>>>>> manually added by various distributions, but not all of them.
> >>>>>>
> >>>>>> So, the patch below breaks building powertop for those
> >>>>>> distributions.
> >>>>>>
> >>>>>
> >>>>> yes. good point. apparently ncurses provides pkg-config files these
> >>>>> days.
> >>>>> but there still may be distributions that use older ncurses version=
s.
> >>
> >>
> >> pkgconfig support was added on 20090103 according to the changelog her=
e:
> >> http://invisible-island.net/ncurses/NEWS.html.
> >>
> >> Is is really a major concern to to require a version of ncurses releas=
ed
> >> within the last 5 years?
> >
> > I believe these comments stand for themselves.  If a user isn't on a
> > modern ncurses I fail to see why they would be on a modern powertop
> > either.  Supporting things >5 years old building against modern things
> > is past my point of caring.  If someone else would like to amend the
> > patch to fall back to hardcoded libs that's fine, but I'm not going to
> > invest my time in this.  Sadly, my autotools skills are unimpressive and
> > there is no justification for the amount of time this would take me.
> >
> > Accept the patch, don't accept the patch, modify the patch as you see
> > fit, whatever you like.
> >
> > Thanks,
> > Zero
>
> Hi Zero,
>
> Unfortunately, at the moment I don't have the bandwidth to fix your patch.
>
> Additionally, PowerTOP doesn't accept patches that break the tool, even if
> that is in older technologies.  Therefore, I'm simply rejecting your
> submission.
>
> Thank you,
> Alexandra.
>
>
> >>
> >> -Zero
> >>>>>
> >>>>>   -ss
> >>>>>
> >>>>>> I suggest that if you really want to make it use pkg-config, you
> >>>>>> write
> >>>>>> it in such a way that if pkg-config checking fails, it will still
> >>>>>> attempt to search for the appropriate libs instead.
> >>>>>>
> >>>>>> Auke
> >>>>>>
> >>>>>>
> >>>>>>
> >>>>>> On Wed, Apr 16, 2014 at 8:20 AM, Rick "Zero_Chaos" Farina
> >>>>>> <zerochaos(a)gentoo.org> wrote:
> >>>>> Original bug report: https://bugs.gentoo.org/show_bug.cgi?id=3D4861=
24
> >>>>>
> >>>>> Depending on how ncurses is built, it may require different
> >>>>> information
> >>>>> passed to the linker.  Use pkg-config to detect the correct
> >>>>> information:
> >>>>>
> >>>>> --- a/configure.ac
> >>>>> +++ b/configure.ac
> >>>>> @@ -46,7 +46,7 @@
> >>>>>  AC_FUNC_STRTOD
> >>>>>  AC_CHECK_FUNCS([fdatasync getpagesize gettimeofday memmove memset
> >>>>> mkdir
> >>>>> munmap pow realpath regcomp select setlocale socket sqrt strcasecmp
> >>>>> strchr strdup strerror strncasecmp strstr strtoul strtoull])
> >>>>>
> >>>>> -AC_SEARCH_LIBS([delwin], [ncursesw ncurses], [],
> >>>>> AC_MSG_ERROR([ncurses
> >>>>> is required but was not found]), [])
> >>>>> +PKG_CHECK_MODULES(ncurses, ncurses, [LIBS=3D"$LIBS $ncurses_LIBS"],
> >>>>> AC_MSG_ERROR([ncurses is required but was not found]))
> >>>>>
> >>>>>  has_libpci=3D0
> >>>>>  PKG_CHECK_MODULES([PCIUTILS], [libpci],[has_libpci=3D1],[
> >>>>>
> >>>>>
> >>>>> Original patch:
> >>>>>
> http://sources.gentoo.org/cgi-bin/viewvc.cgi/gentoo-x86/sys-power/powerto=
p/files/powertop-2.4-tinfo.patch?revision=3D1.1&view=3Dmarkup
> >>>>>
> >>>>> Please include this fix.
> >>>>>
> >>>>> thanks,
> >>>>> Zero
> >>>>>>> _______________________________________________
> >>>>>>> PowerTop mailing list
> >>>>>>> PowerTop(a)lists.01.org
> >>>>>>> https://lists.01.org/mailman/listinfo/powertop
> >>>>>> _______________________________________________
> >>>>>> PowerTop mailing list
> >>>>>> PowerTop(a)lists.01.org
> >>>>>> https://lists.01.org/mailman/listinfo/powertop
> >>>>>>
> >>>>>
> >>
> >>> _______________________________________________
> >>> PowerTop mailing list
> >>> PowerTop(a)lists.01.org
> >>> https://lists.01.org/mailman/listinfo/powertop
> >>>
> >>
> >>
> >> Thank you,
> >> Alexandra.
> >>
> >
> > -----BEGIN PGP SIGNATURE-----
> > Version: GnuPG v2.0.22 (GNU/Linux)
> > Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/
> >
> > iQIcBAEBAgAGBQJTX7T7AAoJEKXdFCfdEflKMpwP/A3ajGdX9nzIN9qelCT6B1Zh
> > EfwGI+aNQ+ae9GP7BMYx9Dzirrg7g///cTv3oXxnSpX4XiQIj7oozwLOF1DgEcs8
> > XdmoTSONx6gEiGlYU60jrMKokml+bJoABxM4R6tBMYM2XUD+Zx28TdM76SCx2cGq
> > CiWI6dvK7x5afyLbrjRtNvkBQ2k5qMej4s/4fDC/yr1XNvaLxEq4RQyohF+5dAk8
> > T9rD6Yq0B8EvyrXT09TD03cNm/GH+I4Fzuo/h7Ivun10TM40nsXHuNq67LPhYgVa
> > ox28MsyRcaRnHyoPzuuMOhz+/QIeUgDHOu1lTFBDNcJgCuox+OPf1O9flw/HTEZ/
> > +YQewdYIgjIiv9tVjwdvXlkr/JSgCl0CdjaJT6MN+VhXz2aMdyQh9TV5Ph8+KBIH
> > 3+R3pUGKh+mTEyJ5mwBXMsL9jqQa8TTwFp9OGRjmnqyvyqRJ7z4CRQrnLRfS+D99
> > 5FaZkS2NL/5XDnLAZcNqrRkV4w+UFjuJK5yrZxiYWXgX1n6IqX8eY8Q66SMfBRMG
> > 6XKtGD53ku7DV6H+/dlfzOZTD8B+emOJQXprT5O9/QPX1R1bbpC3DSEzMTadtRPi
> > CVhMEPfdY/UllH+pIAVNP3ORo4vgRJwOfZNhcqLke7sDrSjqTa5KnAbjb+4Qb5nK
> > nBQKYIQfN92Mb7fxF3ve
> > =3DdGdt
> > -----END PGP SIGNATURE-----
> >
>
>
> Thank you,
> Alexandra.
> _______________________________________________
> PowerTop mailing list
> PowerTop(a)lists.01.org
> https://lists.01.org/mailman/listinfo/powertop
>

--===============8488255760254845823==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PHAgZGlyPSJsdHIiPkkmIzM5O20gY29uZnVzZWQsIGhvdyBkb2VzIHJlcXVpcmluZyBhIHBrZ2Nv
bmZpZyBmaWxlIGJyZWFrIHRoZSB0b29sPyA8L3A+CjxwIGRpcj0ibHRyIj5JZiBhIHVzZXIgc29t
ZWhvdyBmaW5kcyB0aGVtIGluIGEgc2l0dWF0aW9uIHdoZXJlIHRoZXkgbmVlZCB0byBidWlsZCBh
IHJlY2VudCBwb3dlcnRvcCBidXQgY2FuJiMzOTt0IGJ1aWxkIGEgcmVjZW50IG5jdXJzZXMsIHRo
ZXkgY2FuIG1hbnVhbGx5IGFkZCB0aGUgZmlsZS4uLiBPciB1c2UgYW4gb2xkZXIgdmVyc2lvbiBv
ZiBwb3dlcnRvcC4uLiA8L3A+CjxkaXYgY2xhc3M9ImdtYWlsX3F1b3RlIj5PbiBNYXkgNiwgMjAx
NCAxOjIwIEFNLCAmcXVvdDtBbGV4YW5kcmEgWWF0ZXMmcXVvdDsgJmx0OzxhIGhyZWY9Im1haWx0
bzphbGV4YW5kcmEueWF0ZXNAbGludXguaW50ZWwuY29tIj5hbGV4YW5kcmEueWF0ZXNAbGludXgu
aW50ZWwuY29tPC9hPiZndDsgd3JvdGU6PGJyIHR5cGU9ImF0dHJpYnV0aW9uIj48YmxvY2txdW90
ZSBjbGFzcz0iZ21haWxfcXVvdGUiIHN0eWxlPSJtYXJnaW46MCAwIDAgLjhleDtib3JkZXItbGVm
dDoxcHggI2NjYyBzb2xpZDtwYWRkaW5nLWxlZnQ6MWV4Ij4KPGJyPgomZ3Q7IC0tLS0tQkVHSU4g
UEdQIFNJR05FRCBNRVNTQUdFLS0tLS08YnI+CiZndDsgSGFzaDogU0hBMTxicj4KJmd0Ozxicj4K
Jmd0OyBPbiAwNC8yNS8yMDE0IDA3OjU4IFBNLCBBbGV4YW5kcmEgWWF0ZXMgd3JvdGU6PGJyPgom
Z3Q7Jmd0OyBIaSBaZXJvLDxicj4KJmd0OyZndDs8YnI+CiZndDsmZ3Q7IEJhc2VkIG9uIFNlcmdl
eSYjMzk7cyBmZWVkYmFjayBjYW4geW91IHNlbmQgYSByZXZpc2lvbiBmb3IgeW91ciBwYXRjaGVz
Pzxicj4KJmd0OyZndDs8YnI+CiZndDsmZ3Q7IHRoYW5rIHlvdSw8YnI+CiZndDsmZ3Q7IEFsZXg8
YnI+CiZndDsmZ3Q7IE9uIDA0LzE2LzIwMTQgMDM6NTQgUE0sIFNlcmdleSBTZW5vemhhdHNreSB3
cm90ZTo8YnI+CiZndDsmZ3Q7Jmd0OyZndDsmZ3Q7IE9uICgwNC8xNi8xNCAxMjo0MSksIEtvaywg
QXVrZS1qYW4gSCB3cm90ZTo8YnI+CiZndDsmZ3Q7Jmd0OyZndDsmZ3Q7Jmd0OyBuY3Vyc2VzIGJ5
IGl0c2VsZiBkb2VzIG5vdCBwcm92aWRlIGEgcGtnY29uZmlnIGNoZWNrLCBpdCBpcyBob3dldmVy
PGJyPgomZ3Q7Jmd0OyZndDsmZ3Q7Jmd0OyZndDsgbWFudWFsbHkgYWRkZWQgYnkgdmFyaW91cyBk
aXN0cmlidXRpb25zLCBidXQgbm90IGFsbCBvZiB0aGVtLjxicj4KJmd0OyZndDsmZ3Q7Jmd0OyZn
dDsmZ3Q7PGJyPgomZ3Q7Jmd0OyZndDsmZ3Q7Jmd0OyZndDsgU28sIHRoZSBwYXRjaCBiZWxvdyBi
cmVha3MgYnVpbGRpbmcgcG93ZXJ0b3AgZm9yIHRob3NlPGJyPgomZ3Q7Jmd0OyZndDsmZ3Q7Jmd0
OyZndDsgZGlzdHJpYnV0aW9ucy48YnI+CiZndDsmZ3Q7Jmd0OyZndDsmZ3Q7Jmd0Ozxicj4KJmd0
OyZndDsmZ3Q7Jmd0OyZndDs8YnI+CiZndDsmZ3Q7Jmd0OyZndDsmZ3Q7IHllcy4gZ29vZCBwb2lu
dC4gYXBwYXJlbnRseSBuY3Vyc2VzIHByb3ZpZGVzIHBrZy1jb25maWcgZmlsZXMgdGhlc2U8YnI+
CiZndDsmZ3Q7Jmd0OyZndDsmZ3Q7IGRheXMuPGJyPgomZ3Q7Jmd0OyZndDsmZ3Q7Jmd0OyBidXQg
dGhlcmUgc3RpbGwgbWF5IGJlIGRpc3RyaWJ1dGlvbnMgdGhhdCB1c2Ugb2xkZXIgbmN1cnNlcyB2
ZXJzaW9ucy48YnI+CiZndDsmZ3Q7PGJyPgomZ3Q7Jmd0Ozxicj4KJmd0OyZndDsgcGtnY29uZmln
IHN1cHBvcnQgd2FzIGFkZGVkIG9uIDIwMDkwMTAzIGFjY29yZGluZyB0byB0aGUgY2hhbmdlbG9n
IGhlcmU6PGJyPgomZ3Q7Jmd0OyA8YSBocmVmPSJodHRwOi8vaW52aXNpYmxlLWlzbGFuZC5uZXQv
bmN1cnNlcy9ORVdTLmh0bWwiIHRhcmdldD0iX2JsYW5rIj5odHRwOi8vaW52aXNpYmxlLWlzbGFu
ZC5uZXQvbmN1cnNlcy9ORVdTLmh0bWw8L2E+Ljxicj4KJmd0OyZndDs8YnI+CiZndDsmZ3Q7IElz
IGlzIHJlYWxseSBhIG1ham9yIGNvbmNlcm4gdG8gdG8gcmVxdWlyZSBhIHZlcnNpb24gb2YgbmN1
cnNlcyByZWxlYXNlZDxicj4KJmd0OyZndDsgd2l0aGluIHRoZSBsYXN0IDUgeWVhcnM/PGJyPgom
Z3Q7PGJyPgomZ3Q7IEkgYmVsaWV2ZSB0aGVzZSBjb21tZW50cyBzdGFuZCBmb3IgdGhlbXNlbHZl
cy4gwqBJZiBhIHVzZXIgaXNuJiMzOTt0IG9uIGE8YnI+CiZndDsgbW9kZXJuIG5jdXJzZXMgSSBm
YWlsIHRvIHNlZSB3aHkgdGhleSB3b3VsZCBiZSBvbiBhIG1vZGVybiBwb3dlcnRvcDxicj4KJmd0
OyBlaXRoZXIuIMKgU3VwcG9ydGluZyB0aGluZ3MgJmd0OzUgeWVhcnMgb2xkIGJ1aWxkaW5nIGFn
YWluc3QgbW9kZXJuIHRoaW5nczxicj4KJmd0OyBpcyBwYXN0IG15IHBvaW50IG9mIGNhcmluZy4g
wqBJZiBzb21lb25lIGVsc2Ugd291bGQgbGlrZSB0byBhbWVuZCB0aGU8YnI+CiZndDsgcGF0Y2gg
dG8gZmFsbCBiYWNrIHRvIGhhcmRjb2RlZCBsaWJzIHRoYXQmIzM5O3MgZmluZSwgYnV0IEkmIzM5
O20gbm90IGdvaW5nIHRvPGJyPgomZ3Q7IGludmVzdCBteSB0aW1lIGluIHRoaXMuIMKgU2FkbHks
IG15IGF1dG90b29scyBza2lsbHMgYXJlIHVuaW1wcmVzc2l2ZSBhbmQ8YnI+CiZndDsgdGhlcmUg
aXMgbm8ganVzdGlmaWNhdGlvbiBmb3IgdGhlIGFtb3VudCBvZiB0aW1lIHRoaXMgd291bGQgdGFr
ZSBtZS48YnI+CiZndDs8YnI+CiZndDsgQWNjZXB0IHRoZSBwYXRjaCwgZG9uJiMzOTt0IGFjY2Vw
dCB0aGUgcGF0Y2gsIG1vZGlmeSB0aGUgcGF0Y2ggYXMgeW91IHNlZTxicj4KJmd0OyBmaXQsIHdo
YXRldmVyIHlvdSBsaWtlLjxicj4KJmd0Ozxicj4KJmd0OyBUaGFua3MsPGJyPgomZ3Q7IFplcm88
YnI+Cjxicj4KSGkgWmVybyw8YnI+Cjxicj4KVW5mb3J0dW5hdGVseSwgYXQgdGhlIG1vbWVudCBJ
IGRvbiYjMzk7dCBoYXZlIHRoZSBiYW5kd2lkdGggdG8gZml4IHlvdXIgcGF0Y2guPGJyPgo8YnI+
CkFkZGl0aW9uYWxseSwgUG93ZXJUT1AgZG9lc24mIzM5O3QgYWNjZXB0IHBhdGNoZXMgdGhhdCBi
cmVhayB0aGUgdG9vbCwgZXZlbiBpZjxicj4KdGhhdCBpcyBpbiBvbGRlciB0ZWNobm9sb2dpZXMu
IMKgVGhlcmVmb3JlLCBJJiMzOTttIHNpbXBseSByZWplY3RpbmcgeW91cjxicj4Kc3VibWlzc2lv
bi48YnI+Cjxicj4KVGhhbmsgeW91LDxicj4KQWxleGFuZHJhLjxicj4KPGJyPgo8YnI+CiZndDsm
Z3Q7PGJyPgomZ3Q7Jmd0OyAtWmVybzxicj4KJmd0OyZndDsmZ3Q7Jmd0OyZndDs8YnI+CiZndDsm
Z3Q7Jmd0OyZndDsmZ3Q7IMKgIC1zczxicj4KJmd0OyZndDsmZ3Q7Jmd0OyZndDs8YnI+CiZndDsm
Z3Q7Jmd0OyZndDsmZ3Q7Jmd0OyBJIHN1Z2dlc3QgdGhhdCBpZiB5b3UgcmVhbGx5IHdhbnQgdG8g
bWFrZSBpdCB1c2UgcGtnLWNvbmZpZywgeW91PGJyPgomZ3Q7Jmd0OyZndDsmZ3Q7Jmd0OyZndDsg
d3JpdGU8YnI+CiZndDsmZ3Q7Jmd0OyZndDsmZ3Q7Jmd0OyBpdCBpbiBzdWNoIGEgd2F5IHRoYXQg
aWYgcGtnLWNvbmZpZyBjaGVja2luZyBmYWlscywgaXQgd2lsbCBzdGlsbDxicj4KJmd0OyZndDsm
Z3Q7Jmd0OyZndDsmZ3Q7IGF0dGVtcHQgdG8gc2VhcmNoIGZvciB0aGUgYXBwcm9wcmlhdGUgbGli
cyBpbnN0ZWFkLjxicj4KJmd0OyZndDsmZ3Q7Jmd0OyZndDsmZ3Q7PGJyPgomZ3Q7Jmd0OyZndDsm
Z3Q7Jmd0OyZndDsgQXVrZTxicj4KJmd0OyZndDsmZ3Q7Jmd0OyZndDsmZ3Q7PGJyPgomZ3Q7Jmd0
OyZndDsmZ3Q7Jmd0OyZndDs8YnI+CiZndDsmZ3Q7Jmd0OyZndDsmZ3Q7Jmd0Ozxicj4KJmd0OyZn
dDsmZ3Q7Jmd0OyZndDsmZ3Q7IE9uIFdlZCwgQXByIDE2LCAyMDE0IGF0IDg6MjAgQU0sIFJpY2sg
JnF1b3Q7WmVyb19DaGFvcyZxdW90OyBGYXJpbmE8YnI+CiZndDsmZ3Q7Jmd0OyZndDsmZ3Q7Jmd0
OyAmbHQ7PGEgaHJlZj0ibWFpbHRvOnplcm9jaGFvc0BnZW50b28ub3JnIj56ZXJvY2hhb3NAZ2Vu
dG9vLm9yZzwvYT4mZ3Q7IHdyb3RlOjxicj4KJmd0OyZndDsmZ3Q7Jmd0OyZndDsgT3JpZ2luYWwg
YnVnIHJlcG9ydDogPGEgaHJlZj0iaHR0cHM6Ly9idWdzLmdlbnRvby5vcmcvc2hvd19idWcuY2dp
P2lkPTQ4NjEyNCIgdGFyZ2V0PSJfYmxhbmsiPmh0dHBzOi8vYnVncy5nZW50b28ub3JnL3Nob3df
YnVnLmNnaT9pZD00ODYxMjQ8L2E+PGJyPgomZ3Q7Jmd0OyZndDsmZ3Q7Jmd0Ozxicj4KJmd0OyZn
dDsmZ3Q7Jmd0OyZndDsgRGVwZW5kaW5nIG9uIGhvdyBuY3Vyc2VzIGlzIGJ1aWx0LCBpdCBtYXkg
cmVxdWlyZSBkaWZmZXJlbnQ8YnI+CiZndDsmZ3Q7Jmd0OyZndDsmZ3Q7IGluZm9ybWF0aW9uPGJy
PgomZ3Q7Jmd0OyZndDsmZ3Q7Jmd0OyBwYXNzZWQgdG8gdGhlIGxpbmtlci4gwqBVc2UgcGtnLWNv
bmZpZyB0byBkZXRlY3QgdGhlIGNvcnJlY3Q8YnI+CiZndDsmZ3Q7Jmd0OyZndDsmZ3Q7IGluZm9y
bWF0aW9uOjxicj4KJmd0OyZndDsmZ3Q7Jmd0OyZndDs8YnI+CiZndDsmZ3Q7Jmd0OyZndDsmZ3Q7
IC0tLSBhLzxhIGhyZWY9Imh0dHA6Ly9jb25maWd1cmUuYWMiIHRhcmdldD0iX2JsYW5rIj5jb25m
aWd1cmUuYWM8L2E+PGJyPgomZ3Q7Jmd0OyZndDsmZ3Q7Jmd0OyArKysgYi88YSBocmVmPSJodHRw
Oi8vY29uZmlndXJlLmFjIiB0YXJnZXQ9Il9ibGFuayI+Y29uZmlndXJlLmFjPC9hPjxicj4KJmd0
OyZndDsmZ3Q7Jmd0OyZndDsgQEAgLTQ2LDcgKzQ2LDcgQEA8YnI+CiZndDsmZ3Q7Jmd0OyZndDsm
Z3Q7IMKgQUNfRlVOQ19TVFJUT0Q8YnI+CiZndDsmZ3Q7Jmd0OyZndDsmZ3Q7IMKgQUNfQ0hFQ0tf
RlVOQ1MoW2ZkYXRhc3luYyBnZXRwYWdlc2l6ZSBnZXR0aW1lb2ZkYXkgbWVtbW92ZSBtZW1zZXQ8
YnI+CiZndDsmZ3Q7Jmd0OyZndDsmZ3Q7IG1rZGlyPGJyPgomZ3Q7Jmd0OyZndDsmZ3Q7Jmd0OyBt
dW5tYXAgcG93IHJlYWxwYXRoIHJlZ2NvbXAgc2VsZWN0IHNldGxvY2FsZSBzb2NrZXQgc3FydCBz
dHJjYXNlY21wPGJyPgomZ3Q7Jmd0OyZndDsmZ3Q7Jmd0OyBzdHJjaHIgc3RyZHVwIHN0cmVycm9y
IHN0cm5jYXNlY21wIHN0cnN0ciBzdHJ0b3VsIHN0cnRvdWxsXSk8YnI+CiZndDsmZ3Q7Jmd0OyZn
dDsmZ3Q7PGJyPgomZ3Q7Jmd0OyZndDsmZ3Q7Jmd0OyAtQUNfU0VBUkNIX0xJQlMoW2RlbHdpbl0s
IFtuY3Vyc2VzdyBuY3Vyc2VzXSwgW10sPGJyPgomZ3Q7Jmd0OyZndDsmZ3Q7Jmd0OyBBQ19NU0df
RVJST1IoW25jdXJzZXM8YnI+CiZndDsmZ3Q7Jmd0OyZndDsmZ3Q7IGlzIHJlcXVpcmVkIGJ1dCB3
YXMgbm90IGZvdW5kXSksIFtdKTxicj4KJmd0OyZndDsmZ3Q7Jmd0OyZndDsgK1BLR19DSEVDS19N
T0RVTEVTKG5jdXJzZXMsIG5jdXJzZXMsIFtMSUJTPSZxdW90OyRMSUJTICRuY3Vyc2VzX0xJQlMm
cXVvdDtdLDxicj4KJmd0OyZndDsmZ3Q7Jmd0OyZndDsgQUNfTVNHX0VSUk9SKFtuY3Vyc2VzIGlz
IHJlcXVpcmVkIGJ1dCB3YXMgbm90IGZvdW5kXSkpPGJyPgomZ3Q7Jmd0OyZndDsmZ3Q7Jmd0Ozxi
cj4KJmd0OyZndDsmZ3Q7Jmd0OyZndDsgwqBoYXNfbGlicGNpPTA8YnI+CiZndDsmZ3Q7Jmd0OyZn
dDsmZ3Q7IMKgUEtHX0NIRUNLX01PRFVMRVMoW1BDSVVUSUxTXSwgW2xpYnBjaV0sW2hhc19saWJw
Y2k9MV0sWzxicj4KJmd0OyZndDsmZ3Q7Jmd0OyZndDs8YnI+CiZndDsmZ3Q7Jmd0OyZndDsmZ3Q7
PGJyPgomZ3Q7Jmd0OyZndDsmZ3Q7Jmd0OyBPcmlnaW5hbCBwYXRjaDo8YnI+CiZndDsmZ3Q7Jmd0
OyZndDsmZ3Q7IDxhIGhyZWY9Imh0dHA6Ly9zb3VyY2VzLmdlbnRvby5vcmcvY2dpLWJpbi92aWV3
dmMuY2dpL2dlbnRvby14ODYvc3lzLXBvd2VyL3Bvd2VydG9wL2ZpbGVzL3Bvd2VydG9wLTIuNC10
aW5mby5wYXRjaD9yZXZpc2lvbj0xLjEmYW1wO3ZpZXc9bWFya3VwIiB0YXJnZXQ9Il9ibGFuayI+
aHR0cDovL3NvdXJjZXMuZ2VudG9vLm9yZy9jZ2ktYmluL3ZpZXd2Yy5jZ2kvZ2VudG9vLXg4Ni9z
eXMtcG93ZXIvcG93ZXJ0b3AvZmlsZXMvcG93ZXJ0b3AtMi40LXRpbmZvLnBhdGNoP3JldmlzaW9u
PTEuMSZhbXA7dmlldz1tYXJrdXA8L2E+PGJyPgoKJmd0OyZndDsmZ3Q7Jmd0OyZndDs8YnI+CiZn
dDsmZ3Q7Jmd0OyZndDsmZ3Q7IFBsZWFzZSBpbmNsdWRlIHRoaXMgZml4Ljxicj4KJmd0OyZndDsm
Z3Q7Jmd0OyZndDs8YnI+CiZndDsmZ3Q7Jmd0OyZndDsmZ3Q7IHRoYW5rcyw8YnI+CiZndDsmZ3Q7
Jmd0OyZndDsmZ3Q7IFplcm88YnI+CiZndDsmZ3Q7Jmd0OyZndDsmZ3Q7Jmd0OyZndDsgX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX188YnI+CiZndDsmZ3Q7Jmd0
OyZndDsmZ3Q7Jmd0OyZndDsgUG93ZXJUb3AgbWFpbGluZyBsaXN0PGJyPgomZ3Q7Jmd0OyZndDsm
Z3Q7Jmd0OyZndDsmZ3Q7IDxhIGhyZWY9Im1haWx0bzpQb3dlclRvcEBsaXN0cy4wMS5vcmciPlBv
d2VyVG9wQGxpc3RzLjAxLm9yZzwvYT48YnI+CiZndDsmZ3Q7Jmd0OyZndDsmZ3Q7Jmd0OyZndDsg
PGEgaHJlZj0iaHR0cHM6Ly9saXN0cy4wMS5vcmcvbWFpbG1hbi9saXN0aW5mby9wb3dlcnRvcCIg
dGFyZ2V0PSJfYmxhbmsiPmh0dHBzOi8vbGlzdHMuMDEub3JnL21haWxtYW4vbGlzdGluZm8vcG93
ZXJ0b3A8L2E+PGJyPgomZ3Q7Jmd0OyZndDsmZ3Q7Jmd0OyZndDsgX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX188YnI+CiZndDsmZ3Q7Jmd0OyZndDsmZ3Q7Jmd0
OyBQb3dlclRvcCBtYWlsaW5nIGxpc3Q8YnI+CiZndDsmZ3Q7Jmd0OyZndDsmZ3Q7Jmd0OyA8YSBo
cmVmPSJtYWlsdG86UG93ZXJUb3BAbGlzdHMuMDEub3JnIj5Qb3dlclRvcEBsaXN0cy4wMS5vcmc8
L2E+PGJyPgomZ3Q7Jmd0OyZndDsmZ3Q7Jmd0OyZndDsgPGEgaHJlZj0iaHR0cHM6Ly9saXN0cy4w
MS5vcmcvbWFpbG1hbi9saXN0aW5mby9wb3dlcnRvcCIgdGFyZ2V0PSJfYmxhbmsiPmh0dHBzOi8v
bGlzdHMuMDEub3JnL21haWxtYW4vbGlzdGluZm8vcG93ZXJ0b3A8L2E+PGJyPgomZ3Q7Jmd0OyZn
dDsmZ3Q7Jmd0OyZndDs8YnI+CiZndDsmZ3Q7Jmd0OyZndDsmZ3Q7PGJyPgomZ3Q7Jmd0Ozxicj4K
Jmd0OyZndDsmZ3Q7IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fPGJyPgomZ3Q7Jmd0OyZndDsgUG93ZXJUb3AgbWFpbGluZyBsaXN0PGJyPgomZ3Q7Jmd0OyZn
dDsgPGEgaHJlZj0ibWFpbHRvOlBvd2VyVG9wQGxpc3RzLjAxLm9yZyI+UG93ZXJUb3BAbGlzdHMu
MDEub3JnPC9hPjxicj4KJmd0OyZndDsmZ3Q7IDxhIGhyZWY9Imh0dHBzOi8vbGlzdHMuMDEub3Jn
L21haWxtYW4vbGlzdGluZm8vcG93ZXJ0b3AiIHRhcmdldD0iX2JsYW5rIj5odHRwczovL2xpc3Rz
LjAxLm9yZy9tYWlsbWFuL2xpc3RpbmZvL3Bvd2VydG9wPC9hPjxicj4KJmd0OyZndDsmZ3Q7PGJy
PgomZ3Q7Jmd0Ozxicj4KJmd0OyZndDs8YnI+CiZndDsmZ3Q7IFRoYW5rIHlvdSw8YnI+CiZndDsm
Z3Q7IEFsZXhhbmRyYS48YnI+CiZndDsmZ3Q7PGJyPgomZ3Q7PGJyPgomZ3Q7IC0tLS0tQkVHSU4g
UEdQIFNJR05BVFVSRS0tLS0tPGJyPgomZ3Q7IFZlcnNpb246IEdudVBHIHYyLjAuMjIgKEdOVS9M
aW51eCk8YnI+CiZndDsgQ29tbWVudDogVXNpbmcgR251UEcgd2l0aCBUaHVuZGVyYmlyZCAtIDxh
IGhyZWY9Imh0dHA6Ly93d3cuZW5pZ21haWwubmV0LyIgdGFyZ2V0PSJfYmxhbmsiPmh0dHA6Ly93
d3cuZW5pZ21haWwubmV0LzwvYT48YnI+CiZndDs8YnI+CiZndDsgaVFJY0JBRUJBZ0FHQlFKVFg3
VDdBQW9KRUtYZEZDZmRFZmxLTXB3UC9BM2FqR2RYOW56SU45cWVsQ1Q2QjFaaDxicj4KJmd0OyBF
ZndHSSthTlErYWU5R1A3Qk1ZeDlEemlycmc3Zy8vL2NUdjNvWHhuU3BYNFhpUUlqN29vendMT0Yx
RGdFY3M4PGJyPgomZ3Q7IFhkbW9UU09OeDZnRWlHbFlVNjBqck1Lb2ttbCtiSm9BQnhNNFI2dEJN
WU0yWFVEK1p4MjhUZE03NlNDeDJjR3E8YnI+CiZndDsgQ2lXSTZkdks3eDVhZnlMYnJqUnROdmtC
UTJrNXFNZWo0cy80ZkRDL3lyMVhOdmFMeEVxNFJReW9oRis1ZEFrODxicj4KJmd0OyBUOXJENllx
MEI4RXZ5clhUMDlURDAzY05tL0dIK0k0Rnp1by9oN0l2dW4xMFRNNDBuc1hIdU5xNjdMUGhZZ1Zh
PGJyPgomZ3Q7IG94MjhNc3lSY2FSbkh5b1B6dXVNT2h6Ky9RSWVVZ0RIT3UxbFRGQkROY0pnQ3Vv
eCtPUGYxTzlmbHcvSFRFWi88YnI+CiZndDsgK1lRZXdkWUlnaklpdjl0Vmp3ZHZYbGtyL0pTZ0Ns
MENkamFKVDZNTitWaFh6MmFNZHlRaDlUVjVQaDgrS0JJSDxicj4KJmd0OyAzK1IzcFVHS2grbVRF
eUo1bXdCWE1zTDlqcVFhOFRUd0ZwOU9HUmptbnF5dnlxUko3ejRDUlFybkxSZlMrRDk5PGJyPgom
Z3Q7IDVGYVprUzJOTC81WERuTEFaY05xclJrVjR3K1VGanVKSzV5clp4aVlXWGdYMW42SXFYOGVZ
OFE2NlNNZkJSTUc8YnI+CiZndDsgNlhLdEdENTNrdTdEVjZIKy9kbGZ6T1pURDhCK2VtT0pRWHBy
VDVPOS9RUFgxUjFiYnBDM0RTRXpNVGFkdFJQaTxicj4KJmd0OyBDVmhNRVBmZFkvVWxsSCtwSUFW
TlAzT1JvNHZnUkp3T2ZaTmhjcUxrZTdzRHJTanFUYTVLbkFiamIrNFFiNW5LPGJyPgomZ3Q7IG5C
UUtZSVFmTjkyTWI3ZnhGM3ZlPGJyPgomZ3Q7ID1kR2R0PGJyPgomZ3Q7IC0tLS0tRU5EIFBHUCBT
SUdOQVRVUkUtLS0tLTxicj4KJmd0Ozxicj4KPGJyPgo8YnI+ClRoYW5rIHlvdSw8YnI+CkFsZXhh
bmRyYS48YnI+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
PGJyPgpQb3dlclRvcCBtYWlsaW5nIGxpc3Q8YnI+CjxhIGhyZWY9Im1haWx0bzpQb3dlclRvcEBs
aXN0cy4wMS5vcmciPlBvd2VyVG9wQGxpc3RzLjAxLm9yZzwvYT48YnI+CjxhIGhyZWY9Imh0dHBz
Oi8vbGlzdHMuMDEub3JnL21haWxtYW4vbGlzdGluZm8vcG93ZXJ0b3AiIHRhcmdldD0iX2JsYW5r
Ij5odHRwczovL2xpc3RzLjAxLm9yZy9tYWlsbWFuL2xpc3RpbmZvL3Bvd2VydG9wPC9hPjxicj4K
PC9ibG9ja3F1b3RlPjwvZGl2Pgo=

--===============8488255760254845823==--

