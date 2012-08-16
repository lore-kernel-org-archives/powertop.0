Content-Type: multipart/mixed; boundary="===============4637858047321036934=="
MIME-Version: 1.0
From: Jaroslav Skarvada <jskarvad at redhat.com>
Subject: Re: [Powertop] [Announcement] Release of PowerTOP v2.1
Date: Thu, 16 Aug 2012 07:58:44 -0400
Message-ID: <1491217031.6681372.1345118324523.JavaMail.root@redhat.com>
In-Reply-To: 502C13F6.3070305@linux.intel.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============4637858047321036934==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Thanks for the release.

One problem that I spotted during the rebuild for Fedora -
there are some object files included in the archive:

$ ls -1 src/tuning/*.o
src/tuning/powertop-bluetooth.o
src/tuning/powertop-cpufreq.o
src/tuning/powertop-ethernet.o
src/tuning/powertop-iw.o
src/tuning/powertop-runtime.o
src/tuning/powertop-tunable.o
src/tuning/powertop-tuning.o
src/tuning/powertop-tuningsysfs.o
src/tuning/powertop-tuningusb.o
src/tuning/powertop-wifi.o

--===============4637858047321036934==--

