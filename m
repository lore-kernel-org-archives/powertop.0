Content-Type: multipart/mixed; boundary="===============1099224786042371311=="
MIME-Version: 1.0
From: Sami Kerola <kerolasa at iki.fi>
Subject: Re: [Powertop] [PATCH 07/12] move options structure to function scope
Date: Sun, 03 Aug 2014 10:34:12 +0100
Message-ID: <CAG27Bk3KH-yYU-w6fCv_RZF8n+s21SG7EpwEChKpCH=Ua24SpA@mail.gmail.com>
In-Reply-To: 20140803035218.GA952@swordfish
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============1099224786042371311==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 3 August 2014 04:52, Sergey Senozhatsky <sergey.senozhatsky(a)gmail.com>=
 wrote:
> On (08/02/14 23:20), Sami Kerola wrote:
>> On 2 August 2014 14:47, Sergey Senozhatsky <sergey.senozhatsky(a)gmail.c=
om> wrote:
>> >> Subject: [Powertop] [PATCH 07/12] move options structure to function =
scope
>> >
>> > what for?
>>
>> They've told me keeping variables in as narrow scope as possible is a
>> virtue. Even if it would not be I don't see any harm of moving
>> everything out of global scope when ever possible.
>>
>> https://www.securecoding.cert.org/confluence/display/cplusplus/DCL07-CPP=
.+Minimize+the+scope+of+variables+and+methods
>
> this is different. let's keep it as is.

Hi Sergey,

That's alright the scope move is reverted. When I did that I started
to look the option structure, and later switch case segment. I started
to wonder why '-a' is marked as an option in structure but it is
missing from short options in optstring. That lead me to write two
small clean ups.

https://github.com/kerolasa/powertop/commit/09a3bb68d1f92c30675679b64d63cdd=
eafbfbce7
https://github.com/kerolasa/powertop/commit/8d81534bf55486b5230e18b217524a0=
7694c5e9e

Reminder. As mentioned yesterday, the patch series in maillist is
broken. Up to date versions of these changes are in my github branch,
which makes this a pull request.

  https://github.com/kerolasa/powertop sami

-- =

Sami Kerola
http://www.iki.fi/kerolasa/

--===============1099224786042371311==--

