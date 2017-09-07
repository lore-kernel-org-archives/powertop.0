Content-Type: multipart/mixed; boundary="===============4189591810045872720=="
MIME-Version: 1.0
From: Joe Konno <joe.konno at linux.intel.com>
Subject: Re: [Powertop] RH Bugzilla [Bug 1482649] Logitech USB Unified
 Receiver+M570 need 'waking' up by click after kernel update
Date: Thu, 07 Sep 2017 13:03:47 -0700
Message-ID: <419c8d$u57vqs@orsmga003.jf.intel.com>
In-Reply-To: VI1PR0301MB2510765FF1A9FBAE0EDEFDFD87940@VI1PR0301MB2510.eurprd03.prod.outlook.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============4189591810045872720==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, 7 Sep 2017 18:09:59 +0000
Mike Simms <micsim2007(a)outlook.com> wrote:

> Then explain why it was never an issue before kernel 4.12 please

That's a question for the maintainer of the kernel USB HID driver driver
community. The Linux kernel is a very large piece of software with many, ma=
ny
device drivers supporting still more devices. These drivers can and do chan=
ge,
for myriad reasons, from kernel release to kernel release.

Particular device power management behaviors are implemented by kernel devi=
ce
drivers. PowerTOP gives you the ability to toggle (or tune) low-level,
power-sensitive settings for each device. If by toggling a setting for a
particular device that device behaves in an undesirable way, you may have a
kernel device driver bug.

USB HID-- human interface device-- drivers, which include mice and the like,
have an upstream kernel maintainer. In this specific case, the linux-usb
mailing list would be a good starting point, or the kernel.org bugzilla.

In the general case, consulting the kernel MAINTAINERS file for the device =
in
question should provide a mailing list starting point when issues like these
arise.

Here I can only offer general advice, nothing specific. Hope it helps!

--===============4189591810045872720==
Content-Type: application/pgp-signature
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.sig"

LS0tLS1CRUdJTiBQR1AgU0lHTkFUVVJFLS0tLS0KCmlRSXpCQUVCQ0FBZEZpRUVrUS8vcXlmRjdF
UndpV2hLalloSDFTOUtxbVlGQWxteHBpTUFDZ2tRalloSDFTOUsKcW1aZVJnLy9WQjNSS3dvdkE4
Q0EvN2VBc1dXSnd4MlMvZmRTVnJjSlkrdFRVUjhZbzBPT3hRaWgxNVo4aTdVQwptK1FHNUx6VVI5
U0ZQMENzV0hEQ3dCK1d3NXpjZWMwQ2dCOTZQdFRUd2l0cXoya2VIQ3EvUDJVTWlqZ0xYcU1iCkJm
dldPVjl1cVd3WTFwSmNXWGFxM1gzR1ZvQms2NXNtbWVndjFxalYvSktEQTlnbEpsZnBzNUYxQjlT
SHRkMk0KbzB0eVJjTy9XTXlhbWNEWXd3NUhNQ2k5M2NweVZHWHJyaFJJaFphWC8ydFFQMlFsUW9w
bFZJWG5KRnVTMDRYYwpnUlhqbmNIY1VZbmlxRG5qbWh6anJBWlltSWxQUTFQak1OVjI1d3dxelhS
ZHBOWTE4WTQ4V21DYkJOOUJzNlYrCmJ6SzhDdzUwY25XUmFteTZ5RkY4VTNZaVdYS2wvUHRjeDg1
UUllR3lDamp3K29YUzBWSE1HM1B6UHFwOHRqb0EKWWw1WHFPMzFKdzJCS2t0VDdZa1F0bjBCaVpI
aXZqcFlRcDZYZlFzalZrR1pXNXBNSStpaUZVNys1MGpiWld6aQpSVnIwVlFXSVlHZUNUU21MdEND
MW5Ec3VZVTRLQWxzbm16cEV2SDJRZlp2ZjVaNXZPblVVZTY3K20zNlZUeTc0CjFDWWZUZ2d4ZzRn
bHFJZ3VBUGNvSVU5eml4aE1wWnhTZ2RFSXRnTm1KR0g3cU5qQ1dOT0YzYjZwMTZRaVowaUQKWDQ1
NG9TUVI5T0hsU1Y5R0RZWUNySGpoRGZWQzlaR1J5MnoxL2ZwOWFnbEJ4eDRYSUJ0NWxUKyt2bDlQ
V0lEegp4UGtBRkJkb1hHbzc4U1RGNEhpZXhxSE9aOU50Y3VJSlh3MndnbTJ2cDJEWWdBQmFLcFE9
Cj1tVmJhCi0tLS0tRU5EIFBHUCBTSUdOQVRVUkUtLS0tLQo=

--===============4189591810045872720==--

