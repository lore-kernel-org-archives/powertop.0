Content-Type: multipart/mixed; boundary="===============8828072945710860727=="
MIME-Version: 1.0
From: Nanley Chery <nanleychery at gmail.com>
Subject: Re: [Powertop] [RFC 0/9] Use udev for accessing sysfs
Date: Wed, 03 Jun 2015 13:23:31 -0700
Message-ID: <CAJDL4uLsyFK5DJsbC1b4yKyJEqKxUKrUmGk-QZUriiz4af8QvQ@mail.gmail.com>
In-Reply-To: 556C83B3.5070005@linux.intel.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============8828072945710860727==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 1, 2015 at 9:09 AM, Arjan van de Ven <arjan(a)linux.intel.com> =
wrote:
> On 6/1/2015 9:09 AM, Nanley Chery wrote:
>>
>> From: Nanley Chery <nanley.g.chery(a)intel.com>
>>
>> This patch series changes PowerTOP's method of accessing sysfs (for
>> tunables mainly) from explicitly accessing files to using the standard
>> udev device management library and API.
>>
>> The current codebase collects data on devices by probing sysfs files
>> directly with the usual low-level file handling API. This method is
>> not recommended by the Linux kernel maintainers because the sysfs
>> organization is not guaranteed to be stable over time. This can lead
>> to dependent applications breaking with newer kernel releases. Instead
>> using an abstraction layer, like udev, is suggested
>> (see https://www.kernel.org/doc/Documentation/sysfs-rules.txt).
>
>
> .... how does this work on Android ?

That's a good question. I actually hadn't considered the affects on
that platform. It seems like there is no udev-like abstraction layer
on Android. It looks like the way forward would be to either keep a
separate folder for android specific code or to create more helper
functions to abstract how we access sysfs. The latter method seems
preferable because it wouldn't increase the complexity of the project
as a whole. Thoughts?

- Nanley

--===============8828072945710860727==--

