Content-Type: multipart/mixed; boundary="===============8797239717484020097=="
MIME-Version: 1.0
From: Sergey Senozhatsky <sergey.senozhatsky at gmail.com>
Subject: [Powertop] introduce powertop2 -next
Date: Tue, 17 Sep 2013 22:30:33 +0300
Message-ID: <20130917193033.GC2289@swordfish>
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============8797239717484020097==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello everybody,

I've forked a powertop2-next (well, let it be our -next) from the current
code and dig through the list from February 2013 to September 2013 and
picked up all patches that haven't been merged. so we have better chances
not to lose them (we'll merge them with the upstream some day)

URL:  https://github.com/sergey-senozhatsky/powertop2-next

WARNING: the rule remains the same - we use mailing list to publish and dis=
cuss
patches, please no github pull requests, etc.



shortlog at the moment is as follows:

Hans-Peter Deifel (2):
      Use symbolic instead of numeric constants for keys
      Document key bindings in man page

Sergey Senozhatsky (5):
      Suppress decimal constant compilation warning (From: Paul Menzel <pau=
lepanter(a)users.sourceforge.net>)
      Seg Fault due to function format_watts in file src/lib.cpp
      Do not leak fd in perf_bundle read_file()
      README: add CONFIG_DEBUG_FS to Kernel Parameters
      Introduce --auto-tune mode

Youquan Song (1):
      Fix running failure when > 69 CPUs for open file limitation




Daniel Kahn Gillmor's 'embed self-contained javascript' patch has some minor
issues at the moment.


NOTE: if you feel that your patch has been lost, please kindly rebase and r=
esend.

Thanks,
        -ss

--===============8797239717484020097==--

