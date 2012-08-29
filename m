Content-Type: multipart/mixed; boundary="===============0340028529531302536=="
MIME-Version: 1.0
From: Viresh Kumar <viresh.linux at gmail.com>
Subject: [Powertop] Support for printing report in text format in powertop2.x
Date: Wed, 29 Aug 2012 11:46:01 +0530
Message-ID: <CAOh2x=nmJYnz1JT=m8KUU=Lj9iRn__Xt-uua9RReqfioXn+gOw@mail.gmail.com>
In-Reply-To: CAOh2x==-Vu-9W86D+RHwVi6aA5rtWinhS1s-j9ckw0tn1LWrQw@mail.gmail.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============0340028529531302536==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Guys,

I have following test case, i need to capture data using powertop
for some time and then analyse it.

There are two formats in which this is done as of today
- html
- csv

I believe we must also have a plain text version for it. Any cons
of that?

Without changing much of code, we can simply use html2text
at the end of program to create default file Powertop.txt.

Thanks for your inputs.

--
viresh

--===============0340028529531302536==--

