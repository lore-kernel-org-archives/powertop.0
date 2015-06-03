Content-Type: multipart/mixed; boundary="===============1221271348808413751=="
MIME-Version: 1.0
From: Nanley Chery <nanleychery at gmail.com>
Subject: Re: [Powertop] [RFC 6/9] replace pciutils usage with udevhwdb
Date: Wed, 03 Jun 2015 13:33:40 -0700
Message-ID: <CAJDL4uKfRA=171fktrMiaS=YzcL-mgOCMSfj-BYvRNG=ksqvVw@mail.gmail.com>
In-Reply-To: 556C8519.6050009@linux.intel.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============1221271348808413751==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 1, 2015 at 9:15 AM, Arjan van de Ven <arjan(a)linux.intel.com> =
wrote:
> On 6/1/2015 9:09 AM, Nanley Chery wrote:
>>
>> Signed-off-by: Nanley Chery <nanley.g.chery(a)intel.com>
>
>
> no commit message?
I've been sitting on these patches for a while and just wanted to get
them out into the open. Most of my comments are in the cover letter.
I'll try to be better about commit messages in the future however.

>
> also on some OSes the udevhwdb for PCI names is empty and the pciutils
> explicit file is needed
I can't think of any work-around to this issue. pciutils will have to
stick around.

--===============1221271348808413751==--

