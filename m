Content-Type: multipart/mixed; boundary="===============7948452699772759131=="
MIME-Version: 1.0
From: SF Markus Elfring <elfring at users.sourceforge.net>
Subject: Re: [Powertop] reserved identifier violation
Date: Sat, 01 Nov 2014 09:58:14 +0100
Message-ID: <5454A0A6.2080500@users.sourceforge.net>
In-Reply-To: 54037.10.24.5.246.1414797755.squirrel@linux.intel.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============7948452699772759131==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

> Have you come across any name clashes with PowerTOP?

I try to clean-up source files generally which tamper with the reserved name
space in the programming languages "C" and "C++".


> Can you reproduce the error?

I suggest to reconsider an other technical aspect.

Are you aware of an interpretation of the corresponding standard specificat=
ions
that a questionable name selection could result in undefined behaviour?
https://www.securecoding.cert.org/confluence/display/seccode/CC.+Undefined+=
Behavior#CC.UndefinedBehavior-ub_106

How would you try to reproduce anything when a detail was marked as potenti=
ally
undefined?

Regards,
Markus

--===============7948452699772759131==--

