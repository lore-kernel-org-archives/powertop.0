Content-Type: multipart/mixed; boundary="===============4267801412928550905=="
MIME-Version: 1.0
From: Arjan van de Ven <arjan at linux.intel.com>
Subject: Re: [Powertop] Too much memory consumption by powertop
Date: Tue, 28 Apr 2015 14:54:53 -0700
Message-ID: <554001AD.8020701@linux.intel.com>
In-Reply-To: CABsxX9KpabXDAds_1ZOs5BRnAyVb6bLv-k+QOGaAzUAJh28nHQ@mail.gmail.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============4267801412928550905==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

> Maybe a more sensible 250x250 size would be a good default, as I seem to =
be able to fill a 1080p screen with just under 250 columns, and it would gi=
ve some scrolling overhead?
>
> that's at least a 16x reduction already compared to 1000x1000.
>
> You could dynamically calculate the number based on the terminal properti=
es, but that would likely break on terminal resizes.

it;s a bit more subtle

this is the canvas on which the text gets put,
your terminal is just a viewport into that canvas.

the number of cpus etc determines how big that canvas needs to be, not the =
width of our terminal


--===============4267801412928550905==--

