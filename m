Content-Type: multipart/mixed; boundary="===============3790995355922450950=="
MIME-Version: 1.0
From: Chris Ferron <chris.e.ferron at linux.intel.com>
Subject: Re: [Powertop] PowerTOP 2.0 bugs
Date: Mon, 14 May 2012 15:05:20 -0700
Message-ID: <4FB181A0.9020803@linux.intel.com>
In-Reply-To: CABRT9RBEN=Jz6YuSRbVL+kob7Gb_LXPRhLN2pMq5Dm1wbpoR9A@mail.gmail.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============3790995355922450950==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 05/11/2012 09:29 AM, Marti Raudsepp wrote:
> Hi list,
>
> I read that PowerTOP 2.0 was released yesterday, so I decided to give
> it a run again. First I saw some discrepancy in the CPU usage reported
> by PowerTOP. So I ran "while true; do openssl speed aes -multi 4;
> done" to utilize all my 4 CPU cores at 100%. htop displays utilization
> 4x100% all the time. PowerTOP thinks:
Can you please tell me what system, processors and distro (and version) =

you are running?
Also are you running in a VM by chance?

> Summary: 0.2 wakeups/second,  0.0 GPU ops/second, 0.0 VFS ops/sec and
> 187.1% CPU use
>
>                 Usage       Events/s    Category       Description
>              1816 ms/s      0.00        Process        openssl speed
> aes -multi 4
>
> The usage numbers are clearly bogus.
Why do you think theyt
> Then I remembered that I already reported some bugs about the PowerTOP
> 2.0 beta release I tested in January 2011:
>
> On Thu, Jan 13, 2011 at 9:14 PM, Marti Raudsepp<marti(a)juffo.org>  wrote:
>> First, I also see an empty "Idle stats" screen, as reported by Ian
>> Kumlien earlier. Old PowerTOP didn't report idle state statistics
>> either, but at least it had an explanatory message.
> "Idle stats page" is still empty:
>
>           Package   |            CPU 0
>                     |            CPU 1
>                     |            CPU 2
>                     |            CPU 3
>
>> Fourth, the "Frequency stats" screen starts up showing good numbers,
>> but after the first refresh, all per-core numbers turn bogus. For each
>> core, the percentages always add up to 1895% !
> Still occurs, but now the magic constant is always 1961.1%
>
>             Package |            CPU 0
> Idle         0.0%   | Idle         0.6%
>   800 MHz     0.0%   |  800 MHz     0.4%
> 3.00 GHz   100.0%   | 3.00 GHz   1960.1%
> 1.80 GHz     0.0%   | 2.31 GHz     0.0%
> 2.31 GHz     0.0%   |
>
>                     |            CPU 1
>                     | Idle         2.6%
>                     |  800 MHz     0.3%
>                     | 3.00 GHz   1958.1%
>                     | 2.31 GHz     0.0%
>                     |
>
>                     |            CPU 2
>                     | Idle         2.0%
>                     |  800 MHz     0.3%
>                     | 3.00 GHz   1958.8%
>                     | 1.80 GHz     0.0%
>                     | 2.31 GHz     0.0%
>
>                     |            CPU 3
>                     | Idle         1.9%
>                     |  800 MHz     0.2%
>                     | 3.00 GHz   1958.7%
>                     | 1.80 GHz     0.3%
>                     | 2.31 GHz     0.0%
>
> Can anyone remind me why do you do beta releases and why should users
> spend their time reporting bugs?
Your bug was not ignored, it was not seen before release during our =

testing.
I have spent three hours testing this bug using your test case above, =

and am not seeing the issue.
So it may very well be there is an hardware corner case I need to track =

down. Which is why I asked the above questions.

-Chris
>
> Regards,
> Marti
> _______________________________________________
> PowerTop mailing list
> PowerTop(a)lists.01.org
> https://lists.01.org/mailman/listinfo/powertop


--===============3790995355922450950==--

