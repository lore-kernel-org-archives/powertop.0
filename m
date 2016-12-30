Content-Type: multipart/mixed; boundary="===============5690894469512203046=="
MIME-Version: 1.0
From: Chris Murphy <lists at colorremedies.com>
Subject: [Powertop] README kernel config options
Date: Thu, 29 Dec 2016 17:17:19 -0700
Message-ID: <CAJCQCtT3h=12Ash22Ah3A=cmi22tir8mFDKgqWeei_hEd_s=bg@mail.gmail.com>
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============5690894469512203046==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Are the README's kernel config option requirements current?
https://github.com/fenrus75/powertop

Of those listed, these four are missing from default Fedora kernels (I
checked config-4.9.0-1.fc26.x86_64)

CONFIG_USB_SUSPEND
CONFIG_PERF_COUNTERS
CONFIG_EVENT_POWER_TRACING_DEPRECATED
CONFIG_ACPI_PROCFS_POWER

I have no idea if those missing relate to the following issues:

[root(a)f25h ~]# ls -l /var/cache/powertop/
total 0
-rw-r--r--. 1 root root 0 Dec 29 14:49 saved_parameters.powertop
-rw-r--r--. 1 root root 0 Dec 29 14:49 saved_results.powertop

These files are also zero byte files. They remain zero bytes even after
'powertop -c' although their time stamp changes.

[root(a)f25h ~]# powertop -c
modprobe cpufreq_stats failedLoaded 0 prior measurements
RAPL device for cpu 0
RAPL Using PowerCap Sysfs : Domain Mask f
RAPL device for cpu 0
RAPL Using PowerCap Sysfs : Domain Mask f
RAPL device for cpu 0
RAPL Using PowerCap Sysfs : Domain Mask f
Devfreq not enabled
Starting PowerTOP power estimate calibration
Calibrating idle
System is not available
  unknown op '{'
System is not available
Calibrating: disk usage
Calibrating backlight
.... device /sys/class/backlight/intel_backlight/brightness
Calibrating idle
System is not available
System is not available
Calibrating: CPU usage on 1 threads
Calibrating: CPU usage on 4 threads
Calibrating: CPU wakeup power consumption
Calibrating: CPU wakeup power consumption
Calibrating: CPU wakeup power consumption
Calibrating USB devices
.... device /sys/bus/usb/devices/1-7/power/control
.... device /sys/bus/usb/devices/usb1/power/control
.... device /sys/bus/usb/devices/1-5/power/control
^T.... device /sys/bus/usb/devices/usb2/power/control
Calibrating radio devices
.... device /sys/class/rfkill/rfkill2/soft
.... device /sys/class/rfkill/rfkill1/soft
.... device /sys/class/rfkill/rfkill2/soft
.... device /sys/class/rfkill/rfkill1/soft
Finishing PowerTOP power estimate calibration
Parameters after calibration:


Parameter state
----------------------------------
Value        Name
 0.50        alsa-codec-power (13)
 0.00        backlight (4)
 0.00        backlight-boost-100 (8)
 0.00        backlight-boost-40 (6)
 0.00        backlight-boost-80 (7)
 0.00        backlight-power (5)
 4.13        base power (98)
 1.56        cpu-consumption (3)
