Content-Type: multipart/mixed; boundary="===============5615988744754885239=="
MIME-Version: 1.0
From: Sami Kerola <kerolasa at iki.fi>
Subject: Re: [Powertop] Complete build options for Pthread API
Date: Fri, 31 Oct 2014 10:01:12 +0000
Message-ID: <CAG27Bk3-HDQ3od-ULKP7RZSP0buyN0yCEuKaOfXkog2j9HStbg@mail.gmail.com>
In-Reply-To: 50509.10.252.141.137.1414726527.squirrel@linux.intel.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============5615988744754885239==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 31 October 2014 03:35, Alexandra Yates
<alexandra.yates(a)linux.intel.com> wrote:
> What is the the return on investment for this feature in terms of
> performance?

Markus, fancy answering to why you proposed AX_PTHREAD to be added to proje=
ct?

> At the moment PowerTOP builds with in 40 seconds from source and building
> the package takes ~15 seconds.

If you want performance making the build system to be none-recursive
could be a good improvement.

http://evbergen.home.xs4all.nl/nonrecursive-make.html

Notice that traceevent should still be built using separate Makefile
even if rest of the project would use single file. I can write change
making the none-recursive build to work, but be aware it will cause
built program binary to be wrote to project top-level directory, e.g.,
not in src/ where it ends up now.

-- =

Sami Kerola
http://www.iki.fi/kerolasa/

--===============5615988744754885239==--

