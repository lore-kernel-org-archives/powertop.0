Content-Type: multipart/mixed; boundary="===============1835759439888002764=="
MIME-Version: 1.0
From: Rony Ross <rony.ross at gmail.com>
Subject: Re: [Powertop] Package C states over Haswell platform
Date: Wed, 29 Oct 2014 14:23:27 +0200
Message-ID: <CAMnBwJQcRnR+eLevSHLNxpy8U+RwBerbsSbN9oroF9F8f6GdtA@mail.gmail.com>
In-Reply-To: 58642.10.255.85.192.1414555068.squirrel@linux.intel.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============1835759439888002764==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi,

Alexandra and Daniel, thank you for your suggestions.

1. I forgot to mention that the powertop results that I posted were after
performing --autotune
2. The platform's lid is off and I connect using SSH, so I don't think that
the graphic card/frame buffer are to blame
3. I don't think that not entering D3 has any affect on entering PC7. The
package should enter PC7 even when the device is not in D3
4. Currently I'm trying to avoid updating the kernel. However, if nothing
else helps I might have to...

I can think of one thing that might prevent the package from entering high
C states. It might be related to the LTR mechanism, which would prevent
high PC states when devices report low LTR values (or if there is some
other LTR related issue). Is there a way the read the LTR values that
devices set during runtime?

BTW, reading LTR values could be an important feature for powertop.

Thanks,

Rony

On Wed, Oct 29, 2014 at 5:57 AM, Alexandra Yates <
alexandra.yates(a)linux.intel.com> wrote:

>
> >
> >> Hi,
> >>
> >> I'm working on DELL E7440 platform (Haswell based) with dual OS: Windo=
ws
> >> 8.1
> >> and Ubuntu 14.04.1 (based on 3.13).
> >> When I use Win 8.1, using BLA I get ~90% PC7 when idle. However, when I
> >> use
> >> the Ubuntu, using powertop I get only as high as PC3.
> >> Since it's the same platform, it seems to rule out a HW issue. Any idea
> >> what
> >> can be the problem? Is Haswell fully supported by powertop?
> >>
> >>           Package   |             Core    |            CPU 0       CPU=
 2
> >>                     |                     | C0 active   0.2%        0.=
1%
> >>                     |                     | POLL        0.0%    0.0 ms
> >> 0.0%
> >> 0.0 ms
> >>                     |                     | C1E-HSW     0.0%    0.1 ms
> >> 0.0%
> >> 0.0 ms
> >> C2 (pc2)    0.1%    |                     |
> >> C3 (pc3)    3.7%    | C3 (cc3)    0.0%    | C3-HSW      0.0%    0.4 ms
> >> 0.0%
> >> 0.4 ms
> >> C6 (pc6)    0.0%    | C6 (cc6)    0.0%    | C6-HSW      0.0%    0.0 ms
> >> 0.0%
> >> 0.2 ms
> >> C7 (pc7)    0.0%    | C7 (cc7)   99.0%    | C7s-HSW     0.1%    0.9 ms
> >> 0.1%
> >> 1.8 ms
> >> C8 (pc8)    0.0%    |                     | C8-HSW      0.1%    1.4 ms
> >> 0.2%
> >> 2.5 ms
> >> C9 (pc9)    0.0%    |                     | C9-HSW      0.4%    4.0 ms
> >> 2.3%
> >> 8.0 ms
> >> C10 (pc10)  0.0%    |                     | C10-HSW    98.9%   44.5 ms
> >> 97.0%
> >> 36.5 ms
> >>
> >>                     |             Core    |            CPU 1       CPU=
 3
