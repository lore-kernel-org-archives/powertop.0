Content-Type: multipart/mixed; boundary="===============9139339401808654069=="
MIME-Version: 1.0
From: Chris Ferron <chris.e.ferron at linux.intel.com>
Subject: Re: [Powertop] Powertop doesn't detects sleeping ARM cores
Date: Wed, 19 Sep 2012 08:15:59 -0700
Message-ID: <5059E1AF.3010000@linux.intel.com>
In-Reply-To: 505981D3.7010403@samsung.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============9139339401808654069==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 09/19/2012 01:26 AM, Igor Zhbanov wrote:
> Hi,
>
> Here is some notes to my previous post.
>
> I mean that only online cores are shown in /proc/cpuinfo.
> So the PowerTOP doesn't count currently offline ones.
> And you must run the PowerTOP on a heavy loaded system
> to let the PowerTOP see all CPU cores.
>
> Therefore it is impossible to run the PowerTOP before starting
> of heavy application to get information about all CPU cores.
>
> Probably the PowerTOP could cache CPU information in some file,
> so it will be possible to register trace events for all cores.
>
Off hand I don't have a good solution to help your ARM story. Your notes =

are interesting and I agree this is something that ARM is going to need. =

Do you have a complete solution you would like to purpose? I assume you =

have done some hacking to get around this, but if you have taken that =

and tuned it i suggest purposing the change. If you find a solution that =

doesn't digress the Architectures, and corrects the ARM story then =

please submit patches. I would be interested in seeing what you have =

come up with.

I will try and look for a general solution, are there any other ARM =

advocates on this list who would like to chime in?

-C


--===============9139339401808654069==--

