Content-Type: multipart/mixed; boundary="===============2973283355246360424=="
MIME-Version: 1.0
From: Chris Ferron <chris.e.ferron at linux.intel.com>
Subject: Re: [Powertop] [PATCH] Get rid of ncurses' TRUE and FALSE
Date: Thu, 19 Jul 2012 13:20:19 -0700
Message-ID: <50086C03.4000001@linux.intel.com>
In-Reply-To: 5006B84F.7020104@samsung.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============2973283355246360424==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 07/18/2012 06:21 AM, Igor Zhbanov wrote:
> Arjan van de Ven wrote:
>> On 7/18/2012 2:17 AM, Igor Zhbanov wrote:
>>> Get rid of TRUE and FALSE ncurses' defines used for boolean variables
>>> initialization. This fix also helps build without ncurses support.
>> while I appreciate going to C++ true/false, building without ncurses
>> isn't really a goal.
>> (even on android, building ncurses is easy, and it does make the tool SO
>> much more useful)
> It is not good that C++ code depends on TRUE/FALSE defines
> (defined in ncurses.h) in functions that are not related to ncurses.
>
> P.S. I have merged Intel's and Linaro's repositories and will send =

> patches for
> review soon. I don't know why but Linaro wants to build PowerTOP =

> without ncurses.
> So I will send a patch that makes ncurses and libpci dependencies =

> conditional.
>

     Please do not merge Intel's and Linaro repositories and send =

patches for what comes of it.
If the Linaro maintainers want to do an upstream merge or if =

contributors of Linaro want to upstream
patches they have authored then great.
Submitting patches based on other peoples work is not agreeable to me. I =

will not take patches that
I even suspect isn't from the original authors, and or without the =

authors consent. Do not just merge code bases
and generate patches based on the diff, and send it to the list. They =

will not be taken.

-Chris Ferron





--===============2973283355246360424==--

