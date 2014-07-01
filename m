Content-Type: multipart/mixed; boundary="===============6676726001591842586=="
MIME-Version: 1.0
From: Sergey Senozhatsky <sergey.senozhatsky at gmail.com>
Subject: Re: [Powertop] [PATCH POWERTOP] Fix various resource leaks
Date: Tue, 01 Jul 2014 21:47:14 +0900
Message-ID: <20140701124714.GA1143@swordfish>
In-Reply-To: CAP245DVj8JEWx2oDUvoUBB2+jTKkP9P8CaUXmUbPcfHSUZ9ikg@mail.gmail.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============6676726001591842586==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On (07/01/14 17:54), Amit Kucheria wrote:
> Date: Tue, 1 Jul 2014 17:54:15 +0530
> From: Amit Kucheria <amit.kucheria(a)linaro.org>
> To: Mohammad Merajul Islam Molla <meraj.enigma(a)gmail.com>,
>  powertop(a)lists.01.org
> Cc: Lists linaro-dev <linaro-dev(a)lists.linaro.org>
> Subject: Re: [Powertop] [PATCH POWERTOP] Fix various resource leaks
> =

> Mohammad,
> =

> This fix should go upstream. cc'ing the powertop list.
> =

> Regards,
> Amit
> =

> On Thu, Jun 26, 2014 at 12:42 PM, Mohammad Merajul Islam Molla
> <meraj.enigma(a)gmail.com> wrote:
> > Fixes some resource leaks detected by valgrind and coverity scan.
> >
> >
> > diff --git a/src/devices/ahci.cpp b/src/devices/ahci.cpp
> > index ac06460..7f704b6 100644
> > --- a/src/devices/ahci.cpp
> > +++ b/src/devices/ahci.cpp
> > @@ -64,8 +64,10 @@ static string disk_name(char *path, char *target,
> > char *shortname)
> >                 sprintf(line, "%s/%s/model", pathname, dirent->d_name);
> >                 file =3D fopen(line, "r");
> >                 if (file) {
> > -                       if (fgets(line, 4096, file) =3D=3D NULL)
> > +                       if (fgets(line, 4096, file) =3D=3D NULL) {
> > +                               fclose(file);
> >                                 break;
> > +                       }
> >                         fclose(file);
> >                         c =3D strchr(line, '\n');
> >                         if (c)
> > diff --git a/src/devices/devfreq.cpp b/src/devices/devfreq.cpp
> > index e16951c..23c4b0c 100644
> > --- a/src/devices/devfreq.cpp
> > +++ b/src/devices/devfreq.cpp
> > @@ -238,6 +238,7 @@ void create_all_devfreq_devices(void)
> >
> >         callback fn =3D &devfreq_dev_callback;
> >         process_directory(p.c_str(), fn);
> > +       closedir(dir);

I don't see this file at
https://github.com/fenrus75/powertop/tree/master/src/devices

afair, process_directory() closes dir.

	-ss

> >  }
> >
> >  void initialize_devfreq(void)
> > diff --git a/src/perf/perf_bundle.cpp b/src/perf/perf_bundle.cpp
> > index b0e982b..cf1ae11 100644
> > --- a/src/perf/perf_bundle.cpp
> > +++ b/src/perf/perf_bundle.cpp
> > @@ -142,8 +142,10 @@ static void parse_event_format(const char *event_n=
ame)
> >
> >         buf =3D read_file(file);
> >         free(file);
> > -       if (!buf)
> > +       if (!buf) {
> > +               free(name);
> >                 return;
> > +       }
> >
> >         pevent_parse_event(perf_event::pevent, buf, strlen(buf), sys);
> >         free(name);
> > diff --git a/src/tuning/bluetooth.cpp b/src/tuning/bluetooth.cpp
> > index e0bdf12..5100a8a 100644
> > --- a/src/tuning/bluetooth.cpp
> > +++ b/src/tuning/bluetooth.cpp
> > @@ -144,8 +144,10 @@ int bt_tunable::good_bad(void)
> >                 if (file) {
> >                         char line[2048];
> >                         /* first line is standard header */
> > -                       if (fgets(line, 2047, file) =3D=3D NULL)
> > +                       if (fgets(line, 2047, file) =3D=3D NULL) {
> > +                               pclose(file);
> >                                 goto out;
> > +                       }
> >                         memset(line, 0, 2048);
> >                         if (fgets(line, 2047, file) =3D=3D NULL) {
> >                                 result =3D last_check_result =3D TUNE_G=
OOD;
> >
> >
> >
> > --
> > Thanks,
> > -Meraj
> >
> > _______________________________________________
> > linaro-dev mailing list
> > linaro-dev(a)lists.linaro.org
> > http://lists.linaro.org/mailman/listinfo/linaro-dev
> >
> _______________________________________________
> PowerTop mailing list
> PowerTop(a)lists.01.org
> https://lists.01.org/mailman/listinfo/powertop
>=20

--===============6676726001591842586==--

