Content-Type: multipart/mixed; boundary="===============4763906697591196151=="
MIME-Version: 1.0
From: Thomas Spura <thomas.spura at googlemail.com>
Subject: Re: [Powertop] segfault on Sheevaplug (ARM Kirkwood)
Date: Tue, 22 May 2012 22:50:58 +0200
Message-ID: <CAE4GLstC0KOFLJ6G7Zt0sfaASvcu8JBDDsEdTQEyYvoMEu=EbA@mail.gmail.com>
In-Reply-To: 1337505562.47794.BPMail_high_noncarrier@web160306.mail.bf1.yahoo.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============4763906697591196151==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sun, May 20, 2012 at 11:19 AM, Rui DaCosta <ruidc(a)yahoo.com> wrote:
>
> Sure and thanks,
> (v1.13 worked fine btw)
> Processor =C2=A0 =C2=A0 =C2=A0 : Feroceon 88FR131 rev 1 (v5l)
> BogoMIPS =C2=A0 =C2=A0 =C2=A0 =C2=A0: 1191.11
> Features =C2=A0 =C2=A0 =C2=A0 =C2=A0: swp half thumb fastmult edsp
> CPU implementer : 0x56
> CPU architecture: 5TE
> CPU variant =C2=A0 =C2=A0 : 0x2
> CPU part =C2=A0 =C2=A0 =C2=A0 =C2=A0: 0x131
> CPU revision =C2=A0 =C2=A0: 1
>
> Hardware =C2=A0 =C2=A0 =C2=A0 =C2=A0: Marvell SheevaPlug Reference Board
> Revision =C2=A0 =C2=A0 =C2=A0 =C2=A0: 0000
> Serial =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0: 0000000000000000

Here perf is trying to open this file:
/sys/kernel/debug/tracing/events/power/cpu_frequency/id
with the old version it was:
/sys/kernel/debug/tracing/events/vfs/dirty_inode/id
(which doesn't exist here anymore)

Could you please look which files of those two exist on your arm device?

Greetings,
    Tom

--===============4763906697591196151==--

