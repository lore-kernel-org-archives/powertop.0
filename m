Content-Type: multipart/mixed; boundary="===============1524924330082977676=="
MIME-Version: 1.0
From: Miguel Ferreira <m.ferreira at sig.eu>
Subject: Re: [Powertop] Process-level power estimation
Date: Wed, 17 Jul 2013 14:16:01 +0200
Message-ID: <3E48080A-34E1-407F-9FFC-911F84B144B1@sig.eu>
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============1524924330082977676==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

I forgot to mention that I'm using PowerTop 2.3

And I'm sorry for the HTML message! These dam signatures...

> Hi,
> =

> I'm currently doing research into power profiling tools and PowerTop is o=
ne of the tools I would like to test.
> =

> Because the research I'm doing is on server hardware I had to use an exte=
rnal power meter with PowerTop.
> I've decided to use a Watts Up? Pro meter because I already had one, so I=
 changed the code (in src/measurement/extech.cpp) that reads from the Extec=
h to read from the Watts Up? Pro. =

> As a result PowerTop now reports on energy drain and that seems correct.
> =

> I read in other threads that PowerTop needs to accumulate measurements be=
fore it can provide process-level power estimates.
> I also read that it should collect (roughly) over 100 measurements.
> So I ran PowerTop in calibration mode and then left it running for over 3=
0 minutes (with an update interval of 1 second).
> Still I don't get the first column ("Power est.") shown in the About page=
 of the website.
> =

> I'm wondering how can I check if PowerTop is collecting measurements at a=
ll?
> Or do I just need to let it run for longer?

Miguel
_________________________
Miguel Ferreira | Researcher
+31 20 314 09 50 | m.ferreira(a)sig.eu =

Software Improvement Group | www.sig.eu



--===============1524924330082977676==--

