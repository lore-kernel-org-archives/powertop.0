Content-Type: multipart/mixed; boundary="===============4118089675334335289=="
MIME-Version: 1.0
From: Nanley Chery <nanleychery at gmail.com>
Subject: [Powertop] [PATCH 0/1] Update target value of Power Aware CPU
 scheduler tunable
Date: Wed, 13 Aug 2014 21:28:04 -0400
Message-ID: <1407979685-1745-1-git-send-email-nanleychery@gmail.com>
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============4118089675334335289==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello,

This patch fixes a problem made evident by the debian bug 655843,
'powertop report[s] incorrect "bad" value.' =


The issue is that the tunable for the "Power Aware CPU scheduler" has an
outdated target value of "1". That value was correct in linux kernels
before the 2.6.29 release. However, starting with the 2.6.29 release,
the level setting for the scheduler that offered the greatest power
savings was increased to "2" (linux kernel commit:
afb8a9b70b86866a60e08b2956ae4e1406390336).  Eventually, due to seemingly
poor code maintenance, the power aware scheduler feature was removed
altogther in the 3.5 linux kernel (linux kernel commit:
8e7fbcbc22c12414bcc9dfdd683637f58fb32759).

According to the README file, we currently support kernels that have the
updated power savings level (>=3D 2.6.38). Therefore, this patch updates
the target value to "2" and conditionally omits adding the tunable for
kernel versions that do not support the feature (>=3D 3.5).

Nanley Chery (1):
  tunable: update sched_mc_power_savings target value

 src/tuning/tuning.cpp | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

-- =

2.0.4


--===============4118089675334335289==--

