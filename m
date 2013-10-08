Content-Type: multipart/mixed; boundary="===============6541191237722092136=="
MIME-Version: 1.0
From: Sergey Senozhatsky <sergey.senozhatsky at gmail.com>
Subject: Re: [Powertop] [PATCH POWERTOP V3] resolve the bug that powertop
 doesn't show correct frequency stats
Date: Tue, 08 Oct 2013 11:54:00 +0300
Message-ID: <20131008085359.GA2495@swordfish.minsk.epam.com>
In-Reply-To: CANHzE=2g6K4tzBEXOC5cuw98erR44RF_4ZQnzQacuqv6W9Ktkw@mail.gmail.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============6541191237722092136==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello,

On (10/08/13 16:45), Shaojie Sun wrote:
> Hi Sergey
> =

> I tested in powertop tool and find that there is no cpu_id filed in
> some perf events. such as sched_switch, hrtimer_expire_exit and so on.
> so we can't modify this change in src/perf/perf_bundle (perf_sample's
> perf_event_header).
> =

> And we didn't find any bugs on other perf events. So we only modified
> it in src/cpu/cpu.cpp.
> =


thanks. I'll try to find some time today (or tomorrow) to take a look
on it.

	-ss

> On Tue, Oct 8, 2013 at 4:17 PM, Jon Medhurst (Tixy) <tixy(a)linaro.org> w=
rote:
> > On Mon, 2013-10-07 at 22:54 +0800, Shaojie Sun wrote:
> >> add jon.medhurst(a)linaro.org
> >>
> >> On Mon, Oct 7, 2013 at 7:40 PM, Sergey Senozhatsky
> >> <sergey.senozhatsky(a)gmail.com> wrote:
> >> > On (10/07/13 19:31), Shaojie Sun wrote:
> >> >> Date: Mon, 7 Oct 2013 19:31:54 +0800
> >> >> From: Shaojie Sun <shaojie.sun(a)linaro.org>
> >> >> To: Sergey Senozhatsky <sergey.senozhatsky(a)gmail.com>
> >> >> Cc: Sanjay Rawat <sanjay.rawat(a)linaro.org>, Jon Medhurst <tixy(a)=
linaro.org>,
> >> >>  SunShaoJie <sunshaojie(a)huawei.com>, "Private-PMWG(a)Linaro"
> >> >>  <private-pmwg(a)linaro.org>
> >> >> Subject: Re: [Powertop] [PATCH POWERTOP V3] resolve the bug that po=
wertop
> >> >>  doesn't show correct frequency stats
> >> >>
> >> >> Goog question.
> >> >> Could Tixy answer it?
> >> >
> >> > /** Removed Private-PMWG (no permissions), Cc'd powertop list. */
> >> >
> >> >
> >> >
> >> > the thing is that we tend to trust passed cpunr in many handle_trace=
_point()-s.
> >> > so it would be better to fix all sample->trace.cpu users, because the
> >> > problme may be a bit bigger than that (e.g. src/process/do_process.c=
pp
> >> > perf_process_bundle::handle_trace_point()).
> >
> > That's what I thought too and said so when I commented on the Linaro's
> > bug tracking system [1]. I was hoping that someone more familiar with
> > powertop would investigate further as I had never looked at powertop or
> > any perf related code before.
> >
> > [1] https://bugs.launchpad.net/linaro-android/+bug/1042755/comments/14
> >
> > --
> > Tixy
> >
> >> >
> >> >         -ss
> >> >
> >> >> On Mon, Oct 7, 2013 at 6:03 PM, Sergey Senozhatsky
> >> >> <sergey.senozhatsky(a)gmail.com> wrote:
> >> >> > On (10/07/13 17:26), Shaojie Sun wrote:
> >> >> >> From: Jon Medhurst <tixy(a)linaro.org>
> >> >> >>
> >> >> >> For cpu_frequency events, perf_power_bundle::handle_trace_point()
> >> >> >> is always being called with the same cpunr. so the parameter of
> >> >> >> cpunr is not equal to the cpu which cpu_frequency events happene=
d.
> >> >> >> Lucky the trace event themselves have a cpu_id field to say to w=
hich
> >> >> >> CPU event it relates, we should use this cpu_id field.
> >> >> >>
> >> >> >> Signed-off-by:  Jon Medhurst <tixy(a)linaro.org>
> >> >> >>               Shaojie Sun <shaojie.sun(a)linaro.com>
> >> >> >> ---
> >> >> >>  src/cpu/cpu.cpp |    9 +++++++--
> >> >> >>  1 file changed, 7 insertions(+), 2 deletions(-)
> >> >> >>
> >> >> >> diff --git a/src/cpu/cpu.cpp b/src/cpu/cpu.cpp
> >> >> >> index 7f3af69..e304bbe 100644
> >> >> >> --- a/src/cpu/cpu.cpp
> >> >> >> +++ b/src/cpu/cpu.cpp
> >> >> >> @@ -781,10 +781,15 @@ void perf_power_bundle::handle_trace_point=
(void *trace, int cpunr, uint64_t time
> >> >> >>
> >> >> >>       if (strcmp(event->name, "power_frequency") =3D=3D 0
> >> >> >>       || strcmp(event->name, "cpu_frequency") =3D=3D 0){
> >> >> >> -
> >> >> >> +             ret =3D pevent_get_field_val(NULL, event, "cpu_id"=
, &rec, &val, 0);
> >> >> >> +             if (ret < 0) {
> >> >> >> +                     fprintf(stderr, _("power or cpu_frequency =
event returned no cpu?\n"));
> >> >> >> +                     exit(-1);
> >> >> >> +             }
> >> >> >> +             cpu =3D all_cpus[val];
> >> >> >>               ret =3D pevent_get_field_val(NULL, event, "state",=
 &rec, &val, 0);
> >> >> >>               if (ret < 0) {
> >> >> >> -                     fprintf(stderr, _("power or cpu_frequecny =
event returned no state?\n"));
> >> >> >> +                     fprintf(stderr, _("power or cpu_frequency =
event returned no state?\n"));
> >> >> >>                       exit(-1);
> >> >> >>               }
> >> >> >
> >> >> > Hello,
> >> >> > why not fixing it in src/perf/perf_bundle (perf_sample's perf_eve=
nt_header),
> >> >> > where we create data for handle_trace_point() ?
> >> >> >
> >> >> >         -ss
> >> >> >
> >> >> >> --
> >> >> >> 1.7.9.5
> >> >> >>
> >> >> >> _______________________________________________
> >> >> >> PowerTop mailing list
> >> >> >> PowerTop(a)lists.01.org
> >> >> >> https://lists.01.org/mailman/listinfo/powertop
> >> >> >>
> >> >>
> >
> >

> perf find a event not support cpu_id, event name is sched_switch.
> perf cpnnr 1, cpu 175798456, event name sched_switch.
> perf find a event not support cpu_id, event name is sched_switch.
> perf cpnnr 0, cpu 27164, event name sched_switch.
> perf find a event not support cpu_id, event name is sched_switch.
> perf cpnnr 2, cpu 0, event name sched_switch.
> perf find a event not support cpu_id, event name is sched_switch.
> perf cpnnr 3, cpu 0, event name sched_switch.
> perf find a event not support cpu_id, event name is sched_switch.
> perf cpnnr 1, cpu 0, event name sched_switch.
> perf find a event not support cpu_id, event name is sched_switch.
> perf cpnnr 2, cpu 8, event name sched_switch.
> perf find a event not support cpu_id, event name is sched_switch.
> perf cpnnr 3, cpu 13, event name sched_switch.
> perf find a event not support cpu_id, event name is sched_switch.
> perf cpnnr 0, cpu 17, event name sched_switch.
> perf find a event not support cpu_id, event name is sched_wakeup.
> perf cpnnr 1, cpu 6, event name sched_wakeup.
> perf find a event not support cpu_id, event name is sched_switch.
> perf cpnnr 1, cpu 8, event name sched_switch.
> perf find a event not support cpu_id, event name is sched_wakeup.
> perf cpnnr 0, cpu 27164, event name sched_wakeup.
> perf find a event not support cpu_id, event name is sched_wakeup.
> perf cpnnr 2, cpu 6, event name sched_wakeup.
> perf find a event not support cpu_id, event name is sched_wakeup.
> perf cpnnr 3, cpu 13, event name sched_wakeup.
> perf find a event not support cpu_id, event name is sched_switch.
> perf cpnnr 0, cpu 17, event name sched_switch.
> perf find a event not support cpu_id, event name is sched_switch.
> perf cpnnr 2, cpu 0, event name sched_switch.
> perf find a event not support cpu_id, event name is sched_switch.
> perf cpnnr 3, cpu 0, event name sched_switch.
> perf find a event not support cpu_id, event name is sched_switch.
> perf cpnnr 1, cpu 0, event name sched_switch.
> perf find a event not support cpu_id, event name is sched_switch.
> perf cpnnr 3, cpu 8, event name sched_switch.
> perf find a event not support cpu_id, event name is sched_switch.
> perf cpnnr 0, cpu 17, event name sched_switch.
> perf find a event not support cpu_id, event name is sched_switch.
> perf cpnnr 2, cpu 6, event name sched_switch.
> perf find a event not support cpu_id, event name is sched_wakeup.
> perf cpnnr 1, cpu 13, event name sched_wakeup.
> perf find a event not support cpu_id, event name is sched_wakeup.
> perf cpnnr 0, cpu 8, event name sched_wakeup.
> perf find a event not support cpu_id, event name is sched_switch.
> perf cpnnr 1, cpu 6, event name sched_switch.
> perf find a event not support cpu_id, event name is sched_switch.
> perf cpnnr 0, cpu 27164, event name sched_switch.
> perf find a event not support cpu_id, event name is sched_wakeup.
> perf cpnnr 3, cpu 0, event name sched_wakeup.
> perf find a event not support cpu_id, event name is sched_wakeup.
> perf cpnnr 2, cpu 17, event name sched_wakeup.
> perf find a event not support cpu_id, event name is sched_switch.
> perf cpnnr 3, cpu 13, event name sched_switch.
> perf find a event not support cpu_id, event name is sched_switch.
> perf cpnnr 2, cpu 0, event name sched_switch.
> perf find a event not support cpu_id, event name is sched_switch.
> perf cpnnr 1, cpu 0, event name sched_switch.
> perf find a event not support cpu_id, event name is sched_switch.
> perf cpnnr 3, cpu 8, event name sched_switch.
> perf find a event not support cpu_id, event name is sched_switch.
> perf cpnnr 0, cpu 17, event name sched_switch.
> perf find a event not support cpu_id, event name is sched_switch.
> perf cpnnr 2, cpu 6, event name sched_switch.
> perf find a event not support cpu_id, event name is sched_wakeup.
> perf cpnnr 1, cpu 13, event name sched_wakeup.
> perf find a event not support cpu_id, event name is sched_switch.
> perf cpnnr 1, cpu 8, event name sched_switch.
> perf find a event not support cpu_id, event name is sched_wakeup.
> perf cpnnr 0, cpu 27164, event name sched_wakeup.
> perf find a event not support cpu_id, event name is sched_switch.
> perf cpnnr 0, cpu 6, event name sched_switch.
> perf find a event not support cpu_id, event name is sched_wakeup.
> perf cpnnr 2, cpu 0, event name sched_wakeup.
> perf find a event not support cpu_id, event name is sched_wakeup.
> perf cpnnr 3, cpu 13, event name sched_wakeup.
> perf find a event not support cpu_id, event name is sched_switch.
> perf cpnnr 2, cpu 17, event name sched_switch.
> perf find a event not support cpu_id, event name is sched_switch.
> perf cpnnr 3, cpu 0, event name sched_switch.
> perf find a event not support cpu_id, event name is sched_switch.
> perf cpnnr 1, cpu 0, event name sched_switch.
> perf find a event not support cpu_id, event name is sched_switch.
> perf cpnnr 3, cpu 8, event name sched_switch.
> perf find a event not support cpu_id, event name is sched_switch.
> perf cpnnr 0, cpu 17, event name sched_switch.
> perf find a event not support cpu_id, event name is sched_switch.
> perf cpnnr 2, cpu 6, event name sched_switch.
> perf find a event not support cpu_id, event name is sched_wakeup.
> perf cpnnr 1, cpu 13, event name sched_wakeup.
> perf find a event not support cpu_id, event name is sched_switch.
> perf cpnnr 1, cpu 8, event name sched_switch.
> perf find a event not support cpu_id, event name is sched_wakeup.
> perf cpnnr 0, cpu 27164, event name sched_wakeup.
> perf find a event not support cpu_id, event name is sched_wakeup.
> perf cpnnr 3, cpu 6, event name sched_wakeup.
> perf find a event not support cpu_id, event name is sched_wakeup.
> perf cpnnr 2, cpu 17, event name sched_wakeup.
> perf find a event not support cpu_id, event name is sched_switch.
> perf cpnnr 0, cpu 13, event name sched_switch.
> perf find a event not support cpu_id, event name is sched_switch.
> perf cpnnr 3, cpu 0, event name sched_switch.
> perf find a event not support cpu_id, event name is sched_switch.
> perf cpnnr 2, cpu 0, event name sched_switch.
> perf find a event not support cpu_id, event name is sched_switch.
> perf cpnnr 1, cpu 0, event name sched_switch.
> perf find a event not support cpu_id, event name is sched_switch.
> perf cpnnr 0, cpu 8, event name sched_switch.
> perf find a event not support cpu_id, event name is sched_switch.
> perf cpnnr 3, cpu 6, event name sched_switch.
> perf find a event not support cpu_id, event name is sched_switch.
> perf cpnnr 2, cpu 17, event name sched_switch.
> perf find a event not support cpu_id, event name is sched_wakeup.
> perf cpnnr 1, cpu 13, event name sched_wakeup.
> perf find a event not support cpu_id, event name is sched_switch.
> perf cpnnr 1, cpu 8, event name sched_switch.
> perf find a event not support cpu_id, event name is sched_wakeup.
> perf cpnnr 3, cpu 27164, event name sched_wakeup.
> perf find a event not support cpu_id, event name is sched_wakeup.
> perf cpnnr 2, cpu 17, event name sched_wakeup.
> perf find a event not support cpu_id, event name is sched_switch.
> perf cpnnr 3, cpu 13, event name sched_switch.
> perf find a event not support cpu_id, event name is sched_switch.
> perf cpnnr 2, cpu 0, event name sched_switch.
> perf find a event not support cpu_id, event name is sched_wakeup.
> perf find a event not support cpu_id, event name is sched_switch.
> perf cpnnr 0, cpu 6, event name sched_switch.
> perf find a event not support cpu_id, event name is sched_switch.
> perf cpnnr 1, cpu 0, event name sched_switch.
> perf find a event not support cpu_id, event name is sched_switch.
> perf cpnnr 3, cpu 8, event name sched_switch.
> perf find a event not support cpu_id, event name is sched_switch.
> perf cpnnr 0, cpu 17, event name sched_switch.
> perf find a event not support cpu_id, event name is sched_switch.
> perf cpnnr 2, cpu 6, event name sched_switch.
> perf find a event not support cpu_id, event name is sched_wakeup.
> perf cpnnr 1, cpu 13, event name sched_wakeup.
> perf find a event not support cpu_id, event name is sched_wakeup.
> perf cpnnr 0, cpu 8, event name sched_wakeup.
> perf find a event not support cpu_id, event name is sched_switch.
> perf cpnnr 0, cpu 6, event name sched_switch.
> perf find a event not support cpu_id, event name is sched_wakeup.
> perf cpnnr 2, cpu 0, event name sched_wakeup.
> perf find a event not support cpu_id, event name is sched_switch.
> perf cpnnr 1, cpu 13, event name sched_switch.
> perf find a event not support cpu_id, event name is sched_wakeup.
> perf cpnnr 3, cpu 27164, event name sched_wakeup.
> perf find a event not support cpu_id, event name is sched_switch.
> perf cpnnr 2, cpu 17, event name sched_switch.
> perf find a event not support cpu_id, event name is sched_switch.
> perf cpnnr 3, cpu 0, event name sched_switch.
> perf find a event not support cpu_id, event name is sched_switch.
> perf cpnnr 1, cpu 0, event name sched_switch.
> perf find a event not support cpu_id, event name is sched_switch.
> perf cpnnr 3, cpu 8, event name sched_switch.
> perf find a event not support cpu_id, event name is sched_switch.
> perf cpnnr 2, cpu 17, event name sched_switch.
> perf find a event not support cpu_id, event name is sched_switch.
> perf cpnnr 0, cpu 13, event name sched_switch.
> perf find a event not support cpu_id, event name is softirq_entry.
> perf cpnnr 3, cpu 6, event name softirq_entry.
> perf find a event not support cpu_id, event name is softirq_entry.
> perf cpnnr 2, cpu 1, event name softirq_entry.
> perf find a event not support cpu_id, event name is softirq_entry.
> perf cpnnr 0, cpu 1, event name softirq_entry.
> perf find a event not support cpu_id, event name is softirq_entry.
> perf find a event not support cpu_id, event name is softirq_exit.
> perf cpnnr 0, cpu 1, event name softirq_exit.
> perf find a event not support cpu_id, event name is softirq_entry.
> perf cpnnr 3, cpu 1, event name softirq_entry.
> perf find a event not support cpu_id, event name is softirq_entry.
> perf cpnnr 2, cpu 9, event name softirq_entry.
> perf find a event not support cpu_id, event name is softirq_entry.
> perf cpnnr 1, cpu 9, event name softirq_entry.
> perf find a event not support cpu_id, event name is softirq_entry.
> perf cpnnr 0, cpu 9, event name softirq_entry.
> perf find a event not support cpu_id, event name is softirq_exit.
> perf cpnnr 0, cpu 9, event name softirq_exit.
> perf find a event not support cpu_id, event name is sched_wakeup.
> perf cpnnr 1, cpu 9, event name sched_wakeup.
> perf find a event not support cpu_id, event name is sched_switch.
> perf cpnnr 1, cpu 8, event name sched_switch.
> perf find a event not support cpu_id, event name is sched_wakeup.
> perf cpnnr 2, cpu 27164, event name sched_wakeup.
> perf find a event not support cpu_id, event name is sched_wakeup.
> perf cpnnr 0, cpu 13, event name sched_wakeup.
> perf find a event not support cpu_id, event name is sched_wakeup.
> perf cpnnr 3, cpu 6, event name sched_wakeup.
> perf find a event not support cpu_id, event name is sched_switch.
> perf cpnnr 2, cpu 17, event name sched_switch.
> perf find a event not support cpu_id, event name is sched_switch.
> perf cpnnr 3, cpu 0, event name sched_switch.
> perf find a event not support cpu_id, event name is sched_switch.
> perf find a event not support cpu_id, event name is sched_switch.
> perf cpnnr 1, cpu 0, event name sched_switch.
> perf find a event not support cpu_id, event name is sched_switch.
> perf cpnnr 2, cpu 8, event name sched_switch.
> perf find a event not support cpu_id, event name is sched_switch.
> perf cpnnr 3, cpu 13, event name sched_switch.
> perf find a event not support cpu_id, event name is sched_switch.
> perf cpnnr 0, cpu 17, event name sched_switch.
> perf find a event not support cpu_id, event name is sched_wakeup.
> perf cpnnr 1, cpu 6, event name sched_wakeup.
> perf find a event not support cpu_id, event name is sched_switch.
> perf cpnnr 1, cpu 8, event name sched_switch.
> perf find a event not support cpu_id, event name is sched_wakeup.
> perf cpnnr 2, cpu 27164, event name sched_wakeup.
> perf find a event not support cpu_id, event name is sched_wakeup.
> perf cpnnr 0, cpu 13, event name sched_wakeup.
> perf find a event not support cpu_id, event name is sched_wakeup.
> perf cpnnr 3, cpu 6, event name sched_wakeup.
> perf find a event not support cpu_id, event name is sched_switch.
> perf cpnnr 2, cpu 17, event name sched_switch.
> perf find a event not support cpu_id, event name is sched_switch.
> perf find a event not support cpu_id, event name is sched_switch.
> perf cpnnr 3, cpu 0, event name sched_switch.
> perf find a event not support cpu_id, event name is sched_switch.
> perf cpnnr 1, cpu 0, event name sched_switch.
> perf find a event not support cpu_id, event name is sched_switch.
> perf cpnnr 2, cpu 8, event name sched_switch.
> perf find a event not support cpu_id, event name is sched_switch.
> perf cpnnr 3, cpu 13, event name sched_switch.
> perf find a event not support cpu_id, event name is sched_switch.
> perf cpnnr 0, cpu 17, event name sched_switch.
> perf find a event not support cpu_id, event name is sched_wakeup.
> perf cpnnr 1, cpu 6, event name sched_wakeup.
> perf find a event not support cpu_id, event name is sched_switch.
> perf cpnnr 1, cpu 8, event name sched_switch.
> perf find a event not support cpu_id, event name is sched_wakeup.
> perf cpnnr 2, cpu 27164, event name sched_wakeup.
> perf find a event not support cpu_id, event name is sched_wakeup.
> perf cpnnr 0, cpu 13, event name sched_wakeup.
> perf find a event not support cpu_id, event name is sched_wakeup.
> perf cpnnr 3, cpu 6, event name sched_wakeup.
> perf find a event not support cpu_id, event name is sched_switch.
> perf cpnnr 2, cpu 17, event name sched_switch.
> perf find a event not support cpu_id, event name is sched_switch.
> perf find a event not support cpu_id, event name is sched_switch.
> perf cpnnr 3, cpu 0, event name sched_switch.
> perf find a event not support cpu_id, event name is sched_switch.
> perf cpnnr 1, cpu 0, event name sched_switch.
> perf find a event not support cpu_id, event name is sched_switch.
> perf cpnnr 2, cpu 8, event name sched_switch.
> perf find a event not support cpu_id, event name is sched_switch.
> perf cpnnr 3, cpu 13, event name sched_switch.
> perf find a event not support cpu_id, event name is sched_switch.
> perf cpnnr 0, cpu 17, event name sched_switch.
> perf find a event not support cpu_id, event name is sched_wakeup.
> perf cpnnr 1, cpu 6, event name sched_wakeup.
> perf find a event not support cpu_id, event name is sched_switch.
> perf cpnnr 1, cpu 8, event name sched_switch.
> perf find a event not support cpu_id, event name is sched_wakeup.
> perf cpnnr 2, cpu 27164, event name sched_wakeup.
> perf find a event not support cpu_id, event name is sched_switch.
> perf cpnnr 2, cpu 13, event name sched_switch.
> perf find a event not support cpu_id, event name is sched_wakeup.
> perf find a event not support cpu_id, event name is sched_wakeup.
> perf cpnnr 3, cpu 6, event name sched_wakeup.
> perf find a event not support cpu_id, event name is sched_switch.
> perf cpnnr 0, cpu 17, event name sched_switch.
> perf find a event not support cpu_id, event name is sched_switch.
> perf cpnnr 3, cpu 0, event name sched_switch.
> perf find a event not support cpu_id, event name is sched_switch.
> perf cpnnr 3, cpu 0, event name sched_switch.
> perf find a event not support cpu_id, event name is sched_switch.
> perf cpnnr 1, cpu 17, event name sched_switch.
> perf find a event not support cpu_id, event name is sched_switch.
> perf cpnnr 2, cpu 8, event name sched_switch.
> perf find a event not support cpu_id, event name is sched_switch.
> perf cpnnr 0, cpu 13, event name sched_switch.
> perf find a event not support cpu_id, event name is sched_wakeup.
> perf cpnnr 1, cpu 6, event name sched_wakeup.
> perf find a event not support cpu_id, event name is sched_wakeup.
> perf cpnnr 0, cpu 8, event name sched_wakeup.
> perf find a event not support cpu_id, event name is sched_wakeup.
> perf cpnnr 2, cpu 6, event name sched_wakeup.
> perf find a event not support cpu_id, event name is sched_switch.
> perf cpnnr 0, cpu 13, event name sched_switch.
> perf find a event not support cpu_id, event name is sched_switch.
> perf cpnnr 1, cpu 0, event name sched_switch.
> perf find a event not support cpu_id, event name is sched_wakeup.
> perf cpnnr 3, cpu 27164, event name sched_wakeup.
> perf find a event not support cpu_id, event name is sched_switch.
> perf cpnnr 2, cpu 17, event name sched_switch.
> perf find a event not support cpu_id, event name is sched_switch.
> perf cpnnr 3, cpu 0, event name sched_switch.
> perf find a event not support cpu_id, event name is sched_switch.
> perf cpnnr 3, cpu 0, event name sched_switch.
> perf find a event not support cpu_id, event name is sched_switch.
> perf cpnnr 2, cpu 17, event name sched_switch.
> perf find a event not support cpu_id, event name is sched_switch.
> perf cpnnr 0, cpu 13, event name sched_switch.
> perf find a event not support cpu_id, event name is sched_switch.
> perf cpnnr 1, cpu 6, event name sched_switch.
> perf find a event not support cpu_id, event name is sched_wakeup.
> perf cpnnr 1, cpu 8, event name sched_wakeup.
> perf find a event not support cpu_id, event name is sched_wakeup.
> perf cpnnr 0, cpu 8, event name sched_wakeup.
> perf find a event not support cpu_id, event name is sched_switch.
> perf cpnnr 1, cpu 6, event name sched_switch.
> perf find a event not support cpu_id, event name is sched_switch.
> perf cpnnr 0, cpu 27164, event name sched_switch.
> perf find a event not support cpu_id, event name is sched_wakeup.
> perf cpnnr 2, cpu 0, event name sched_wakeup.
> perf find a event not support cpu_id, event name is sched_wakeup.
> perf cpnnr 3, cpu 13, event name sched_wakeup.
> perf find a event not support cpu_id, event name is sched_switch.
> perf cpnnr 2, cpu 17, event name sched_switch.
> perf find a event not support cpu_id, event name is sched_switch.
> perf cpnnr 3, cpu 0, event name sched_switch.
> perf find a event not support cpu_id, event name is sched_switch.
> perf cpnnr 1, cpu 0, event name sched_switch.
> perf find a event not support cpu_id, event name is sched_switch.
> perf cpnnr 2, cpu 8, event name sched_switch.
> perf find a event not support cpu_id, event name is sched_switch.
> perf cpnnr 0, cpu 13, event name sched_switch.
> perf find a event not support cpu_id, event name is sched_switch.
> perf cpnnr 3, cpu 6, event name sched_switch.
> perf find a event not support cpu_id, event name is sched_wakeup.
> perf cpnnr 1, cpu 17, event name sched_wakeup.
> perf find a event not support cpu_id, event name is sched_wakeup.
> perf cpnnr 0, cpu 8, event name sched_wakeup.
> perf find a event not support cpu_id, event name is sched_switch.
> perf cpnnr 1, cpu 6, event name sched_switch.
> perf find a event not support cpu_id, event name is sched_switch.
> perf cpnnr 0, cpu 27164, event name sched_switch.
> perf find a event not support cpu_id, event name is sched_wakeup.
> perf cpnnr 2, cpu 0, event name sched_wakeup.
> perf find a event not support cpu_id, event name is sched_wakeup.
> perf cpnnr 3, cpu 13, event name sched_wakeup.
> perf find a event not support cpu_id, event name is sched_switch.
> perf cpnnr 2, cpu 17, event name sched_switch.
> perf find a event not support cpu_id, event name is sched_switch.
> perf cpnnr 3, cpu 0, event name sched_switch.
> perf find a event not support cpu_id, event name is sched_switch.
> perf cpnnr 2, cpu 0, event name sched_switch.
> perf find a event not support cpu_id, event name is sched_switch.
> perf cpnnr 1, cpu 13, event name sched_switch.
> perf find a event not support cpu_id, event name is sched_switch.
> perf cpnnr 0, cpu 8, event name sched_switch.
> perf find a event not support cpu_id, event name is sched_switch.
> perf cpnnr 3, cpu 6, event name sched_switch.
> perf find a event not support cpu_id, event name is sched_wakeup.
> perf cpnnr 1, cpu 17, event name sched_wakeup.
> perf find a event not support cpu_id, event name is sched_wakeup.
> perf cpnnr 0, cpu 8, event name sched_wakeup.
> perf find a event not support cpu_id, event name is sched_switch.
> perf cpnnr 1, cpu 6, event name sched_switch.
> perf find a event not support cpu_id, event name is sched_wakeup.
> perf cpnnr 2, cpu 27164, event name sched_wakeup.
> perf find a event not support cpu_id, event name is sched_wakeup.
> perf cpnnr 3, cpu 13, event name sched_wakeup.
> perf find a event not support cpu_id, event name is sched_switch.
> perf cpnnr 0, cpu 17, event name sched_switch.
> perf find a event not support cpu_id, event name is sched_switch.
> perf cpnnr 2, cpu 0, event name sched_switch.
> perf find a event not support cpu_id, event name is sched_switch.
> perf cpnnr 3, cpu 0, event name sched_switch.
> perf find a event not support cpu_id, event name is sched_switch.
> perf cpnnr 3, cpu 0, event name sched_switch.
> perf find a event not support cpu_id, event name is sched_switch.
> perf cpnnr 2, cpu 17, event name sched_switch.
> perf find a event not support cpu_id, event name is sched_switch.
> perf cpnnr 0, cpu 13, event name sched_switch.
> perf find a event not support cpu_id, event name is sched_switch.
> perf cpnnr 1, cpu 6, event name sched_switch.
> perf find a event not support cpu_id, event name is sched_wakeup.
> perf cpnnr 1, cpu 8, event name sched_wakeup.
> perf find a event not support cpu_id, event name is sched_wakeup.
> perf cpnnr 0, cpu 8, event name sched_wakeup.
> perf find a event not support cpu_id, event name is sched_switch.
> perf cpnnr 1, cpu 6, event name sched_switch.
> perf find a event not support cpu_id, event name is sched_switch.
> perf cpnnr 0, cpu 27164, event name sched_switch.
> perf find a event not support cpu_id, event name is sched_wakeup.
> perf cpnnr 2, cpu 0, event name sched_wakeup.
> perf find a event not support cpu_id, event name is sched_wakeup.
> perf cpnnr 3, cpu 13, event name sched_wakeup.
> perf find a event not support cpu_id, event name is sched_switch.
> perf cpnnr 2, cpu 17, event name sched_switch.
> perf find a event not support cpu_id, event name is sched_switch.
> perf cpnnr 3, cpu 0, event name sched_switch.
> perf find a event not support cpu_id, event name is sched_switch.
> perf cpnnr 1, cpu 0, event name sched_switch.
> perf find a event not support cpu_id, event name is sched_switch.
> perf cpnnr 0, cpu 8, event name sched_switch.
> perf find a event not support cpu_id, event name is sched_switch.
> perf cpnnr 2, cpu 6, event name sched_switch.
> perf find a event not support cpu_id, event name is sched_switch.
> perf cpnnr 3, cpu 13, event name sched_switch.
> perf find a event not support cpu_id, event name is sched_wakeup.
> perf cpnnr 1, cpu 17, event name sched_wakeup.
> perf find a event not support cpu_id, event name is sched_wakeup.
> perf cpnnr 0, cpu 8, event name sched_wakeup.
> perf find a event not support cpu_id, event name is sched_switch.
> perf cpnnr 1, cpu 6, event name sched_switch.
> perf find a event not support cpu_id, event name is sched_switch.
> perf cpnnr 0, cpu 27164, event name sched_switch.
> perf find a event not support cpu_id, event name is sched_wakeup.
> perf cpnnr 2, cpu 0, event name sched_wakeup.
> perf find a event not support cpu_id, event name is sched_wakeup.
> perf cpnnr 3, cpu 13, event name sched_wakeup.
> perf find a event not support cpu_id, event name is sched_switch.
> perf cpnnr 2, cpu 17, event name sched_switch.
> perf find a event not support cpu_id, event name is sched_switch.
> perf cpnnr 3, cpu 0, event name sched_switch.
> perf find a event not support cpu_id, event name is sched_switch.
> perf cpnnr 3, cpu 0, event name sched_switch.
> perf find a event not support cpu_id, event name is sched_switch.
> perf cpnnr 1, cpu 17, event name sched_switch.
> perf find a event not support cpu_id, event name is sched_switch.
> perf cpnnr 2, cpu 8, event name sched_switch.
> perf find a event not support cpu_id, event name is sched_switch.
> perf cpnnr 0, cpu 13, event name sched_switch.
> perf find a event not support cpu_id, event name is sched_wakeup.
> perf cpnnr 1, cpu 6, event name sched_wakeup.
> perf find a event not support cpu_id, event name is sched_wakeup.
> perf cpnnr 0, cpu 8, event name sched_wakeup.
> perf find a event not support cpu_id, event name is sched_switch.
> perf cpnnr 1, cpu 6, event name sched_switch.
> perf find a event not support cpu_id, event name is sched_wakeup.
> perf cpnnr 2, cpu 27164, event name sched_wakeup.
> perf find a event not support cpu_id, event name is sched_switch.
> perf cpnnr 0, cpu 13, event name sched_switch.
> perf find a event not support cpu_id, event name is sched_wakeup.
> perf cpnnr 3, cpu 0, event name sched_wakeup.
> perf find a event not support cpu_id, event name is sched_switch.
> perf cpnnr 2, cpu 17, event name sched_switch.
> perf find a event not support cpu_id, event name is sched_switch.
> perf cpnnr 3, cpu 0, event name sched_switch.
> perf find a event not support cpu_id, event name is sched_switch.
> perf cpnnr 3, cpu 0, event name sched_switch.
> perf find a event not support cpu_id, event name is sched_switch.
> perf cpnnr 2, cpu 17, event name sched_switch.
> perf find a event not support cpu_id, event name is sched_switch.
> perf cpnnr 1, cpu 13, event name sched_switch.
> perf find a event not support cpu_id, event name is sched_switch.
> perf cpnnr 0, cpu 8, event name sched_switch.
> perf find a event not support cpu_id, event name is sched_wakeup.
> perf cpnnr 1, cpu 6, event name sched_wakeup.
> perf find a event not support cpu_id, event name is sched_wakeup.
> perf cpnnr 0, cpu 8, event name sched_wakeup.
> perf find a event not support cpu_id, event name is sched_switch.
> perf cpnnr 1, cpu 6, event name sched_switch.
> perf find a event not support cpu_id, event name is sched_wakeup.
> perf cpnnr 2, cpu 27164, event name sched_wakeup.
> perf find a event not support cpu_id, event name is sched_switch.
> perf cpnnr 0, cpu 13, event name sched_switch.
> perf find a event not support cpu_id, event name is sched_wakeup.
> perf cpnnr 3, cpu 0, event name sched_wakeup.
> perf find a event not support cpu_id, event name is sched_switch.
> perf cpnnr 2, cpu 17, event name sched_switch.
> perf find a event not support cpu_id, event name is sched_switch.
> perf cpnnr 3, cpu 0, event name sched_switch.
> perf find a event not support cpu_id, event name is sched_switch.
> perf cpnnr 1, cpu 0, event name sched_switch.
> perf find a event not support cpu_id, event name is sched_switch.
> perf cpnnr 0, cpu 8, event name sched_switch.
> perf find a event not support cpu_id, event name is sched_switch.
> perf cpnnr 2, cpu 6, event name sched_switch.
> perf find a event not support cpu_id, event name is sched_switch.
> perf cpnnr 3, cpu 13, event name sched_switch.
> perf find a event not support cpu_id, event name is sched_wakeup.
> perf find a event not support cpu_id, event name is sched_wakeup.
> perf cpnnr 0, cpu 8, event name sched_wakeup.
> perf find a event not support cpu_id, event name is sched_wakeup.
> perf cpnnr 2, cpu -1, event name sched_wakeup.
> perf find a event not support cpu_id, event name is sched_wakeup.
> perf cpnnr 3, cpu 13, event name sched_wakeup.
> perf find a event not support cpu_id, event name is sched_switch.
> perf cpnnr 1, cpu 17, event name sched_switch.
> perf find a event not support cpu_id, event name is sched_switch.
> perf cpnnr 0, cpu 27164, event name sched_switch.
> perf find a event not support cpu_id, event name is sched_switch.
> perf cpnnr 3, cpu -1, event name sched_switch.
> perf find a event not support cpu_id, event name is sched_switch.
> perf cpnnr 2, cpu 0, event name sched_switch.
> perf find a event not support cpu_id, event name is sched_switch.
> perf cpnnr 3, cpu 0, event name sched_switch.
> perf find a event not support cpu_id, event name is sched_switch.
> perf cpnnr 2, cpu 17, event name sched_switch.
> perf find a event not support cpu_id, event name is sched_switch.
> perf cpnnr 0, cpu 13, event name sched_switch.
> perf find a event not support cpu_id, event name is sched_switch.
> perf cpnnr 1, cpu 6, event name sched_switch.
> perf find a event not support cpu_id, event name is sched_wakeup.
> perf find a event not support cpu_id, event name is sched_wakeup.
> perf cpnnr 0, cpu 8, event name sched_wakeup.
> perf find a event not support cpu_id, event name is sched_wakeup.
> perf cpnnr 2, cpu -1, event name sched_wakeup.
> perf find a event not support cpu_id, event name is sched_switch.
> perf cpnnr 1, cpu 13, event name sched_switch.
> perf find a event not support cpu_id, event name is sched_wakeup.
> perf cpnnr 3, cpu 27164, event name sched_wakeup.
> perf find a event not support cpu_id, event name is sched_switch.
> perf cpnnr 0, cpu -1, event name sched_switch.
> perf find a event not support cpu_id, event name is sched_switch.
> perf cpnnr 2, cpu -1, event name sched_switch.
> perf find a event not support cpu_id, event name is sched_switch.
> perf cpnnr 3, cpu 0, event name sched_switch.
> perf find a event not support cpu_id, event name is sched_switch.
> perf cpnnr 2, cpu 0, event name sched_switch.
> perf find a event not support cpu_id, event name is sched_switch.
> perf cpnnr 0, cpu 13, event name sched_switch.
> perf find a event not support cpu_id, event name is sched_switch.
> perf cpnnr 3, cpu 6, event name sched_switch.
> perf find a event not support cpu_id, event name is sched_switch.
> perf cpnnr 1, cpu 17, event name sched_switch.
> perf find a event not support cpu_id, event name is sched_wakeup.
> perf find a event not support cpu_id, event name is sched_wakeup.
> perf cpnnr 0, cpu 8, event name sched_wakeup.
> perf find a event not support cpu_id, event name is sched_wakeup.
> perf cpnnr 2, cpu -1, event name sched_wakeup.
> perf find a event not support cpu_id, event name is sched_switch.
> perf cpnnr 1, cpu 13, event name sched_switch.
> perf find a event not support cpu_id, event name is sched_wakeup.
> perf cpnnr 3, cpu 27164, event name sched_wakeup.
> perf find a event not support cpu_id, event name is sched_switch.
> perf cpnnr 0, cpu -1, event name sched_switch.
> perf find a event not support cpu_id, event name is sched_switch.
> perf cpnnr 2, cpu 0, event name sched_switch.
> perf find a event not support cpu_id, event name is sched_switch.
> perf cpnnr 3, cpu 0, event name sched_switch.
> perf find a event not support cpu_id, event name is sched_switch.
> perf cpnnr 3, cpu 0, event name sched_switch.
> perf find a event not support cpu_id, event name is sched_switch.
> perf cpnnr 0, cpu 17, event name sched_switch.
> perf find a event not support cpu_id, event name is sched_switch.
> perf cpnnr 1, cpu 6, event name sched_switch.
> perf find a event not support cpu_id, event name is sched_switch.
> perf cpnnr 2, cpu 8, event name sched_switch.
> perf find a event not support cpu_id, event name is sched_wakeup.
> perf find a event not support cpu_id, event name is sched_wakeup.
> perf cpnnr 0, cpu 8, event name sched_wakeup.
> perf find a event not support cpu_id, event name is sched_wakeup.
> perf cpnnr 3, cpu -1, event name sched_wakeup.
> perf find a event not support cpu_id, event name is sched_switch.
> perf cpnnr 1, cpu 17, event name sched_switch.
> perf find a event not support cpu_id, event name is sched_switch.
> perf cpnnr 0, cpu 27164, event name sched_switch.
> perf find a event not support cpu_id, event name is sched_switch.
> perf cpnnr 3, cpu -1, event name sched_switch.
> perf find a event not support cpu_id, event name is sched_wakeup.
> perf cpnnr 2, cpu 0, event name sched_wakeup.
> perf find a event not support cpu_id, event name is sched_switch.
> perf cpnnr 2, cpu -1, event name sched_switch.
> perf find a event not support cpu_id, event name is sched_switch.
> perf find a event not support cpu_id, event name is sched_switch.
> perf cpnnr 1, cpu 6, event name sched_switch.
> perf find a event not support cpu_id, event name is sched_switch.
> perf cpnnr 2, cpu 8, event name sched_switch.
> perf find a event not support cpu_id, event name is sched_switch.
> perf cpnnr 3, cpu 13, event name sched_switch.
> perf find a event not support cpu_id, event name is hrtimer_expire_entry.
> perf cpnnr 0, cpu 1, event name hrtimer_expire_entry.
> perf find a event not support cpu_id, event name is hrtimer_expire_entry.
> perf cpnnr 2, cpu 773908736, event name hrtimer_expire_entry.
> perf find a event not support cpu_id, event name is hrtimer_expire_entry.
> perf cpnnr 3, cpu 774957312, event name hrtimer_expire_entry.
> perf find a event not support cpu_id, event name is hrtimer_expire_entry.
> perf cpnnr 1, cpu 775481600, event name hrtimer_expire_entry.
> perf find a event not support cpu_id, event name is hrtimer_expire_exit.
> perf cpnnr 3, cpu 774433024, event name hrtimer_expire_exit.
> perf find a event not support cpu_id, event name is hrtimer_expire_exit.
> perf cpnnr 2, cpu 775481600, event name hrtimer_expire_exit.
> perf find a event not support cpu_id, event name is hrtimer_expire_exit.
> perf cpnnr 0, cpu 774957312, event name hrtimer_expire_exit.
> perf find a event not support cpu_id, event name is hrtimer_expire_exit.
> perf cpnnr 1, cpu 773908736, event name hrtimer_expire_exit.
> perf find a event not support cpu_id, event name is softirq_entry.
> perf cpnnr 0, cpu 774433024, event name softirq_entry.
> perf find a event not support cpu_id, event name is softirq_entry.
> perf cpnnr 2, cpu 1, event name softirq_entry.
> perf find a event not support cpu_id, event name is softirq_entry.
> perf cpnnr 3, cpu 1, event name softirq_entry.
> perf find a event not support cpu_id, event name is softirq_entry.
> perf find a event not support cpu_id, event name is softirq_exit.
> perf cpnnr 0, cpu 1, event name softirq_exit.
> perf find a event not support cpu_id, event name is softirq_exit.
> perf find a event not support cpu_id, event name is softirq_exit.
> perf cpnnr 2, cpu 1, event name softirq_exit.
> perf find a event not support cpu_id, event name is softirq_exit.
> perf cpnnr 3, cpu 1, event name softirq_exit.
> perf find a event not support cpu_id, event name is softirq_entry.
> perf find a event not support cpu_id, event name is softirq_entry.
> perf cpnnr 2, cpu 9, event name softirq_entry.
> perf find a event not support cpu_id, event name is softirq_entry.
> perf cpnnr 0, cpu 9, event name softirq_entry.
> perf find a event not support cpu_id, event name is softirq_entry.
> perf cpnnr 3, cpu 9, event name softirq_entry.
> perf find a event not support cpu_id, event name is softirq_exit.
> perf cpnnr 2, cpu 9, event name softirq_exit.
> perf find a event not support cpu_id, event name is softirq_exit.
> perf cpnnr 0, cpu 9, event name softirq_exit.
> perf find a event not support cpu_id, event name is softirq_exit.
> perf cpnnr 1, cpu 9, event name softirq_exit.
> perf find a event not support cpu_id, event name is softirq_exit.
> perf cpnnr 3, cpu 9, event name softirq_exit.
> perf find a event not support cpu_id, event name is sched_switch.
> perf find a event not support cpu_id, event name is hrtimer_expire_entry.
> perf find a event not support cpu_id, event name is sched_wakeup.
> perf cpnnr 2, cpu -1898111448, event name sched_wakeup.
> perf find a event not support cpu_id, event name is hrtimer_expire_exit.
> perf cpnnr 2, cpu 17533, event name hrtimer_expire_exit.
> perf find a event not support cpu_id, event name is sched_switch.
> perf cpnnr 2, cpu -1, event name sched_switch.
> perf find a event not support cpu_id, event name is sched_wakeup.


--===============6541191237722092136==--

