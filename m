Content-Type: multipart/mixed; boundary="===============1098433258891599084=="
MIME-Version: 1.0
From: samer <samer at samertm.com>
Subject: Re: [Powertop] corrupted double-linked list error on exit
Date: Sat, 14 Feb 2015 00:05:56 -0800
Message-ID: <f4906c92001de5dc9eaec1bd2ee81240@samertm.com>
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============1098433258891599084==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

I'm seeing the same issue on 3.18.6-1-ARCH.

[samer(a)archbox ~]$ sudo powertop --auto-tune
Loaded 34 prior measurements
Cannot load from file /var/cache/powertop/saved_parameters.powertop
RAPL device for cpu 0
RAPL Using PowerCap Sysfs : Domain Mask f
RAPL device for cpu 0
RAPL Using PowerCap Sysfs : Domain Mask f
RAPL device for cpu 0
RAPL Using PowerCap Sysfs : Domain Mask f
Devfreq not enabled
Cannot load from file /var/cache/powertop/saved_parameters.powertop
   unknown op '{'
To show power estimates do 263 measurement(s) connected to battery =

onlyLeaving PowerTOP
*** Error in `powertop': corrupted double-linked list: =

0x0000000000fbceb0 ***

Any idea what's causing this?


--===============1098433258891599084==--

