Content-Type: multipart/mixed; boundary="===============1883791149295390428=="
MIME-Version: 1.0
From: sheepdestroyer <sheepdestroyer at gmail.com>
Subject: Re: [Powertop] error when auto-tune on last git (Sept 30th)
Date: Mon, 17 Nov 2014 18:35:41 +0900
Message-ID: <CAPU6dhAgjSa9RSAxkXQKOGBEeZPL9+iO7bP9tE1sp1bcPAapng@mail.gmail.com>
In-Reply-To: 20141022122623.GA950@swordfish
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============1883791149295390428==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi,
I just tried last git, powertop 2.7, on Fedora 21 with kernel 3.17.3 and I
got :

[sheepdestroyer(a)sheepora ~]$ sudo powertop --auto-tune
modprobe cpufreq_stats failedLoaded 435 prior measurements
RAPL device for cpu 0
RAPL Using PowerCap Sysfs : Domain Mask d
RAPL device for cpu 0
RAPL Using PowerCap Sysfs : Domain Mask d
RAPL device for cpu 0
RAPL Using PowerCap Sysfs : Domain Mask d
Devfreq not enabled
  unknown op '{'
Leaving PowerTOP
[sheepdestroyer(a)sheepora ~]$

On Wed, Oct 22, 2014 at 9:26 PM, Sergey Senozhatsky <
sergey.senozhatsky(a)gmail.com> wrote:

> On (10/19/14 12:35), sheepdestroyer wrote:
> >    Just compiled last available source from Github
> >    I get this error on fedora 20 when trying auto-tune
> >
> >    $ sudo powertop --auto-tune
> >    Loaded 750 prior measurements
> >    RAPL device for cpu 0
> >    RAPL device for cpu 0
> >    RAPL device for cpu 0
> >      unknown op '{'
> not critical (and known). comes from traceevent lib.
> need to check with the most recent libtraceevent if plug-in support
> has been integrated.
>
> >    Leaving PowerTOP
> this is "ok" message in this case.
>
>         -ss
>

