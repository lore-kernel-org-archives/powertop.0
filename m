Content-Type: multipart/mixed; boundary="===============8096176869339872457=="
MIME-Version: 1.0
From: Nanley Chery <nanleychery at gmail.com>
Subject: [Powertop] [PATCH v2 0/1] Update target value of Power Aware CPU
 scheduler tunable
Date: Thu, 14 Aug 2014 14:04:37 -0400
Message-ID: <1408039478-23276-1-git-send-email-nanleychery@gmail.com>
In-Reply-To: 1407979685-1745-1-git-send-email-nanleychery@gmail.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============8096176869339872457==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Removed the check for the kernel version. add_sysfs_tunable() actually
doesn't create the tunable if the sysfs file doesn't exist. This should
be the case for kernel versions after 3.4, so the problem will be
handled gracefully.

Also word-wrapped the commit to 72 columns.

Nanley Chery (1):
  tunable: update sched_mc_power_savings target val

 src/tuning/tuning.cpp | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- =

2.0.4


--===============8096176869339872457==--

