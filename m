Content-Type: multipart/mixed; boundary="===============3593818050456097923=="
MIME-Version: 1.0
From: Arjan van de Ven <arjan at linux.intel.com>
Subject: Re: [Powertop] [PATCH] do not implement get_user_input() in
 DISABLE_NCURSES builds
Date: Sun, 19 Aug 2012 17:40:38 -0700
Message-ID: <50318786.20701@linux.intel.com>
In-Reply-To: 20120819215734.GA3137@swordfish
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============3593818050456097923==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 8/19/2012 2:57 PM, Sergey Senozhatsky wrote:
> do not implement get_user_input() in DISABLE_NCURSES builds

no offence.. but this ifdef madness needs to stop.

right now, powertop uses ncurses.

either we want to make it optional, but then this stuff needs to get a lot =
more modular,
or we just declare that you need ncurses.
I'm very much leaning towards the later fwiw...


--===============3593818050456097923==--

