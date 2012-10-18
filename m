Content-Type: multipart/mixed; boundary="===============2506338167325703143=="
MIME-Version: 1.0
From: Arjan van de Ven <arjan at linux.intel.com>
Subject: Re: [Powertop] [RFC/PATCH] devices: Use new(std::nothrow) for
 creating devices
Date: Thu, 18 Oct 2012 08:36:05 -0700
Message-ID: <508021E5.8070209@linux.intel.com>
In-Reply-To: 1350574368-4657-1-git-send-email-namhyung@gmail.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============2506338167325703143==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 10/18/2012 8:32 AM, Namhyung Kim wrote:
> When allocation fails, just skip the device and proceed if possible.
> This is also for consistency with others.

hmm...
if we're that low on memory something is so seriously wrong, exiting is the=
 right answer really.

I'm getting strong advice from other userspace coders that checking allocat=
ions like this is actually
pointless...
based on that, I'd say we need to go for better code readability, not more =
complexity for no actual gain.



--===============2506338167325703143==--

