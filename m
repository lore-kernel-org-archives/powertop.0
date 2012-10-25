Content-Type: multipart/mixed; boundary="===============5176707171933933435=="
MIME-Version: 1.0
From: Igor Zhbanov <i.zhbanov at samsung.com>
Subject: [Powertop] Internationalization problem with abstract field "type"
Date: Thu, 25 Oct 2012 12:55:50 +0400
Message-ID: <5088FE96.20602@samsung.com>
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============5176707171933933435==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Chris,

It seems that there is a problem with internationalization with the last co=
mmit.
Please look here:
- report.addf(__("Package %i"), _package->get_number());
+ report.addf(__("%s %i"), _package->get_type(), _package->get_number());

I have introduced the macro __() /* Double underscore */ to be a conditiona=
l =

variant
of classical _() /* Single underscore */ in the report refactoring commit.

Usual underscore macro calls the gettext() function. And we need some sort =

of conditional
gettext() -- we want to print untranslated strings to CSV-report. (Of =

course, we could simply
set English locale for CSV-reports. But this will look strange.)

So I have introduced the double underscore macro which calls gettext() for =

HTML-reports and
return original strings for CSV.

After your patch the gettext will try to translate the string "%s %i" and =

not the "Package %i",
so we have lost the internationalization here.

We could fix it by internationalizing the "type" field in the class:
   ret->set_type(__("Package"));

But I'm not sure that it is good to have the type depending on current =

locale (especially
if in some future there will be need to compare the value of this field by =

strcmp()).

What you think?

P.S. Why you not sending patches to mailing list for discussion? ;-)

-- =

Best regards,
Igor Zhbanov,
Technical Leader,
phone: +7 (495) 797 25 00 ext 3806
e-mail: i.zhbanov(a)samsung.com

Mobile group, Moscow R&D center, Samsung Electronics
12 Dvintsev street, building 1
127018, Moscow, Russian Federation


--===============5176707171933933435==--

