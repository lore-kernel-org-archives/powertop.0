Content-Type: multipart/mixed; boundary="===============1586908691462992451=="
MIME-Version: 1.0
From: Sergey Senozhatsky <sergey.senozhatsky at gmail.com>
Subject: Re: [Powertop] [PATCH] catch fstream exceptions in lib routines (v2)
Date: Tue, 22 May 2012 00:05:51 +0300
Message-ID: <20120521210551.GA27971@swordfish>
In-Reply-To: 4FBA9581.8080903@linux.intel.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============1586908691462992451==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On (05/21/12 12:20), Chris Ferron wrote:
> =

> patch accepted by hand merge from v1.
> Thanks
> -Chris
>

Thank you.

	-ss

> =

> On 05/18/2012 04:18 AM, Sergey Senozhatsky wrote:
> >[PATCH] catch fstream exceptions in lib routines (v2)
> >
> >Catch possible fstream and traits_type exceptions in lib.
> >
> >V2: Thanks to Peter, he pointed to silly typo I've done in V1.
> >
> >Reported-and-tested-by: Lekensteyn<lekensteyn(a)gmail.com>
> >Signed-off-by: Sergey Senozhatsky<sergey.senozhatsky(a)gmail.com>
> >
> >---
> >
> >  src/lib.cpp |   54 +++++++++++++++++++++++++++++++++++++++------------=
---
> >  1 file changed, 39 insertions(+), 15 deletions(-)
> >
> >diff --git a/src/lib.cpp b/src/lib.cpp
> >index 53638dd..0c2c1f1 100644
> >--- a/src/lib.cpp
> >+++ b/src/lib.cpp
> >@@ -172,8 +172,13 @@ void write_sysfs(const string&filename, const strin=
g&value)
> >  	file.open(filename.c_str(), ios::out);
> >  	if (!file)
> >  		return;
> >-	file<<  value;
> >-	file.close();
> >+	try
> >+	{
> >+		file<<  value;
> >+		file.close();
> >+	} catch (std::exception&exc) {
> >+		return;
> >+	}
> >  }
> >
> >  int read_sysfs(const string&filename, bool *ok)
> >@@ -187,10 +192,17 @@ int read_sysfs(const string&filename, bool *ok)
> >  			*ok =3D false;
> >  		return 0;
> >  	}
> >-	file>>  i;
> >+	try
> >+	{
> >+		file>>  i;
> >+		if (ok)
> >+			*ok =3D true;
> >+	} catch (std::exception&exc) {
> >+		if (ok)
> >+			*ok =3D false;
> >+		i =3D 0;
> >+	}
> >  	file.close();
> >-	if (ok)
> >-		*ok =3D true;
> >  	return i;
> >  }
> >
> >@@ -203,11 +215,17 @@ string read_sysfs_string(const string&filename)
> >  	file.open(filename.c_str(), ios::in);
> >  	if (!file)
> >  		return "";
> >-	file.getline(content, 4096);
> >-	file.close();
> >-	c =3D strchr(content, '\n');
> >-	if (c)
> >-		*c =3D 0;
> >+	try
> >+	{
> >+		file.getline(content, 4096);
> >+		file.close();
> >+		c =3D strchr(content, '\n');
> >+		if (c)
> >+			*c =3D 0;
> >+	} catch (std::exception&exc) {
> >+		file.close();
> >+		return "";
> >+	}
> >  	return content;
> >  }
> >
> >@@ -224,11 +242,17 @@ string read_sysfs_string(const char *format, const=
 char *param)
> >  	file.open(filename, ios::in);
> >  	if (!file)
> >  		return "";
> >-	file.getline(content, 4096);
> >-	file.close();
> >-	c =3D strchr(content, '\n');
> >-	if (c)
> >-		*c =3D 0;
> >+	try
> >+	{
> >+		file.getline(content, 4096);
> >+		file.close();
> >+		c =3D strchr(content, '\n');
> >+		if (c)
> >+			*c =3D 0;
> >+	} catch (std::exception&exc) {
> >+		file.close();
> >+		return "";
> >+	}
> >  	return content;
> >  }
> >
> >
>=20

--===============1586908691462992451==--

