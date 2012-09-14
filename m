Content-Type: multipart/mixed; boundary="===============4314844856481051638=="
MIME-Version: 1.0
From: Sergey Senozhatsky <sergey.senozhatsky at gmail.com>
Subject: Re: [Powertop] [PATCH] abstract_cpu: do not call total_pstate_time()
 in validate()
Date: Fri, 14 Sep 2012 13:16:13 +0300
Message-ID: <20120914101613.GA3053@swordfish.minsk.epam.com>
In-Reply-To: 1347616856.6783.11.camel@mattotaupa
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============4314844856481051638==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On (09/14/12 12:00), Paul Menzel wrote:
> =

> Dear Sergey,
> =

> Am Donnerstag, den 13.09.2012, 15:41 +0300 schrieb Sergey Senozhatsky:
> > abstract_cpu: do not call total_pstate_time() in validate()
> =

> copying the commit summary into the commit message body is not useful.
> =

> Maybe also describe why this was a problem.
>

while I agree, this commit was not fixing any real problem (perhaps, meager
performance impact), but just cleaned up abstract_cpu part after
f77ea5fe2ad46b3c5de46b8447d23bd12958d2c8 commit:

-                       if (my_time !=3D children[i]->total_pstate_time())
-                               printf("My (%i) time %llu is not the same a=
s child (%i) time %llu\n",
-                                       first_cpu,
-                                       (unsigned long long)my_time,
-                                       children[i]->number,
-                                       (unsigned long long)children[i]->to=
tal_pstate_time());

for such trivial commits I usually cut corners since commit does what the s=
ummary says.
may be I should be more accurate.


	-ss

--===============4314844856481051638==--

