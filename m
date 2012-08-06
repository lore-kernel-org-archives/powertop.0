Content-Type: multipart/mixed; boundary="===============5477769199952601403=="
MIME-Version: 1.0
From: Rajagopal Venkat <rajagopal.venkat at linaro.org>
Subject: Re: [Powertop] [PATCH 2/4] Make the "which C state line" logic better
Date: Mon, 06 Aug 2012 12:49:03 +0530
Message-ID: <CA+Z25wXQKuTpwh-0Y2VFqZW2+zDiAveXhrqwvQrztXN=Kb+hZg@mail.gmail.com>
In-Reply-To: 501EA9A7.8020900@linux.intel.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============5477769199952601403==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 5 August 2012 22:43, Arjan van de Ven <arjan(a)linux.intel.com> wrote:

> From 2e88a61859db0592707d1a0a35e33408a0327951 Mon Sep 17 00:00:00 2001
> From: Arjan van de Ven <arjan(a)linux.intel.com>
> Date: Sun, 5 Aug 2012 09:57:49 -0700
> Subject: [PATCH 2/4] Make the "which C state line" logic better
>
> the ARM guys complained that their human-readable C state names didn't ha=
ve
> numbers in them, and that as a result, the output is all messed up.
> Using the "linux_name" instead is only a partial solution; it messes up
> the x86
> side of the logic.
>
>
I fail to understand how using "linux_name" for parsing C states would mess
up
x86 logic. Each supported C state will have corresponding 'stateX' directory
(linux_name) which contain numbers in them. Also there are few hard coded
states in intel_cpus.cpp file, in which linux_name contains numbers in them
as well. In both the cases linux_name contains numbers and hence safe to
parse. Please let me know if I am missing something here.

Thanks.


