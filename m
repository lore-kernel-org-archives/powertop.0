Content-Type: multipart/mixed; boundary="===============6495659735997602749=="
MIME-Version: 1.0
From: denisart benjamin2 <p.drouand at gmail.com>
Subject: [Powertop] 64bit-portability-issue
Date: Sat, 28 Dec 2013 14:52:25 +0100
Message-ID: <52BED799.3020805@gmail.com>
In-Reply-To: 52BED726.2040003@gmail.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============6495659735997602749==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


Hello everyone,

I'm a openSUSE maintainer and I have an issue with powertop 2.5 about
implicit implementation, classic stdio.h,... Obviously, I tried to patch
event-parce.c but it doesn't work

I: Program is using implicit definitions of functions getting
    pointers or implemented by macros. These functions need to use their
    correct prototypes to allow correct argument passing on e.g. x86_64 .
    - Implicit memory/string functions need #include <string.h>.
    - Implicit *printf functions need #include <stdio.h>.
    - Implicit *printf functions need #include <stdio.h>.
    - Implicit *read* functions need #include <unistd.h>.
    - Implicit *recv* functions need #include <sys/socket.h>.
W: powertop implicit-pointer-decl event-parse.c:856
E: powertop 64bit-portability-issue event-parse.c:5120

Have a nice day

Benjamin





--===============6495659735997602749==--

