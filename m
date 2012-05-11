Content-Type: multipart/mixed; boundary="===============3401312908812168750=="
MIME-Version: 1.0
From: Marti Raudsepp <marti at juffo.org>
Subject: [Powertop] PowerTOP 2.0 bugs
Date: Fri, 11 May 2012 19:29:54 +0300
Message-ID: <CABRT9RBEN=Jz6YuSRbVL+kob7Gb_LXPRhLN2pMq5Dm1wbpoR9A@mail.gmail.com>
In-Reply-To: CABRT9RBCGLe3czyw=XR37+_6N4fMYWrE0dMk=H_Qcu9mLaV0tA@mail.gmail.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============3401312908812168750==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi list,

I read that PowerTOP 2.0 was released yesterday, so I decided to give
it a run again. First I saw some discrepancy in the CPU usage reported
by PowerTOP. So I ran "while true; do openssl speed aes -multi 4;
done" to utilize all my 4 CPU cores at 100%. htop displays utilization
4x100% all the time. PowerTOP thinks:

Summary: 0.2 wakeups/second, =C2=A00.0 GPU ops/second, 0.0 VFS ops/sec and
187.1% CPU use

=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Usage =C2=A0 =C2=A0 =
=C2=A0 Events/s =C2=A0 =C2=A0Category =C2=A0 =C2=A0 =C2=A0 Description
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 1816 ms/s =C2=A0 =C2=A0 =C2=A00.0=
0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Process =C2=A0 =C2=A0 =C2=A0 =C2=A0openssl spe=
ed
aes -multi 4

The usage numbers are clearly bogus.

Then I remembered that I already reported some bugs about the PowerTOP
2.0 beta release I tested in January 2011:

On Thu, Jan 13, 2011 at 9:14 PM, Marti Raudsepp <marti(a)juffo.org> wrote:
> First, I also see an empty "Idle stats" screen, as reported by Ian
> Kumlien earlier. Old PowerTOP didn't report idle state statistics
> either, but at least it had an explanatory message.

"Idle stats page" is still empty:

=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Package =C2=A0 | =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0CPU 0
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0CPU 1
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0CPU 2
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0CPU 3

> Fourth, the "Frequency stats" screen starts up showing good numbers,
> but after the first refresh, all per-core numbers turn bogus. For each
> core, the percentages always add up to 1895% !

Still occurs, but now the magic constant is always 1961.1%

=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Package | =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0CPU 0
Idle =C2=A0 =C2=A0 =C2=A0 =C2=A0 0.0% =C2=A0 | Idle =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 0.6%
=C2=A0800 MHz =C2=A0 =C2=A0 0.0% =C2=A0 | =C2=A0800 MHz =C2=A0 =C2=A0 0.4%
3.00 GHz =C2=A0 100.0% =C2=A0 | 3.00 GHz =C2=A0 1960.1%
1.80 GHz =C2=A0 =C2=A0 0.0% =C2=A0 | 2.31 GHz =C2=A0 =C2=A0 0.0%
2.31 GHz =C2=A0 =C2=A0 0.0% =C2=A0 |

=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0CPU 1
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| Idle=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 2.6%
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=
=A0800 MHz =C2=A0 =C2=A0 0.3%
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 3.00=
 GHz =C2=A0 1958.1%
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2.31=
 GHz =C2=A0 =C2=A0 0.0%
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|

=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0CPU 2
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| Idle=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 2.0%
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=
=A0800 MHz =C2=A0 =C2=A0 0.3%
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 3.00=
 GHz =C2=A0 1958.8%
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 1.80=
 GHz =C2=A0 =C2=A0 0.0%
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2.31=
 GHz =C2=A0 =C2=A0 0.0%

=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0CPU 3
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| Idle=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 1.9%
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=
=A0800 MHz =C2=A0 =C2=A0 0.2%
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 3.00=
 GHz =C2=A0 1958.7%
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 1.80=
 GHz =C2=A0 =C2=A0 0.3%
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2.31=
 GHz =C2=A0 =C2=A0 0.0%

Can anyone remind me why do you do beta releases and why should users
spend their time reporting bugs?

Regards,
Marti

--===============3401312908812168750==--

