Content-Type: multipart/mixed; boundary="===============4856917111231288911=="
MIME-Version: 1.0
From: Chris Murphy <lists at colorremedies.com>
Subject: Re: [Powertop] 700+mW for nic:virbr0?
Date: Wed, 30 Aug 2017 17:47:02 -0600
Message-ID: <CAJCQCtQ7Mh5_PyL+9RWpRb3A+Za=PT_oiuE0COoUBmk7c4p_vA@mail.gmail.com>
In-Reply-To: 6b8d62d9-5292-83b4-2a89-b487a6da07d7@linux.intel.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============4856917111231288911==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 30, 2017 at 3:48 PM, Arjan van de Ven <arjan(a)linux.intel.com>=
 wrote:
> On 8/30/2017 2:36 PM, Chris Murphy wrote:
>>
>> The #2 power consumer on my laptop according to powertop is
>> nic:virbr0 which seems unlikely. That's more than Firefox, and a bit
>> less than the display backlight. And it's nearly 300x more power than
>> used by the wifi driver.
>>
>
> so powertop seems to correlate virbr activity with power consumption...
> so while it may not be the virtual bridge itself to cause power consumpti=
on,
> the usage of it very likely is
>

It varies a lot, even while connected to the same AP. 190mW up to 2W.

-- =

Chris Murphy

--===============4856917111231288911==--

