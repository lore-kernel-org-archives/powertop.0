Content-Type: multipart/mixed; boundary="===============4126217513852700269=="
MIME-Version: 1.0
From: Rajagopal Venkat <rajagopal.venkat at linaro.org>
Subject: Re: [Powertop] [PATCH] fix cpuidle state name parsing
Date: Tue, 31 Jul 2012 11:49:58 +0530
Message-ID: <CA+Z25wXABDtAnmPAUXzBfRofz=t0qyzcUpdiaMGGTOaaJT1wHA@mail.gmail.com>
In-Reply-To: 1340390327-2836-1-git-send-email-rajagopal.venkat@linaro.org
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============4126217513852700269==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

This patch fixes powertop to display cpuidle states on platforms
where cpuidle stateX directory name field does not contain
"CX" string. On some platforms, the name field contains meaningful
strings like WFI, Sleep, DeepSleep.

Please review the patch.

On 23 June 2012 00:08, Rajagopal Venkat <rajagopal.venkat(a)linaro.org> wro=
te:

> parse cpuidle C state based on sysfs file entry(stateX)
> instead of state name/description
>
> Signed-off-by: Rajagopal Venkat <rajagopal.venkat(a)linaro.org>
> ---
>  src/cpu/abstract_cpu.cpp |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/src/cpu/abstract_cpu.cpp b/src/cpu/abstract_cpu.cpp
> index cd4eba0..72969fc 100644
> --- a/src/cpu/abstract_cpu.cpp
> +++ b/src/cpu/abstract_cpu.cpp
> @@ -147,7 +147,7 @@ void abstract_cpu::insert_cstate(const char
> *linux_name, const char *human_name,
>         strcpy(state->linux_name, linux_name);
>         strcpy(state->human_name, human_name);
>
> -       c =3D human_name;
> +       c =3D linux_name;
>         while (*c) {
>                 if (strcmp(linux_name, "active")=3D=3D0) {
>                         state->line_level =3D LEVEL_C0;
> --
> 1.7.9.5
>
>

--===============4126217513852700269==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

VGhpcyBwYXRjaCBmaXhlcyBwb3dlcnRvcCB0byBkaXNwbGF5IGNwdWlkbGUgc3RhdGVzIG9uIHBs
YXRmb3Jtczxicj53aGVyZSBjcHVpZGxlIHN0YXRlWCBkaXJlY3RvcnkgbmFtZSBmaWVsZCBkb2Vz
IG5vdCBjb250YWluPGJyPiZxdW90O0NYJnF1b3Q7IHN0cmluZy4gT24gc29tZSBwbGF0Zm9ybXMs
IHRoZSBuYW1lIGZpZWxkIGNvbnRhaW5zIG1lYW5pbmdmdWw8YnI+c3RyaW5ncyBsaWtlIFdGSSwg
U2xlZXAsIERlZXBTbGVlcC48YnI+Cjxicj5QbGVhc2UgcmV2aWV3IHRoZSBwYXRjaC48YnI+PGJy
PjxkaXYgY2xhc3M9ImdtYWlsX3F1b3RlIj5PbiAyMyBKdW5lIDIwMTIgMDA6MDgsIFJhamFnb3Bh
bCBWZW5rYXQgPHNwYW4gZGlyPSJsdHIiPiZsdDs8YSBocmVmPSJtYWlsdG86cmFqYWdvcGFsLnZl
bmthdEBsaW5hcm8ub3JnIiB0YXJnZXQ9Il9ibGFuayI+cmFqYWdvcGFsLnZlbmthdEBsaW5hcm8u
b3JnPC9hPiZndDs8L3NwYW4+IHdyb3RlOjxicj4KPGJsb2NrcXVvdGUgY2xhc3M9ImdtYWlsX3F1
b3RlIiBzdHlsZT0ibWFyZ2luOjAgMCAwIC44ZXg7Ym9yZGVyLWxlZnQ6MXB4ICNjY2Mgc29saWQ7
cGFkZGluZy1sZWZ0OjFleCI+cGFyc2UgY3B1aWRsZSBDIHN0YXRlIGJhc2VkIG9uIHN5c2ZzIGZp
bGUgZW50cnkoc3RhdGVYKTxicj4KaW5zdGVhZCBvZiBzdGF0ZSBuYW1lL2Rlc2NyaXB0aW9uPGJy
Pgo8YnI+ClNpZ25lZC1vZmYtYnk6IFJhamFnb3BhbCBWZW5rYXQgJmx0OzxhIGhyZWY9Im1haWx0
bzpyYWphZ29wYWwudmVua2F0QGxpbmFyby5vcmciPnJhamFnb3BhbC52ZW5rYXRAbGluYXJvLm9y
ZzwvYT4mZ3Q7PGJyPgotLS08YnI+CqBzcmMvY3B1L2Fic3RyYWN0X2NwdS5jcHAgfCCgIKAyICst
PGJyPgqgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pPGJyPgo8
YnI+CmRpZmYgLS1naXQgYS9zcmMvY3B1L2Fic3RyYWN0X2NwdS5jcHAgYi9zcmMvY3B1L2Fic3Ry
YWN0X2NwdS5jcHA8YnI+CmluZGV4IGNkNGViYTAuLjcyOTY5ZmMgMTAwNjQ0PGJyPgotLS0gYS9z
cmMvY3B1L2Fic3RyYWN0X2NwdS5jcHA8YnI+CisrKyBiL3NyYy9jcHUvYWJzdHJhY3RfY3B1LmNw
cDxicj4KQEAgLTE0Nyw3ICsxNDcsNyBAQCB2b2lkIGFic3RyYWN0X2NwdTo6aW5zZXJ0X2NzdGF0
ZShjb25zdCBjaGFyICpsaW51eF9uYW1lLCBjb25zdCBjaGFyICpodW1hbl9uYW1lLDxicj4KoCCg
IKAgoCBzdHJjcHkoc3RhdGUtJmd0O2xpbnV4X25hbWUsIGxpbnV4X25hbWUpOzxicj4KoCCgIKAg
oCBzdHJjcHkoc3RhdGUtJmd0O2h1bWFuX25hbWUsIGh1bWFuX25hbWUpOzxicj4KPGJyPgotIKAg
oCCgIGMgPSBodW1hbl9uYW1lOzxicj4KKyCgIKAgoCBjID0gbGludXhfbmFtZTs8YnI+CqAgoCCg
IKAgd2hpbGUgKCpjKSB7PGJyPgqgIKAgoCCgIKAgoCCgIKAgaWYgKHN0cmNtcChsaW51eF9uYW1l
LCAmcXVvdDthY3RpdmUmcXVvdDspPT0wKSB7PGJyPgqgIKAgoCCgIKAgoCCgIKAgoCCgIKAgoCBz
dGF0ZS0mZ3Q7bGluZV9sZXZlbCA9IExFVkVMX0MwOzxicj4KPHNwYW4gY2xhc3M9IkhPRW5aYiI+
PGZvbnQgY29sb3I9IiM4ODg4ODgiPi0tPGJyPgoxLjcuOS41PGJyPgo8YnI+CjwvZm9udD48L3Nw
YW4+PC9ibG9ja3F1b3RlPjwvZGl2Pjxicj4K

--===============4126217513852700269==--