> >>                     |                     | C0 active   0.2%        0.=
1%
> >>                     |                     | POLL        0.0%    0.0 ms
> >> 0.0%
> >> 0.0 ms
> >>                     |                     | C1E-HSW     0.0%    0.0 ms
> >> 1.0%
> >> 50.1 ms
> >>                     |                     |
> >>                     | C3 (cc3)    0.0%    | C3-HSW      0.0%    0.7 ms
> >> 0.0%
> >> 0.6 ms
> >>                     | C6 (cc6)    0.0%    | C6-HSW      0.0%    0.5 ms
> >> 0.0%
> >> 0.0 ms
> >>                     | C7 (cc7)   98.0%    | C7s-HSW     0.1%    0.7 ms
> >> 0.4%
> >> 25.7 ms
> >>                     |                     | C8-HSW      0.0%    4.9 ms
> >> 0.0%
> >> 1.5 ms
> >>                     |                     | C9-HSW      0.6%    4.7 ms
> >> 0.7%
> >> 19.5 ms
> >>                     |                     | C10-HSW    98.5%   93.5 ms
> >> 97.8%
> >> 78.0 ms
> >>
> >>                     |             GPU     |
> >>                     |                     |
> >>                     | Powered On 12.1%    |
> >>                     | RC6        87.9%    |
> >>                     | RC6p        0.0%    |
> >>                     | RC6pp       0.0%    |
> >>
> >> Thanks
> >>
> >>
> >>
> >> Rony
> >>
> >> _______________________________________________
> >> PowerTop mailing list
> >> PowerTop(a)lists.01.org
> >> https://lists.01.org/mailman/listinfo/powertop
> >>
>
> Hi Rony,
>
> Interesting you ask this since I presented at the Open source bridge
> conference a case study on how to optimize your computer in terms of power
> using PowerTOP, as an example I used a Haswell box with Ubuntu.  I also
> presented on the Debian conference a similar talk using Debian distro.
> Both talks happened this year.
>
>
> There are few things that may be happening.
>
>  1- Update to the latest kernel 3.17.  From 3.13 to 3.17
> there have been few bug fixes that help linux in terms of power
>  management.
>
>  2-At the boot command line of your kernel add the following settings:
>        i915.enable_psr=3D1
>        i915.enable_fbc=3D1
>        pcie_aspm=3Dforce
>
> The first command enables the graphics card use panel self refresh, the
> second  enables frame buffer compression. The third command helps the
> network card enter D3 state.
>
> http://wireless.kernel.org/en/users/Documentation/ASPM#Enabling_ASPM_with=
_setpci
>
>  3- Use PowerTOP/tunables to tune power management for all your devices.
> If none of the settings disrupt the proper usability of the computer add
> then to a script file and run this each time you restart your computer.
> Alternatively you can use powertop --auto_tune
>
>
> Run PowerTOP at this point you should see your system reaching a deep
> power state.
>
> Thank you,
> Alexandra.
>

