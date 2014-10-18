Content-Type: multipart/mixed; boundary="===============2252238700739596691=="
MIME-Version: 1.0
From: SF Markus Elfring <elfring at users.sourceforge.net>
Subject: [Powertop] Completion of error handling
Date: Sat, 18 Oct 2014 22:10:30 +0200
Message-ID: <5442C936.3000303@users.sourceforge.net>
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============2252238700739596691==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello,

I have looked at a few source files for your current software. I have notic=
ed
that some checks for return codes are missing.

Would you like to add more error handling for return values from functions =
like
the following?
- fputs =E2=87=92 finish_report_output

https://github.com/fenrus75/powertop/blob/79123b34cf2cac2edeb918087dfc73f7b=
219cf54/src/report/report.cpp#L200

- pthread_create =E2=87=92 cpu_calibration

https://github.com/fenrus75/powertop/blob/cdff23d6e40e31a68286a51e3c94c8a90=
1a74091/src/calibrate/calibrate.cpp#L252

- pthread_join =E2=87=92 extech_power_meter::end_measurement

https://github.com/fenrus75/powertop/blob/a5465a282107da5205b7928fe4ce4f642=
d1fd770/src/measurement/extech.cpp#L328

Regards,
Markus

--===============2252238700739596691==--

