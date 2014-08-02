Content-Type: multipart/mixed; boundary="===============1876868545034979018=="
MIME-Version: 1.0
From: Sami Kerola <kerolasa at iki.fi>
Subject: Re: [Powertop] [PATCH 01/12] configure: use vertical lists and AS_IF
 macro
Date: Sat, 02 Aug 2014 23:02:57 +0100
Message-ID: <CAG27Bk0bQMdwTrue34-t-tYmpzdBHzEp7Da6b=+PJ3798K=KgA@mail.gmail.com>
In-Reply-To: 20140802121723.GA20307@sara.bahnhof.se
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============1876868545034979018==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 2 August 2014 13:17, Magnus Fromreide <magfr(a)lysator.liu.se> wrote:
> On Sat, Aug 02, 2014 at 12:54:06PM +0100, Sami Kerola wrote:
>> Horizontal lists has downside of being managed as a single entry in
>> version control, which makes commits that add and remove items difficult
>> to follow.  With vertical lists each entry is managed separately, which
>> is much nicer.
>
> I agree with this but there is a small issue - in autoconf you don't need=
 to
> have \'s at the end of the lines.

I am afraid backslashes are not optional. When they are removed the
./autogen.sh will produce ./configure file that fails with following
error:

checking how to hardcode library paths into programs... immediate
./configure: line 19421: syntax error near unexpected token `fcntl.h'
./configure: line 19421: `      fcntl.h'

I have not tried would backslash removing work with old autoconf
versions. Mine is from autoconf upstream, and compiled about month
ago, so it should be more or less up to date.

>> Additionally make the 'if' statements to use AS_IF() macro, add project
>> URL to autoconfig init
>
> It is always better to separate patches :-)

The commit is split, here is the AS_IF update.

https://github.com/kerolasa/powertop/commit/cc5cb0f2b16414449c123738a7bf0da=
08bf1b042

>> and pretty print macro expressions to have
>> indentation, and bracing that follows more or less in K&R style.
>
> This is pretty much a style issue and I ain't certain about which style I
> prefer. I am also unsure about the messages - have you adde newlines to a=
ny
> message?

No. The messaging to users should stay exactly as they've always been.

The point why I like K&R bracing when writing m4 is that at least I
find it easier to validate visually when brace opens & close's follow
indentation level in which they are effective. That said style changes
are matters of taste, and I could very well be wrong^W against common
consensus what is according good taste in this project. If so I can
drop the change from final merge request.

-- =

Sami Kerola
http://www.iki.fi/kerolasa/

--===============1876868545034979018==--

