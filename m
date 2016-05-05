Content-Type: multipart/mixed; boundary="===============0614956098734207482=="
MIME-Version: 1.0
From: Jaroslav Skarvada <jskarvad at redhat.com>
Subject: [Powertop] Report to STDOUT by default, reintroduce the -d,
 --dump switch
Date: Thu, 05 May 2016 11:55:53 -0400
Message-ID: <529961732.61974244.1462463753284.JavaMail.zimbra@redhat.com>
In-Reply-To: 1008406645.61972797.1462463513308.JavaMail.zimbra@redhat.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============0614956098734207482==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi,

I think it would be useful if PowerTOP could by default write reports to ST=
DOUT
(the output could be easily filtered through pipes).

I proposed patch [1], which:
- makes the filename argument of CSV, HTML reports optional (was previously=
 mandatory),
if it is not specified it outputs to STDOUT
- reintroduced the old -d, --dump switch, which writes report in plain text
(which could be also useful and at least keeps user interface backward
compatibility with powertop 1.x)

thanks & regards

Jaroslav

[1] https://github.com/fenrus75/powertop/pull/22

--===============0614956098734207482==--

