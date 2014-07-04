Content-Type: multipart/mixed; boundary="===============2508769219323824866=="
MIME-Version: 1.0
From: rahul shrivastava <rshrivastava2 at gmail.com>
Subject: [Powertop] not getting the power consumption numbers
Date: Fri, 04 Jul 2014 10:19:24 +0530
Message-ID: <CAETyQ1Mn25GBQnRq+X7J3V++gQqYZeqrtLMCO74cQpSONYXPfA@mail.gmail.com>
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============2508769219323824866==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi,

While installing version 2.6.1, I got the following error -
make[2]: Entering directory `/home/rahul/powertop/powertop-2.6.1/src'
/bin/bash ./csstoh.sh powertop.css css.h
/bin/bash: ./csstoh.sh: No such file or directory


So I installed version 2.5 and it compiled correctly. But, I am not getting
the power consumption numbers. What I am getting is this

              * Usage       Events/s    Category       Description*
             66.7 us/s      26.5        Process        [rcu_sched]
            152.8 us/s      18.7        Interrupt      [3] net_rx(softirq)
             21.7 us/s      18.7        kWork          od_dbs_timer
            367.6 us/s      11.8        Process        avahi-daemon:
running [Ramanujan.local]
             33.6 us/s       9.8        Timer          tick_sched_timer
              7.0 ms/s       2.0        Process        powertop
            299.8 us/s       2.0        Process        /usr/sbin/irqbalance
             50.3 us/s       2.0        Process
 /usr/lib/accountsservice/accounts-daemon
             39.7 us/s       2.0        Process        nmbd -D


I am not getting any "power estimation" field.
I am using ubuntu 12.04 with linux kernel version 3.11.0-24-generic
Could you please let me know what could be wrong.


Regards
Rahul

--===============2508769219323824866==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PGRpdiBkaXI9Imx0ciI+SGksPGRpdj48YnI+PC9kaXY+PGRpdj5XaGlsZSBpbnN0YWxsaW5nIHZl
cnNpb24gMi42LjEsIEkgZ290IHRoZSBmb2xsb3dpbmcgZXJyb3IgLcKgPC9kaXY+PGRpdj48ZGl2
Pm1ha2VbMl06IEVudGVyaW5nIGRpcmVjdG9yeSBgL2hvbWUvcmFodWwvcG93ZXJ0b3AvcG93ZXJ0
b3AtMi42LjEvc3JjJiMzOTs8L2Rpdj48ZGl2Pi9iaW4vYmFzaCAuL2Nzc3RvaC5zaCBwb3dlcnRv
cC5jc3MgY3NzLmg8L2Rpdj4NCjxkaXY+L2Jpbi9iYXNoOiAuL2Nzc3RvaC5zaDogTm8gc3VjaCBm
aWxlIG9yIGRpcmVjdG9yeTwvZGl2PjwvZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+PGJyPjwvZGl2
PjxkaXY+U28gSSBpbnN0YWxsZWQgdmVyc2lvbiAyLjUgYW5kIGl0IGNvbXBpbGVkIGNvcnJlY3Rs
eS4gQnV0LCBJIGFtIG5vdCBnZXR0aW5nIHRoZSBwb3dlciBjb25zdW1wdGlvbiBudW1iZXJzLiBX
aGF0IEkgYW0gZ2V0dGluZyBpcyB0aGlzPC9kaXY+DQo8ZGl2Pjxicj48L2Rpdj48ZGl2PjxkaXY+
wqAgwqAgwqAgwqAgwqAgwqAgwqAgPGI+wqBVc2FnZSDCoCDCoCDCoCBFdmVudHMvcyDCoCDCoENh
dGVnb3J5IMKgIMKgIMKgIERlc2NyaXB0aW9uPC9iPjwvZGl2PjxkaXY+wqAgwqAgwqAgwqAgwqAg
wqAgwqA2Ni43IHVzL3MgwqAgwqAgwqAyNi41IMKgIMKgIMKgIMKgUHJvY2VzcyDCoCDCoCDCoCDC
oFtyY3Vfc2NoZWRdPC9kaXY+PGRpdj7CoCDCoCDCoCDCoCDCoCDCoCAxNTIuOCB1cy9zIMKgIMKg
IMKgMTguNyDCoCDCoCDCoCDCoEludGVycnVwdCDCoCDCoCDCoFszXSBuZXRfcngoc29mdGlycSk8
L2Rpdj4NCjxkaXY+wqAgwqAgwqAgwqAgwqAgwqAgwqAyMS43IHVzL3MgwqAgwqAgwqAxOC43IMKg
IMKgIMKgIMKga1dvcmsgwqAgwqAgwqAgwqAgwqBvZF9kYnNfdGltZXI8L2Rpdj48ZGl2PsKgIMKg
IMKgIMKgIMKgIMKgIDM2Ny42IHVzL3MgwqAgwqAgwqAxMS44IMKgIMKgIMKgIMKgUHJvY2VzcyDC
oCDCoCDCoCDCoGF2YWhpLWRhZW1vbjogcnVubmluZyBbUmFtYW51amFuLmxvY2FsXTwvZGl2Pjxk
aXY+wqAgwqAgwqAgwqAgwqAgwqAgwqAzMy42IHVzL3MgwqAgwqAgwqAgOS44IMKgIMKgIMKgIMKg
VGltZXIgwqAgwqAgwqAgwqAgwqB0aWNrX3NjaGVkX3RpbWVyPC9kaXY+DQo8ZGl2PsKgIMKgIMKg
IMKgIMKgIMKgIMKgIDcuMCBtcy9zIMKgIMKgIMKgIDIuMCDCoCDCoCDCoCDCoFByb2Nlc3MgwqAg
wqAgwqAgwqBwb3dlcnRvcDwvZGl2PjxkaXY+wqAgwqAgwqAgwqAgwqAgwqAgMjk5LjggdXMvcyDC
oCDCoCDCoCAyLjAgwqAgwqAgwqAgwqBQcm9jZXNzIMKgIMKgIMKgIMKgL3Vzci9zYmluL2lycWJh
bGFuY2U8L2Rpdj48ZGl2PsKgIMKgIMKgIMKgIMKgIMKgIMKgNTAuMyB1cy9zIMKgIMKgIMKgIDIu
MCDCoCDCoCDCoCDCoFByb2Nlc3MgwqAgwqAgwqAgwqAvdXNyL2xpYi9hY2NvdW50c3NlcnZpY2Uv
YWNjb3VudHMtZGFlbW9uPC9kaXY+DQo8ZGl2PsKgIMKgIMKgIMKgIMKgIMKgIMKgMzkuNyB1cy9z
IMKgIMKgIMKgIDIuMCDCoCDCoCDCoCDCoFByb2Nlc3MgwqAgwqAgwqAgwqBubWJkIC1EPC9kaXY+
PC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj5JIGFtIG5vdCBnZXR0aW5n
IGFueSAmcXVvdDtwb3dlciBlc3RpbWF0aW9uJnF1b3Q7IGZpZWxkLjwvZGl2PjxkaXY+SSBhbSB1
c2luZyB1YnVudHUgMTIuMDQgd2l0aCBsaW51eCBrZXJuZWwgdmVyc2lvbiAzLjExLjAtMjQtZ2Vu
ZXJpYzwvZGl2Pg0KPGRpdj5Db3VsZCB5b3UgcGxlYXNlIGxldCBtZSBrbm93IHdoYXQgY291bGQg
YmUgd3JvbmcuPC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj5SZWdhcmRz
PC9kaXY+PGRpdj5SYWh1bDwvZGl2PjwvZGl2Pg0K

--===============2508769219323824866==--

