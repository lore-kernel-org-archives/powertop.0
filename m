Content-Type: multipart/mixed; boundary="===============0247382270195395789=="
MIME-Version: 1.0
From: royy walls <royywalls at gmail.com>
Subject: [Powertop] Fwd: powertop is not showing power usage but everything
Date: Wed, 06 Feb 2013 14:59:16 -0800
Message-ID: <CAD6NFY0rgTfAA=2NpMheqYhWCG_Cjt4Q1a5G1Lg9++iV8hiqZQ@mail.gmail.com>
In-Reply-To: CAD6NFY3aOHyuhToV=2v8qXfWmuhCPGNLeNy1nb35CxOxzbyXvQ@mail.gmail.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============0247382270195395789==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

> Hi
>
> I am trying to run powertop on my machine, I think it's really cool tool.
>
> But after installation I was not able see any power related information on
> my macchine.
>
> Following is the configuration :-
>
> [root(a)fos1 linux-3.5]# uname -a
> Linux fos1 3.5.0 #1 SMP Wed Jan 30 17:27:06 PST 2013 x86_64 x86_64 x86_64
> GNU/Linux
> [root(a)fos1 linux-3.5]# cat /etc/redhat-release
> Red Hat Enterprise Linux Server release 6.1 (Santiago)
> [root(a)fos1 linux-3.5]#
>
>
> Here is the output produced by the powertop:-
>
> [root(a)fos1 powertop-2.2]# cat  op
> PowerTOP 2.1      Overview   Idle stats   Frequency stats   Device stats
> Tunables
>
> Summary: 67.4 wakeups/second,  0.0 GPU ops/seconds, 0.0 VFS ops/sec and
> 8.4% CPU use
>
>                 Usage       Events/s    Category       Description
>               1.2 ms/s      37.8        Interrupt      [7] sched(softirq)
>              81.0 ms/s      0.00        Process        ./src/powertop
>              97.4 =C2=B5s/s       12.6        Timer          tick_sched_t=
imer
>              93.9 =C2=B5s/s        3.6        kWork          cache_reap
>              45.7 =C2=B5s/s        3.6        Interrupt    [3] net_rx(sof=
tirq)
>              47.5 =C2=B5s/s        1.8        Process        /usr/sbin/yp=
bind
>              15.7 =C2=B5s/s        1.8        Timer          hrtimer_wake=
up
>              87.2 =C2=B5s/s        0.9        Process        [ksoftirqd/9]
>              63.5 =C2=B5s/s        0.9        Process        sshd: ckulka=
rni(a)pts
> /0
>              13.4 =C2=B5s/s        0.9        Process        [sync_supers]
>               5.3 =C2=B5s/s        0.9        kWork          flush_to_ldi=
sc
>               3.1 =C2=B5s/s        0.9        kWork
> edac_pci_workq_function
>               2.6 =C2=B5s/s        0.9        kWork
> _base_fault_reset_work
>               2.1 =C2=B5s/s        0.9        kWork          neigh_period=
ic_work
>             405.9 =C2=B5s/s       0.00        Interrupt    [9] RCU(softir=
q)
>             278.3 =C2=B5s/s       0.00        Interrupt    [1] timer(soft=
irq)
>              79.1 =C2=B5s/s       0.00        Process        [kworker/9:1]
>              55.1 =C2=B5s/s       0.00        kWork          do_dbs_timer
>              51.8 =C2=B5s/s       0.00        Timer          rh_timer_func
>              32.2 =C2=B5s/s       0.00        Process        [kworker/0:1]
>              27.0 =C2=B5s/s       0.00        Process        [kworker/u:0]
>              18.6 =C2=B5s/s       0.00        Process        [kworker/7:1]
>              13.6 =C2=B5s/s       0.00        kWork          vmstat_update
>              10.1 =C2=B5s/s       0.00        kWork
> edac_mc_workq_function
>               9.9 =C2=B5s/s       0.00        Process        [kworker/2:1]
>               9.8 =C2=B5s/s       0.00        Process        [kworker/1:1]
>               8.2 =C2=B5s/s       0.00        Process        [kworker/14:=
1]
>               6.6 =C2=B5s/s       0.00        Process        [kworker/u:2]
>               3.3 =C2=B5s/s       0.00        Timer
> sync_supers_timer_fn
>               3.2 =C2=B5s/s       0.00        Timer
> clocksource_watchdog
>               2.7 =C2=B5s/s       0.00        Timer
> br_hello_timer_expired
>               2.6 =C2=B5s/s       0.00        Interrupt    [101] eth0-TxR=
x-0
>               2.0 =C2=B5s/s       0.00        Interrupt    [106] eth0-TxR=
x-5
>               1.6 =C2=B5s/s       0.00        Interrupt    [104] eth0-TxR=
x-3
>               1.6 =C2=B5s/s       0.00        Interrupt    [108] eth0-TxR=
x-7
>               0.7 =C2=B5s/s       0.00        Timer          tcp_write_ti=
mer
>
> [root(a)fos1 powertop-2.2]#
>
>
> I observed that first column is absent.
>
> As per the readme file I tried to look for kernel configuration but found
> following variables set in my .config file
>
> CONFIG_NO_HZ=3Dy
> CONFIG_HIGH_RES_TIMERS=3Dy
> CONFIG_HPET_TIMER=3Dy
> CONFIG_CPU_FREQ_GOV_ONDEMAND=3Dm
> CONFIG_USB_SUSPEND=3Dy
> CONFIG_SND_AC97_POWER_SAVE=3Dy
> CONFIG_SND_AC97_POWER_SAVE_DEFAULT=3D5
> CONFIG_TIMER_STATS=3Dy
> CONFIG_PERF_EVENTS=3Dy
> CONFIG_PERF_COUNTERS<<<<<<<<<<<<<<<<<not available in my kernel
> CONFIG_TRACEPOINTS<<<<<<<<<<<<<<< not available in my kernel
> CONFIG_TRACEPOINTS=3Dy
> CONFIG_TRACING=3Dy
> CONFIG_TRACING_SUPPORT=3Dy
> CONFIG_EVENT_POWER_TRACING_DEPRECATED=3Dy
> CONFIG_ACPI_PROCFS_POWER=3Dy
>
> Can someone help to get powertop running?
>
>
> Regards,
> Royy
>
>
>

