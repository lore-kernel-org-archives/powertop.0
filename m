Content-Type: multipart/mixed; boundary="===============5472011458182676905=="
MIME-Version: 1.0
From: Rajagopal Venkat <rajagopal.venkat at linaro.org>
Subject: Re: [Powertop] [PATCH 1/2] Updates to support Android platform
Date: Tue, 18 Sep 2012 09:20:11 +0530
Message-ID: <CA+Z25wVqtYcSq_rQHThD7mqxHXSWPkZRK1xfrZWCMdxahrLSxw@mail.gmail.com>
In-Reply-To: 505748F0.6010708@linux.intel.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============5472011458182676905==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 17 September 2012 21:29, Arjan van de Ven <arjan(a)linux.intel.com> wrot=
e:
>
>> Hi,
>> I don't have exp with android development.
>> this is not the first time we have exception related patches in order to=
 support android.
>> I just wonder -- what's wrong with C++ in general (and exception handlin=
g in particular)
>> in android?
>
> yeah this looks extremely fragile
>
> +/* define stubs for C++ exception handling */
> +#define try            if (true)
> +#define catch(x)       if (false)
> +
>
> I mean.. this really is wrong.
> Is C++ on Android really so broken that try/catch do not work ???
>
> what else is terminal in the C++ implementation on android then?
>
Android doesn't support C++ exception handling. Here is the Android official
answer [1]. This is the reason for having DISABLE_TRYCATCH macro in
powertop code which were removed in recent commit.

[1] https://groups.google.com/forum/?fromgroups=3D#!topic/android-ndk/idtn7=
R-_ZFA

-- =

Regards,
Rajagopal

--===============5472011458182676905==--

