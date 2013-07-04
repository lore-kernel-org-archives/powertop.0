Content-Type: multipart/mixed; boundary="===============5148117848188003641=="
MIME-Version: 1.0
From: Niels Penneman <niels at penneman.org>
Subject: [Powertop] Intel GPU statistics on multi-GPU systems
Date: Thu, 04 Jul 2013 09:47:08 +0200
Message-ID: <51D5287C.1090503@penneman.org>
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============5148117848188003641==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi all,

Currently powertop tries to find Intel GPU statistics in sysfs with a
hardcoded path; in src/cpu/cpu.cpp:353-354:

if (access("/sys/class/drm/card0/power/rc6_residency_ms", R_OK) =3D=3D 0)
 handle_i965_gpu();

In systems with multiple GPUs it is not guaranteed that the Intel GPU is
labeled 'card0' in sysfs. In my system with both integrated Intel and
discrete AMD Radeon the Intel GPU is 'card1', and powertop will not
display GPU statistics.

One possible solution would be to scan all /sys/class/drm/card[0-9]+
folders and check the vendor & device IDs in 'device/vendor' and
'device/device'. Perhaps there is a better solution, e.g. by examining
the PCI device tree.


Regards,

-- =

Niels Penneman
Computer Systems Lab
Electronics and Information Systems Department
Ghent University


--===============5148117848188003641==
Content-Type: application/pgp-signature
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="signature.asc"

LS0tLS1CRUdJTiBQR1AgU0lHTkFUVVJFLS0tLS0KVmVyc2lvbjogR251UEcgdjIuMC4xOSAoR05V
L0xpbnV4KQpDb21tZW50OiBVc2luZyBHbnVQRyB3aXRoIFRodW5kZXJiaXJkIC0gaHR0cDovL3d3
dy5lbmlnbWFpbC5uZXQvCgppUUljQkFFQkFnQUdCUUpSMVNpRUFBb0pFTEgyOFAyQndvM0Nram9Q
L1JOLy9pWFNqb0hRUFR2VUFsVTdmekhxCmJ1amRJemt6aTVxd1dwSTNoMmxiZFFEWWMyMytqUytT
SStHNExmMGh0eTM0Qzd1TlduNUtXOGZBamNYYjh4b20KenZkbFZRRFVuK1FsejNzeUdhNlNxZEN2
U3lRalJBVlc3ZnppU2JDRnUwWVNlTVlyVklsZlFDaG1LemExN2IydAp4dExnZ3Q3UExnUDNnYUEv
ajV1eVliVXo0OEVUekE0bUJxVFJGUXVoMUk5M3EyRlZuZkhUYStaZFlkWFFZSk8rCmVFOC8rdEp4
a0Nwbnd5bU1JOU5RSllEOGxBbTllMmRqWGsvN09nMnl6Y0pEWC9UOGY3VVVmdHVpOXg0NVpTUWEK
cmJqRVFFbFEzNCtiQXdHdm1hSVJNMHFIblBOMENvOGhGWnQ2djd2Z1lxOTBqL2hVaWNHWFZIbGZt
TGxvN25TWQpKN1daVVVjQkJLVnR5SFAzQnZUTW9IK3YyRnFnMVZPazhjTG1CdmEwZEN5ZG9STU9Y
dExORkVWd2EyemM2NlRzClN6RzRHY2o4STBDeHIzNFJiekJBNHFwMmlYZUxBNm5qMDJSWEZXYXJz
Y1VKNnRDeWpING8rQm1YQjAwakZCVUEKYUpPMjVncnJjQXN4bFcwYTRoVlpZYkFMZlJIWmdRbUpO
aFY5Yzg3V3p6azcvVk5PQzZ5eDg4ZnFrbk9MRjRucwptUlVES3RKYldPTXQ4OVJXNmYvMUhqZGNE
d0t0OG5GM3RvLzBHaWs4NHdOWm0rbnVRUW9rcW1aZFJiNTF1TEtiCk8zUlVNdU9aN2M3UUZINHNK
NGI1alovT1NadWJoYkpxb2VTZGduZXFWQzh0cjcvNGZKWEpOcGUxeW5YTEk0RXMKWWVvMGJ5VDU1
ZEpjNC9qRTBHb0wKPTg5NjMKLS0tLS1FTkQgUEdQIFNJR05BVFVSRS0tLS0tCg==

--===============5148117848188003641==--

