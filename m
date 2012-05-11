Content-Type: multipart/mixed; boundary="===============1445079483693264683=="
MIME-Version: 1.0
From: Arjan van de Ven <arjan at linux.intel.com>
Subject: Re: [Powertop] PowerTOP 2.0 bugs
Date: Fri, 11 May 2012 09:56:52 -0700
Message-ID: <4FAD44D4.2070802@linux.intel.com>
In-Reply-To: CABRT9RBEN=Jz6YuSRbVL+kob7Gb_LXPRhLN2pMq5Dm1wbpoR9A@mail.gmail.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============1445079483693264683==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 5/11/2012 9:29 AM, Marti Raudsepp wrote:
> Hi list,
> =

> I read that PowerTOP 2.0 was released yesterday, so I decided to give
> it a run again. First I saw some discrepancy in the CPU usage reported
> by PowerTOP. So I ran "while true; do openssl speed aes -multi 4;
> done" to utilize all my 4 CPU cores at 100%. htop displays utilization
> 4x100% all the time. PowerTOP thinks:
> =

> Summary: 0.2 wakeups/second,  0.0 GPU ops/second, 0.0 VFS ops/sec and
> 187.1% CPU use
> =

>                Usage       Events/s    Category       Description
>             1816 ms/s      0.00        Process        openssl speed
> aes -multi 4
> =

> The usage numbers are clearly bogus.

hmm we assumed these gaps would go away with the new perfevent library
(it solved cases we had here at least).

--===============1445079483693264683==--

