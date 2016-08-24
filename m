Content-Type: multipart/mixed; boundary="===============7605327734146601629=="
MIME-Version: 1.0
From: =?utf-8?q?Ond=C5=99ej_Lyson=C4=9Bk_=3Colysonek_at_redhat=2Ecom=3E?=
Subject: [Powertop] [PATCH] Fixed a dangling pointer
Date: Wed, 24 Aug 2016 14:11:51 +0200
Message-ID: <07192cfc-e760-4f1e-8bee-52f64e256ba3@redhat.com>
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============7605327734146601629==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

---
 traceevent/parse-filter.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/traceevent/parse-filter.c b/traceevent/parse-filter.c
index 2500e75..ec308ae 100644
--- a/traceevent/parse-filter.c
+++ b/traceevent/parse-filter.c
@@ -1720,7 +1720,7 @@ static const char *get_field_str(struct filter_arg *a=
rg, struct pevent_record *r
 	struct pevent *pevent;
 	unsigned long long addr;
 	const char *val =3D NULL;
-	char hex[64];
+	static char hex[64];
 =

 	/* If the field is not a string convert it */
 	if (arg->str.field->flags & FIELD_IS_STRING) {
-- =

2.5.5


--===============7605327734146601629==--