--===============1883791149295390428==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PGRpdiBkaXI9Imx0ciI+PGRpdj5IaSwgPGJyPjwvZGl2PkkganVzdCB0cmllZCBsYXN0IGdpdCwg
cG93ZXJ0b3AgMi43LCBvbiBGZWRvcmEgMjEgd2l0aCBrZXJuZWwgMy4xNy4zIGFuZCBJIGdvdCA6
PGJyPjxicj5bc2hlZXBkZXN0cm95ZXJAc2hlZXBvcmEgfl0kIHN1ZG8gcG93ZXJ0b3AgLS1hdXRv
LXR1bmU8YnI+bW9kcHJvYmUgY3B1ZnJlcV9zdGF0cyBmYWlsZWRMb2FkZWQgNDM1IHByaW9yIG1l
YXN1cmVtZW50czxicj5SQVBMIGRldmljZSBmb3IgY3B1IDA8YnI+UkFQTCBVc2luZyBQb3dlckNh
cCBTeXNmcyA6IERvbWFpbiBNYXNrIGQ8YnI+UkFQTCBkZXZpY2UgZm9yIGNwdSAwPGJyPlJBUEwg
VXNpbmcgUG93ZXJDYXAgU3lzZnMgOiBEb21haW4gTWFzayBkPGJyPlJBUEwgZGV2aWNlIGZvciBj
cHUgMDxicj5SQVBMIFVzaW5nIFBvd2VyQ2FwIFN5c2ZzIDogRG9tYWluIE1hc2sgZDxicj5EZXZm
cmVxIG5vdCBlbmFibGVkPGJyPsKgIHVua25vd24gb3AgJiMzOTt7JiMzOTs8YnI+TGVhdmluZyBQ
b3dlclRPUDxicj5bc2hlZXBkZXN0cm95ZXJAc2hlZXBvcmEgfl0kIDxicj48L2Rpdj48ZGl2IGNs
YXNzPSJnbWFpbF9leHRyYSI+PGJyPjxkaXYgY2xhc3M9ImdtYWlsX3F1b3RlIj5PbiBXZWQsIE9j
dCAyMiwgMjAxNCBhdCA5OjI2IFBNLCBTZXJnZXkgU2Vub3poYXRza3kgPHNwYW4gZGlyPSJsdHIi
PiZsdDs8YSBocmVmPSJtYWlsdG86c2VyZ2V5LnNlbm96aGF0c2t5QGdtYWlsLmNvbSIgdGFyZ2V0
PSJfYmxhbmsiPnNlcmdleS5zZW5vemhhdHNreUBnbWFpbC5jb208L2E+Jmd0Ozwvc3Bhbj4gd3Jv
dGU6PGJyPjxibG9ja3F1b3RlIGNsYXNzPSJnbWFpbF9xdW90ZSIgc3R5bGU9Im1hcmdpbjowIDAg
MCAuOGV4O2JvcmRlci1sZWZ0OjFweCAjY2NjIHNvbGlkO3BhZGRpbmctbGVmdDoxZXgiPjxkaXYg
Y2xhc3M9IkhPRW5aYiI+PGRpdiBjbGFzcz0iaDUiPk9uICgxMC8xOS8xNCAxMjozNSksIHNoZWVw
ZGVzdHJveWVyIHdyb3RlOjxicj4KJmd0O8KgIMKgIEp1c3QgY29tcGlsZWQgbGFzdCBhdmFpbGFi
bGUgc291cmNlIGZyb20gR2l0aHViPGJyPgomZ3Q7wqAgwqAgSSBnZXQgdGhpcyBlcnJvciBvbiBm
ZWRvcmEgMjAgd2hlbiB0cnlpbmcgYXV0by10dW5lPGJyPgomZ3Q7PGJyPgomZ3Q7wqAgwqAgJCBz
dWRvIHBvd2VydG9wIC0tYXV0by10dW5lPGJyPgomZ3Q7wqAgwqAgTG9hZGVkIDc1MCBwcmlvciBt
ZWFzdXJlbWVudHM8YnI+CiZndDvCoCDCoCBSQVBMIGRldmljZSBmb3IgY3B1IDA8YnI+CiZndDvC
oCDCoCBSQVBMIGRldmljZSBmb3IgY3B1IDA8YnI+CiZndDvCoCDCoCBSQVBMIGRldmljZSBmb3Ig
Y3B1IDA8YnI+CiZndDvCoCDCoCDCoCB1bmtub3duIG9wICYjMzk7eyYjMzk7PGJyPgo8L2Rpdj48
L2Rpdj5ub3QgY3JpdGljYWwgKGFuZCBrbm93bikuIGNvbWVzIGZyb20gdHJhY2VldmVudCBsaWIu
PGJyPgpuZWVkIHRvIGNoZWNrIHdpdGggdGhlIG1vc3QgcmVjZW50IGxpYnRyYWNlZXZlbnQgaWYg
cGx1Zy1pbiBzdXBwb3J0PGJyPgpoYXMgYmVlbiBpbnRlZ3JhdGVkLjxicj4KPGJyPgomZ3Q7wqAg
wqAgTGVhdmluZyBQb3dlclRPUDxicj4KdGhpcyBpcyAmcXVvdDtvayZxdW90OyBtZXNzYWdlIGlu
IHRoaXMgY2FzZS48YnI+CjxzcGFuIGNsYXNzPSJIT0VuWmIiPjxmb250IGNvbG9yPSIjODg4ODg4
Ij48YnI+CsKgIMKgIMKgIMKgIC1zczxicj4KPC9mb250Pjwvc3Bhbj48L2Jsb2NrcXVvdGU+PC9k
aXY+PGJyPjwvZGl2Pgo=

--===============1883791149295390428==--

