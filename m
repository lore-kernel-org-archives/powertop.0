Content-Type: multipart/mixed; boundary="===============7869180323942821479=="
MIME-Version: 1.0
From: Alexandra Yates <alexandra.yates at linux.intel.com>
Subject: Re: [Powertop] [PATCH] Assign line level based on linux name
Date: Wed, 23 Sep 2015 14:13:52 -0700
Message-ID: <56031610.8080304@linux.intel.com>
In-Reply-To: 8C2593290C2B3E488D763E819AF1F02E0AF8A2CE@ORSMSX101.amr.corp.intel.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============7869180323942821479==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello,


On 09/21/2015 02:26 PM, Sripada, Radhakrishna wrote:
> intel_idle driver exposes the sates C1-SKL and C1E-SKL. Powertop Idle Sta=
ts only show the statistics of C1E-SKL and not C1-SKL. By parsing the human=
 name for the two states, the same line level '1' gets assigned to both C1-=
SKL and C1E-SKL. Hence the statistics of C1-SKL are always overwritten by t=
he statistics of C1E-SKL. To eliminate this parsing linux name would assign=
 different line levels to different cstates irrespective of their human nam=
es.
>
> -----Original Message-----
> From: Arjan van de Ven [mailto:arjan(a)linux.intel.com]
> Sent: Monday, September 21, 2015 12:49 PM
> To: Sripada, Radhakrishna; powertop(a)lists.01.org
> Subject: Re: [Powertop] [PATCH] Assign line level based on linux name
>
> On 9/21/2015 11:34 AM, Radhakrishna Sripada wrote:
>> C-states having the same number in their human names have the same
>> line levels. Switching to linux names assigns seperate levels to each C-=
state.
>>
>> Signed-off-by: Radhakrishna Sripada <radhakrishna.sripada(a)intel.com>
>
> hmm do you have a before/after kind of thing?
> (your description is a bit cryptic in that sense)
>
> also of course this code isn't used for Intel cpus normally...
>
>
> _______________________________________________
> PowerTop mailing list
> PowerTop(a)lists.01.org
> https://lists.01.org/mailman/listinfo/powertop
>

Does anyone from the ARM community have an issue with this patch?

RD,
Please re-send your patch with a more clear description on what the =

patch fixes.  like you do in this message.

-- =

Thank you,
<Alexandra>

--===============7869180323942821479==--

