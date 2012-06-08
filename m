Content-Type: multipart/mixed; boundary="===============5198931295637278098=="
MIME-Version: 1.0
From: Colin Ian King <colin.king at canonical.com>
Subject: [Powertop] questions concerning powertop --calibrate output
Date: Fri, 08 Jun 2012 13:48:29 +0100
Message-ID: <4FD1F49D.6070506@canonical.com>
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============5198931295637278098==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi,

When running 'sudo powertop --calibrate' I observe that it is =

calibrating idle, disk usage, backlight, CPU, USB devices and so forth. =

  At the end of the calibration process powertop dumps out a table =

headed "Parameter state". Couple of questions about this table:

1. What does the "Value" column refer to, and what units are they being =

measured in? I'm trying to figure out the significance of these values.

I believe that the rows are sorted on name order and the following =

number in parentheses refers to the internal index number of this =

device. At first I thought this number had some deeper significance.

2. At the end of the table there are values annotated as "Score", =

"Guess" and "Actual".  Again, what are these referring to?

3. At the end of the calibration process has powertop tuned the system =

to a more "optimal" power configuration?

Thanks for any insight,

Colin


--===============5198931295637278098==--

