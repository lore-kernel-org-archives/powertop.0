Content-Type: multipart/mixed; boundary="===============0543417036289398953=="
MIME-Version: 1.0
From: Kok, Auke-jan H <auke-jan.h.kok at intel.com>
Subject: Re: [Powertop] [PATCH] powertop: update build instructions
Date: Mon, 14 Jul 2014 12:55:04 -0700
Message-ID: <CABsxX9KLKUfHjC2AJqbuomwzuhh7i08gFuKWvA-0rBA8JKzBoQ@mail.gmail.com>
In-Reply-To: 20140713072647.GA947@swordfish
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============0543417036289398953==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 13, 2014 at 12:26 AM, Sergey Senozhatsky
<sergey.senozhatsky(a)gmail.com> wrote:
> On (07/13/14 12:06), Mohammad Merajul Islam Molla wrote:
>> update powertop build instuctions in README file.
>>
>> Signed-off-by: Mohammad Merajul Islam Molla <meraj.enigma(a)gmail.com>
>> ---
>>  README | 7 ++++---
>>  1 file changed, 4 insertions(+), 3 deletions(-)
>>
>> diff --git a/README b/README
>> index cd38cc5..efe95c3 100644
>> --- a/README
>> +++ b/README
>> @@ -2,9 +2,10 @@
>>  ------------------------------
>>
>>  To build and install PowerTOP type the following commands,
>> -     ./configure
>> -     ./make
>> -     ./make install
>> +       autoreconf -sfi
>
> we have autogen.sh to deal with autoreconf. let's recommend to use
> it instead of direct autoreconf.

These instructions are currently correct when people download the
published tarballs, and this change would make them incorrect, or
unnecessarily make people rerun autoconf & friends at the least.

I suggest you document both build cases, e.g. some text for people who
build from git sources, vs. those folks who do distribution
integration and never build from git.

Cheers,

Auke

--===============0543417036289398953==--