--===============1835759439888002764==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PGRpdiBkaXI9Imx0ciI+PGRpdj5IaSw8L2Rpdj48ZGl2PsKgPC9kaXY+PGRpdj5BbGV4YW5kcmEg
YW5kIERhbmllbCwgdGhhbmsgeW91wqBmb3LCoHlvdXIgc3VnZ2VzdGlvbnMuIDwvZGl2PjxkaXY+
wqA8L2Rpdj48ZGl2PjEuIEkgZm9yZ290IHRvIG1lbnRpb24gdGhhdCB0aGUgcG93ZXJ0b3AgcmVz
dWx0cyB0aGF0IEkgcG9zdGVkIHdlcmUgYWZ0ZXIgcGVyZm9ybWluZyAtLWF1dG90dW5lPC9kaXY+
PGRpdj4yLiBUaGUgcGxhdGZvcm0mIzM5O3MgbGlkIGlzIG9mZiBhbmQgSSBjb25uZWN0wqB1c2lu
ZyBTU0gsIHNvIEkgZG9uJiMzOTt0IHRoaW5rIHRoYXQgdGhlIGdyYXBoaWMgY2FyZC9mcmFtZSBi
dWZmZXIgYXJlIHRvIGJsYW1lPC9kaXY+PGRpdj4zLiBJIGRvbiYjMzk7dCB0aGluayB0aGF0IG5v
dCBlbnRlcmluZyBEMyBoYXMgYW55IGFmZmVjdCBvbiBlbnRlcmluZyBQQzcuIFRoZSBwYWNrYWdl
IHNob3VsZCBlbnRlciBQQzcgZXZlbiB3aGVuIHRoZSBkZXZpY2UgaXMgbm90IGluIEQzPC9kaXY+
PGRpdj40LiBDdXJyZW50bHkgSSYjMzk7bSB0cnlpbmcgdG8gYXZvaWTCoHVwZGF0aW5nIHRoZSBr
ZXJuZWwuIEhvd2V2ZXIsIGlmIG5vdGhpbmcgZWxzZSBoZWxwcyBJIG1pZ2h0IGhhdmUgdG8uLi48
L2Rpdj48ZGl2PsKgPC9kaXY+PGRpdj5JIGNhbiB0aGluayBvZiBvbmUgdGhpbmcgdGhhdCBtaWdo
dCBwcmV2ZW50IHRoZSBwYWNrYWdlIGZyb20gZW50ZXJpbmcgaGlnaCBDIHN0YXRlcy4gSXQgbWln
aHQgYmUgcmVsYXRlZCB0byB0aGUgTFRSIG1lY2hhbmlzbSwgd2hpY2ggd291bGQgcHJldmVudCBo
aWdoIFBDIHN0YXRlcyB3aGVuwqBkZXZpY2VzIHJlcG9ydCBsb3cgTFRSIHZhbHVlcyAob3IgaWYg
dGhlcmUgaXMgc29tZSBvdGhlciBMVFIgcmVsYXRlZCBpc3N1ZSkuIElzIHRoZXJlIGEgd2F5IHRo
ZSByZWFkIHRoZSBMVFIgdmFsdWVzIHRoYXQgZGV2aWNlc8Kgc2V0IGR1cmluZyBydW50aW1lPzwv
ZGl2PjxkaXY+wqA8L2Rpdj48ZGl2PkJUVywgcmVhZGluZyBMVFIgdmFsdWVzIGNvdWxkIGJlIGFu
IGltcG9ydGFudCBmZWF0dXJlIGZvciBwb3dlcnRvcC48L2Rpdj48ZGl2PsKgPC9kaXY+PGRpdj5U
aGFua3MsPC9kaXY+PGRpdj7CoDwvZGl2PjxkaXY+Um9ueTwvZGl2PjwvZGl2PjxkaXYgY2xhc3M9
ImdtYWlsX2V4dHJhIj48YnI+PGRpdiBjbGFzcz0iZ21haWxfcXVvdGUiPk9uIFdlZCwgT2N0IDI5
LCAyMDE0IGF0IDU6NTcgQU0sIEFsZXhhbmRyYSBZYXRlcyA8c3BhbiBkaXI9Imx0ciI+Jmx0Ozxh
IGhyZWY9Im1haWx0bzphbGV4YW5kcmEueWF0ZXNAbGludXguaW50ZWwuY29tIiB0YXJnZXQ9Il9i
bGFuayI+YWxleGFuZHJhLnlhdGVzQGxpbnV4LmludGVsLmNvbTwvYT4mZ3Q7PC9zcGFuPiB3cm90
ZTo8YnI+PGJsb2NrcXVvdGUgY2xhc3M9ImdtYWlsX3F1b3RlIiBzdHlsZT0ibWFyZ2luOjAgMCAw
IC44ZXg7Ym9yZGVyLWxlZnQ6MXB4ICNjY2Mgc29saWQ7cGFkZGluZy1sZWZ0OjFleCI+PGRpdiBj
bGFzcz0iSE9FblpiIj48ZGl2IGNsYXNzPSJoNSI+PGJyPgomZ3Q7PGJyPgomZ3Q7Jmd0OyBIaSw8
YnI+CiZndDsmZ3Q7PGJyPgomZ3Q7Jmd0OyBJJiMzOTttIHdvcmtpbmcgb24gREVMTCBFNzQ0MCBw
bGF0Zm9ybSAoSGFzd2VsbCBiYXNlZCkgd2l0aCBkdWFsIE9TOiBXaW5kb3dzPGJyPgomZ3Q7Jmd0
OyA4LjE8YnI+CiZndDsmZ3Q7IGFuZCBVYnVudHUgMTQuMDQuMSAoYmFzZWQgb24gMy4xMykuPGJy
PgomZ3Q7Jmd0OyBXaGVuIEkgdXNlIFdpbiA4LjEsIHVzaW5nIEJMQSBJIGdldCB+OTAlIFBDNyB3
aGVuIGlkbGUuIEhvd2V2ZXIsIHdoZW4gSTxicj4KJmd0OyZndDsgdXNlPGJyPgomZ3Q7Jmd0OyB0
aGUgVWJ1bnR1LCB1c2luZyBwb3dlcnRvcCBJIGdldCBvbmx5IGFzIGhpZ2ggYXMgUEMzLjxicj4K
Jmd0OyZndDsgU2luY2UgaXQmIzM5O3MgdGhlIHNhbWUgcGxhdGZvcm0sIGl0IHNlZW1zIHRvIHJ1
bGUgb3V0IGEgSFcgaXNzdWUuIEFueSBpZGVhPGJyPgomZ3Q7Jmd0OyB3aGF0PGJyPgomZ3Q7Jmd0
OyBjYW4gYmUgdGhlIHByb2JsZW0/IElzIEhhc3dlbGwgZnVsbHkgc3VwcG9ydGVkIGJ5IHBvd2Vy
dG9wPzxicj4KJmd0OyZndDs8YnI+CiZndDsmZ3Q7wqAgwqAgwqAgwqAgwqAgwqBQYWNrYWdlwqAg
wqB8wqAgwqAgwqAgwqAgwqAgwqAgwqBDb3JlwqAgwqAgfMKgIMKgIMKgIMKgIMKgIMKgIENQVSAw
wqAgwqAgwqAgwqBDUFUgMjxicj4KJmd0OyZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoHzCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHwgQzAgYWN0aXZlwqAgwqAwLjIl
wqAgwqAgwqAgwqAgMC4xJTxicj4KJmd0OyZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoHzCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHwgUE9MTMKgIMKgIMKgIMKgIDAu
MCXCoCDCoCAwLjAgbXM8YnI+CiZndDsmZ3Q7IDAuMCU8YnI+CiZndDsmZ3Q7IDAuMCBtczxicj4K
Jmd0OyZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHzCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoHwgQzFFLUhTV8KgIMKgIMKgMC4wJcKgIMKgIDAuMSBtczxicj4KJmd0
OyZndDsgMC4wJTxicj4KJmd0OyZndDsgMC4wIG1zPGJyPgomZ3Q7Jmd0OyBDMiAocGMyKcKgIMKg
IDAuMSXCoCDCoCB8wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB8PGJyPgomZ3Q7Jmd0
OyBDMyAocGMzKcKgIMKgIDMuNyXCoCDCoCB8IEMzIChjYzMpwqAgwqAgMC4wJcKgIMKgIHwgQzMt
SFNXwqAgwqAgwqAgMC4wJcKgIMKgIDAuNCBtczxicj4KJmd0OyZndDsgMC4wJTxicj4KJmd0OyZn
dDsgMC40IG1zPGJyPgomZ3Q7Jmd0OyBDNiAocGM2KcKgIMKgIDAuMCXCoCDCoCB8IEM2IChjYzYp
wqAgwqAgMC4wJcKgIMKgIHwgQzYtSFNXwqAgwqAgwqAgMC4wJcKgIMKgIDAuMCBtczxicj4KJmd0
OyZndDsgMC4wJTxicj4KJmd0OyZndDsgMC4yIG1zPGJyPgomZ3Q7Jmd0OyBDNyAocGM3KcKgIMKg
IDAuMCXCoCDCoCB8IEM3IChjYzcpwqAgwqA5OS4wJcKgIMKgIHwgQzdzLUhTV8KgIMKgIMKgMC4x
JcKgIMKgIDAuOSBtczxicj4KJmd0OyZndDsgMC4xJTxicj4KJmd0OyZndDsgMS44IG1zPGJyPgom
Z3Q7Jmd0OyBDOCAocGM4KcKgIMKgIDAuMCXCoCDCoCB8wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqB8IEM4LUhTV8KgIMKgIMKgIDAuMSXCoCDCoCAxLjQgbXM8YnI+CiZndDsmZ3Q7IDAu
MiU8YnI+CiZndDsmZ3Q7IDIuNSBtczxicj4KJmd0OyZndDsgQzkgKHBjOSnCoCDCoCAwLjAlwqAg
wqAgfMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgfCBDOS1IU1fCoCDCoCDCoCAwLjQl
wqAgwqAgNC4wIG1zPGJyPgomZ3Q7Jmd0OyAyLjMlPGJyPgomZ3Q7Jmd0OyA4LjAgbXM8YnI+CiZn
dDsmZ3Q7IEMxMCAocGMxMCnCoCAwLjAlwqAgwqAgfMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgfCBDMTAtSFNXwqAgwqAgOTguOSXCoCDCoDQ0LjUgbXM8YnI+CiZndDsmZ3Q7IDk3LjAl
PGJyPgomZ3Q7Jmd0OyAzNi41IG1zPGJyPgomZ3Q7Jmd0Ozxicj4KJmd0OyZndDvCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoHzCoCDCoCDCoCDCoCDCoCDCoCDCoENvcmXCoCDCoCB8wqAg
wqAgwqAgwqAgwqAgwqAgQ1BVIDHCoCDCoCDCoCDCoENQVSAzPGJyPgomZ3Q7Jmd0O8KgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgfMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
fCBDMCBhY3RpdmXCoCDCoDAuMiXCoCDCoCDCoCDCoCAwLjElPGJyPgomZ3Q7Jmd0O8KgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgfMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
fCBQT0xMwqAgwqAgwqAgwqAgMC4wJcKgIMKgIDAuMCBtczxicj4KJmd0OyZndDsgMC4wJTxicj4K
Jmd0OyZndDsgMC4wIG1zPGJyPgomZ3Q7Jmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgfMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgfCBDMUUtSFNXwqAgwqAgwqAwLjAl
wqAgwqAgMC4wIG1zPGJyPgomZ3Q7Jmd0OyAxLjAlPGJyPgomZ3Q7Jmd0OyA1MC4xIG1zPGJyPgom
Z3Q7Jmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgfMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgfDxicj4KJmd0OyZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoHwgQzMgKGNjMynCoCDCoCAwLjAlwqAgwqAgfCBDMy1IU1fCoCDCoCDCoCAwLjAlwqAgwqAg
MC43IG1zPGJyPgomZ3Q7Jmd0OyAwLjAlPGJyPgomZ3Q7Jmd0OyAwLjYgbXM8YnI+CiZndDsmZ3Q7
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB8IEM2IChjYzYpwqAgwqAgMC4wJcKgIMKg
IHwgQzYtSFNXwqAgwqAgwqAgMC4wJcKgIMKgIDAuNSBtczxicj4KJmd0OyZndDsgMC4wJTxicj4K
Jmd0OyZndDsgMC4wIG1zPGJyPgomZ3Q7Jmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgfCBDNyAoY2M3KcKgIMKgOTguMCXCoCDCoCB8IEM3cy1IU1fCoCDCoCDCoDAuMSXCoCDCoCAw
LjcgbXM8YnI+CiZndDsmZ3Q7IDAuNCU8YnI+CiZndDsmZ3Q7IDI1LjcgbXM8YnI+CiZndDsmZ3Q7
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB8wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqB8IEM4LUhTV8KgIMKgIMKgIDAuMCXCoCDCoCA0LjkgbXM8YnI+CiZndDsmZ3Q7IDAu
MCU8YnI+CiZndDsmZ3Q7IDEuNSBtczxicj4KJmd0OyZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoHzCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHwgQzktSFNXwqAgwqAg
wqAgMC42JcKgIMKgIDQuNyBtczxicj4KJmd0OyZndDsgMC43JTxicj4KJmd0OyZndDsgMTkuNSBt
czxicj4KJmd0OyZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHzCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoHwgQzEwLUhTV8KgIMKgIDk4LjUlwqAgwqA5My41IG1zPGJy
PgomZ3Q7Jmd0OyA5Ny44JTxicj4KJmd0OyZndDsgNzguMCBtczxicj4KJmd0OyZndDs8YnI+CiZn
dDsmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB8wqAgwqAgwqAgwqAgwqAgwqAg
wqBHUFXCoCDCoCDCoHw8YnI+CiZndDsmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqB8wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB8PGJyPgomZ3Q7Jmd0O8KgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgfCBQb3dlcmVkIE9uIDEyLjElwqAgwqAgfDxicj4KJmd0
OyZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHwgUkM2wqAgwqAgwqAgwqAgODcu
OSXCoCDCoCB8PGJyPgomZ3Q7Jmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgfCBS
QzZwwqAgwqAgwqAgwqAgMC4wJcKgIMKgIHw8YnI+CiZndDsmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqB8IFJDNnBwwqAgwqAgwqAgwqAwLjAlwqAgwqAgfDxicj4KJmd0OyZndDs8
YnI+CiZndDsmZ3Q7IFRoYW5rczxicj4KJmd0OyZndDs8YnI+CiZndDsmZ3Q7PGJyPgomZ3Q7Jmd0
Ozxicj4KJmd0OyZndDsgUm9ueTxicj4KJmd0OyZndDs8YnI+CiZndDsmZ3Q7IF9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fPGJyPgomZ3Q7Jmd0OyBQb3dlclRv
cCBtYWlsaW5nIGxpc3Q8YnI+CiZndDsmZ3Q7IDxhIGhyZWY9Im1haWx0bzpQb3dlclRvcEBsaXN0
cy4wMS5vcmciPlBvd2VyVG9wQGxpc3RzLjAxLm9yZzwvYT48YnI+CiZndDsmZ3Q7IDxhIGhyZWY9
Imh0dHBzOi8vbGlzdHMuMDEub3JnL21haWxtYW4vbGlzdGluZm8vcG93ZXJ0b3AiIHRhcmdldD0i
X2JsYW5rIj5odHRwczovL2xpc3RzLjAxLm9yZy9tYWlsbWFuL2xpc3RpbmZvL3Bvd2VydG9wPC9h
Pjxicj4KJmd0OyZndDs8YnI+Cjxicj4KSGkgUm9ueSw8YnI+Cjxicj4KSW50ZXJlc3RpbmcgeW91
IGFzayB0aGlzIHNpbmNlIEkgcHJlc2VudGVkIGF0IHRoZSBPcGVuIHNvdXJjZSBicmlkZ2U8YnI+
CjwvZGl2PjwvZGl2PmNvbmZlcmVuY2UgYSBjYXNlIHN0dWR5IG9uIGhvdyB0byBvcHRpbWl6ZSB5
b3VyIGNvbXB1dGVyIGluIHRlcm1zIG9mIHBvd2VyPGJyPgp1c2luZyBQb3dlclRPUCwgYXMgYW4g
ZXhhbXBsZSBJIHVzZWQgYSBIYXN3ZWxsIGJveCB3aXRoIFVidW50dS7CoCBJIGFsc288YnI+Cjxz
cGFuPnByZXNlbnRlZCBvbiB0aGUgRGViaWFuIGNvbmZlcmVuY2UgYSBzaW1pbGFyIHRhbGsgdXNp
bmcgRGViaWFuIGRpc3Ryby48YnI+Cjwvc3Bhbj5Cb3RoIHRhbGtzIGhhcHBlbmVkIHRoaXMgeWVh
ci48YnI+CjxzcGFuPjxicj4KPGJyPgpUaGVyZSBhcmUgZmV3IHRoaW5ncyB0aGF0IG1heSBiZSBo
YXBwZW5pbmcuPGJyPgo8YnI+Cjwvc3Bhbj7CoDEtIFVwZGF0ZSB0byB0aGUgbGF0ZXN0IGtlcm5l
bCAzLjE3LsKgIEZyb20gMy4xMyB0byAzLjE3PGJyPgo8c3Bhbj50aGVyZSBoYXZlIGJlZW4gZmV3
IGJ1ZyBmaXhlcyB0aGF0IGhlbHAgbGludXggaW4gdGVybXMgb2YgcG93ZXI8YnI+CsKgbWFuYWdl
bWVudC48YnI+Cjxicj4KwqAyLUF0IHRoZSBib290IGNvbW1hbmQgbGluZSBvZiB5b3VyIGtlcm5l
bCBhZGQgdGhlIGZvbGxvd2luZyBzZXR0aW5nczo8YnI+Cjwvc3Bhbj7CoCDCoCDCoCDCoGk5MTUu
ZW5hYmxlX3Bzcj0xPGJyPgrCoCDCoCDCoCDCoGk5MTUuZW5hYmxlX2ZiYz0xPGJyPgrCoCDCoCDC
oCDCoHBjaWVfYXNwbT1mb3JjZTxicj4KPGJyPgpUaGUgZmlyc3QgY29tbWFuZCBlbmFibGVzIHRo
ZSBncmFwaGljcyBjYXJkIHVzZSBwYW5lbCBzZWxmIHJlZnJlc2gsIHRoZTxicj4Kc2Vjb25kwqAg
ZW5hYmxlcyBmcmFtZSBidWZmZXIgY29tcHJlc3Npb24uIFRoZSB0aGlyZCBjb21tYW5kIGhlbHBz
IHRoZTxicj4KbmV0d29yayBjYXJkIGVudGVyIEQzIHN0YXRlLjxicj4KPGEgaHJlZj0iaHR0cDov
L3dpcmVsZXNzLmtlcm5lbC5vcmcvZW4vdXNlcnMvRG9jdW1lbnRhdGlvbi9BU1BNI0VuYWJsaW5n
X0FTUE1fd2l0aF9zZXRwY2kiIHRhcmdldD0iX2JsYW5rIj5odHRwOi8vd2lyZWxlc3Mua2VybmVs
Lm9yZy9lbi91c2Vycy9Eb2N1bWVudGF0aW9uL0FTUE0jRW5hYmxpbmdfQVNQTV93aXRoX3NldHBj
aTwvYT48YnI+Cjxicj4KwqAzLSBVc2UgUG93ZXJUT1AvdHVuYWJsZXMgdG8gdHVuZSBwb3dlciBt
YW5hZ2VtZW50IGZvciBhbGwgeW91ciBkZXZpY2VzLjxicj4KSWYgbm9uZSBvZiB0aGUgc2V0dGlu
Z3MgZGlzcnVwdCB0aGUgcHJvcGVyIHVzYWJpbGl0eSBvZiB0aGUgY29tcHV0ZXIgYWRkPGJyPgp0
aGVuIHRvIGEgc2NyaXB0IGZpbGUgYW5kIHJ1biB0aGlzIGVhY2ggdGltZSB5b3UgcmVzdGFydCB5
b3VyIGNvbXB1dGVyLjxicj4KQWx0ZXJuYXRpdmVseSB5b3UgY2FuIHVzZSBwb3dlcnRvcCAtLWF1
dG9fdHVuZTxicj4KPGJyPgo8YnI+ClJ1biBQb3dlclRPUCBhdCB0aGlzIHBvaW50IHlvdSBzaG91
bGQgc2VlIHlvdXIgc3lzdGVtIHJlYWNoaW5nIGEgZGVlcDxicj4KcG93ZXIgc3RhdGUuPGJyPgo8
YnI+ClRoYW5rIHlvdSw8YnI+CkFsZXhhbmRyYS48YnI+CjwvYmxvY2txdW90ZT48L2Rpdj48YnI+
PC9kaXY+Cg==

--===============1835759439888002764==--

