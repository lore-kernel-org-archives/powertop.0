Content-Type: multipart/mixed; boundary="===============3359654109805694104=="
MIME-Version: 1.0
From: Arjan van de Ven <arjan at linux.intel.com>
Subject: Re: [Powertop] [PATCH] Get rid of ncurses' TRUE and FALSE
Date: Wed, 18 Jul 2012 06:11:49 -0700
Message-ID: <5006B615.1000305@linux.intel.com>
In-Reply-To: 1342603045-25492-1-git-send-email-i.zhbanov@samsung.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============3359654109805694104==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 7/18/2012 2:17 AM, Igor Zhbanov wrote:
> Get rid of TRUE and FALSE ncurses' defines used for boolean variables
> initialization. This fix also helps build without ncurses support.


while I appreciate going to C++ true/false, building without ncurses
isn't really a goal.
(even on android, building ncurses is easy, and it does make the tool SO
much more useful)

--===============3359654109805694104==--

