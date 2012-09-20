Content-Type: multipart/mixed; boundary="===============0890836116898663704=="
MIME-Version: 1.0
From: Arjan van de Ven <arjan at linux.intel.com>
Subject: Re: [Powertop] Powertop doesn't detects sleeping ARM cores
Date: Thu, 20 Sep 2012 12:42:34 +0200
Message-ID: <505AF31A.4000400@linux.intel.com>
In-Reply-To: 505AF291.4000308@samsung.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============0890836116898663704==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 9/20/2012 12:40 PM, Igor Zhbanov wrote:
> But is it correct to consider ARM core to be offline when it is just in W=
FI state?

nope

for all intents and purposes, the cpu is still there.

in an idle state, the cpu logically is there, and ready to resume execution=
 if needed...
that's the definition of idle ;-)

offline is where the administrator takes a cpu out of circulation.

neither specifies any physical hardware state... in fact offline is usually=
 implemented as an idle state, at
least on x86. the semantics for how to get back are different (system auton=
omous versus administrator)

now, quite possible some ARM platforms abuse this and don't implement somet=
hing as "idle" but as "offline" instead.
that sounds not very smart to me.



--===============0890836116898663704==--

