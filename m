Content-Type: multipart/mixed; boundary="===============4661865518370531309=="
MIME-Version: 1.0
From: Arjan van de Ven <arjan at linux.intel.com>
Subject: Re: [Powertop] [PATCH 1/2] Updates to support Android platform
Date: Mon, 17 Sep 2012 08:59:44 -0700
Message-ID: <505748F0.6010708@linux.intel.com>
In-Reply-To: 20120917145442.GA2969@swordfish.minsk.epam.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============4661865518370531309==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


> Hi,
> I don't have exp with android development.
> this is not the first time we have exception related patches in order to =
support android.
> I just wonder -- what's wrong with C++ in general (and exception handling=
 in particular) =

> in android?

yeah this looks extremely fragile

+/* define stubs for C++ exception handling */
+#define try     	if (true)
+#define catch(x) 	if (false)
+

I mean.. this really is wrong.
Is C++ on Android really so broken that try/catch do not work ???

what else is terminal in the C++ implementation on android then?


--===============4661865518370531309==--

