Content-Type: multipart/mixed; boundary="===============1219995795760647326=="
MIME-Version: 1.0
From: Martin Walch <walch.martin at web.de>
Subject: [Powertop] Some settings can not be set back from "Good" to "Bad"
Date: Sun, 24 Apr 2016 00:33:59 +0200
Message-ID: <1794735.5a5bPLbTgx@tacticalops>
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============1219995795760647326==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi,

it is possible to toggle some settings like "Enable Audio codec power =

management" from "Bad" to "Good" and back again. However, when exiting =

powertop while it is set to "Good", and then re-running powertop, the value=
 is =

stuck at "Good", i.e. it is not possible to toggle it to "Bad". When trying=
 to =

do so, the status line only shows ">> (null)" instead of something like "ec=
ho =

'' > '/sys/module/snd_hda_intel/parameters/power_save';".

This is probably because sysfs_tunable::bad_value is initialized with "\0" =
and =

does not change its value if it is already set to "Good" when starting up =

powertop. When now calling sysfs_tunable::toggle(void), strlen(bad_value) i=
s 0 =

and the write_sysfs line is not executed.

Is it possible to fix this?

Regards,
Martin Walch
-- =



--===============1219995795760647326==--

