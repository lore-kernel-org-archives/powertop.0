Content-Type: multipart/mixed; boundary="===============2241782562840309757=="
MIME-Version: 1.0
From: Sami Kerola <kerolasa at iki.fi>
Subject: Re: [Powertop] [PATCH 04/12] fix clang++ compilation errors
Date: Sat, 02 Aug 2014 23:09:24 +0100
Message-ID: <CAG27Bk2J51mHUnQE_sMTiqaP1yAjreoVo+MZoj90v4zU9KcMew@mail.gmail.com>
In-Reply-To: 20140802121942.GB20307@sara.bahnhof.se
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============2241782562840309757==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 2 August 2014 13:19, Magnus Fromreide <magfr(a)lysator.liu.se> wrote:
> On Sat, Aug 02, 2014 at 12:54:09PM +0100, Sami Kerola wrote:
>> The same error was fixed in multiple files to made clang++ work.
>>
>> error: variable length array of non-POD element type 'string' (aka
>> 'basic_string<char>')
>
> Stupid question: Why not a vector<string> ?

The clang++ did not like them, the error I got is

tuning/tuning.cpp:293:26: error: no viable conversion from
'std::vector<string>' to 'string *'
      (aka 'basic_string<char> *')
        report.add_table(tuned_data, &tune_table_css);

and I don't know how to make vectors work in that case. Of course part
of the problem is that my C++ skill is in beginner level zero, and I
might be doing something stupid. Assuming the later a hint how to make
that code better would be nice.

-- =

Sami Kerola
http://www.iki.fi/kerolasa/

--===============2241782562840309757==--

