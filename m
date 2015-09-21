Content-Type: multipart/mixed; boundary="===============4046232970716234843=="
MIME-Version: 1.0
From: Sripada, Radhakrishna <radhakrishna.sripada at intel.com>
Subject: Re: [Powertop] [PATCH] Assign line level based on linux name
Date: Mon, 21 Sep 2015 21:26:53 +0000
Message-ID: <8C2593290C2B3E488D763E819AF1F02E0AF8A2CE@ORSMSX101.amr.corp.intel.com>
In-Reply-To: 56005F46.5050703@linux.intel.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============4046232970716234843==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

intel_idle driver exposes the sates C1-SKL and C1E-SKL. Powertop Idle Stats=
 only show the statistics of C1E-SKL and not C1-SKL. By parsing the human n=
ame for the two states, the same line level '1' gets assigned to both C1-SK=
L and C1E-SKL. Hence the statistics of C1-SKL are always overwritten by the=
 statistics of C1E-SKL. To eliminate this parsing linux name would assign d=
ifferent line levels to different cstates irrespective of their human names.

-----Original Message-----
From: Arjan van de Ven [mailto:arjan(a)linux.intel.com] =

Sent: Monday, September 21, 2015 12:49 PM
To: Sripada, Radhakrishna; powertop(a)lists.01.org
Subject: Re: [Powertop] [PATCH] Assign line level based on linux name

On 9/21/2015 11:34 AM, Radhakrishna Sripada wrote:
> C-states having the same number in their human names have the same =

> line levels. Switching to linux names assigns seperate levels to each C-s=
tate.
>
> Signed-off-by: Radhakrishna Sripada <radhakrishna.sripada(a)intel.com>

hmm do you have a before/after kind of thing?
(your description is a bit cryptic in that sense)

also of course this code isn't used for Intel cpus normally...



--===============4046232970716234843==--

