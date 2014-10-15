Content-Type: multipart/mixed; boundary="===============0692055755861561971=="
MIME-Version: 1.0
From: Sami Kerola <kerolasa at iki.fi>
Subject: Re: [Powertop] [PATCH v3 04/15] clean up Makefile.am files
Date: Wed, 15 Oct 2014 09:25:04 +0100
Message-ID: <CAG27Bk0_nMryZ2CsF7d6q+y5v8guZwTH5dT1r4m_Gy4F3PX6Zw@mail.gmail.com>
In-Reply-To: 543DB314.2060504@linux.intel.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============0692055755861561971==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 15 October 2014 00:34, Joe Konno <joe.konno(a)linux.intel.com> wrote:
> On 09/07/2014 02:27 PM, Sami Kerola wrote:
[snip]
>> ---
>>  Makefile.am     |  14 +++-
[snip]
>> +powertop_SOURCES =3D \
>> +     css.h \
>> +     devlist.cpp \
>> +     devlist.h \
>> +     display.cpp \
>> +     display.h \
>> +     lib.cpp \
>> +     lib.h \
>> +     main.cpp \
>> +     powertop.css \
>> +     \
>
> Why the white line here?

To separate src/*.(cpp|h) file from files in sub-directory targets the
way one very clearly see the difference. Sorting all the targets in
simple alphabetical order would make the none-sub-directory objects to
be here and there in middle of listing, so separating the lists seemed
like clarity enhancement to me. If the empty line really annoys send a
patch to remove it, I don't have too strong opinions either in favor
or against it.

-- =

Sami Kerola
http://www.iki.fi/kerolasa/

--===============0692055755861561971==--