39.50        cpu-wakeups (2)
 0.00        disk-operations (100)
 0.20        disk-operations-hard (99)
 0.56        gpu-operations (16)
 0.00        radio:hci0 (14)
 0.00        radio:phy0 (15)
 0.00        runtime-0000:00:00.0 (37)
 0.00        runtime-0000:00:02.0 (41)
 0.00        runtime-0000:00:04.0 (49)
 0.00        runtime-0000:00:14.0 (42)
 0.00        runtime-0000:00:14.2 (40)
 0.00        runtime-0000:00:15.0 (38)
 0.00        runtime-0000:00:15.1 (47)
 0.00        runtime-0000:00:16.0 (52)
 0.00        runtime-0000:00:17.0 (44)
 0.00        runtime-0000:00:1c.0 (46)
 0.00        runtime-0000:00:1c.5 (50)
 0.00        runtime-0000:00:1d.0 (39)
 0.00        runtime-0000:00:1f.0 (48)
 0.00        runtime-0000:00:1f.2 (45)
 0.00        runtime-0000:00:1f.3 (36)
 0.00        runtime-0000:00:1f.4 (43)
 0.00        runtime-0000:6c:00.0 (35)
 0.00        runtime-0000:6d:00.0 (51)
 0.00        runtime-ACPI0003:00 (78)
 0.00        runtime-ACPI000C:00 (88)
 0.00        runtime-Fixed MDIO bus.0 (81)
 0.00        runtime-HPQ6001:00 (59)
 0.00        runtime-INT0800:00 (63)
 0.00        runtime-INT3400:00 (54)
 0.00        runtime-INT3403:00 (53)
 0.00        runtime-INT344B:00 (76)
 0.00        runtime-MSFT0101:00 (64)
 0.00        runtime-PNP0103:00 (55)
 0.00        runtime-PNP0C09:00 (70)
 0.00        runtime-PNP0C0A:00 (71)
 0.00        runtime-PNP0C0B:00 (60)
 0.00        runtime-PNP0C0B:01 (73)
 0.00        runtime-PNP0C0B:02 (56)
 0.00        runtime-PNP0C0B:03 (72)
 0.00        runtime-PNP0C0B:04 (87)
 0.00        runtime-PNP0C0C:00 (82)
 0.00        runtime-PNP0C0D:00 (69)
 0.00        runtime-PNP0C14:00 (68)
 0.00        runtime-PNP0C14:01 (85)
 0.00        runtime-alarmtimer (66)
 0.00        runtime-coretemp.0 (67)
 0.00        runtime-efi-framebuffer.0 (79)
 0.00        runtime-hp-wmi (74)
 0.00        runtime-i2c-0 (95)
 0.00        runtime-i2c-1 (90)
 0.00        runtime-i2c-2 (94)
 0.00        runtime-i2c-3 (89)
 0.00        runtime-i2c-4 (93)
 0.00        runtime-i2c-5 (97)
 0.00        runtime-i2c-6 (92)
 0.00        runtime-i2c-7 (96)
 0.00        runtime-i2c-8 (91)
 0.00        runtime-i2c_designware.0 (75)
 0.00        runtime-i2c_designware.1 (57)
 0.00        runtime-i8042 (86)
 0.00        runtime-iTCO_wdt (62)
 0.00        runtime-idma64.0 (77)
 0.00        runtime-idma64.1 (58)
 0.00        runtime-microcode (65)
 0.00        runtime-pcspkr (80)
 0.00        runtime-regulatory.0 (61)
 0.00        runtime-serial8250 (84)
 0.00        runtime-snd-soc-dummy (83)
 0.10        usb-device-13d3-5670 (11)
 0.10        usb-device-1d6b-0002 (10)
 0.10        usb-device-1d6b-0003 (12)
 0.10        usb-device-8087-0a2b (9)
 0.00        virbr0-link-100 (19)
 0.00        virbr0-link-1000 (20)
 0.00        virbr0-link-high (21)
 0.00        virbr0-nic-link-100 (31)
 0.00        virbr0-nic-link-1000 (32)
 0.00        virbr0-nic-link-high (33)
 0.00        virbr0-nic-packets (34)
 0.00        virbr0-nic-powerunsave (30)
 0.00        virbr0-nic-up (29)
 0.00        virbr0-packets (22)
 0.00        virbr0-powerunsave (18)
 0.00        virbr0-up (17)
 0.00        wlo1-link-100 (25)
 0.00        wlo1-link-1000 (26)
 0.00        wlo1-link-high (27)
 0.00        wlo1-packets (28)
 0.00        wlo1-powerunsave (24)
 0.00        wlo1-up (23)
 0.10        xwakes (101)

Score:    0.0  (  0.0)
Guess:    4.1
Actual:   0.0
----------------------------------
Leaving PowerTOP



    Version: Intel(R) Core(TM) i7-6500U CPU @ 2.50GHz

