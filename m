Content-Type: multipart/mixed; boundary="===============4683268603146145713=="
MIME-Version: 1.0
From: Alexandra Yates <alexandra.yates at linux.intel.com>
Subject: Re: [Powertop] [PATCH] Do not exit on MSR read errors
Date: Wed, 16 Sep 2015 12:19:28 -0700
Message-ID: <55F9C0C0.1020606@linux.intel.com>
In-Reply-To: 5550DEBF.6000207@linux.intel.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============4683268603146145713==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Jaroslav,

On 05/11/2015 09:54 AM, Arjan van de Ven wrote:
> but it's really not the right thing.
> the reason is that the statistics code still uses the "native intel =

> msr" model,
> so it gets all zeroes... it should use "just trust the kernel" model in
Based on Arjan's feedback do you have a change for this patch?  =

Otherwise I would have to reject it.

I'm also looking into all other submitted patches.

-- =

Thank you,
<Alexandra>


--===============4683268603146145713==--

