Content-Type: multipart/mixed; boundary="===============4625028825451518020=="
MIME-Version: 1.0
From: Arjan van de Ven <arjan at linux.intel.com>
Subject: Re: [Powertop] [RFC 0/9] Use udev for accessing sysfs
Date: Mon, 01 Jun 2015 09:09:23 -0700
Message-ID: <556C83B3.5070005@linux.intel.com>
In-Reply-To: 1433174955-17349-1-git-send-email-nanleychery@gmail.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============4625028825451518020==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 6/1/2015 9:09 AM, Nanley Chery wrote:
> From: Nanley Chery <nanley.g.chery(a)intel.com>
>
> This patch series changes PowerTOP's method of accessing sysfs (for
> tunables mainly) from explicitly accessing files to using the standard
> udev device management library and API.
>
> The current codebase collects data on devices by probing sysfs files
> directly with the usual low-level file handling API. This method is
> not recommended by the Linux kernel maintainers because the sysfs
> organization is not guaranteed to be stable over time. This can lead
> to dependent applications breaking with newer kernel releases. Instead
> using an abstraction layer, like udev, is suggested
> (see https://www.kernel.org/doc/Documentation/sysfs-rules.txt).

.... how does this work on Android ?



--===============4625028825451518020==--

