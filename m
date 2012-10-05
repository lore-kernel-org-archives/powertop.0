Content-Type: multipart/mixed; boundary="===============7813387931130780512=="
MIME-Version: 1.0
From: Igor Zhbanov <i.zhbanov at samsung.com>
Subject: Re: [Powertop] [RFC][PATCH 1/2] Adding report generator facility
Date: Fri, 05 Oct 2012 14:15:52 +0400
Message-ID: <506EB358.8020100@samsung.com>
In-Reply-To: 20121004211717.GB3333@swordfish.datadirect.datadirectnet.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============7813387931130780512==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Sergey,

Sergey Senozhatsky wrote:

> it's better have a destructor in abstract class.

Yes, you are right. Thank you.

To not send the big patch again, here is the small fix.
I will send the new version when other issues will be resolved, if any will=
 be found,
and without [RFC] tag.

--- src/report/report-formatter.h	2012-10-03 20:52:36.834281876 +0400
+++ src/report/report-formatter.h	2012-10-05 13:22:04.307887912 +0400
@@ -31,6 +31,8 @@
  class report_formatter /* Interface */
  {
  public:
+	virtual ~report_formatter() {}
+
         virtual void finish_report() =3D 0;
         virtual const char *get_result() =3D 0;
         virtual void clear_result() =3D 0;

-- =

Best regards,
Igor Zhbanov,
Expert Software Engineer,
phone: +7 (495) 797 25 00 ext 3806
e-mail: i.zhbanov(a)samsung.com

ASWG, Moscow R&D center, Samsung Electronics
12 Dvintsev street, building 1
127018, Moscow, Russian Federation


--===============7813387931130780512==--

