Content-Type: multipart/mixed; boundary="===============7036219309587998820=="
MIME-Version: 1.0
From: Hans-Peter Deifel <hpdeifel at gmx.de>
Subject: [Powertop] [PATCH 0/2] Document key bindings
Date: Sun, 19 May 2013 18:00:41 +0200
Message-ID: <1368979243-3175-1-git-send-email-hpdeifel@gmx.de>
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============7036219309587998820==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi list,

I had trouble finding all keybindings for powertop and decided to
document them better. The first patch makes the code itself more
readable, the second one adds a new section about keys to the man
page.

Regards,
Hans-Peter

Hans-Peter Deifel (2):
  Use symbolic instead of numeric constants for keys
  Document key bindings in man page

 doc/powertop.8 | 32 ++++++++++++++++++++++++++++++++
 src/main.cpp   | 10 +++++-----
 2 files changed, 37 insertions(+), 5 deletions(-)

-- =

1.8.1.5


--===============7036219309587998820==--

