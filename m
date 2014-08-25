Content-Type: multipart/mixed; boundary="===============7290755335296430447=="
MIME-Version: 1.0
From: Salman Ahmed <salman0yam at gmail.com>
Subject: [Powertop] [PATCH RESEND] Powertop: remove unnecessary code
Date: Mon, 25 Aug 2014 11:30:56 +0600
Message-ID: <CAH0joKF07+1mC4dvqvVXjaWoeTdYc=4SjBX1SFvQABhO=gUHuw@mail.gmail.com>
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============7290755335296430447==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

nr_open is already initialized by NR_OPEN_DEF. Removing unnecessary checkin=
g and
assignment.

Signed-off-by: Salman Ahmed <salman0yam(a)gmail.com>
---
 src/main.cpp | 2 --
 1 file changed, 2 deletions(-)

diff --git a/src/main.cpp b/src/main.cpp
index cf4e547..990bc1f 100644
--- a/src/main.cpp
+++ b/src/main.cpp
@@ -293,8 +293,6 @@ static int get_nr_open(void) {
        file.open("/proc/sys/fs/nr_open", ios::in);
        if (file) {
                file >> nr_open;
-               if (!file)
-                       nr_open =3D NR_OPEN_DEF;
                file.close();
        }
        return nr_open;
--
1.8.1.2

--===============7290755335296430447==--

