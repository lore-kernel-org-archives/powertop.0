Content-Type: multipart/mixed; boundary="===============4524302365896767653=="
MIME-Version: 1.0
From: Rajagopal Venkat <rajagopal.venkat at linaro.org>
Subject: [Powertop] Suspecting incorrect if check during powertop init
Date: Tue, 07 Aug 2012 16:24:55 +0530
Message-ID: <CA+Z25wVQkpQx-_JfHJJZVD_7vhzf4u=T78Jg7PfVBqXUZY8n2A@mail.gmail.com>
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============4524302365896767653==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi,

Recently a patch[1] is applied to remove boardname support from powertop.
This commit adds few lines of code to powertop_init(), to initialize two
global variables. I suspect, if condition is not correct and is suppose
to be as follows. Is that intentional?

        if (access("/var/cache/powertop/saved_parameters.powertop", R_OK)
=3D=3D 0 ||
            access("/data/local/powertop/saved_parameters.powertop", R_OK)
=3D=3D 0) {
                global_fixed_parameters =3D 1;
                global_power_override =3D 1;
        }


[1] commit 1c7b4b999cb172b59833f829ab7b95fab11d7a00<https://github.com/fenr=
us75/powertop/commit/1c7b4b999cb172b59833f829ab7b95fab11d7a00>
-- =

Regards,
Rajagopal

--===============4524302365896767653==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

SGksPGJyPjxicj5SZWNlbnRseSBhIHBhdGNoPHNwYW4gY2xhc3M9InNoYS1ibG9jayI+PHNwYW4g
Y2xhc3M9InNoYSBqcy1zZWxlY3RhYmxlLXRleHQiPjwvc3Bhbj48L3NwYW4+WzFdIGlzIGFwcGxp
ZWQgdG8gcmVtb3ZlIGJvYXJkbmFtZSBzdXBwb3J0IGZyb20gcG93ZXJ0b3AuPGJyPlRoaXMgY29t
bWl0IGFkZHMgZmV3IGxpbmVzIG9mIGNvZGUgdG8gcG93ZXJ0b3BfaW5pdCgpLCB0byBpbml0aWFs
aXplIHR3bzxicj4KZ2xvYmFsIHZhcmlhYmxlcy4gSSBzdXNwZWN0LCBpZiBjb25kaXRpb24gaXMg
bm90IGNvcnJlY3QgYW5kIGlzIHN1cHBvc2U8YnI+dG8gYmUgYXMgZm9sbG93cy4gSXMgdGhhdCBp
bnRlbnRpb25hbD88YnI+oDxicj6goKCgoKCgIGlmIChhY2Nlc3MoJnF1b3Q7L3Zhci9jYWNoZS9w
b3dlcnRvcC9zYXZlZF9wYXJhbWV0ZXJzLnBvd2VydG9wJnF1b3Q7LCBSX09LKSA9PSAwIHx8PGJy
PqCgoKCgoKCgoKCgIGFjY2VzcygmcXVvdDsvZGF0YS9sb2NhbC9wb3dlcnRvcC9zYXZlZF9wYXJh
bWV0ZXJzLnBvd2VydG9wJnF1b3Q7LCBSX09LKSA9PSAwKSB7PGJyPgqgoKCgoKCgoKCgoKCgoKAg
Z2xvYmFsX2ZpeGVkX3BhcmFtZXRlcnMgPSAxOzxicj6goKCgoKCgoKCgoKCgoKAgZ2xvYmFsX3Bv
d2VyX292ZXJyaWRlID0gMTs8YnI+oKCgoKCgoCB9PGJyPqA8YnI+PGJyPlsxXSBjb21taXQgPGEg
aHJlZj0iaHR0cHM6Ly9naXRodWIuY29tL2ZlbnJ1czc1L3Bvd2VydG9wL2NvbW1pdC8xYzdiNGI5
OTljYjE3MmI1OTgzM2Y4MjlhYjdiOTVmYWIxMWQ3YTAwIj48c3BhbiBjbGFzcz0ic2hhLWJsb2Nr
Ij48c3BhbiBjbGFzcz0ic2hhIGpzLXNlbGVjdGFibGUtdGV4dCI+MWM3YjRiOTk5Y2IxNzJiNTk4
MzNmODI5YWI3Yjk1ZmFiMTFkN2EwMDwvc3Bhbj48L3NwYW4+PC9hPjxicj4KLS0gPGJyPlJlZ2Fy
ZHMsPGJyPlJhamFnb3BhbDxicj48YnI+Cg==

--===============4524302365896767653==--

