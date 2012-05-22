Content-Type: multipart/mixed; boundary="===============2949854940680525725=="
MIME-Version: 1.0
From: Rui DaCosta <ruidc at yahoo.com>
Subject: Re: [Powertop] segfault on Sheevaplug (ARM Kirkwood)
Date: Tue, 22 May 2012 14:58:21 -0700
Message-ID: <1337723901.12206.YahooMailNeo@web160302.mail.bf1.yahoo.com>
In-Reply-To: CAE4GLstC0KOFLJ6G7Zt0sfaASvcu8JBDDsEdTQEyYvoMEu=EbA@mail.gmail.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============2949854940680525725==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

nothing exists below /sys/kernel/debug
does the kernel need to be built with debug flags? or a switch flicked on s=
omewhere?



________________________________
 From: Thomas Spura <thomas.spura(a)googlemail.com>
To: Rui DaCosta <ruidc(a)yahoo.com> =

Cc: powertop(a)lists.01.org =

Sent: Tuesday, 22 May 2012, 22:50
Subject: Re: [Powertop] segfault on Sheevaplug (ARM Kirkwood)
 =

On Sun, May 20, 2012 at 11:19 AM, Rui DaCosta <ruidc(a)yahoo.com> wrote:
>
> Sure and thanks,
> (v1.13 worked fine btw)
> Processor =C2=A0 =C2=A0 =C2=A0 : Feroceon 88FR131 rev 1 (v5l)
> BogoMIPS =C2=A0 =C2=A0 =C2=A0 =C2=A0: 1191.11
> Features =C2=A0 =C2=A0 =C2=A0 =C2=A0: swp half thumb fastmult edsp
> CPU implementer : 0x56
> CPU architecture: 5TE
> CPU variant =C2=A0 =C2=A0 : 0x2
> CPU part =C2=A0 =C2=A0 =C2=A0 =C2=A0: 0x131
> CPU revision =C2=A0 =C2=A0: 1
>
> Hardware =C2=A0 =C2=A0 =C2=A0 =C2=A0: Marvell SheevaPlug Reference Board
> Revision =C2=A0 =C2=A0 =C2=A0 =C2=A0: 0000
> Serial =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0: 0000000000000000

