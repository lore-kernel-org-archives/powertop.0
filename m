Content-Type: multipart/mixed; boundary="===============6081884149619377078=="
MIME-Version: 1.0
From: Arjan van de Ven <arjan at linux.intel.com>
Subject: Re: [Powertop] USB devices get wrong power use values
Date: Sun, 13 Oct 2013 11:48:25 -0700
Message-ID: <525AEAF9.5080709@linux.intel.com>
In-Reply-To: 20131013162212.GH30504@merlins.org
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============6081884149619377078==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 10/13/2013 9:22 AM, Marc MERLIN wrote:

>> having a USB device active also generally makes the CPU/etc use much mor=
e power,
>> which Powertop "charges" to the USB device in question.
>>
>> 8 Watts sounds entirely reasonable for that to me...
>
> Aah, if the CPU gets involved, then yes, it's a bit more possible.
> So, a simple USB keyboard that's unused can keep one core awake and burn 8
> watts if something else goes wrong in the kernel to cause that?

a bad USB keyboard can keep the processor out of deep package C states..
not a lot the software can do about that...
but yet it can be THAT much power delta.

(we've seen for example on some servers that a cheap keyboard makes > 15 Wa=
tts difference, but measured
at the wall socket, so after the power supply/etc)


--===============6081884149619377078==--

