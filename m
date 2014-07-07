Content-Type: multipart/mixed; boundary="===============6462215667163755993=="
MIME-Version: 1.0
From: rahul shrivastava <rshrivastava2 at gmail.com>
Subject: Re: [Powertop] not getting the power consumption numbers
Date: Mon, 07 Jul 2014 23:10:10 +0530
Message-ID: <CAETyQ1P9=FosHGecc2=bZEPasBft9m9yyBvT1T6rr8OgGy2sxA@mail.gmail.com>
In-Reply-To: 20140704120549.GA956@swordfish
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============6462215667163755993==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Sergey,

I am running powertop without any argument. According to your mail,
powertop starts estimation after running it 3 times the number of
parameters. I have run it almost 6 7 times, but yet I am not getting power
figures. Could you please help me out here


Regards
Rahul


On Fri, Jul 4, 2014 at 5:35 PM, Sergey Senozhatsky <
sergey.senozhatsky(a)gmail.com> wrote:

> On (07/04/14 10:19), rahul shrivastava wrote:
> > Date: Fri, 4 Jul 2014 10:19:24 +0530
> > From: rahul shrivastava <rshrivastava2(a)gmail.com>
> > To: powertop(a)lists.01.org
> > Subject: [Powertop] not getting the power consumption numbers
> >
> >    Hi,
> >    While installing version 2.6.1, I got the following error -
> >    make[2]: Entering directory `/home/rahul/powertop/powertop-2.6.1/src'
> >    /bin/bash ./csstoh.sh powertop.css css.h
> >    /bin/bash: ./csstoh.sh: No such file or directory
>
> should be fixed by now, not sure if the fix is already included into
> tarball, though.
>
> >    So I installed version 2.5 and it compiled correctly. But, I am not
> >    getting the power consumption numbers. What I am getting is this
> >                   Usage       Events/s    Category       Description
> >                 66.7 us/s      26.5        Process        [rcu_sched]
> >                152.8 us/s      18.7        Interrupt      [3]
> net_rx(softirq)
> >                 21.7 us/s      18.7        kWork          od_dbs_timer
> >                367.6 us/s      11.8        Process        avahi-daemon:
> >    running [Ramanujan.local]
> >                 33.6 us/s       9.8        Timer
>  tick_sched_timer
> >                  7.0 ms/s       2.0        Process        powertop
> >                299.8 us/s       2.0        Process
> >     /usr/sbin/irqbalance
> >                 50.3 us/s       2.0        Process
> >     /usr/lib/accountsservice/accounts-daemon
> >                 39.7 us/s       2.0        Process        nmbd -D
> >    I am not getting any "power estimation" field.
>
> please read https://lists.01.org/pipermail/powertop/2014-March/001256.html
>
>         -ss
>
> >    I am using ubuntu 12.04 with linux kernel version 3.11.0-24-generic
> >    Could you please let me know what could be wrong.
> >    Regards
> >    Rahul
>
> > _______________________________________________
> > PowerTop mailing list
> > PowerTop(a)lists.01.org
> > https://lists.01.org/mailman/listinfo/powertop
>
>

--===============6462215667163755993==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PGRpdiBkaXI9Imx0ciI+PGRpdj48ZGl2PkhpIFNlcmdleSw8YnI+PGJyPjwvZGl2PkkgYW0gcnVu
bmluZyBwb3dlcnRvcCB3aXRob3V0IGFueSBhcmd1bWVudC4gQWNjb3JkaW5nIHRvIHlvdXIgbWFp
bCwgcG93ZXJ0b3Agc3RhcnRzIGVzdGltYXRpb24gYWZ0ZXIgcnVubmluZyBpdCAzIHRpbWVzIHRo
ZSBudW1iZXIgb2YgcGFyYW1ldGVycy4gSSBoYXZlIHJ1biBpdCBhbG1vc3QgNiA3IHRpbWVzLCBi
dXQgeWV0IEkgYW0gbm90IGdldHRpbmcgcG93ZXIgZmlndXJlcy4gQ291bGQgeW91IHBsZWFzZSBo
ZWxwIG1lIG91dCBoZXJlPGJyPgo8YnI+PGJyPjwvZGl2PlJlZ2FyZHM8YnI+UmFodWw8YnI+PC9k
aXY+PGRpdiBjbGFzcz0iZ21haWxfZXh0cmEiPjxicj48YnI+PGRpdiBjbGFzcz0iZ21haWxfcXVv
dGUiPk9uIEZyaSwgSnVsIDQsIDIwMTQgYXQgNTozNSBQTSwgU2VyZ2V5IFNlbm96aGF0c2t5IDxz
cGFuIGRpcj0ibHRyIj4mbHQ7PGEgaHJlZj0ibWFpbHRvOnNlcmdleS5zZW5vemhhdHNreUBnbWFp
bC5jb20iIHRhcmdldD0iX2JsYW5rIj5zZXJnZXkuc2Vub3poYXRza3lAZ21haWwuY29tPC9hPiZn
dDs8L3NwYW4+IHdyb3RlOjxicj4KPGJsb2NrcXVvdGUgY2xhc3M9ImdtYWlsX3F1b3RlIiBzdHls
ZT0ibWFyZ2luOjAgMCAwIC44ZXg7Ym9yZGVyLWxlZnQ6MXB4ICNjY2Mgc29saWQ7cGFkZGluZy1s
ZWZ0OjFleCI+T24gKDA3LzA0LzE0IDEwOjE5KSwgcmFodWwgc2hyaXZhc3RhdmEgd3JvdGU6PGJy
PgomZ3Q7IERhdGU6IEZyaSwgNCBKdWwgMjAxNCAxMDoxOToyNCArMDUzMDxicj4KJmd0OyBGcm9t
OiByYWh1bCBzaHJpdmFzdGF2YSAmbHQ7PGEgaHJlZj0ibWFpbHRvOnJzaHJpdmFzdGF2YTJAZ21h
aWwuY29tIj5yc2hyaXZhc3RhdmEyQGdtYWlsLmNvbTwvYT4mZ3Q7PGJyPgomZ3Q7IFRvOiA8YSBo
cmVmPSJtYWlsdG86cG93ZXJ0b3BAbGlzdHMuMDEub3JnIj5wb3dlcnRvcEBsaXN0cy4wMS5vcmc8
L2E+PGJyPgomZ3Q7IFN1YmplY3Q6IFtQb3dlcnRvcF0gbm90IGdldHRpbmcgdGhlIHBvd2VyIGNv
bnN1bXB0aW9uIG51bWJlcnM8YnI+CjxkaXYgY2xhc3M9IiI+Jmd0Ozxicj4KJmd0OyDCoCDCoEhp
LDxicj4KJmd0OyDCoCDCoFdoaWxlIGluc3RhbGxpbmcgdmVyc2lvbiAyLjYuMSwgSSBnb3QgdGhl
IGZvbGxvd2luZyBlcnJvciAtwqA8YnI+CiZndDsgwqAgwqBtYWtlWzJdOiBFbnRlcmluZyBkaXJl
Y3RvcnkgYC9ob21lL3JhaHVsL3Bvd2VydG9wL3Bvd2VydG9wLTIuNi4xL3NyYyYjMzk7PGJyPgom
Z3Q7IMKgIMKgL2Jpbi9iYXNoIC4vY3NzdG9oLnNoIHBvd2VydG9wLmNzcyBjc3MuaDxicj4KJmd0
OyDCoCDCoC9iaW4vYmFzaDogLi9jc3N0b2guc2g6IE5vIHN1Y2ggZmlsZSBvciBkaXJlY3Rvcnk8
YnI+Cjxicj4KPC9kaXY+c2hvdWxkIGJlIGZpeGVkIGJ5IG5vdywgbm90IHN1cmUgaWYgdGhlIGZp
eCBpcyBhbHJlYWR5IGluY2x1ZGVkIGludG88YnI+CnRhcmJhbGwsIHRob3VnaC48YnI+CjxkaXYg
Y2xhc3M9IiI+PGJyPgomZ3Q7IMKgIMKgU28gSSBpbnN0YWxsZWQgdmVyc2lvbiAyLjUgYW5kIGl0
IGNvbXBpbGVkIGNvcnJlY3RseS4gQnV0LCBJIGFtIG5vdDxicj4KJmd0OyDCoCDCoGdldHRpbmcg
dGhlIHBvd2VyIGNvbnN1bXB0aW9uIG51bWJlcnMuIFdoYXQgSSBhbSBnZXR0aW5nIGlzIHRoaXM8
YnI+CiZndDsgwqAgwqDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoFVzYWdlIMKgIMKgIMKgIEV2ZW50
cy9zIMKgIMKgQ2F0ZWdvcnkgwqAgwqAgwqAgRGVzY3JpcHRpb248YnI+CiZndDsgwqAgwqDCoCDC
oCDCoCDCoCDCoCDCoCDCoDY2LjcgdXMvcyDCoCDCoCDCoDI2LjUgwqAgwqAgwqAgwqBQcm9jZXNz
IMKgIMKgIMKgIMKgW3JjdV9zY2hlZF08YnI+CiZndDsgwqAgwqDCoCDCoCDCoCDCoCDCoCDCoCAx
NTIuOCB1cy9zIMKgIMKgIMKgMTguNyDCoCDCoCDCoCDCoEludGVycnVwdCDCoCDCoCDCoFszXSBu
ZXRfcngoc29mdGlycSk8YnI+CiZndDsgwqAgwqDCoCDCoCDCoCDCoCDCoCDCoCDCoDIxLjcgdXMv
cyDCoCDCoCDCoDE4LjcgwqAgwqAgwqAgwqBrV29yayDCoCDCoCDCoCDCoCDCoG9kX2Ric190aW1l
cjxicj4KJmd0OyDCoCDCoMKgIMKgIMKgIMKgIMKgIMKgIDM2Ny42IHVzL3MgwqAgwqAgwqAxMS44
IMKgIMKgIMKgIMKgUHJvY2VzcyDCoCDCoCDCoCDCoGF2YWhpLWRhZW1vbjo8YnI+CiZndDsgwqAg
wqBydW5uaW5nIFtSYW1hbnVqYW4ubG9jYWxdPGJyPgomZ3Q7IMKgIMKgwqAgwqAgwqAgwqAgwqAg
wqAgwqAzMy42IHVzL3MgwqAgwqAgwqAgOS44IMKgIMKgIMKgIMKgVGltZXIgwqAgwqAgwqAgwqAg
wqB0aWNrX3NjaGVkX3RpbWVyPGJyPgomZ3Q7IMKgIMKgwqAgwqAgwqAgwqAgwqAgwqAgwqAgNy4w
IG1zL3MgwqAgwqAgwqAgMi4wIMKgIMKgIMKgIMKgUHJvY2VzcyDCoCDCoCDCoCDCoHBvd2VydG9w
PGJyPgomZ3Q7IMKgIMKgwqAgwqAgwqAgwqAgwqAgwqAgMjk5LjggdXMvcyDCoCDCoCDCoCAyLjAg
wqAgwqAgwqAgwqBQcm9jZXNzIMKgIMKgIMKgPGJyPgomZ3Q7IMKgIMKgwqAvdXNyL3NiaW4vaXJx
YmFsYW5jZTxicj4KJmd0OyDCoCDCoMKgIMKgIMKgIMKgIMKgIMKgIMKgNTAuMyB1cy9zIMKgIMKg
IMKgIDIuMCDCoCDCoCDCoCDCoFByb2Nlc3MgwqAgwqAgwqA8YnI+CiZndDsgwqAgwqDCoC91c3Iv
bGliL2FjY291bnRzc2VydmljZS9hY2NvdW50cy1kYWVtb248YnI+CiZndDsgwqAgwqDCoCDCoCDC
oCDCoCDCoCDCoCDCoDM5LjcgdXMvcyDCoCDCoCDCoCAyLjAgwqAgwqAgwqAgwqBQcm9jZXNzIMKg
IMKgIMKgIMKgbm1iZCAtRDxicj4KJmd0OyDCoCDCoEkgYW0gbm90IGdldHRpbmcgYW55ICZxdW90
O3Bvd2VyIGVzdGltYXRpb24mcXVvdDsgZmllbGQuPGJyPgo8YnI+CjwvZGl2PnBsZWFzZSByZWFk
IDxhIGhyZWY9Imh0dHBzOi8vbGlzdHMuMDEub3JnL3BpcGVybWFpbC9wb3dlcnRvcC8yMDE0LU1h
cmNoLzAwMTI1Ni5odG1sIiB0YXJnZXQ9Il9ibGFuayI+aHR0cHM6Ly9saXN0cy4wMS5vcmcvcGlw
ZXJtYWlsL3Bvd2VydG9wLzIwMTQtTWFyY2gvMDAxMjU2Lmh0bWw8L2E+PGJyPgo8YnI+CsKgIMKg
IMKgIMKgIC1zczxicj4KPGRpdiBjbGFzcz0iIj48YnI+CiZndDsgwqAgwqBJIGFtIHVzaW5nIHVi
dW50dSAxMi4wNCB3aXRoIGxpbnV4IGtlcm5lbCB2ZXJzaW9uIDMuMTEuMC0yNC1nZW5lcmljPGJy
PgomZ3Q7IMKgIMKgQ291bGQgeW91IHBsZWFzZSBsZXQgbWUga25vdyB3aGF0IGNvdWxkIGJlIHdy
b25nLjxicj4KJmd0OyDCoCDCoFJlZ2FyZHM8YnI+CiZndDsgwqAgwqBSYWh1bDxicj4KPGJyPgo8
L2Rpdj4mZ3Q7IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
PGJyPgomZ3Q7IFBvd2VyVG9wIG1haWxpbmcgbGlzdDxicj4KJmd0OyA8YSBocmVmPSJtYWlsdG86
UG93ZXJUb3BAbGlzdHMuMDEub3JnIj5Qb3dlclRvcEBsaXN0cy4wMS5vcmc8L2E+PGJyPgomZ3Q7
IDxhIGhyZWY9Imh0dHBzOi8vbGlzdHMuMDEub3JnL21haWxtYW4vbGlzdGluZm8vcG93ZXJ0b3Ai
IHRhcmdldD0iX2JsYW5rIj5odHRwczovL2xpc3RzLjAxLm9yZy9tYWlsbWFuL2xpc3RpbmZvL3Bv
d2VydG9wPC9hPjxicj4KPGJyPgo8L2Jsb2NrcXVvdGU+PC9kaXY+PGJyPjwvZGl2Pgo=

--===============6462215667163755993==--

