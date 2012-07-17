Content-Type: multipart/mixed; boundary="===============3404649994941702827=="
MIME-Version: 1.0
From: Sergey Senozhatsky <sergey.senozhatsky at gmail.com>
Subject: Re: [Powertop] Wishlist: print the commands executed by 'toggle
 tunables'
Date: Tue, 17 Jul 2012 23:30:07 +0300
Message-ID: <20120717203007.GD3261@swordfish.datadirect.datadirectnet.com>
In-Reply-To: 5005C6EE.8030001@richardneill.org
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============3404649994941702827==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On (07/17/12 21:11), Richard Neill wrote:
> >>When I run it, I can toggle various tunable options from within the
> >>Powertop interface. As I understand it, the effect of these to invoke an
> >>underlying system command such as:
> >>   echo value > /sys/device/power/something
> =

> >
> >on the normal screen, there is not really enough real estate to put the
> >full command there.
> >however, if you run the --html report, it will give you these commands!
> >
> >(the html page has a lot more space to put stuff)
> >
> =

> Dear Arjan,
> =

> Thanks for your reply - that is indeed helpful.
> =

> I see what you mean that there is less space on the ncurses gui. But
> using the html report is rather "non-discoverable".
> =

> For maximum friendliness, might I suggest:
> =

> 1. When the user exits the ncurses gui, a log of the commands that
> were actually invoked should be printed to stderr.
> =

> 2. The command that was just run could perhaps be put into the status
> bar at the bottom of the ncurses gui?
>

Hello,

not all toggle actions are just one liners.


	-ss

--===============3404649994941702827==--

