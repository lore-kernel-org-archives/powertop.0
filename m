Content-Type: multipart/mixed; boundary="===============6607825334735515798=="
MIME-Version: 1.0
From: Arjan van de Ven <arjan at linux.intel.com>
Subject: Re: [Powertop] [PATCH POWERTOP] auto tune option to set everything to
 bad state
Date: Sun, 30 Jun 2019 00:08:39 -0700
Message-ID: <0c7af46a-82b0-4257-1a38-33a37feb29a6@linux.intel.com>
In-Reply-To: CAG1ReXvvqjZjMz4jP5de5xjihp1Urjtg10wR84HjdETJ+dWqrQ@mail.gmail.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============6607825334735515798==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 6/29/2019 12:49 PM, Koosha Hosseiny wrote:
> Having the command `tuned-adm profile throughput-performance`, it's also =
nice to tell powertop to put everything in bad state.

so I'm not convinced on this. If all is bad you generally get lower through=
put
(power is performance nowadays... the top performance range is in many syst=
ems clipped by TDP and if you waste 1 Watt on say a SATA link your CPU
may say lose 100Mhz or more of turbo mode performance)

but maybe I miss the objective you're trying to achieve?



--===============6607825334735515798==--

