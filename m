Content-Type: multipart/mixed; boundary="===============3732146347953459567=="
MIME-Version: 1.0
From: u know gascogne <atlrudeboi1 at gmail.com>
Subject: Re: [Powertop] compile error
Date: Fri, 18 May 2012 11:49:24 -0700
Message-ID: <CALRnzVVcCjdbULfw-3w8tXnkLy9TgSOfuOwBbgiOBokGoN9wqA@mail.gmail.com>
In-Reply-To: CALRnzVX1_3RLy_7TL-tyT8gpNCJL6Wi0eTTJ6nj1vMQrwGwYHg@mail.gmail.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============3732146347953459567==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

> I am unable to compile powertop I have all the dependencies and the
> autogen and configure complete sussesfulyl however during make i get:
>
> /powertop-extech.o powertop-main.o  -L/usr/local/lib -lpci -lnl -lz
> ../pevent/.libs/libparseevent.a -lpthread -lncurses
> /usr/local/lib/libpci.a(names-net.o): In function `pci_id_net_lookup':
> names-net.c:(.text+0x125): undefined reference to `__res_query'
> collect2: ld returned 1 exit status
> make[3]: *** [powertop] Error 1
> make[3]: Leaving directory `/home/aaron/Downloads/powertop-2.0/src'
> make[2]: *** [all] Error 2
> make[2]: Leaving directory `/home/aaron/Downloads/powertop-2.0/src'
> make[1]: *** [all-recursive] Error 1
> make[1]: Leaving directory `/home/aaron/Downloads/powertop-2.0'
> make: *** [all] Error 2
>
> I have pcitutils version 3.19 installed and have verified that libpci-a is
> present i am on 3.4rc kernel on ubuntu 12.04
>

--===============3732146347953459567==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PGJyPjxkaXYgY2xhc3M9ImdtYWlsX3F1b3RlIj48YmxvY2txdW90ZSBjbGFzcz0iZ21haWxfcXVv
dGUiIHN0eWxlPSJtYXJnaW46MCAwIDAgLjhleDtib3JkZXItbGVmdDoxcHggI2NjYyBzb2xpZDtw
YWRkaW5nLWxlZnQ6MWV4Ij5JIGFtIHVuYWJsZSB0byBjb21waWxlIHBvd2VydG9wIEkgaGF2ZSBh
bGwgdGhlIGRlcGVuZGVuY2llcyBhbmQgdGhlIGF1dG9nZW4gYW5kIGNvbmZpZ3VyZSBjb21wbGV0
ZSBzdXNzZXNmdWx5bCBob3dldmVyIGR1cmluZyBtYWtlIGkgZ2V0OjxkaXY+Cgo8YnI+PC9kaXY+
PGRpdj48ZGl2Pi9wb3dlcnRvcC1leHRlY2gubyBwb3dlcnRvcC1tYWluLm8goC1ML3Vzci9sb2Nh
bC9saWIgLWxwY2kgLWxubCAtbHogLi4vcGV2ZW50Ly5saWJzL2xpYnBhcnNlZXZlbnQuYSAtbHB0
aHJlYWQgLWxuY3Vyc2VzPC9kaXY+CjxkaXY+L3Vzci9sb2NhbC9saWIvbGlicGNpLmEobmFtZXMt
bmV0Lm8pOiBJbiBmdW5jdGlvbiBgcGNpX2lkX25ldF9sb29rdXAmIzM5Ozo8L2Rpdj48ZGl2Pm5h
bWVzLW5ldC5jOigudGV4dCsweDEyNSk6IHVuZGVmaW5lZCByZWZlcmVuY2UgdG8gYF9fcmVzX3F1
ZXJ5JiMzOTs8L2Rpdj48ZGl2PmNvbGxlY3QyOiBsZCByZXR1cm5lZCAxIGV4aXQgc3RhdHVzPC9k
aXY+PGRpdj5tYWtlWzNdOiAqKiogW3Bvd2VydG9wXSBFcnJvciAxPC9kaXY+CgoKPGRpdj5tYWtl
WzNdOiBMZWF2aW5nIGRpcmVjdG9yeSBgL2hvbWUvYWFyb24vRG93bmxvYWRzL3Bvd2VydG9wLTIu
MC9zcmMmIzM5OzwvZGl2PjxkaXY+bWFrZVsyXTogKioqIFthbGxdIEVycm9yIDI8L2Rpdj48ZGl2
Pm1ha2VbMl06IExlYXZpbmcgZGlyZWN0b3J5IGAvaG9tZS9hYXJvbi9Eb3dubG9hZHMvcG93ZXJ0
b3AtMi4wL3NyYyYjMzk7PC9kaXY+PGRpdj5tYWtlWzFdOiAqKiogW2FsbC1yZWN1cnNpdmVdIEVy
cm9yIDE8L2Rpdj4KCgo8ZGl2Pm1ha2VbMV06IExlYXZpbmcgZGlyZWN0b3J5IGAvaG9tZS9hYXJv
bi9Eb3dubG9hZHMvcG93ZXJ0b3AtMi4wJiMzOTs8L2Rpdj48ZGl2Pm1ha2U6ICoqKiBbYWxsXSBF
cnJvciAyPC9kaXY+PC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj5JIGhhdmUgcGNpdHV0aWxzIHZl
cnNpb24gMy4xOSBpbnN0YWxsZWQgYW5kIGhhdmWgdmVyaWZpZWSgdGhhdCBsaWJwY2ktYSBpcyBw
cmVzZW50IGkgYW0gb24gMy40cmMga2VybmVsIG9uIHVidW50dSAxMi4wNKA8L2Rpdj4KCgo8L2Js
b2NrcXVvdGU+PC9kaXY+PGJyPgo=

--===============3732146347953459567==--

