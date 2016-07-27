Content-Type: multipart/mixed; boundary="===============6277426730080241332=="
MIME-Version: 1.0
From: Arjan van de Ven <arjan at linux.intel.com>
Subject: Re: [Powertop] cpu wiggle changes userspace governor settings
Date: Wed, 27 Jul 2016 06:04:59 -0700
Message-ID: <da360754-a907-e098-8437-c21f620d58a0@linux.intel.com>
In-Reply-To: 342d1204-68b7-7943-9a17-61b98f2763cb@tu-dresden.de
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============6277426730080241332==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 7/27/2016 12:10 AM, Thomas Ilsche wrote:
> On 2016-07-26 20:20, Joe Konno wrote:
>>> >
>>> > Please note that I don't really understand what you are trying to
>>> > achieve with the wiggle in the first place. It seems for instance
>>> > that this doesn't do anything if max_freq =3D=3D min_freq.
>> We need to force a perf event at the beginning of the sampling
>> period. That's the only way the code can determine the starting
>> frequency. There may be other/better ways to do this. Patches, input
>> always welcome.
>
> If the event is only used to get the frequency at the start, is there a r=
eason why scaling_cur_freq is not used instead?
>
mostly scaling_cur_freq returns a lie ;-(



--===============6277426730080241332==--

