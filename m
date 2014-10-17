Content-Type: multipart/mixed; boundary="===============6054673354927922855=="
MIME-Version: 1.0
From: Joe Konno <joe.konno at linux.intel.com>
Subject: Re: [Powertop] [PATCH v2 1/8] Properly cleaning up the display tabs
Date: Fri, 17 Oct 2014 11:12:12 -0700
Message-ID: <54415BFC.5080207@linux.intel.com>
In-Reply-To: 20141015125810.GC1189@swordfish
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============6054673354927922855==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 10/15/2014 05:58 AM, Sergey Senozhatsky wrote:
> =

> here and in other patch -- why does it matter? we are exiting,
> memory will be freed anyway, etc. why take that extra effort?
> =

> 	-ss

Adhering to the "for every new/malloc there is a delete/free" principle
as we are not using any garbage collection facilities (memory pools,
smart pointers, etc) in this project.

--===============6054673354927922855==--

