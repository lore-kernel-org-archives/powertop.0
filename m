Content-Type: multipart/mixed; boundary="===============7824622281171096331=="
MIME-Version: 1.0
From: Rick "Zero_Chaos" Farina <zerochaos at gentoo.org>
Subject: [Powertop] [Bug report] prebuilt object files in tarball
Date: Tue, 04 Sep 2012 11:17:51 -0400
Message-ID: <50461B9F.9040006@gentoo.org>
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============7824622281171096331==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

ozzie tuning # pwd
/tmp/powertop-2.1/src/tuning
ozzie tuning # ls *.o
powertop-bluetooth.o  powertop-runtime.o      powertop-tuningusb.o
powertop-cpufreq.o    powertop-tunable.o      powertop-wifi.o
powertop-ethernet.o   powertop-tuning.o
powertop-iw.o         powertop-tuningsysfs.o
ozzie tuning #


The powertop 2.1 tarball contains some prebuilt object files causing
build to fail on systems with incompatible CFLAGS (like on hardened
systems).  Yes a simple "make clean" at the right time can fix this but
it would be super if we could get the tarball respun without the
unneeded and breakage causing precompiled objects.

Keep up the great work though, I'm super happy to see such active
development in powertop.

Thanks,
Zero
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iQIcBAEBAgAGBQJQRhufAAoJEKXdFCfdEflKIiYQAKvyhyBS+9+Y+SFIZ8xIQ409
VBLjSYCaYDkrdQOV5xYZsViFGyISkMDxCC3RG6EUjX83ASINvNY0IAEVKAi/lWQr
EunS741wxuGLcxgiPWOHx7KzSep5hUo0sif6Q3083rm0AKK2uBAoDe8V8kcbKFja
1g95joSRtkpU3r/MrT2KM3u8+dbTiQnQM5TpD8nCY+GndcSM/pkOicokpWDXKjPj
G6kCHVw7uLlBs14cgMWxU/uU9yeoR3C0Fy1aUpyGVQoKggI5RK7Ev/0oYtUfOFgN
qNC6uhBTXrMm8fAiEcfDEHrbeGUespwngwFaPeZU0CC0dmwUEvWPG1Le+9EfcXNA
PJQ0GlDk/wL/KEYxi1FCeZa0pS7XqZADXKbWY+/T3VhKFxs7XAceU8I3L4jdCbxA
2CurNWhj28I1vGaCpND7yZgnisY4EkK8YEZrSCzxbPU2uli5cSuhPUM3d8FuHT/U
Kr6MxfUVEE5cN6ruC2N4ePkXuoRHGYbgpO1vL2g7TnYTHO/fYgti2ER4JwS8P8mt
mg/KjBCqdbpffURnH+JAITN8gZAVsg4YpzZBjhvt67S8g1d5xbOTkZD/RAMd0ep7
hqsAcbww+ht6XaVgRXyXfuLlysZFnEpm87XvfLXpMX80a1FSaxjq2xEgpXP78jJ7
1FdgGhGmQ2P8kSpq7md5
=3DOBDl
-----END PGP SIGNATURE-----

--===============7824622281171096331==--

