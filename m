Content-Type: multipart/mixed; boundary="===============7165319653118867670=="
MIME-Version: 1.0
From: Wolf Drechsel <wd-p at trolink.de>
Subject: [Powertop] last bit of tuning
Date: Sat, 16 Jun 2018 21:57:32 +0200
Message-ID: <1529179052.11174.1.camel@trolink.de>
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============7165319653118867670==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello,

powertop works like a charm - nearly a litte magic...

I'm on a Debian 9.1, PowerTOP version v2.8, compiled on Nov=C2=A0=C2=A06 20=
15.
"powertop --auto-tune" did a very good job, most "bad" signs changed to
"good"

Only a little bit remains - these three lines remain "bad" (in need of
tuning):

Energieverwaltung f=C3=BCr Audiocodec aktivieren=C2=A0	echo '1' >
'/sys/module/snd_hda_intel/parameters/power_save';

Zeit=C3=BCberschreitung beim VM zur=C3=BCckschreiben=C2=A0	echo '1500' >
'/proc/sys/vm/dirty_writeback_centisecs';

Wake-On-LAN-Status f=C3=BCr Ger=C3=A4t enp0s25=C2=A0	ethtool -s enp0s25 wol=
 d;=C2=A0


Web hits seem to be quite outdated.. - so: Where should I place the
three commands above?

Cheers,
Wolf


--===============7165319653118867670==--

