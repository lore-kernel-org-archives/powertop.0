Content-Type: multipart/mixed; boundary="===============3233280872570259054=="
MIME-Version: 1.0
From: Arjan van de Ven <arjan at linux.intel.com>
Subject: Re: [Powertop] 700+mW for nic:virbr0?
Date: Wed, 30 Aug 2017 14:48:33 -0700
Message-ID: <6b8d62d9-5292-83b4-2a89-b487a6da07d7@linux.intel.com>
In-Reply-To: CAJCQCtRUCK-Aie1tB2wiSfvxZD0cHL-XWKjDhA=TvLBEVB_SHw@mail.gmail.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============3233280872570259054==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 8/30/2017 2:36 PM, Chris Murphy wrote:
> The #2 power consumer on my laptop according to powertop is
> nic:virbr0 which seems unlikely. That's more than Firefox, and a bit
> less than the display backlight. And it's nearly 300x more power than
> used by the wifi driver.
> =


so powertop seems to correlate virbr activity with power consumption...
so while it may not be the virtual bridge itself to cause power consumption=
, the usage of it very likely is


--===============3233280872570259054==--

