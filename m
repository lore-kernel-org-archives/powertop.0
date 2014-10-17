Content-Type: multipart/mixed; boundary="===============4757748270557498284=="
MIME-Version: 1.0
From: Magnus Fromreide <magfr at lysator.liu.se>
Subject: Re: [Powertop] [PATCH v2 1/8] Properly cleaning up the display tabs
Date: Sat, 18 Oct 2014 00:53:43 +0200
Message-ID: <20141017225342.GA6568@sara.bahnhof.se>
In-Reply-To: 54415BFC.5080207@linux.intel.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============4757748270557498284==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 17, 2014 at 11:12:12AM -0700, Joe Konno wrote:
> On 10/15/2014 05:58 AM, Sergey Senozhatsky wrote:
> > =

> > here and in other patch -- why does it matter? we are exiting,
> > memory will be freed anyway, etc. why take that extra effort?
> > =

> > 	-ss
> =

> Adhering to the "for every new/malloc there is a delete/free" principle
> as we are not using any garbage collection facilities (memory pools,
> smart pointers, etc) in this project.

I have to admit that I have asked myself why there is so little use of
RAII in powertop but I havent found a good reason,

--===============4757748270557498284==--

