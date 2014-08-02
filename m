Content-Type: multipart/mixed; boundary="===============1737352900664969472=="
MIME-Version: 1.0
From: Magnus Fromreide <magfr at lysator.liu.se>
Subject: Re: [Powertop] [PATCH 01/12] configure: use vertical lists and AS_IF
 macro
Date: Sat, 02 Aug 2014 14:17:23 +0200
Message-ID: <20140802121723.GA20307@sara.bahnhof.se>
In-Reply-To: 1406980457-19077-2-git-send-email-kerolasa@iki.fi
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============1737352900664969472==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 02, 2014 at 12:54:06PM +0100, Sami Kerola wrote:
> Horizontal lists has downside of being managed as a single entry in
> version control, which makes commits that add and remove items difficult
> to follow.  With vertical lists each entry is managed separately, which
> is much nicer.

I agree with this but there is a small issue - in autoconf you don't need to
have \'s at the end of the lines.

> Additionally make the 'if' statements to use AS_IF() macro, add project
> URL to autoconfig init

It is always better to separate patches :-)

> and pretty print macro expressions to have
> indentation, and bracing that follows more or less in K&R style.

This is pretty much a style issue and I ain't certain about which style I
prefer. I am also unsure about the messages - have you adde newlines to any
message?

/MF

--===============1737352900664969472==--

