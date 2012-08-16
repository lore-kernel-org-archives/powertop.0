Content-Type: multipart/mixed; boundary="===============3861745164827293462=="
MIME-Version: 1.0
From: Chris Ferron <chris.e.ferron at linux.intel.com>
Subject: Re: [Powertop] [Announcement] Release of PowerTOP v2.1
Date: Thu, 16 Aug 2012 09:00:15 -0700
Message-ID: <502D190F.8060700@linux.intel.com>
In-Reply-To: 1491217031.6681372.1345118324523.JavaMail.root@redhat.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============3861745164827293462==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 08/16/2012 04:58 AM, Jaroslav Skarvada wrote:
> Thanks for the release.
>
> One problem that I spotted during the rebuild for Fedora -
> there are some object files included in the archive:
>
> $ ls -1 src/tuning/*.o
> src/tuning/powertop-bluetooth.o
> src/tuning/powertop-cpufreq.o
> src/tuning/powertop-ethernet.o
> src/tuning/powertop-iw.o
> src/tuning/powertop-runtime.o
> src/tuning/powertop-tunable.o
> src/tuning/powertop-tuning.o
> src/tuning/powertop-tuningsysfs.o
> src/tuning/powertop-tuningusb.o
> src/tuning/powertop-wifi.o
> _______________________________________________
> PowerTop mailing list
> PowerTop(a)lists.01.org
> https://lists.01.org/mailman/listinfo/powertop
Sorry about that, its fixed. Thanks for the find.
-Chris


--===============3861745164827293462==--

