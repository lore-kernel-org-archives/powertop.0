Content-Type: multipart/mixed; boundary="===============4957614408955113035=="
MIME-Version: 1.0
From: Alex <axfelix at gmail.com>
Subject: Re: [Powertop] corrupted double-linked list error on exit
Date: Sat, 31 Jan 2015 20:21:36 -0800
Message-ID: <1422764496.824.0@smtp.gmail.com>
In-Reply-To: 1422385274.16232.1@smtp.gmail.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============4957614408955113035==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Nevermind -- the issue appears to have gone away after updating kernel =

point versions (from 3.18.2 to 3.18.4, I believe).

-alex

On Tue, 27 Jan, 2015 at 11:01 AM, Alex <axfelix(a)gmail.com> wrote:
> Hi folks,
> =

> Wanted to alert you to this github issue which I and another user are =

> experiencing running Powertop on fairly bleeding edge environments =

> (Gnome 3.14, Linux 3.18). Receiving a "corrupted double-linked list" =

> error citing a memory address on trying to exit which prevents me =

> from saving calibrations.
> =

> https://github.com/NixOS/nixpkgs/issues/5424
> =

> Best,
> -alex

--===============4957614408955113035==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

TmV2ZXJtaW5kIC0tIHRoZSBpc3N1ZSBhcHBlYXJzIHRvIGhhdmUgZ29uZSBhd2F5IGFmdGVyIHVw
ZGF0aW5nIGtlcm5lbCBwb2ludCB2ZXJzaW9ucyAoZnJvbSAzLjE4LjIgdG8gMy4xOC40LCBJIGJl
bGlldmUpLjxicj48YnI+LWFsZXgKCjxicj48YnI+T24gVHVlLCAyNyBKYW4sIDIwMTUgYXQgMTE6
MDEgQU0sIEFsZXggJmx0O2F4ZmVsaXhAZ21haWwuY29tJmd0OyB3cm90ZTo8YnI+CjxibG9ja3F1
b3RlIHR5cGU9ImNpdGUiPkhpIGZvbGtzLDxkaXY+PGJyPjwvZGl2PjxkaXY+V2FudGVkIHRvIGFs
ZXJ0IHlvdSB0byB0aGlzIGdpdGh1YiBpc3N1ZSB3aGljaCBJIGFuZCBhbm90aGVyIHVzZXIgYXJl
IGV4cGVyaWVuY2luZyBydW5uaW5nIFBvd2VydG9wIG9uIGZhaXJseSBibGVlZGluZyBlZGdlIGVu
dmlyb25tZW50cyAoR25vbWUgMy4xNCwgTGludXggMy4xOCkuIFJlY2VpdmluZyBhICJjb3JydXB0
ZWQgZG91YmxlLWxpbmtlZCBsaXN0IiBlcnJvciBjaXRpbmcgYSBtZW1vcnkgYWRkcmVzcyBvbiB0
cnlpbmcgdG8gZXhpdCB3aGljaCBwcmV2ZW50cyBtZSBmcm9tIHNhdmluZyBjYWxpYnJhdGlvbnMu
PC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj48YSBocmVmPSJodHRwczovL2dpdGh1Yi5jb20vTml4
T1Mvbml4cGtncy9pc3N1ZXMvNTQyNCI+aHR0cHM6Ly9naXRodWIuY29tL05peE9TL25peHBrZ3Mv
aXNzdWVzLzU0MjQ8L2E+PC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj5CZXN0LDxicj4tYWxleDwv
ZGl2PjwvYmxvY2txdW90ZT4=
--===============4957614408955113035==--

