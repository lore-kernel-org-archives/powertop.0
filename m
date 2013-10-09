Content-Type: multipart/mixed; boundary="===============5970858069502753598=="
MIME-Version: 1.0
From: Sergey Senozhatsky <sergey.senozhatsky at gmail.com>
Subject: Re: [Powertop] introduce powertop2 -next
Date: Wed, 09 Oct 2013 13:01:09 +0300
Message-ID: <20131009100109.GB2210@swordfish.datadirectnet.com>
In-Reply-To: 20131008145815.0da005aa@bluebird.jf.intel.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============5970858069502753598==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On (10/08/13 14:58), Kristen Carlson Accardi wrote:
> pulled all of your patches - we should be up to date now.

Hello,

2 patches were added to -next:

Jaroslav Skarvada (2):
      tell user if the system is running out of FDs
      set open files rlimit to /proc/sys/fs/nr_open


the first one introduces new string
	_("Too many open files, please increase the limit of open file
	descriptors.\n")

but I think we have enough time before string freeze to catch up.

	-ss

--===============5970858069502753598==--