Here perf is trying to open this file:
/sys/kernel/debug/tracing/events/power/cpu_frequency/id
with the old version it was:
/sys/kernel/debug/tracing/events/vfs/dirty_inode/id
(which doesn't exist here anymore)

Could you please look which files of those two exist on your arm device?

Greetings,
=C2=A0 =C2=A0 Tom

--===============2949854940680525725==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PGh0bWw+PGJvZHk+PGRpdiBzdHlsZT0iY29sb3I6IzAwMDsgYmFja2dyb3VuZC1jb2xvcjojZmZm
OyBmb250LWZhbWlseTp0aW1lcyBuZXcgcm9tYW4sIG5ldyB5b3JrLCB0aW1lcywgc2VyaWY7Zm9u
dC1zaXplOjEycHQiPjxkaXY+PHNwYW4+bm90aGluZyBleGlzdHMgYmVsb3cgL3N5cy9rZXJuZWwv
ZGVidWc8YnI+ZG9lcyB0aGUga2VybmVsIG5lZWQgdG8gYmUgYnVpbHQgd2l0aCBkZWJ1ZyBmbGFn
cz8gb3IgYSBzd2l0Y2ggZmxpY2tlZCBvbiBzb21ld2hlcmU/PGJyPjwvc3Bhbj48L2Rpdj48ZGl2
Pjxicj48L2Rpdj4gIDxkaXYgc3R5bGU9ImZvbnQtc2l6ZTogMTJwdDsgZm9udC1mYW1pbHk6ICZx
dW90O3RpbWVzIG5ldyByb21hbiZxdW90OywgJnF1b3Q7bmV3IHlvcmsmcXVvdDssICZxdW90O3Rp
bWVzJnF1b3Q7LCBzZXJpZiI+IDxkaXYgc3R5bGU9ImZvbnQtc2l6ZTogMTJwdDsgZm9udC1mYW1p
bHk6ICZxdW90O3RpbWVzIG5ldyByb21hbiZxdW90OywgJnF1b3Q7bmV3IHlvcmsmcXVvdDssICZx
dW90O3RpbWVzJnF1b3Q7LCBzZXJpZiI+IDxkaXYgZGlyPSJsdHIiPiA8Zm9udCBzaXplPSIyIiBm
YWNlPSJBcmlhbCI+IDxociBzaXplPSIxIj4gIDxiPjxzcGFuIHN0eWxlPSJmb250LXdlaWdodDpi
b2xkOyI+RnJvbTo8L3NwYW4+PC9iPiBUaG9tYXMgU3B1cmEgJmx0O3Rob21hcy5zcHVyYUBnb29n
bGVtYWlsLmNvbSZndDs8YnI+IDxiPjxzcGFuIHN0eWxlPSJmb250LXdlaWdodDogYm9sZDsiPlRv
Ojwvc3Bhbj48L2I+IFJ1aSBEYUNvc3RhICZsdDtydWlkY0B5YWhvby5jb20mZ3Q7IDxicj48Yj48
c3BhbiBzdHlsZT0iZm9udC13ZWlnaHQ6IGJvbGQ7Ij5DYzo8L3NwYW4+PC9iPiBwb3dlcnRvcEBs
aXN0cy4wMS5vcmcgPGJyPiA8Yj48c3BhbiBzdHlsZT0iZm9udC13ZWlnaHQ6IGJvbGQ7Ij5TZW50
Ojwvc3Bhbj48L2I+IFR1ZXNkYXksIDIyIE1heSAyMDEyLCAyMjo1MDxicj4gPGI+PHNwYW4KIHN0
eWxlPSJmb250LXdlaWdodDogYm9sZDsiPlN1YmplY3Q6PC9zcGFuPjwvYj4gUmU6IFtQb3dlcnRv
cF0gc2VnZmF1bHQgb24gU2hlZXZhcGx1ZyAoQVJNIEtpcmt3b29kKTxicj4gPC9mb250PiA8L2Rp
dj4gPGJyPk9uIFN1biwgTWF5IDIwLCAyMDEyIGF0IDExOjE5IEFNLCBSdWkgRGFDb3N0YSAmbHQ7
PGEgeW1haWx0bz0ibWFpbHRvOnJ1aWRjQHlhaG9vLmNvbSIgaHJlZj0ibWFpbHRvOnJ1aWRjQHlh
aG9vLmNvbSI+cnVpZGNAeWFob28uY29tPC9hPiZndDsgd3JvdGU6PGJyPiZndDs8YnI+Jmd0OyBT
dXJlIGFuZCB0aGFua3MsPGJyPiZndDsgKHYxLjEzIHdvcmtlZCBmaW5lIGJ0dyk8YnI+Jmd0OyBQ
cm9jZXNzb3IgJm5ic3A7ICZuYnNwOyAmbmJzcDsgOiBGZXJvY2VvbiA4OEZSMTMxIHJldiAxICh2
NWwpPGJyPiZndDsgQm9nb01JUFMgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7OiAxMTkxLjEx
PGJyPiZndDsgRmVhdHVyZXMgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7OiBzd3AgaGFsZiB0
aHVtYiBmYXN0bXVsdCBlZHNwPGJyPiZndDsgQ1BVIGltcGxlbWVudGVyIDogMHg1Njxicj4mZ3Q7
IENQVSBhcmNoaXRlY3R1cmU6IDVURTxicj4mZ3Q7IENQVSB2YXJpYW50ICZuYnNwOyAmbmJzcDsg
OiAweDI8YnI+Jmd0OyBDUFUgcGFydCAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDs6IDB4MTMx
PGJyPiZndDsgQ1BVIHJldmlzaW9uICZuYnNwOyAmbmJzcDs6IDE8YnI+Jmd0Ozxicj4mZ3Q7IEhh
cmR3YXJlICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOzogTWFydmVsbCBTaGVldmFQbHVnIFJl
ZmVyZW5jZSBCb2FyZDxicj4mZ3Q7IFJldmlzaW9uICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNw
OzogMDAwMDxicj4mZ3Q7IFNlcmlhbCAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7
OiAwMDAwMDAwMDAwMDAwMDAwPGJyPjxicj5IZXJlIHBlcmYgaXMgdHJ5aW5nIHRvIG9wZW4KIHRo
aXMgZmlsZTo8YnI+L3N5cy9rZXJuZWwvZGVidWcvdHJhY2luZy9ldmVudHMvcG93ZXIvY3B1X2Zy
ZXF1ZW5jeS9pZDxicj53aXRoIHRoZSBvbGQgdmVyc2lvbiBpdCB3YXM6PGJyPi9zeXMva2VybmVs
L2RlYnVnL3RyYWNpbmcvZXZlbnRzL3Zmcy9kaXJ0eV9pbm9kZS9pZDxicj4od2hpY2ggZG9lc24n
dCBleGlzdCBoZXJlIGFueW1vcmUpPGJyPjxicj5Db3VsZCB5b3UgcGxlYXNlIGxvb2sgd2hpY2gg
ZmlsZXMgb2YgdGhvc2UgdHdvIGV4aXN0IG9uIHlvdXIgYXJtIGRldmljZT88YnI+PGJyPkdyZWV0
aW5ncyw8YnI+Jm5ic3A7ICZuYnNwOyBUb208YnI+PGJyPjxicj4gPC9kaXY+IDwvZGl2PiAgPC9k
aXY+PC9ib2R5PjwvaHRtbD4=
--===============2949854940680525725==--

