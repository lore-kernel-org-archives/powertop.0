Content-Type: multipart/mixed; boundary="===============4693196723181914615=="
MIME-Version: 1.0
From: Sergey Senozhatsky <sergey.senozhatsky at gmail.com>
Subject: Re: [Powertop] [PATCH] perf_bundle: introduce fixup_sample_trace_cpu()
Date: Wed, 09 Oct 2013 12:02:17 +0300
Message-ID: <20131009090217.GA2532@swordfish.minsk.epam.com>
In-Reply-To: CANHzE=2MDsgFHew0-ga-aNSvEqvmAnvKgitiRZGPW2o07rLHmw@mail.gmail.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============4693196723181914615==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On (10/09/13 11:54), Shaojie Sun wrote:
> Hi Sergey
>     I tested the patch running in our system.
>     Next is the test result.

Hello,
So the patch seems to work for you. Thanks.

	-ss

> fixed [cpu_frequency] cpuid from 2 to 3
> fixed [cpu_frequency] cpuid from 2 to 4
> fixed [cpu_frequency] cpuid from 2 to 3
> fixed [cpu_frequency] cpuid from 2 to 4
> fixed [cpu_frequency] cpuid from 2 to 3
> fixed [cpu_frequency] cpuid from 2 to 4
> fixed [cpu_frequency] cpuid from 2 to 0
> fixed [cpu_frequency] cpuid from 2 to 1
> fixed [cpu_frequency] cpuid from 2 to 0
> fixed [cpu_frequency] cpuid from 2 to 1
> fixed [cpu_frequency] cpuid from 2 to 0
> fixed [cpu_frequency] cpuid from 2 to 1
> fixed [cpu_frequency] cpuid from 2 to 0
> fixed [cpu_frequency] cpuid from 2 to 1
> fixed [cpu_frequency] cpuid from 2 to 0
> fixed [cpu_frequency] cpuid from 2 to 1
> fixed [cpu_frequency] cpuid from 2 to 0
> fixed [cpu_frequency] cpuid from 2 to 1
> fixed [cpu_frequency] cpuid from 2 to 0
> fixed [cpu_frequency] cpuid from 2 to 1
> fixed [cpu_frequency] cpuid from 2 to 0
> fixed [cpu_frequency] cpuid from 2 to 1
> fixed [cpu_frequency] cpuid from 2 to 3
> fixed [cpu_frequency] cpuid from 2 to 4
> fixed [cpu_frequency] cpuid from 2 to 3
> fixed [cpu_frequency] cpuid from 2 to 4
> fixed [cpu_frequency] cpuid from 2 to 3
> fixed [cpu_frequency] cpuid from 2 to 4
> fixed [cpu_frequency] cpuid from 2 to 0
> fixed [cpu_frequency] cpuid from 2 to 1
> fixed [cpu_frequency] cpuid from 2 to 0
> =

> On Tue, Oct 8, 2013 at 10:55 PM, Sergey Senozhatsky
> <sergey.senozhatsky(a)gmail.com> wrote:
> > Could you please test this patch?
> >
> >
> > struct perf_sample's trace cpu is a raw_smp_processor_id()
> > (as requsted by PERF_SAMPLE_CPU) by the time of perf_event_output()
> > call, which may differ from original struct perf_event's cpu.
> > thus we need to fix sample->trace.cpu via fixup_sample_trace_cpu()
> > call.
> >
> > debugging output has demonstrated that some events (namely cpu_frequenc=
y)
> > were routed incorrectly (sample->trace.cpu !=3D pevent_get_field_val("c=
pu_id")):
> > fix [cpu_frequency] cpu_nr from 1 to 0
> > fix [cpu_frequency] cpu_nr from 1 to 0
> > fix [cpu_frequency] cpu_nr from 1 to 2
> > fix [cpu_frequency] cpu_nr from 1 to 2
> > fix [cpu_frequency] cpu_nr from 1 to 3
> > fix [cpu_frequency] cpu_nr from 1 to 3
> > fix [cpu_frequency] cpu_nr from 1 to 0
> > fix [cpu_frequency] cpu_nr from 1 to 0
> > fix [cpu_frequency] cpu_nr from 1 to 2
> > fix [cpu_frequency] cpu_nr from 1 to 2
> > fix [cpu_frequency] cpu_nr from 1 to 0
> > fix [cpu_frequency] cpu_nr from 1 to 0
> > fix [cpu_frequency] cpu_nr from 1 to 0
> >
> > Thanks for reporting and tracking this down to (not in any particular
> > order): Shaojie Sun, Jon Medhurst, Sanjay Rawat, SunShaoJie.
> >
> > Cc: Shaojie Sun <shaojie.sun(a)linaro.org>
> > Cc: Jon Medhurst <jon.medhurst(a)linaro.org>
> > Cc: Sanjay Rawat <sanjay.rawat(a)linaro.org>
> > Cc: SunShaoJie <sunshaojie(a)huawei.com>
> > Signed-off-by: Sergey Senozhatsky <sergey.senozhatsky(a)gmail.com>
> >
> > ---
> >
> > diff --git a/src/perf/perf_bundle.cpp b/src/perf/perf_bundle.cpp
> > index 8d480e8..b0e982b 100644
> > --- a/src/perf/perf_bundle.cpp
> > +++ b/src/perf/perf_bundle.cpp
> > @@ -285,6 +285,31 @@ static bool event_sort_function (void *i, void *j)
> >         return (timestamp(I)<timestamp(J));
> >  }
> >
> > +/*
> > + * sample's PERF_SAMPLE_CPU cpu nr is a raw_smp_processor_id() by the
> > + * time of perf_event_output(), which may differ from struct perf_event
> > + * cpu, thus we need to fix sample->trace.cpu.
> > + */
> > +static void fixup_sample_trace_cpu(struct perf_sample *sample)
> > +{
> > +       struct event_format *event;
> > +       struct pevent_record rec;
> > +       unsigned long long cpu_nr;
> > +       int type;
> > +       int ret;
> > +
> > +       rec.data =3D &sample->data;
> > +       type =3D pevent_data_type(perf_event::pevent, &rec);
> > +       event =3D pevent_find_event(perf_event::pevent, type);
> > +       if (!event)
> > +               return;
> > +       /** don't touch trace if event does not contain cpu_id field*/
> > +       ret =3D pevent_get_field_val(NULL, event, "cpu_id", &rec, &cpu_=
nr, 0);
> > +       if (ret < 0)
> > +               return;
> > +       sample->trace.cpu =3D cpu_nr;
> > +}
> > +
> >  void perf_bundle::process(void)
> >  {
> >         unsigned int i;
> > @@ -309,6 +334,7 @@ void perf_bundle::process(void)
> >                 if (sample->header.type !=3D PERF_RECORD_SAMPLE)
> >                         continue;
> >
> > +               fixup_sample_trace_cpu(sample);
> >                 handle_trace_point(&sample->data, sample->trace.cpu, sa=
mple->trace.time);
> >         }
> >  }
> >
>=20

--===============4693196723181914615==--