--===============0247382270195395789==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PGRpdiBkaXI9Imx0ciI+PGJyPjxkaXYgY2xhc3M9ImdtYWlsX3F1b3RlIj48ZGl2IGNsYXNzPSJI
T0VuWmIiPjxkaXYgY2xhc3M9Img1Ij48ZGl2IGNsYXNzPSJnbWFpbF9leHRyYSI+PGRpdiBjbGFz
cz0iZ21haWxfcXVvdGUiPjxibG9ja3F1b3RlIGNsYXNzPSJnbWFpbF9xdW90ZSIgc3R5bGU9Im1h
cmdpbjowIDAgMCAuOGV4O2JvcmRlci1sZWZ0OjFweCAjY2NjIHNvbGlkO3BhZGRpbmctbGVmdDox
ZXgiPg0KPGRpdiBkaXI9Imx0ciI+PGRpdiBjbGFzcz0iZ21haWxfcXVvdGUiPjxkaXYgZGlyPSJs
dHIiPjxkaXY+PGRpdj48ZGl2PkhpPGJyPjxicj48L2Rpdj5JIGFtIHRyeWluZyB0byBydW4gcG93
ZXJ0b3Agb24gbXkgbWFjaGluZSwgSSB0aGluayBpdCYjMzk7cyByZWFsbHkgY29vbCB0b29sLjxi
cj4NCg0KPGJyPjwvZGl2PkJ1dCBhZnRlciBpbnN0YWxsYXRpb24gSSB3YXMgbm90IGFibGUgc2Vl
IGFueSBwb3dlciByZWxhdGVkIGluZm9ybWF0aW9uIG9uIG15IG1hY2NoaW5lLjxicj4NCjxicj48
L2Rpdj5Gb2xsb3dpbmcgaXMgdGhlIGNvbmZpZ3VyYXRpb24gOi08YnI+PGRpdj48ZGl2PjxkaXY+
PGRpdj48YnI+W3Jvb3RAZm9zMSBsaW51eC0zLjVdIyB1bmFtZSAtYTxicj5MaW51eCBmb3MxIDMu
NS4wICMxIFNNUCBXZWQgSmFuIDMwIDE3OjI3OjA2IFBTVCAyMDEzIHg4Nl82NCB4ODZfNjQgeDg2
XzY0IEdOVS9MaW51eDxicj5bcm9vdEBmb3MxIGxpbnV4LTMuNV0jIGNhdCAvZXRjL3JlZGhhdC1y
ZWxlYXNlIDxicj4NCg0KDQoNClJlZCBIYXQgRW50ZXJwcmlzZSBMaW51eCBTZXJ2ZXIgcmVsZWFz
ZSA2LjEgKFNhbnRpYWdvKTxicj5bcm9vdEBmb3MxIGxpbnV4LTMuNV0jIDxicj48YnI+PGJyPkhl
cmUgaXMgdGhlIG91dHB1dCBwcm9kdWNlZCBieSB0aGUgcG93ZXJ0b3A6LTxicj48YnI+W3Jvb3RA
Zm9zMSBwb3dlcnRvcC0yLjJdIyBjYXSgIG9wPGJyPlBvd2VyVE9QIDIuMaCgoKCgIE92ZXJ2aWV3
oKAgSWRsZSBzdGF0c6CgIEZyZXF1ZW5jeSBzdGF0c6CgIERldmljZSBzdGF0c6CgIFR1bmFibGVz
oKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgIDxicj4NCg0KDQoNCjxicj5TdW1t
YXJ5OiA2Ny40IHdha2V1cHMvc2Vjb25kLKAgMC4wIEdQVSBvcHMvc2Vjb25kcywgMC4wIFZGUyBv
cHMvc2VjIGFuZCA4LjQlIENQVSB1c2U8YnI+PGJyPqCgoKCgoKCgoKCgoKCgoCBVc2FnZaCgoKCg
oCBFdmVudHMvc6CgoCBDYXRlZ29yeaCgoKCgoCBEZXNjcmlwdGlvbjxicj6goKCgoKCgoKCgoKCg
IDEuMiBtcy9zoKCgoKAgMzcuOKCgoKCgoKAgSW50ZXJydXB0oKCgoKAgWzddIHNjaGVkKHNvZnRp
cnEpPGJyPg0KDQoNCg0KoKCgoKCgoKCgoKCgIDgxLjAgbXMvc6CgoKCgIDAuMDCgoKCgoKCgIFBy
b2Nlc3OgoKCgoKCgIC4vc3JjL3Bvd2VydG9wPGJyPqCgoKCgoKCgoKCgoCA5Ny40ILVzL3OgoKCg
oKAgMTIuNqCgoKCgoKAgVGltZXKgoKCgoKCgoKAgdGlja19zY2hlZF90aW1lcjxicj6goKCgoKCg
oKCgoKAgOTMuOSC1cy9zoKCgoKCgoCAzLjagoKCgoKCgIGtXb3JroKCgoKCgoKCgIGNhY2hlX3Jl
YXA8YnI+oKCgoKCgoKCgoKCgIDQ1LjcgtXMvc6CgoKCgoKAgMy42oKCgoKCgoCBJbnRlcnJ1cHSg
oKAgWzNdIG5ldF9yeChzb2Z0aXJxKTxicj4NCg0KDQoNCqCgoKCgoKCgoKCgoCA0Ny41ILVzL3Og
oKCgoKCgIDEuOKCgoKCgoKAgUHJvY2Vzc6CgoKCgoKAgL3Vzci9zYmluL3lwYmluZDxicj6goKCg
oKCgoKCgoKAgMTUuNyC1cy9zoKCgoKCgoCAxLjigoKCgoKCgIFRpbWVyoKCgoKCgoKCgIGhydGlt
ZXJfd2FrZXVwPGJyPqCgoKCgoKCgoKCgoCA4Ny4yILVzL3OgoKCgoKCgIDAuOaCgoKCgoKAgUHJv
Y2Vzc6CgoKCgoKAgW2tzb2Z0aXJxZC85XTxicj4NCg0KDQoNCqCgoKCgoKCgoKCgoCA2My41ILVz
L3OgoKCgoKCgIDAuOaCgoKCgoKAgUHJvY2Vzc6CgoKCgoKAgc3NoZDogY2t1bGthcm5pQHB0cy8w
PGJyPqCgoKCgoKCgoKCgoCAxMy40ILVzL3OgoKCgoKCgIDAuOaCgoKCgoKAgUHJvY2Vzc6CgoKCg
oKAgW3N5bmNfc3VwZXJzXTxicj6goKCgoKCgoKCgoKCgIDUuMyC1cy9zoKCgoKCgoCAwLjmgoKCg
oKCgIGtXb3JroKCgoKCgoKCgIGZsdXNoX3RvX2xkaXNjPGJyPg0KDQoNCg0KoKCgoKCgoKCgoKCg
oCAzLjEgtXMvc6CgoKCgoKAgMC45oKCgoKCgoCBrV29ya6CgoKCgoKCgoCBlZGFjX3BjaV93b3Jr
cV9mdW5jdGlvbjxicj6goKCgoKCgoKCgoKCgIDIuNiC1cy9zoKCgoKCgoCAwLjmgoKCgoKCgIGtX
b3JroKCgoKCgoKCgIF9iYXNlX2ZhdWx0X3Jlc2V0X3dvcms8YnI+oKCgoKCgoKCgoKCgoCAyLjEg
tXMvc6CgoKCgoKAgMC45oKCgoKCgoCBrV29ya6CgoKCgoKCgoCBuZWlnaF9wZXJpb2RpY193b3Jr
PGJyPg0KDQoNCg0KoKCgoKCgoKCgoKAgNDA1LjkgtXMvc6CgoKCgoCAwLjAwoKCgoKCgoCBJbnRl
cnJ1cHSgoKAgWzldIFJDVShzb2Z0aXJxKTxicj6goKCgoKCgoKCgoCAyNzguMyC1cy9zoKCgoKCg
IDAuMDCgoKCgoKCgIEludGVycnVwdKCgoCBbMV0gdGltZXIoc29mdGlycSk8YnI+oKCgoKCgoKCg
oKCgIDc5LjEgtXMvc6CgoKCgoCAwLjAwoKCgoKCgoCBQcm9jZXNzoKCgoKCgoCBba3dvcmtlci85
OjFdPGJyPg0KDQoNCg0KoKCgoKCgoKCgoKCgIDU1LjEgtXMvc6CgoKCgoCAwLjAwoKCgoKCgoCBr
V29ya6CgoKCgoKCgoCBkb19kYnNfdGltZXI8YnI+oKCgoKCgoKCgoKCgIDUxLjggtXMvc6CgoKCg
oCAwLjAwoKCgoKCgoCBUaW1lcqCgoKCgoKCgoCByaF90aW1lcl9mdW5jPGJyPqCgoKCgoKCgoKCg
oCAzMi4yILVzL3OgoKCgoKAgMC4wMKCgoKCgoKAgUHJvY2Vzc6CgoKCgoKAgW2t3b3JrZXIvMDox
XTxicj6goKCgoKCgoKCgoKAgMjcuMCC1cy9zoKCgoKCgIDAuMDCgoKCgoKCgIFByb2Nlc3OgoKCg
oKCgIFtrd29ya2VyL3U6MF08YnI+DQoNCg0KDQqgoKCgoKCgoKCgoKAgMTguNiC1cy9zoKCgoKCg
IDAuMDCgoKCgoKCgIFByb2Nlc3OgoKCgoKCgIFtrd29ya2VyLzc6MV08YnI+oKCgoKCgoKCgoKCg
IDEzLjYgtXMvc6CgoKCgoCAwLjAwoKCgoKCgoCBrV29ya6CgoKCgoKCgoCB2bXN0YXRfdXBkYXRl
PGJyPqCgoKCgoKCgoKCgoCAxMC4xILVzL3OgoKCgoKAgMC4wMKCgoKCgoKAga1dvcmugoKCgoKCg
oKAgZWRhY19tY193b3JrcV9mdW5jdGlvbjxicj4NCg0KDQoNCqCgoKCgoKCgoKCgoKAgOS45ILVz
L3OgoKCgoKAgMC4wMKCgoKCgoKAgUHJvY2Vzc6CgoKCgoKAgW2t3b3JrZXIvMjoxXTxicj6goKCg
oKCgoKCgoKCgIDkuOCC1cy9zoKCgoKCgIDAuMDCgoKCgoKCgIFByb2Nlc3OgoKCgoKCgIFtrd29y
a2VyLzE6MV08YnI+oKCgoKCgoKCgoKCgoCA4LjIgtXMvc6CgoKCgoCAwLjAwoKCgoKCgoCBQcm9j
ZXNzoKCgoKCgoCBba3dvcmtlci8xNDoxXTxicj4NCg0KDQqgoKCgoKCgoKCgoKCgIDYuNiC1cy9z
oKCgoKCgIDAuMDCgoKCgoKCgIFByb2Nlc3OgoKCgoKCgIFtrd29ya2VyL3U6Ml08YnI+DQqgoKCg
oKCgoKCgoKCgIDMuMyC1cy9zoKCgoKCgIDAuMDCgoKCgoKCgIFRpbWVyoKCgoKCgoKCgIHN5bmNf
c3VwZXJzX3RpbWVyX2ZuPGJyPqCgoKCgoKCgoKCgoKAgMy4yILVzL3OgoKCgoKAgMC4wMKCgoKCg
oKAgVGltZXKgoKCgoKCgoKAgY2xvY2tzb3VyY2Vfd2F0Y2hkb2c8YnI+oKCgoKCgoKCgoKCgoCAy
LjcgtXMvc6CgoKCgoCAwLjAwoKCgoKCgoCBUaW1lcqCgoKCgoKCgoCBicl9oZWxsb190aW1lcl9l
eHBpcmVkPGJyPg0KDQoNCg0KoKCgoKCgoKCgoKCgoCAyLjYgtXMvc6CgoKCgoCAwLjAwoKCgoKCg
oCBJbnRlcnJ1cHSgoKAgWzEwMV0gZXRoMC1UeFJ4LTA8YnI+oKCgoKCgoKCgoKCgoCAyLjAgtXMv
c6CgoKCgoCAwLjAwoKCgoKCgoCBJbnRlcnJ1cHSgoKAgWzEwNl0gZXRoMC1UeFJ4LTU8YnI+oKCg
oKCgoKCgoKCgoCAxLjYgtXMvc6CgoKCgoCAwLjAwoKCgoKCgoCBJbnRlcnJ1cHSgoKAgWzEwNF0g
ZXRoMC1UeFJ4LTM8YnI+DQoNCg0KDQqgoKCgoKCgoKCgoKCgIDEuNiC1cy9zoKCgoKCgIDAuMDCg
oKCgoKCgIEludGVycnVwdKCgoCBbMTA4XSBldGgwLVR4UngtNzxicj6goKCgoKCgoKCgoKCgIDAu
NyC1cy9zoKCgoKCgIDAuMDCgoKCgoKCgIFRpbWVyoKCgoKCgoKCgIHRjcF93cml0ZV90aW1lcjxi
cj48YnI+W3Jvb3RAZm9zMSBwb3dlcnRvcC0yLjJdIyA8YnI+PGJyPjxicj48L2Rpdj48ZGl2Pkkg
b2JzZXJ2ZWQgdGhhdCBmaXJzdCBjb2x1bW4gaXMgYWJzZW50LiA8YnI+DQoNCg0KDQo8L2Rpdj48
ZGl2Pjxicj48L2Rpdj48ZGl2PkFzIHBlciB0aGUgcmVhZG1lIGZpbGUgSSB0cmllZCB0byBsb29r
IGZvciBrZXJuZWwgY29uZmlndXJhdGlvbiBidXQgZm91bmQgZm9sbG93aW5nIHZhcmlhYmxlcyBz
ZXQgaW4gbXkgLmNvbmZpZyBmaWxlPGJyPjxicj5DT05GSUdfTk9fSFo9eTxicj5DT05GSUdfSElH
SF9SRVNfVElNRVJTPXk8YnI+Q09ORklHX0hQRVRfVElNRVI9eTxicj5DT05GSUdfQ1BVX0ZSRVFf
R09WX09OREVNQU5EPW08YnI+DQoNCg0KDQpDT05GSUdfVVNCX1NVU1BFTkQ9eTxicj5DT05GSUdf
U05EX0FDOTdfUE9XRVJfU0FWRT15PGJyPkNPTkZJR19TTkRfQUM5N19QT1dFUl9TQVZFX0RFRkFV
TFQ9NTxicj5DT05GSUdfVElNRVJfU1RBVFM9eTxicj5DT05GSUdfUEVSRl9FVkVOVFM9eTxicj5D
T05GSUdfUEVSRl9DT1VOVEVSUyZsdDsmbHQ7Jmx0OyZsdDsmbHQ7Jmx0OyZsdDsmbHQ7Jmx0OyZs
dDsmbHQ7Jmx0OyZsdDsmbHQ7Jmx0OyZsdDsmbHQ7bm90IGF2YWlsYWJsZSBpbiBteSBrZXJuZWw8
YnI+DQoNCg0KDQpDT05GSUdfVFJBQ0VQT0lOVFMmbHQ7Jmx0OyZsdDsmbHQ7Jmx0OyZsdDsmbHQ7
Jmx0OyZsdDsmbHQ7Jmx0OyZsdDsmbHQ7Jmx0OyZsdDsgbm90IGF2YWlsYWJsZSBpbiBteSBrZXJu
ZWw8YnI+Q09ORklHX1RSQUNFUE9JTlRTPXk8YnI+Q09ORklHX1RSQUNJTkc9eTxicj5DT05GSUdf
VFJBQ0lOR19TVVBQT1JUPXk8YnI+Q09ORklHX0VWRU5UX1BPV0VSX1RSQUNJTkdfREVQUkVDQVRF
RD15PGJyPg0KDQoNCg0KQ09ORklHX0FDUElfUFJPQ0ZTX1BPV0VSPXk8YnI+PGJyPjwvZGl2Pjxk
aXY+Q2FuIHNvbWVvbmUgaGVscCB0byBnZXQgcG93ZXJ0b3AgcnVubmluZz8gPGJyPjxicj48YnI+
PC9kaXY+PGRpdj5SZWdhcmRzLDxicj48L2Rpdj48ZGl2PlJveXk8YnI+PC9kaXY+PC9kaXY+PC9k
aXY+PC9kaXY+PC9kaXY+DQo8YnI+PC9kaXY+PGJyPjwvZGl2Pg0KPC9ibG9ja3F1b3RlPjwvZGl2
Pjxicj48L2Rpdj4NCjwvZGl2PjwvZGl2PjwvZGl2Pjxicj48L2Rpdj4NCg==

--===============0247382270195395789==--

