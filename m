Content-Type: multipart/mixed; boundary="===============2322696549677379092=="
MIME-Version: 1.0
From: Rajagopal Venkat <rajagopal.venkat at linaro.org>
Subject: Re: [Powertop] [PATCH] fix cpuidle state name parsing
Date: Fri, 13 Jul 2012 10:33:07 +0530
Message-ID: <CA+Z25wVhN65Z2wd90CktzyzMsKy4ZTHrwOeEtumXskbztE6cyA@mail.gmail.com>
In-Reply-To: 1340390327-2836-1-git-send-email-rajagopal.venkat@linaro.org
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============2322696549677379092==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Can someone consider this patch for merge?

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

--===============2322696549677379092==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

Q2FuIHNvbWVvbmUgY29uc2lkZXIgdGhpcyBwYXRjaCBmb3IgbWVyZ2U/PGJyPjxicj48ZGl2IGNs
YXNzPSJnbWFpbF9xdW90ZSI+T24gMjMgSnVuZSAyMDEyIDAwOjA4LCBSYWphZ29wYWwgVmVua2F0
IDxzcGFuIGRpcj0ibHRyIj4mbHQ7PGEgaHJlZj0ibWFpbHRvOnJhamFnb3BhbC52ZW5rYXRAbGlu
YXJvLm9yZyIgdGFyZ2V0PSJfYmxhbmsiPnJhamFnb3BhbC52ZW5rYXRAbGluYXJvLm9yZzwvYT4m
Z3Q7PC9zcGFuPiB3cm90ZTo8YnI+CjxibG9ja3F1b3RlIGNsYXNzPSJnbWFpbF9xdW90ZSIgc3R5
bGU9Im1hcmdpbjowIDAgMCAuOGV4O2JvcmRlci1sZWZ0OjFweCAjY2NjIHNvbGlkO3BhZGRpbmct
bGVmdDoxZXgiPnBhcnNlIGNwdWlkbGUgQyBzdGF0ZSBiYXNlZCBvbiBzeXNmcyBmaWxlIGVudHJ5
KHN0YXRlWCk8YnI+Cmluc3RlYWQgb2Ygc3RhdGUgbmFtZS9kZXNjcmlwdGlvbjxicj4KPGJyPgpT
aWduZWQtb2ZmLWJ5OiBSYWphZ29wYWwgVmVua2F0ICZsdDs8YSBocmVmPSJtYWlsdG86cmFqYWdv
cGFsLnZlbmthdEBsaW5hcm8ub3JnIj5yYWphZ29wYWwudmVua2F0QGxpbmFyby5vcmc8L2E+Jmd0
Ozxicj4KLS0tPGJyPgqgc3JjL2NwdS9hYnN0cmFjdF9jcHUuY3BwIHwgoCCgMiArLTxicj4KoDEg
ZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKTxicj4KPGJyPgpkaWZm
IC0tZ2l0IGEvc3JjL2NwdS9hYnN0cmFjdF9jcHUuY3BwIGIvc3JjL2NwdS9hYnN0cmFjdF9jcHUu
Y3BwPGJyPgppbmRleCBjZDRlYmEwLi43Mjk2OWZjIDEwMDY0NDxicj4KLS0tIGEvc3JjL2NwdS9h
YnN0cmFjdF9jcHUuY3BwPGJyPgorKysgYi9zcmMvY3B1L2Fic3RyYWN0X2NwdS5jcHA8YnI+CkBA
IC0xNDcsNyArMTQ3LDcgQEAgdm9pZCBhYnN0cmFjdF9jcHU6Omluc2VydF9jc3RhdGUoY29uc3Qg
Y2hhciAqbGludXhfbmFtZSwgY29uc3QgY2hhciAqaHVtYW5fbmFtZSw8YnI+CqAgoCCgIKAgc3Ry
Y3B5KHN0YXRlLSZndDtsaW51eF9uYW1lLCBsaW51eF9uYW1lKTs8YnI+CqAgoCCgIKAgc3RyY3B5
KHN0YXRlLSZndDtodW1hbl9uYW1lLCBodW1hbl9uYW1lKTs8YnI+Cjxicj4KLSCgIKAgoCBjID0g
aHVtYW5fbmFtZTs8YnI+CisgoCCgIKAgYyA9IGxpbnV4X25hbWU7PGJyPgqgIKAgoCCgIHdoaWxl
ICgqYykgezxicj4KoCCgIKAgoCCgIKAgoCCgIGlmIChzdHJjbXAobGludXhfbmFtZSwgJnF1b3Q7
YWN0aXZlJnF1b3Q7KT09MCkgezxicj4KoCCgIKAgoCCgIKAgoCCgIKAgoCCgIKAgc3RhdGUtJmd0
O2xpbmVfbGV2ZWwgPSBMRVZFTF9DMDs8YnI+CjxzcGFuIGNsYXNzPSJIT0VuWmIiPjxmb250IGNv
bG9yPSIjODg4ODg4Ij4tLTxicj4KMS43LjkuNTxicj4KPGJyPgo8L2ZvbnQ+PC9zcGFuPjwvYmxv
Y2txdW90ZT48L2Rpdj48YnI+Cg==

--===============2322696549677379092==--

