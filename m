Content-Type: multipart/mixed; boundary="===============1875525235606973330=="
MIME-Version: 1.0
From: Sami Kerola <kerolasa at iki.fi>
Subject: Re: [Powertop] [PATCH 09/14] do not use ncurses when --auto-tune is
 specified
Date: Wed, 20 Aug 2014 15:57:20 +0300
Message-ID: <CAG27Bk3rJCRgpoJu8SYgzrsCWhvvs354mbYHMyVY4q2kd8krow@mail.gmail.com>
In-Reply-To: 20140820122859.GA981@swordfish
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============1875525235606973330==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 20 August 2014 15:28, Sergey Senozhatsky
<sergey.senozhatsky(a)gmail.com> wrote:
> On (08/05/14 22:31), Sami Kerola wrote:
>> Signed-off-by: Sami Kerola <kerolasa(a)iki.fi>
>> ---
>>  src/main.cpp | 9 ++++++---
>>  1 file changed, 6 insertions(+), 3 deletions(-)
>>
>
> I think it makes sense to extend ui_notify_user() so it can cover
> both cases: initialised ncurses -- calling mvprintw(), and
> uninitialised ncurses -- printf (to stdout).
>
> this will change a bit 'powertop --auto-tune' behaviour, since by
> default user will now see a 'list' of commands executed by powertop,
> but it's really easy to silent powertop via stdout redirection.
>
>
> what do you think?

Hi Sergey,

I think this patch set will need to get ready eventually.  Would it be
possible that the upstream maintainer will drop the patch 0007 aka 'do
not use ncurses' and merge the rest (assuming they are not unmentioned
way borken).

Since my primary goal when I started to do anything with powertop was
to get rid of --auto-tune blinking I will craft another change that
will do exactly that. But as mentioned, there is error reporting that
must not break as side effect. Because a signal to do printing
different way is command line option driven it is probably best to add
a control structure that will allow to do that, and allow easy
extensions in future when similar needs appear.

What comes to stdout redirection, you are likely right. Making ncurses
not to blink screen may require poking code a little bit here and
there. To me that is a another good reason to separate the change set.

-- =

Sami Kerola
http://www.iki.fi/kerolasa/

--===============1875525235606973330==--

