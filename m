Content-Type: multipart/mixed; boundary="===============1530192920892279437=="
MIME-Version: 1.0
From: Magnus Fromreide <magfr at lysator.liu.se>
Subject: Re: [Powertop] [PATCH 04/12] fix clang++ compilation errors
Date: Sat, 02 Aug 2014 14:19:42 +0200
Message-ID: <20140802121942.GB20307@sara.bahnhof.se>
In-Reply-To: 1406980457-19077-5-git-send-email-kerolasa@iki.fi
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============1530192920892279437==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 02, 2014 at 12:54:09PM +0100, Sami Kerola wrote:
> The same error was fixed in multiple files to made clang++ work.
> =

> error: variable length array of non-POD element type 'string' (aka
> 'basic_string<char>')

Stupid question: Why not a vector<string> ?

/MF

--===============1530192920892279437==--