[    0.888022] microcode: sig=3D0x406e3, pf=3D0x80, revision=3D0x9e


-- =

Chris Murphy

--===============5690894469512203046==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PGRpdiBkaXI9Imx0ciI+PGJyPkFyZSB0aGUgUkVBRE1FJiMzOTtzIGtlcm5lbCBjb25maWcgb3B0
aW9uIHJlcXVpcmVtZW50cyBjdXJyZW50Pzxicj48YSBocmVmPSJodHRwczovL2dpdGh1Yi5jb20v
ZmVucnVzNzUvcG93ZXJ0b3AiPmh0dHBzOi8vZ2l0aHViLmNvbS9mZW5ydXM3NS9wb3dlcnRvcDwv
YT48YnI+PGJyPk9mIHRob3NlIGxpc3RlZCwgdGhlc2UgZm91ciBhcmUgbWlzc2luZyBmcm9tIGRl
ZmF1bHQgRmVkb3JhIGtlcm5lbHMgKEk8YnI+Y2hlY2tlZCBjb25maWctNC45LjAtMS5mYzI2Lng4
Nl82NCk8YnI+PGJyPkNPTkZJR19VU0JfU1VTUEVORDxicj5DT05GSUdfUEVSRl9DT1VOVEVSUzxi
cj5DT05GSUdfRVZFTlRfUE9XRVJfVFJBQ0lOR19ERVBSRUNBVEVEPGJyPkNPTkZJR19BQ1BJX1BS
T0NGU19QT1dFUjxicj48YnI+SSBoYXZlIG5vIGlkZWEgaWYgdGhvc2UgbWlzc2luZyByZWxhdGUg
dG8gdGhlIGZvbGxvd2luZyBpc3N1ZXM6PGJyPjxicj5bcm9vdEBmMjVoIH5dIyBscyAtbCAvdmFy
L2NhY2hlL3Bvd2VydG9wLzxicj50b3RhbCAwPGJyPi1ydy1yLS1yLS0uIDEgcm9vdCByb290IDAg
RGVjIDI5IDE0OjQ5IHNhdmVkX3BhcmFtZXRlcnMucG93ZXJ0b3A8YnI+LXJ3LXItLXItLS4gMSBy
b290IHJvb3QgMCBEZWMgMjkgMTQ6NDkgc2F2ZWRfcmVzdWx0cy5wb3dlcnRvcDxicj48YnI+VGhl
c2UgZmlsZXMgYXJlIGFsc28gemVybyBieXRlIGZpbGVzLiBUaGV5IHJlbWFpbiB6ZXJvIGJ5dGVz
IGV2ZW4gYWZ0ZXI8YnI+JiMzOTtwb3dlcnRvcCAtYyYjMzk7IGFsdGhvdWdoIHRoZWlyIHRpbWUg
c3RhbXAgY2hhbmdlcy48YnI+PGJyPltyb290QGYyNWggfl0jIHBvd2VydG9wIC1jPGJyPm1vZHBy
b2JlIGNwdWZyZXFfc3RhdHMgZmFpbGVkTG9hZGVkIDAgcHJpb3IgbWVhc3VyZW1lbnRzPGJyPlJB
UEwgZGV2aWNlIGZvciBjcHUgMDxicj5SQVBMIFVzaW5nIFBvd2VyQ2FwIFN5c2ZzIDogRG9tYWlu
IE1hc2sgZjxicj5SQVBMIGRldmljZSBmb3IgY3B1IDA8YnI+UkFQTCBVc2luZyBQb3dlckNhcCBT
eXNmcyA6IERvbWFpbiBNYXNrIGY8YnI+UkFQTCBkZXZpY2UgZm9yIGNwdSAwPGJyPlJBUEwgVXNp
bmcgUG93ZXJDYXAgU3lzZnMgOiBEb21haW4gTWFzayBmPGJyPkRldmZyZXEgbm90IGVuYWJsZWQ8
YnI+U3RhcnRpbmcgUG93ZXJUT1AgcG93ZXIgZXN0aW1hdGUgY2FsaWJyYXRpb248YnI+Q2FsaWJy
YXRpbmcgaWRsZTxicj5TeXN0ZW0gaXMgbm90IGF2YWlsYWJsZTxicj7CoCB1bmtub3duIG9wICYj
Mzk7eyYjMzk7PGJyPlN5c3RlbSBpcyBub3QgYXZhaWxhYmxlPGJyPkNhbGlicmF0aW5nOiBkaXNr
IHVzYWdlPGJyPkNhbGlicmF0aW5nIGJhY2tsaWdodDxicj4uLi4uIGRldmljZSAvc3lzL2NsYXNz
L2JhY2tsaWdodC9pbnRlbF9iYWNrbGlnaHQvYnJpZ2h0bmVzczxicj5DYWxpYnJhdGluZyBpZGxl
PGJyPlN5c3RlbSBpcyBub3QgYXZhaWxhYmxlPGJyPlN5c3RlbSBpcyBub3QgYXZhaWxhYmxlPGJy
PkNhbGlicmF0aW5nOiBDUFUgdXNhZ2Ugb24gMSB0aHJlYWRzPGJyPkNhbGlicmF0aW5nOiBDUFUg
dXNhZ2Ugb24gNCB0aHJlYWRzPGJyPkNhbGlicmF0aW5nOiBDUFUgd2FrZXVwIHBvd2VyIGNvbnN1
bXB0aW9uPGJyPkNhbGlicmF0aW5nOiBDUFUgd2FrZXVwIHBvd2VyIGNvbnN1bXB0aW9uPGJyPkNh
bGlicmF0aW5nOiBDUFUgd2FrZXVwIHBvd2VyIGNvbnN1bXB0aW9uPGJyPkNhbGlicmF0aW5nIFVT
QiBkZXZpY2VzPGJyPi4uLi4gZGV2aWNlIC9zeXMvYnVzL3VzYi9kZXZpY2VzLzEtNy9wb3dlci9j
b250cm9sPGJyPi4uLi4gZGV2aWNlIC9zeXMvYnVzL3VzYi9kZXZpY2VzL3VzYjEvcG93ZXIvY29u
dHJvbDxicj4uLi4uIGRldmljZSAvc3lzL2J1cy91c2IvZGV2aWNlcy8xLTUvcG93ZXIvY29udHJv
bDxicj5eVC4uLi4gZGV2aWNlIC9zeXMvYnVzL3VzYi9kZXZpY2VzL3VzYjIvcG93ZXIvY29udHJv
bDxicj5DYWxpYnJhdGluZyByYWRpbyBkZXZpY2VzPGJyPi4uLi4gZGV2aWNlIC9zeXMvY2xhc3Mv
cmZraWxsL3Jma2lsbDIvc29mdDxicj4uLi4uIGRldmljZSAvc3lzL2NsYXNzL3Jma2lsbC9yZmtp
bGwxL3NvZnQ8YnI+Li4uLiBkZXZpY2UgL3N5cy9jbGFzcy9yZmtpbGwvcmZraWxsMi9zb2Z0PGJy
Pi4uLi4gZGV2aWNlIC9zeXMvY2xhc3MvcmZraWxsL3Jma2lsbDEvc29mdDxicj5GaW5pc2hpbmcg
UG93ZXJUT1AgcG93ZXIgZXN0aW1hdGUgY2FsaWJyYXRpb248YnI+UGFyYW1ldGVycyBhZnRlciBj
YWxpYnJhdGlvbjo8YnI+PGJyPjxicj5QYXJhbWV0ZXIgc3RhdGU8YnI+LS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLTxicj5WYWx1ZcKgwqDCoMKgwqDCoMKgIE5hbWU8YnI+wqAwLjUw
wqDCoMKgwqDCoMKgwqAgYWxzYS1jb2RlYy1wb3dlciAoMTMpPGJyPsKgMC4wMMKgwqDCoMKgwqDC
oMKgIGJhY2tsaWdodCAoNCk8YnI+wqAwLjAwwqDCoMKgwqDCoMKgwqAgYmFja2xpZ2h0LWJvb3N0
LTEwMCAoOCk8YnI+wqAwLjAwwqDCoMKgwqDCoMKgwqAgYmFja2xpZ2h0LWJvb3N0LTQwICg2KTxi
cj7CoDAuMDDCoMKgwqDCoMKgwqDCoCBiYWNrbGlnaHQtYm9vc3QtODAgKDcpPGJyPsKgMC4wMMKg
wqDCoMKgwqDCoMKgIGJhY2tsaWdodC1wb3dlciAoNSk8YnI+wqA0LjEzwqDCoMKgwqDCoMKgwqAg
YmFzZSBwb3dlciAoOTgpPGJyPsKgMS41NsKgwqDCoMKgwqDCoMKgIGNwdS1jb25zdW1wdGlvbiAo
Myk8YnI+MzkuNTDCoMKgwqDCoMKgwqDCoCBjcHUtd2FrZXVwcyAoMik8YnI+wqAwLjAwwqDCoMKg
wqDCoMKgwqAgZGlzay1vcGVyYXRpb25zICgxMDApPGJyPsKgMC4yMMKgwqDCoMKgwqDCoMKgIGRp
c2stb3BlcmF0aW9ucy1oYXJkICg5OSk8YnI+wqAwLjU2wqDCoMKgwqDCoMKgwqAgZ3B1LW9wZXJh
dGlvbnMgKDE2KTxicj7CoDAuMDDCoMKgwqDCoMKgwqDCoCByYWRpbzpoY2kwICgxNCk8YnI+wqAw
LjAwwqDCoMKgwqDCoMKgwqAgcmFkaW86cGh5MCAoMTUpPGJyPsKgMC4wMMKgwqDCoMKgwqDCoMKg
IHJ1bnRpbWUtMDAwMDowMDowMC4wICgzNyk8YnI+wqAwLjAwwqDCoMKgwqDCoMKgwqAgcnVudGlt
ZS0wMDAwOjAwOjAyLjAgKDQxKTxicj7CoDAuMDDCoMKgwqDCoMKgwqDCoCBydW50aW1lLTAwMDA6
MDA6MDQuMCAoNDkpPGJyPsKgMC4wMMKgwqDCoMKgwqDCoMKgIHJ1bnRpbWUtMDAwMDowMDoxNC4w
ICg0Mik8YnI+wqAwLjAwwqDCoMKgwqDCoMKgwqAgcnVudGltZS0wMDAwOjAwOjE0LjIgKDQwKTxi
cj7CoDAuMDDCoMKgwqDCoMKgwqDCoCBydW50aW1lLTAwMDA6MDA6MTUuMCAoMzgpPGJyPsKgMC4w
MMKgwqDCoMKgwqDCoMKgIHJ1bnRpbWUtMDAwMDowMDoxNS4xICg0Nyk8YnI+wqAwLjAwwqDCoMKg
wqDCoMKgwqAgcnVudGltZS0wMDAwOjAwOjE2LjAgKDUyKTxicj7CoDAuMDDCoMKgwqDCoMKgwqDC
oCBydW50aW1lLTAwMDA6MDA6MTcuMCAoNDQpPGJyPsKgMC4wMMKgwqDCoMKgwqDCoMKgIHJ1bnRp
bWUtMDAwMDowMDoxYy4wICg0Nik8YnI+wqAwLjAwwqDCoMKgwqDCoMKgwqAgcnVudGltZS0wMDAw
OjAwOjFjLjUgKDUwKTxicj7CoDAuMDDCoMKgwqDCoMKgwqDCoCBydW50aW1lLTAwMDA6MDA6MWQu
MCAoMzkpPGJyPsKgMC4wMMKgwqDCoMKgwqDCoMKgIHJ1bnRpbWUtMDAwMDowMDoxZi4wICg0OCk8
YnI+wqAwLjAwwqDCoMKgwqDCoMKgwqAgcnVudGltZS0wMDAwOjAwOjFmLjIgKDQ1KTxicj7CoDAu
MDDCoMKgwqDCoMKgwqDCoCBydW50aW1lLTAwMDA6MDA6MWYuMyAoMzYpPGJyPsKgMC4wMMKgwqDC
oMKgwqDCoMKgIHJ1bnRpbWUtMDAwMDowMDoxZi40ICg0Myk8YnI+wqAwLjAwwqDCoMKgwqDCoMKg
wqAgcnVudGltZS0wMDAwOjZjOjAwLjAgKDM1KTxicj7CoDAuMDDCoMKgwqDCoMKgwqDCoCBydW50
aW1lLTAwMDA6NmQ6MDAuMCAoNTEpPGJyPsKgMC4wMMKgwqDCoMKgwqDCoMKgIHJ1bnRpbWUtQUNQ
STAwMDM6MDAgKDc4KTxicj7CoDAuMDDCoMKgwqDCoMKgwqDCoCBydW50aW1lLUFDUEkwMDBDOjAw
ICg4OCk8YnI+wqAwLjAwwqDCoMKgwqDCoMKgwqAgcnVudGltZS1GaXhlZCBNRElPIGJ1cy4wICg4
MSk8YnI+wqAwLjAwwqDCoMKgwqDCoMKgwqAgcnVudGltZS1IUFE2MDAxOjAwICg1OSk8YnI+wqAw
LjAwwqDCoMKgwqDCoMKgwqAgcnVudGltZS1JTlQwODAwOjAwICg2Myk8YnI+wqAwLjAwwqDCoMKg
wqDCoMKgwqAgcnVudGltZS1JTlQzNDAwOjAwICg1NCk8YnI+wqAwLjAwwqDCoMKgwqDCoMKgwqAg
cnVudGltZS1JTlQzNDAzOjAwICg1Myk8YnI+wqAwLjAwwqDCoMKgwqDCoMKgwqAgcnVudGltZS1J
TlQzNDRCOjAwICg3Nik8YnI+wqAwLjAwwqDCoMKgwqDCoMKgwqAgcnVudGltZS1NU0ZUMDEwMTow
MCAoNjQpPGJyPsKgMC4wMMKgwqDCoMKgwqDCoMKgIHJ1bnRpbWUtUE5QMDEwMzowMCAoNTUpPGJy
PsKgMC4wMMKgwqDCoMKgwqDCoMKgIHJ1bnRpbWUtUE5QMEMwOTowMCAoNzApPGJyPsKgMC4wMMKg
wqDCoMKgwqDCoMKgIHJ1bnRpbWUtUE5QMEMwQTowMCAoNzEpPGJyPsKgMC4wMMKgwqDCoMKgwqDC
oMKgIHJ1bnRpbWUtUE5QMEMwQjowMCAoNjApPGJyPsKgMC4wMMKgwqDCoMKgwqDCoMKgIHJ1bnRp
bWUtUE5QMEMwQjowMSAoNzMpPGJyPsKgMC4wMMKgwqDCoMKgwqDCoMKgIHJ1bnRpbWUtUE5QMEMw
QjowMiAoNTYpPGJyPsKgMC4wMMKgwqDCoMKgwqDCoMKgIHJ1bnRpbWUtUE5QMEMwQjowMyAoNzIp
PGJyPsKgMC4wMMKgwqDCoMKgwqDCoMKgIHJ1bnRpbWUtUE5QMEMwQjowNCAoODcpPGJyPsKgMC4w
MMKgwqDCoMKgwqDCoMKgIHJ1bnRpbWUtUE5QMEMwQzowMCAoODIpPGJyPsKgMC4wMMKgwqDCoMKg
wqDCoMKgIHJ1bnRpbWUtUE5QMEMwRDowMCAoNjkpPGJyPsKgMC4wMMKgwqDCoMKgwqDCoMKgIHJ1
bnRpbWUtUE5QMEMxNDowMCAoNjgpPGJyPsKgMC4wMMKgwqDCoMKgwqDCoMKgIHJ1bnRpbWUtUE5Q
MEMxNDowMSAoODUpPGJyPsKgMC4wMMKgwqDCoMKgwqDCoMKgIHJ1bnRpbWUtYWxhcm10aW1lciAo
NjYpPGJyPsKgMC4wMMKgwqDCoMKgwqDCoMKgIHJ1bnRpbWUtY29yZXRlbXAuMCAoNjcpPGJyPsKg
MC4wMMKgwqDCoMKgwqDCoMKgIHJ1bnRpbWUtZWZpLWZyYW1lYnVmZmVyLjAgKDc5KTxicj7CoDAu
MDDCoMKgwqDCoMKgwqDCoCBydW50aW1lLWhwLXdtaSAoNzQpPGJyPsKgMC4wMMKgwqDCoMKgwqDC
oMKgIHJ1bnRpbWUtaTJjLTAgKDk1KTxicj7CoDAuMDDCoMKgwqDCoMKgwqDCoCBydW50aW1lLWky
Yy0xICg5MCk8YnI+wqAwLjAwwqDCoMKgwqDCoMKgwqAgcnVudGltZS1pMmMtMiAoOTQpPGJyPsKg
MC4wMMKgwqDCoMKgwqDCoMKgIHJ1bnRpbWUtaTJjLTMgKDg5KTxicj7CoDAuMDDCoMKgwqDCoMKg
wqDCoCBydW50aW1lLWkyYy00ICg5Myk8YnI+wqAwLjAwwqDCoMKgwqDCoMKgwqAgcnVudGltZS1p
MmMtNSAoOTcpPGJyPsKgMC4wMMKgwqDCoMKgwqDCoMKgIHJ1bnRpbWUtaTJjLTYgKDkyKTxicj7C
oDAuMDDCoMKgwqDCoMKgwqDCoCBydW50aW1lLWkyYy03ICg5Nik8YnI+wqAwLjAwwqDCoMKgwqDC
oMKgwqAgcnVudGltZS1pMmMtOCAoOTEpPGJyPsKgMC4wMMKgwqDCoMKgwqDCoMKgIHJ1bnRpbWUt
aTJjX2Rlc2lnbndhcmUuMCAoNzUpPGJyPsKgMC4wMMKgwqDCoMKgwqDCoMKgIHJ1bnRpbWUtaTJj
X2Rlc2lnbndhcmUuMSAoNTcpPGJyPsKgMC4wMMKgwqDCoMKgwqDCoMKgIHJ1bnRpbWUtaTgwNDIg
KDg2KTxicj7CoDAuMDDCoMKgwqDCoMKgwqDCoCBydW50aW1lLWlUQ09fd2R0ICg2Mik8YnI+wqAw
LjAwwqDCoMKgwqDCoMKgwqAgcnVudGltZS1pZG1hNjQuMCAoNzcpPGJyPsKgMC4wMMKgwqDCoMKg
wqDCoMKgIHJ1bnRpbWUtaWRtYTY0LjEgKDU4KTxicj7CoDAuMDDCoMKgwqDCoMKgwqDCoCBydW50
aW1lLW1pY3JvY29kZSAoNjUpPGJyPsKgMC4wMMKgwqDCoMKgwqDCoMKgIHJ1bnRpbWUtcGNzcGty
ICg4MCk8YnI+wqAwLjAwwqDCoMKgwqDCoMKgwqAgcnVudGltZS1yZWd1bGF0b3J5LjAgKDYxKTxi
cj7CoDAuMDDCoMKgwqDCoMKgwqDCoCBydW50aW1lLXNlcmlhbDgyNTAgKDg0KTxicj7CoDAuMDDC
oMKgwqDCoMKgwqDCoCBydW50aW1lLXNuZC1zb2MtZHVtbXkgKDgzKTxicj7CoDAuMTDCoMKgwqDC
oMKgwqDCoCB1c2ItZGV2aWNlLTEzZDMtNTY3MCAoMTEpPGJyPsKgMC4xMMKgwqDCoMKgwqDCoMKg
IHVzYi1kZXZpY2UtMWQ2Yi0wMDAyICgxMCk8YnI+wqAwLjEwwqDCoMKgwqDCoMKgwqAgdXNiLWRl
dmljZS0xZDZiLTAwMDMgKDEyKTxicj7CoDAuMTDCoMKgwqDCoMKgwqDCoCB1c2ItZGV2aWNlLTgw
ODctMGEyYiAoOSk8YnI+wqAwLjAwwqDCoMKgwqDCoMKgwqAgdmlyYnIwLWxpbmstMTAwICgxOSk8
YnI+wqAwLjAwwqDCoMKgwqDCoMKgwqAgdmlyYnIwLWxpbmstMTAwMCAoMjApPGJyPsKgMC4wMMKg
wqDCoMKgwqDCoMKgIHZpcmJyMC1saW5rLWhpZ2ggKDIxKTxicj7CoDAuMDDCoMKgwqDCoMKgwqDC
oCB2aXJicjAtbmljLWxpbmstMTAwICgzMSk8YnI+wqAwLjAwwqDCoMKgwqDCoMKgwqAgdmlyYnIw
LW5pYy1saW5rLTEwMDAgKDMyKTxicj7CoDAuMDDCoMKgwqDCoMKgwqDCoCB2aXJicjAtbmljLWxp
bmstaGlnaCAoMzMpPGJyPsKgMC4wMMKgwqDCoMKgwqDCoMKgIHZpcmJyMC1uaWMtcGFja2V0cyAo
MzQpPGJyPsKgMC4wMMKgwqDCoMKgwqDCoMKgIHZpcmJyMC1uaWMtcG93ZXJ1bnNhdmUgKDMwKTxi
cj7CoDAuMDDCoMKgwqDCoMKgwqDCoCB2aXJicjAtbmljLXVwICgyOSk8YnI+wqAwLjAwwqDCoMKg
wqDCoMKgwqAgdmlyYnIwLXBhY2tldHMgKDIyKTxicj7CoDAuMDDCoMKgwqDCoMKgwqDCoCB2aXJi
cjAtcG93ZXJ1bnNhdmUgKDE4KTxicj7CoDAuMDDCoMKgwqDCoMKgwqDCoCB2aXJicjAtdXAgKDE3
KTxicj7CoDAuMDDCoMKgwqDCoMKgwqDCoCB3bG8xLWxpbmstMTAwICgyNSk8YnI+wqAwLjAwwqDC
oMKgwqDCoMKgwqAgd2xvMS1saW5rLTEwMDAgKDI2KTxicj7CoDAuMDDCoMKgwqDCoMKgwqDCoCB3
bG8xLWxpbmstaGlnaCAoMjcpPGJyPsKgMC4wMMKgwqDCoMKgwqDCoMKgIHdsbzEtcGFja2V0cyAo
MjgpPGJyPsKgMC4wMMKgwqDCoMKgwqDCoMKgIHdsbzEtcG93ZXJ1bnNhdmUgKDI0KTxicj7CoDAu
MDDCoMKgwqDCoMKgwqDCoCB3bG8xLXVwICgyMyk8YnI+wqAwLjEwwqDCoMKgwqDCoMKgwqAgeHdh
a2VzICgxMDEpPGJyPjxicj5TY29yZTrCoMKgwqAgMC4wwqAgKMKgIDAuMCk8YnI+R3Vlc3M6wqDC
oMKgIDQuMTxicj5BY3R1YWw6wqDCoCAwLjA8YnI+LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLTxicj5MZWF2aW5nIFBvd2VyVE9QPGJyPjxicj48YnI+PGJyPsKgwqDCoCBWZXJzaW9u
OiBJbnRlbChSKSBDb3JlKFRNKSBpNy02NTAwVSBDUFUgQCAyLjUwR0h6PGJyPjxicj5bwqDCoMKg
IDAuODg4MDIyXSBtaWNyb2NvZGU6IHNpZz0weDQwNmUzLCBwZj0weDgwLCByZXZpc2lvbj0weDll
PGJyPjxiciBjbGVhcj0iYWxsIj48YnI+LS0gPGJyPjxkaXYgY2xhc3M9ImdtYWlsX3NpZ25hdHVy
ZSI+Q2hyaXMgTXVycGh5PC9kaXY+DQoNCjwvZGl2Pg0K

--===============5690894469512203046==--