> This patch fixes the logic to make the code use the human readable logic
> first,
> but if there's no numbers there, fall back to the Linux name.
>
> In addition, the patch allows callers to specify the line directly,
> overriding
> both sets of logic.
> ---
>  src/cpu/abstract_cpu.cpp |   21 ++++++++++++++++++---
>  src/cpu/cpu.h            |    4 ++--
>  2 files changed, 20 insertions(+), 5 deletions(-)
>
> diff --git a/src/cpu/abstract_cpu.cpp b/src/cpu/abstract_cpu.cpp
> index cd4eba0..8b4c650 100644
> --- a/src/cpu/abstract_cpu.cpp
> +++ b/src/cpu/abstract_cpu.cpp
> @@ -130,7 +130,7 @@ void abstract_cpu::measurement_end(void)
>         }
>  }
>
> -void abstract_cpu::insert_cstate(const char *linux_name, const char
> *human_name, uint64_t usage, uint64_t duration, int count)
> +void abstract_cpu::insert_cstate(const char *linux_name, const char
> *human_name, uint64_t usage, uint64_t duration, int count, int level)
>  {
>         struct idle_state *state;
>         const char *c;
> @@ -147,6 +147,8 @@ void abstract_cpu::insert_cstate(const char
> *linux_name, const char *human_name,
>         strcpy(state->linux_name, linux_name);
>         strcpy(state->human_name, human_name);
>
> +       state->line_level =3D -1;
> +
>         c =3D human_name;
>         while (*c) {
>                 if (strcmp(linux_name, "active")=3D=3D0) {
> @@ -160,6 +162,19 @@ void abstract_cpu::insert_cstate(const char
> *linux_name, const char *human_name,
>                 c++;
>         }
>
> +       /* some architectures (ARM) don't have good numbers in thier human
> name.. fall back to the linux name for those */
> +       c =3D linux_name;
> +       while (*c && state->line_level < 0) {
> +               if (*c >=3D '0' && *c <=3D'9') {
> +                       state->line_level =3D strtoull(c, NULL, 10);
> +                       break;
> +               }
> +               c++;
> +       }
> +
> +       if (level >=3D 0)
> +               state->line_level =3D level;
> +
>         state->usage_before =3D usage;
>         state->duration_before =3D duration;
>         state->before_count =3D count;
> @@ -187,7 +202,7 @@ void abstract_cpu::finalize_cstate(const char
> *linux_name, uint64_t usage, uint6
>         state->after_count +=3D count;
>  }
>
> -void abstract_cpu::update_cstate(const char *linux_name, const char
> *human_name, uint64_t usage, uint64_t duration, int count)
> +void abstract_cpu::update_cstate(const char *linux_name, const char
> *human_name, uint64_t usage, uint64_t duration, int count, int level)
>  {
>         unsigned int i;
>         struct idle_state *state =3D NULL;
> @@ -200,7 +215,7 @@ void abstract_cpu::update_cstate(const char
> *linux_name, const char *human_name,
>         }
>
>         if (!state) {
> -               insert_cstate(linux_name, human_name, usage, duration,
> count);
> +               insert_cstate(linux_name, human_name, usage, duration,
> count, level);
>                 return;
>         }
>
> diff --git a/src/cpu/cpu.h b/src/cpu/cpu.h
> index b48ada9..d51e3b2 100644
> --- a/src/cpu/cpu.h
> +++ b/src/cpu/cpu.h
> @@ -111,8 +111,8 @@ public:
>
>         /* C state related methods */
>
> -       void            insert_cstate(const char *linux_name, const char
> *human_name, uint64_t usage, uint64_t duration, int count);
> -       void            update_cstate(const char *linux_name, const char
> *human_name, uint64_t usage, uint64_t duration, int count);
> +       void            insert_cstate(const char *linux_name, const char
> *human_name, uint64_t usage, uint64_t duration, int count, int level =3D =
-1);
> +       void            update_cstate(const char *linux_name, const char
> *human_name, uint64_t usage, uint64_t duration, int count, int level =3D =
-1);
>         void            finalize_cstate(const char *linux_name, uint64_t
> usage, uint64_t duration, int count);
>
>         virtual int     has_cstate_level(int level);
> --
> 1.7.7.6
>
>


-- =

Regards,
Rajagopal

--===============5477769199952601403==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PGJyPjxkaXYgY2xhc3M9ImdtYWlsX3F1b3RlIj5PbiA1IEF1Z3VzdCAyMDEyIDIyOjQzLCBBcmph
biB2YW4gZGUgVmVuIDxzcGFuIGRpcj0ibHRyIj4mbHQ7PGEgaHJlZj0ibWFpbHRvOmFyamFuQGxp
bnV4LmludGVsLmNvbSIgdGFyZ2V0PSJfYmxhbmsiPmFyamFuQGxpbnV4LmludGVsLmNvbTwvYT4m
Z3Q7PC9zcGFuPiB3cm90ZTo8YnI+PGJsb2NrcXVvdGUgY2xhc3M9ImdtYWlsX3F1b3RlIiBzdHls
ZT0ibWFyZ2luOjAgMCAwIC44ZXg7Ym9yZGVyLWxlZnQ6MXB4ICNjY2Mgc29saWQ7cGFkZGluZy1s
ZWZ0OjFleCI+Cj5Gcm9tIDJlODhhNjE4NTlkYjA1OTI3MDdkMWEwYTM1ZTMzNDA4YTAzMjc5NTEg
TW9uIFNlcCAxNyAwMDowMDowMCAyMDAxPGJyPgpGcm9tOiBBcmphbiB2YW4gZGUgVmVuICZsdDs8
YSBocmVmPSJtYWlsdG86YXJqYW5AbGludXguaW50ZWwuY29tIj5hcmphbkBsaW51eC5pbnRlbC5j
b208L2E+Jmd0Ozxicj4KRGF0ZTogU3VuLCA1IEF1ZyAyMDEyIDA5OjU3OjQ5IC0wNzAwPGJyPgpT
dWJqZWN0OiBbUEFUQ0ggMi80XSBNYWtlIHRoZSAmcXVvdDt3aGljaCBDIHN0YXRlIGxpbmUmcXVv
dDsgbG9naWMgYmV0dGVyPGJyPgo8YnI+CnRoZSBBUk0gZ3V5cyBjb21wbGFpbmVkIHRoYXQgdGhl
aXIgaHVtYW4tcmVhZGFibGUgQyBzdGF0ZSBuYW1lcyBkaWRuJiMzOTt0IGhhdmU8YnI+Cm51bWJl
cnMgaW4gdGhlbSwgYW5kIHRoYXQgYXMgYSByZXN1bHQsIHRoZSBvdXRwdXQgaXMgYWxsIG1lc3Nl
ZCB1cC48YnI+ClVzaW5nIHRoZSAmcXVvdDtsaW51eF9uYW1lJnF1b3Q7IGluc3RlYWQgaXMgb25s
eSBhIHBhcnRpYWwgc29sdXRpb247IGl0IG1lc3NlcyB1cCB0aGUgeDg2PGJyPgpzaWRlIG9mIHRo
ZSBsb2dpYy48YnI+Cjxicj48L2Jsb2NrcXVvdGU+PGRpdj6gPC9kaXY+PGRpdj5JIGZhaWwgdG8g
dW5kZXJzdGFuZCBob3cgdXNpbmcgJnF1b3Q7bGludXhfbmFtZSZxdW90OyBmb3IgcGFyc2luZyBD
IHN0YXRlcyB3b3VsZCBtZXNzIHVwPGJyPgp4ODYgbG9naWMuIEVhY2ggc3VwcG9ydGVkIEMgc3Rh
dGUgd2lsbCBoYXZlIGNvcnJlc3BvbmRpbmcgJiMzOTtzdGF0ZVgmIzM5OyBkaXJlY3Rvcnk8YnI+
KGxpbnV4X25hbWUpIHdoaWNoIGNvbnRhaW4gbnVtYmVycyBpbiB0aGVtLiBBbHNvIHRoZXJlIGFy
ZSBmZXcgaGFyZCBjb2RlZDxicj5zdGF0ZXMgaW4gaW50ZWxfY3B1cy5jcHAgZmlsZSwgaW4gd2hp
Y2ggbGludXhfbmFtZSBjb250YWlucyBudW1iZXJzIGluIHRoZW08YnI+CmFzIHdlbGwuIEluIGJv
dGggdGhlIGNhc2VzIGxpbnV4X25hbWUgY29udGFpbnMgbnVtYmVycyBhbmQgaGVuY2Ugc2FmZSB0
bzxicj5wYXJzZS4gUGxlYXNlIGxldCBtZSBrbm93IGlmIEkgYW0gbWlzc2luZyBzb21ldGhpbmcg
aGVyZS48YnI+PGJyPlRoYW5rcy48YnI+oDxicj48L2Rpdj48YmxvY2txdW90ZSBjbGFzcz0iZ21h
aWxfcXVvdGUiIHN0eWxlPSJtYXJnaW46MHB4IDBweCAwcHggMC44ZXg7Ym9yZGVyLWxlZnQ6MXB4
IHNvbGlkIHJnYigyMDQsMjA0LDIwNCk7cGFkZGluZy1sZWZ0OjFleCI+CgpUaGlzIHBhdGNoIGZp
eGVzIHRoZSBsb2dpYyB0byBtYWtlIHRoZSBjb2RlIHVzZSB0aGUgaHVtYW4gcmVhZGFibGUgbG9n
aWMgZmlyc3QsPGJyPgpidXQgaWYgdGhlcmUmIzM5O3Mgbm8gbnVtYmVycyB0aGVyZSwgZmFsbCBi
YWNrIHRvIHRoZSBMaW51eCBuYW1lLjxicj4KPGJyPgpJbiBhZGRpdGlvbiwgdGhlIHBhdGNoIGFs
bG93cyBjYWxsZXJzIHRvIHNwZWNpZnkgdGhlIGxpbmUgZGlyZWN0bHksIG92ZXJyaWRpbmc8YnI+
CmJvdGggc2V0cyBvZiBsb2dpYy48YnI+Ci0tLTxicj4KoHNyYy9jcHUvYWJzdHJhY3RfY3B1LmNw
cCB8IKAgMjEgKysrKysrKysrKysrKysrKysrLS0tPGJyPgqgc3JjL2NwdS9jcHUuaCCgIKAgoCCg
IKAgoHwgoCCgNCArKy0tPGJyPgqgMiBmaWxlcyBjaGFuZ2VkLCAyMCBpbnNlcnRpb25zKCspLCA1
IGRlbGV0aW9ucygtKTxicj4KPGJyPgpkaWZmIC0tZ2l0IGEvc3JjL2NwdS9hYnN0cmFjdF9jcHUu
Y3BwIGIvc3JjL2NwdS9hYnN0cmFjdF9jcHUuY3BwPGJyPgppbmRleCBjZDRlYmEwLi44YjRjNjUw
IDEwMDY0NDxicj4KLS0tIGEvc3JjL2NwdS9hYnN0cmFjdF9jcHUuY3BwPGJyPgorKysgYi9zcmMv
Y3B1L2Fic3RyYWN0X2NwdS5jcHA8YnI+CkBAIC0xMzAsNyArMTMwLDcgQEAgdm9pZCBhYnN0cmFj
dF9jcHU6Om1lYXN1cmVtZW50X2VuZCh2b2lkKTxicj4KoCCgIKAgoCB9PGJyPgqgfTxicj4KPGJy
Pgotdm9pZCBhYnN0cmFjdF9jcHU6Omluc2VydF9jc3RhdGUoY29uc3QgY2hhciAqbGludXhfbmFt
ZSwgY29uc3QgY2hhciAqaHVtYW5fbmFtZSwgdWludDY0X3QgdXNhZ2UsIHVpbnQ2NF90IGR1cmF0
aW9uLCBpbnQgY291bnQpPGJyPgordm9pZCBhYnN0cmFjdF9jcHU6Omluc2VydF9jc3RhdGUoY29u
c3QgY2hhciAqbGludXhfbmFtZSwgY29uc3QgY2hhciAqaHVtYW5fbmFtZSwgdWludDY0X3QgdXNh
Z2UsIHVpbnQ2NF90IGR1cmF0aW9uLCBpbnQgY291bnQsIGludCBsZXZlbCk8YnI+CqB7PGJyPgqg
IKAgoCCgIHN0cnVjdCBpZGxlX3N0YXRlICpzdGF0ZTs8YnI+CqAgoCCgIKAgY29uc3QgY2hhciAq
Yzs8YnI+CkBAIC0xNDcsNiArMTQ3LDggQEAgdm9pZCBhYnN0cmFjdF9jcHU6Omluc2VydF9jc3Rh
dGUoY29uc3QgY2hhciAqbGludXhfbmFtZSwgY29uc3QgY2hhciAqaHVtYW5fbmFtZSw8YnI+CqAg
oCCgIKAgc3RyY3B5KHN0YXRlLSZndDtsaW51eF9uYW1lLCBsaW51eF9uYW1lKTs8YnI+CqAgoCCg
IKAgc3RyY3B5KHN0YXRlLSZndDtodW1hbl9uYW1lLCBodW1hbl9uYW1lKTs8YnI+Cjxicj4KKyCg
IKAgoCBzdGF0ZS0mZ3Q7bGluZV9sZXZlbCA9IC0xOzxicj4KKzxicj4KoCCgIKAgoCBjID0gaHVt
YW5fbmFtZTs8YnI+CqAgoCCgIKAgd2hpbGUgKCpjKSB7PGJyPgqgIKAgoCCgIKAgoCCgIKAgaWYg
KHN0cmNtcChsaW51eF9uYW1lLCAmcXVvdDthY3RpdmUmcXVvdDspPT0wKSB7PGJyPgpAQCAtMTYw
LDYgKzE2MiwxOSBAQCB2b2lkIGFic3RyYWN0X2NwdTo6aW5zZXJ0X2NzdGF0ZShjb25zdCBjaGFy
ICpsaW51eF9uYW1lLCBjb25zdCBjaGFyICpodW1hbl9uYW1lLDxicj4KoCCgIKAgoCCgIKAgoCCg
IGMrKzs8YnI+CqAgoCCgIKAgfTxicj4KPGJyPgorIKAgoCCgIC8qIHNvbWUgYXJjaGl0ZWN0dXJl
cyAoQVJNKSBkb24mIzM5O3QgaGF2ZSBnb29kIG51bWJlcnMgaW4gdGhpZXIgaHVtYW4gbmFtZS4u
IGZhbGwgYmFjayB0byB0aGUgbGludXggbmFtZSBmb3IgdGhvc2UgKi88YnI+CisgoCCgIKAgYyA9
IGxpbnV4X25hbWU7PGJyPgorIKAgoCCgIHdoaWxlICgqYyAmYW1wOyZhbXA7IHN0YXRlLSZndDts
aW5lX2xldmVsICZsdDsgMCkgezxicj4KKyCgIKAgoCCgIKAgoCCgIGlmICgqYyAmZ3Q7PSAmIzM5
OzAmIzM5OyAmYW1wOyZhbXA7ICpjICZsdDs9JiMzOTs5JiMzOTspIHs8YnI+CisgoCCgIKAgoCCg
IKAgoCCgIKAgoCCgIHN0YXRlLSZndDtsaW5lX2xldmVsID0gc3RydG91bGwoYywgTlVMTCwgMTAp
Ozxicj4KKyCgIKAgoCCgIKAgoCCgIKAgoCCgIKAgYnJlYWs7PGJyPgorIKAgoCCgIKAgoCCgIKAg
fTxicj4KKyCgIKAgoCCgIKAgoCCgIGMrKzs8YnI+CisgoCCgIKAgfTxicj4KKzxicj4KKyCgIKAg
oCBpZiAobGV2ZWwgJmd0Oz0gMCk8YnI+CisgoCCgIKAgoCCgIKAgoCBzdGF0ZS0mZ3Q7bGluZV9s
ZXZlbCA9IGxldmVsOzxicj4KKzxicj4KoCCgIKAgoCBzdGF0ZS0mZ3Q7dXNhZ2VfYmVmb3JlID0g
dXNhZ2U7PGJyPgqgIKAgoCCgIHN0YXRlLSZndDtkdXJhdGlvbl9iZWZvcmUgPSBkdXJhdGlvbjs8
YnI+CqAgoCCgIKAgc3RhdGUtJmd0O2JlZm9yZV9jb3VudCA9IGNvdW50Ozxicj4KQEAgLTE4Nyw3
ICsyMDIsNyBAQCB2b2lkIGFic3RyYWN0X2NwdTo6ZmluYWxpemVfY3N0YXRlKGNvbnN0IGNoYXIg
KmxpbnV4X25hbWUsIHVpbnQ2NF90IHVzYWdlLCB1aW50Njxicj4KoCCgIKAgoCBzdGF0ZS0mZ3Q7
YWZ0ZXJfY291bnQgKz0gY291bnQ7PGJyPgqgfTxicj4KPGJyPgotdm9pZCBhYnN0cmFjdF9jcHU6
OnVwZGF0ZV9jc3RhdGUoY29uc3QgY2hhciAqbGludXhfbmFtZSwgY29uc3QgY2hhciAqaHVtYW5f
bmFtZSwgdWludDY0X3QgdXNhZ2UsIHVpbnQ2NF90IGR1cmF0aW9uLCBpbnQgY291bnQpPGJyPgor
dm9pZCBhYnN0cmFjdF9jcHU6OnVwZGF0ZV9jc3RhdGUoY29uc3QgY2hhciAqbGludXhfbmFtZSwg
Y29uc3QgY2hhciAqaHVtYW5fbmFtZSwgdWludDY0X3QgdXNhZ2UsIHVpbnQ2NF90IGR1cmF0aW9u
LCBpbnQgY291bnQsIGludCBsZXZlbCk8YnI+CqB7PGJyPgqgIKAgoCCgIHVuc2lnbmVkIGludCBp
Ozxicj4KoCCgIKAgoCBzdHJ1Y3QgaWRsZV9zdGF0ZSAqc3RhdGUgPSBOVUxMOzxicj4KQEAgLTIw
MCw3ICsyMTUsNyBAQCB2b2lkIGFic3RyYWN0X2NwdTo6dXBkYXRlX2NzdGF0ZShjb25zdCBjaGFy
ICpsaW51eF9uYW1lLCBjb25zdCBjaGFyICpodW1hbl9uYW1lLDxicj4KoCCgIKAgoCB9PGJyPgo8
YnI+CqAgoCCgIKAgaWYgKCFzdGF0ZSkgezxicj4KLSCgIKAgoCCgIKAgoCCgIGluc2VydF9jc3Rh
dGUobGludXhfbmFtZSwgaHVtYW5fbmFtZSwgdXNhZ2UsIGR1cmF0aW9uLCBjb3VudCk7PGJyPgor
IKAgoCCgIKAgoCCgIKAgaW5zZXJ0X2NzdGF0ZShsaW51eF9uYW1lLCBodW1hbl9uYW1lLCB1c2Fn
ZSwgZHVyYXRpb24sIGNvdW50LCBsZXZlbCk7PGJyPgqgIKAgoCCgIKAgoCCgIKAgcmV0dXJuOzxi
cj4KoCCgIKAgoCB9PGJyPgo8YnI+CmRpZmYgLS1naXQgYS9zcmMvY3B1L2NwdS5oIGIvc3JjL2Nw
dS9jcHUuaDxicj4KaW5kZXggYjQ4YWRhOS4uZDUxZTNiMiAxMDA2NDQ8YnI+Ci0tLSBhL3NyYy9j
cHUvY3B1Lmg8YnI+CisrKyBiL3NyYy9jcHUvY3B1Lmg8YnI+CkBAIC0xMTEsOCArMTExLDggQEAg
cHVibGljOjxicj4KPGJyPgqgIKAgoCCgIC8qIEMgc3RhdGUgcmVsYXRlZCBtZXRob2RzICovPGJy
Pgo8YnI+Ci0goCCgIKAgdm9pZCCgIKAgoCCgIKAgoGluc2VydF9jc3RhdGUoY29uc3QgY2hhciAq
bGludXhfbmFtZSwgY29uc3QgY2hhciAqaHVtYW5fbmFtZSwgdWludDY0X3QgdXNhZ2UsIHVpbnQ2
NF90IGR1cmF0aW9uLCBpbnQgY291bnQpOzxicj4KLSCgIKAgoCB2b2lkIKAgoCCgIKAgoCCgdXBk
YXRlX2NzdGF0ZShjb25zdCBjaGFyICpsaW51eF9uYW1lLCBjb25zdCBjaGFyICpodW1hbl9uYW1l
LCB1aW50NjRfdCB1c2FnZSwgdWludDY0X3QgZHVyYXRpb24sIGludCBjb3VudCk7PGJyPgorIKAg
oCCgIHZvaWQgoCCgIKAgoCCgIKBpbnNlcnRfY3N0YXRlKGNvbnN0IGNoYXIgKmxpbnV4X25hbWUs
IGNvbnN0IGNoYXIgKmh1bWFuX25hbWUsIHVpbnQ2NF90IHVzYWdlLCB1aW50NjRfdCBkdXJhdGlv
biwgaW50IGNvdW50LCBpbnQgbGV2ZWwgPSAtMSk7PGJyPgorIKAgoCCgIHZvaWQgoCCgIKAgoCCg
IKB1cGRhdGVfY3N0YXRlKGNvbnN0IGNoYXIgKmxpbnV4X25hbWUsIGNvbnN0IGNoYXIgKmh1bWFu
X25hbWUsIHVpbnQ2NF90IHVzYWdlLCB1aW50NjRfdCBkdXJhdGlvbiwgaW50IGNvdW50LCBpbnQg
bGV2ZWwgPSAtMSk7PGJyPgqgIKAgoCCgIHZvaWQgoCCgIKAgoCCgIKBmaW5hbGl6ZV9jc3RhdGUo
Y29uc3QgY2hhciAqbGludXhfbmFtZSwgdWludDY0X3QgdXNhZ2UsIHVpbnQ2NF90IGR1cmF0aW9u
LCBpbnQgY291bnQpOzxicj4KPGJyPgqgIKAgoCCgIHZpcnR1YWwgaW50IKAgoCBoYXNfY3N0YXRl
X2xldmVsKGludCBsZXZlbCk7PGJyPgo8c3BhbiBjbGFzcz0iSE9FblpiIj48Zm9udCBjb2xvcj0i
Izg4ODg4OCI+LS08YnI+CjEuNy43LjY8YnI+Cjxicj4KPC9mb250Pjwvc3Bhbj48L2Jsb2NrcXVv
dGU+PC9kaXY+PGJyPjxiciBjbGVhcj0iYWxsIj48YnI+LS0gPGJyPlJlZ2FyZHMsPGJyPlJhamFn
b3BhbDxicj48YnI+Cg==

--===============5477769199952601403==--

