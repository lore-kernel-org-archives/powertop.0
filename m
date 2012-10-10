Content-Type: multipart/mixed; boundary="===============2105340283939283865=="
MIME-Version: 1.0
From: Jaspal Dhillon <jaspal.iiith at gmail.com>
Subject: [Powertop] Using taskset , powertop and perf with qemu-kvm
Date: Wed, 10 Oct 2012 13:15:26 +0530
Message-ID: <CAHgtvXO0ZB8gqmNbiP+PkvuBP=QPeZEE_HjEDJw383d+tb449A@mail.gmail.com>
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============2105340283939283865==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello ,

I wish to run some cpu intensive tasks on a vm , use only one core
specifically #0 of the 6 available ( Xeon 3670 ) and all the while record
basic perf events like cpu-cycles , instructions etc.

I am using taskset to define the cpu-affinity of the qemu process :
taskset -p 0x1 `pgrep qemu` (assuming only 1 vm is running )

I can verify that the vm is now running only on core 0 using top. top also
shows that the qemu process is using 99% of it's share of CPU time ( %CPU
column in top ) upon running the tasks in vm. However what I fail to see is
the increase in time spent of the core 0 in the C0 ( active ) state via
powertop. It barely manages to cross 12%. If I run the same tasks ( FFT
benchmark ) on the host on a different core ( say #1 ) and monitor it using
powertop again , I can see that  C0 % for core 1 is above 100% ( 104 ~ 107 )
So why does not the output of top ( qemu is using 99% of it's cpu time ,
which is spent on core 0 )  co-relate with powertop ( which says core 0 is
idle for around 88% of time ) ?
Also , powertop reports that core 2 is being used heavily ( 104 % ) and I
suspect this is one which is executing the vm operations. But why ?
There are no other cpu/memory intensive tasks running on the host.

Next , I am using the perf kvm record function to save the stats. If I use
all the 7 core counters available along-with -a option , perf generates
2MB/second . Is there a way to save just the raw count of the events ?
Also , if instead of -a , if I give -C 0 , perf just saves around 0.016MB
as opposed to 1.894MB in case of -a option. If the vm is indeed using core
0 , then perf should have recorded the events.

On a last note , does perf kvm automatically selects the vm to profile ( in
case multiple vms are running ) on the basis of the guest.kallsyms and
guest.modules files passed to it ?

Thanks ,
Jaspal

--===============2105340283939283865==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

SGVsbG8gLKA8ZGl2Pjxicj48L2Rpdj48ZGl2Pkkgd2lzaCB0byBydW4gc29tZSBjcHUgaW50ZW5z
aXZlIHRhc2tzIG9uIGEgdm0gLCB1c2Ugb25seSBvbmUgY29yZSBzcGVjaWZpY2FsbHkgIzAgb2Yg
dGhlIDYgYXZhaWxhYmxlICggWGVvbiAzNjcwICkgYW5kIGFsbCB0aGUgd2hpbGUgcmVjb3JkIGJh
c2ljIHBlcmYgZXZlbnRzIGxpa2UgY3B1LWN5Y2xlcyAsIGluc3RydWN0aW9ucyBldGMuoDwvZGl2
PgoKCjxkaXY+PGJyPjwvZGl2PjxkaXY+SSBhbSB1c2luZyB0YXNrc2V0IHRvIGRlZmluZSB0aGUg
Y3B1LWFmZmluaXR5IG9mIHRoZSBxZW11IHByb2Nlc3MgOqA8L2Rpdj48ZGl2PnRhc2tzZXQgLXAg
MHgxIGBwZ3JlcCBxZW11YCAoYXNzdW1pbmcgb25seSAxIHZtIGlzIHJ1bm5pbmcgKaA8L2Rpdj48
ZGl2Pjxicj48L2Rpdj48ZGl2PkkgY2FuIHZlcmlmeSB0aGF0IHRoZSB2bSBpcyBub3cgcnVubmlu
ZyBvbmx5IG9uIGNvcmUgMCB1c2luZyB0b3AuIHRvcCBhbHNvIHNob3dzIHRoYXQgdGhlIHFlbXUg
cHJvY2VzcyBpcyB1c2luZyA5OSUgb2YgaXQmIzM5O3Mgc2hhcmUgb2YgQ1BVIHRpbWUgKCAlQ1BV
IGNvbHVtbiBpbiB0b3AgKSB1cG9uIHJ1bm5pbmcgdGhlIHRhc2tzIGluIHZtLiBIb3dldmVyIHdo
YXQgSSBmYWlsIHRvIHNlZSBpcyB0aGUgaW5jcmVhc2UgaW4gdGltZSBzcGVudCBvZiB0aGUgY29y
ZSAwIGluIHRoZSBDMCAoIGFjdGl2ZSApIHN0YXRlIHZpYSBwb3dlcnRvcC4gSXQgYmFyZWx5IG1h
bmFnZXMgdG8gY3Jvc3MgMTIlLiBJZiBJIHJ1biB0aGUgc2FtZSB0YXNrcyAoIEZGVCBiZW5jaG1h
cmsgKSBvbiB0aGUgaG9zdCBvbiBhIGRpZmZlcmVudCBjb3JlICggc2F5ICMxICkgYW5kIG1vbml0
b3IgaXQgdXNpbmcgcG93ZXJ0b3AgYWdhaW4gLCBJIGNhbiBzZWUgdGhhdCCgQzAgJSBmb3IgY29y
ZSAxIGlzIGFib3ZlIDEwMCUgKCAxMDQgfiAxMDcgKTwvZGl2PgoKCjxkaXY+U28gd2h5IGRvZXMg
bm90IHRoZSBvdXRwdXQgb2YgdG9wICggcWVtdSBpcyB1c2luZyA5OSUgb2YgaXQmIzM5O3MgY3B1
IHRpbWUgLCB3aGljaCBpcyBzcGVudCBvbiBjb3JlIDAgKSCgY28tcmVsYXRlIHdpdGggcG93ZXJ0
b3AgKCB3aGljaCBzYXlzIGNvcmUgMCBpcyBpZGxlIGZvciBhcm91bmQgODglIG9mIHRpbWUgKSA/
oDwvZGl2PjxkaXY+QWxzbyAsIHBvd2VydG9wIHJlcG9ydHMgdGhhdCBjb3JlIDIgaXMgYmVpbmcg
dXNlZCBoZWF2aWx5ICggMTA0ICUgKSBhbmQgSSBzdXNwZWN0IHRoaXMgaXMgb25lIHdoaWNoIGlz
IGV4ZWN1dGluZyB0aGUgdm0gb3BlcmF0aW9ucy4gQnV0IHdoeSA/oDwvZGl2PgoKPGRpdj5UaGVy
ZSBhcmUgbm8gb3RoZXIgY3B1L21lbW9yeSBpbnRlbnNpdmUgdGFza3MgcnVubmluZyBvbiB0aGUg
aG9zdC48L2Rpdj4KPGRpdj48YnI+PC9kaXY+PGRpdj5OZXh0ICwgSSBhbSB1c2luZyB0aGUgcGVy
ZiBrdm0gcmVjb3JkIGZ1bmN0aW9uIHRvIHNhdmUgdGhlIHN0YXRzLiBJZiBJIHVzZSBhbGwgdGhl
IDcgY29yZSBjb3VudGVycyBhdmFpbGFibGUgYWxvbmctd2l0aCAtYSBvcHRpb24gLCBwZXJmIGdl
bmVyYXRlcyAyTUIvc2Vjb25kIC4gSXMgdGhlcmUgYSB3YXkgdG8gc2F2ZSBqdXN0IHRoZSByYXcg
Y291bnQgb2YgdGhlIGV2ZW50cyA/oDwvZGl2PgoKCjxkaXY+QWxzbyAsIGlmIGluc3RlYWQgb2Yg
LWEgLCBpZiBJIGdpdmUgLUMgMCAsIHBlcmYganVzdCBzYXZlcyBhcm91bmQgMC4wMTZNQiBhcyBv
cHBvc2VkIHRvIDEuODk0TUIgaW4gY2FzZSBvZiAtYSBvcHRpb24uIElmIHRoZSB2bSBpcyBpbmRl
ZWQgdXNpbmcgY29yZSAwICwgdGhlbiBwZXJmIHNob3VsZCBoYXZlIHJlY29yZGVkIHRoZSBldmVu
dHMuoDwvZGl2PjxkaXY+PGJyPjwvZGl2PgoKCjxkaXY+T24gYSBsYXN0IG5vdGUgLCBkb2VzIHBl
cmYga3ZtIGF1dG9tYXRpY2FsbHkgc2VsZWN0cyB0aGUgdm0gdG8gcHJvZmlsZSAoIGluIGNhc2Ug
bXVsdGlwbGUgdm1zIGFyZSBydW5uaW5nICkgb24gdGhlIGJhc2lzIG9mIHRoZSBndWVzdC5rYWxs
c3ltcyBhbmQgZ3Vlc3QubW9kdWxlcyBmaWxlcyBwYXNzZWQgdG8gaXQgP6A8L2Rpdj48ZGl2Pjxi
cj48L2Rpdj48ZGl2PlRoYW5rcyAsoDwvZGl2PgoKCjxkaXY+SmFzcGFsPGJyPjxkaXY+PGJyPjwv
ZGl2PjxkaXY+PGJyPjwvZGl2Pgo8L2Rpdj4K

--===============2105340283939283865==--

