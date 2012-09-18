Content-Type: multipart/mixed; boundary="===============3149620663391908592=="
MIME-Version: 1.0
From: Rajagopal Venkat <rajagopal.venkat at linaro.org>
Subject: Re: [Powertop] [PATCH 1/2] Updates to support Android platform
Date: Tue, 18 Sep 2012 11:28:14 +0530
Message-ID: <CA+Z25wVXrMZaKyGsVjwyv3op4L3JaH7+ONi0oJUeFgi2cNN5jQ@mail.gmail.com>
In-Reply-To: 1347946993.3210.21.camel@sara
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============3149620663391908592==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 18 September 2012 11:13, Magnus Fromreide <magfr(a)lysator.liu.se> wrote:
> On Tue, 2012-09-18 at 09:20 +0530, Rajagopal Venkat wrote:
>> On 17 September 2012 21:29, Arjan van de Ven <arjan(a)linux.intel.com> w=
rote:
>> >
>> >
>> Android doesn't support C++ exception handling. Here is the Android offi=
cial
>> answer [1]. This is the reason for having DISABLE_TRYCATCH macro in
>> powertop code which were removed in recent commit.
>>
>> [1] https://groups.google.com/forum/?fromgroups=3D#!topic/android-ndk/id=
tn7R-_ZFA
>
> That reference is two years old and it ends with a note that they will
> try to enable exception handling for user space programs. Have anything
> happened on that part in these last two years?

I don't think it is yet there. Here is another reference[2],
"Android does not yet support C++ exceptions".

[2] http://developer.android.com/guide/practices/jni.html

>
> /MF
>



-- =

Regards,
Rajagopal

--===============3149620663391908592==--

