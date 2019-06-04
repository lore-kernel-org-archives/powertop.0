Content-Type: multipart/mixed; boundary="===============3444668818532948549=="
MIME-Version: 1.0
From: Rosen Penev <rosenp at gmail.com>
Subject: [Powertop] [PATCH] event-parse: Add compatibility for non GNU
 strerror_r
Date: Tue, 04 Jun 2019 12:04:47 -0700
Message-ID: <20190604190447.8561-1-rosenp@gmail.com>
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============3444668818532948549==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Needed for libraries like musl that do not implement the GNU variant.

Signed-off-by: Rosen Penev <rosenp(a)gmail.com>
---
 traceevent/event-parse.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/traceevent/event-parse.c b/traceevent/event-parse.c
index 5a717a0..1f7eb80 100644
--- a/traceevent/event-parse.c
+++ b/traceevent/event-parse.c
@@ -5121,12 +5121,17 @@ int pevent_strerror(struct pevent *pevent __maybe_u=
nused,
 	const char *msg;
 =

 	if (errnum >=3D 0) {
+#if defined(__GLIBC__)
 		msg =3D strerror_r(errnum, buf, buflen);
 		if (msg !=3D buf) {
 			size_t len =3D strlen(msg);
 			memcpy(buf, msg, min(buflen - 1, len));
 			*(buf + min(buflen - 1, len)) =3D '\0';
 		}
+#else
+		if (strerror_r(errnum, buf, buflen))
+			snprintf(buf, buflen, "errnum %i", errnum);
+#endif
 		return 0;
 	}
 =

-- =

2.17.1


--===============3444668818532948549==--

