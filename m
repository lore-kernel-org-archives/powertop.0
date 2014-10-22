Content-Type: multipart/mixed; boundary="===============8317490681885707060=="
MIME-Version: 1.0
From: Sergey Senozhatsky <sergey.senozhatsky at gmail.com>
Subject: Re: [Powertop] [PATCH v2 1/8] Properly cleaning up the display tabs
Date: Wed, 22 Oct 2014 21:17:25 +0900
Message-ID: <20141022121725.GC950@swordfish>
In-Reply-To: 54415BFC.5080207@linux.intel.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============8317490681885707060==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On (10/17/14 11:12), Joe Konno wrote:
> On 10/15/2014 05:58 AM, Sergey Senozhatsky wrote:
> > =

> > here and in other patch -- why does it matter? we are exiting,
> > memory will be freed anyway, etc. why take that extra effort?
> > =

> =

> Adhering to the "for every new/malloc there is a delete/free" principle
> as we are not using any garbage collection facilities (memory pools,
> smart pointers, etc) in this project.

by example.


void foo()
{
again:
	for (int i =3D 0; i < 100; i++) {
		void *p =3D malloc(100);

		do_things(p);
		do_other_things(p);
	}
	goto again;
}

v.s.

void foo()
{
	void *p =3D malloc(100);
	exit(0);
}

free(p) before exit(0) is really useless, the kernel will clean
up everything.

	-ss

--===============8317490681885707060==--

