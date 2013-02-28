Content-Type: multipart/mixed; boundary="===============2335064743516497827=="
MIME-Version: 1.0
From: Sergey Senozhatsky <sergey.senozhatsky at gmail.com>
Subject: Re: [Powertop] Seg Fault due to function format_watts in file
 src/lib.cpp
Date: Thu, 28 Feb 2013 15:23:30 +0300
Message-ID: <20130228122330.GA20373@swordfish.chats.eng.ddn.int>
In-Reply-To: CABa1t5xZAVYvWagoJR8n-K1iMUZGSJzWtsfmm3HC-FXF-B9hXw@mail.gmail.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============2335064743516497827==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On (02/28/13 14:45), Ganapati Bhat wrote:
> Date: Thu, 28 Feb 2013 14:45:04 +0530
> From: Ganapati Bhat <life.mytake(a)gmail.com>
> To: powertop(a)lists.01.org
> Subject: [Powertop] Seg Fault due to function format_watts in file
>  src/lib.cpp
> =

>    Dear All,
>    I was compiling powertop as an Android external module and using the
>    option powertop --html. However, there used to be a segmentation fault.
>    When i looked into it, I observed that in the function format_watts in
>    src/lib.cpp, the last=EF=BF=BDargument=EF=BF=BDto mbstows was zero. By=
 changing the
>    argument to len, which is itself an argument to the function format_wa=
tts,
>    powertop worked properly? Does this also happen on an x86 machine? ( I=
 am
>    unable to verify this due to some problems in my laptop which I have n=
ot
>    yet resolved.) If not then can someone explain to me why is it happeni=
ng
>    in the case of android?
>    Thanks and Regards,
>    Ganapati

could you try the following patch?

------8<-------8<---------


Use

size_t mbsrtowcs (wchar t *restrict dst, const char **restrict src,
        size t len, mbstate t *restrict ps)

which explicitly handles dst =3D=3D NULL case:

	If dst is not a null pointer, the result is stored in the array pointed to=
 by dst; otherwise,
	the conversion result is not available since it is stored in an internal b=
uffer.

while

size_t mbstowcs (wchar t *wstring, const char *string, size t size)

does not (at least not in my glibc 2.17 docs), thus is free to cause undefi=
ned behavior.

Reported-by: Ganapati Bhat <life.mytake(a)gmail.com>
Signed-off-by: Sergey Senozhatsky <sergey.senozhatsky(a)gmail.com>

---

 src/lib.cpp                | 25 +++++++++++++++++++++----
 src/lib.h                  |  1 +
 src/process/do_process.cpp | 10 ++++++----
 3 files changed, 28 insertions(+), 8 deletions(-)

diff --git a/src/lib.cpp b/src/lib.cpp
index 723517a..1a2f6c8 100644
--- a/src/lib.cpp
+++ b/src/lib.cpp
@@ -257,22 +257,39 @@ string read_sysfs_string(const char *format, const ch=
ar *param)
 	return content;
 }
 =

+void align_string(char *buffer, size_t min_sz, size_t max_sz)
+{
+	size_t sz;
+
+	/** mbsrtowcs() allows NULL dst and zero sz,
+	 * comparing to mbstowcs(), which causes undefined
+	 * behaviour under given circumstances*/
+
+	/* start with mbsrtowcs() local mbstate_t * and
+	 * NULL dst pointer*/
+	sz =3D mbsrtowcs(NULL, (const char **)&buffer, max_sz, NULL);
+	if (sz =3D=3D (size_t)-1) {
+		buffer[min_sz] =3D 0x00;
+		return;
+	}
+	while (sz < min_sz) {
+		strcat(buffer, " ");
+		sz++;
+	}
+}
 =

 void format_watts(double W, char *buffer, unsigned int len)
 {
 	buffer[0] =3D 0;
 	char buf[32];
-
 	sprintf(buffer, _("%7sW"), fmt_prefix(W, buf));
 =

 	if (W < 0.0001)
 		sprintf(buffer, _("    0 mW"));
 =

-	while (mbstowcs(NULL,buffer,0) < len)
-		strcat(buffer, " ");
+	align_string(buffer, len, len);
 }
 =

-
 #ifndef HAVE_NO_PCI
 static struct pci_access *pci_access;
 =

diff --git a/src/lib.h b/src/lib.h
index de2de5a..867f480 100644
--- a/src/lib.h
+++ b/src/lib.h
@@ -75,4 +75,5 @@ extern void process_directory(const char *d_name, callbac=
k fn);
 extern int utf_ok;
 extern int get_user_input(char *buf, unsigned sz);
 =

+extern void align_string(char *buffer, size_t min_sz, size_t max_sz);
 #endif
diff --git a/src/process/do_process.cpp b/src/process/do_process.cpp
index 322ad4c..4aa1a92 100644
--- a/src/process/do_process.cpp
+++ b/src/process/do_process.cpp
@@ -852,13 +852,13 @@ void process_update_display(void)
 		char usage[20];
 		char events[20];
 		char descr[128];
-		format_watts(all_power[i]->Witts(), power, 10);
 =

+		format_watts(all_power[i]->Witts(), power, 10);
 		if (!show_power)
 			strcpy(power, "          ");
 		sprintf(name, "%s", all_power[i]->type());
-		while (mbstowcs(NULL,name,0) < 14) strcat(name, " ");
 =

+		align_string(name, 14, 20);
 =

 		if (all_power[i]->events() =3D=3D 0 && all_power[i]->usage() =3D=3D 0 &&=
 all_power[i]->Witts() =3D=3D 0)
 			break;
@@ -870,14 +870,16 @@ void process_update_display(void)
 			else
 				sprintf(usage, "%5i%s", (int)all_power[i]->usage(), all_power[i]->usag=
e_units());
 		}
-		while (mbstowcs(NULL,usage,0) < 14) strcat(usage, " ");
+
+		align_string(usage, 14, 20);
+
 		sprintf(events, "%5.1f", all_power[i]->events());
 		if (!all_power[i]->show_events())
 			events[0] =3D 0;
 		else if (all_power[i]->events() <=3D 0.3)
 			sprintf(events, "%5.2f", all_power[i]->events());
 =

-		while (strlen(events) < 12) strcat(events, " ");
+		align_string(events, 12, 20);
 		wprintw(win, "%s  %s %s %s %s\n", power, usage, events, name, pretty_pri=
nt(all_power[i]->description(), descr, 128));
 	}
 }



--===============2335064743516497827==--

