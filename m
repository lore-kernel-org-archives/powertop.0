Content-Type: multipart/mixed; boundary="===============6427216426917542470=="
MIME-Version: 1.0
From: Arjan van de Ven <arjan at linux.intel.com>
Subject: Re: [Powertop] [PATCH v2 1/2] Updates to support Android platform
Date: Tue, 25 Sep 2012 08:11:25 +0200
Message-ID: <50614B0D.3040409@linux.intel.com>
In-Reply-To: CA+Z25wV9QXDp9zmaoQrxXUh6VGMBs0Rb3=tNd-xnT50HPz2Uqg@mail.gmail.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============6427216426917542470==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 9/25/2012 7:34 AM, Rajagopal Venkat wrote:
>> On 09/24/2012 06:28 AM, Rajagopal Venkat wrote:
>>>
>>> This patch adds following minor changes to prepare powertop
>>> to support Android platform.
>>>
>>> - Add missing HAVE_CONFIG_H conditional check.
>>> - remove un-used ethtool_cmd_speed_set and ethtool_cmd_speed
>>> functions.
>>> - Minimize dependency on exception handling in catch blocks.
>>>
>>> These changes will not affect powertop functionality.
>>>
>>> Signed-off-by: Rajagopal Venkat <rajagopal.venkat(a)linaro.org>


>>
> As discussed in first patch set, android doesn't support exception
> handling. This

where is this in your commit log?

> is the reason powertop had DISABLE_TRYCATCH conditional macro which is
> removed in recent commit.

Android being braindead about the C++ language should be it's own patch, no=
t snuck in as part of another change.


> =

> The patch 2/2 adds stubs for exception handling
> =

> #define try           if (true)
> #define catch(x)      if (false)
> =

> With this, fprintf(stderr, "%s\n", c.what()); in catch block throws
> undefined reference
> to c. So added message instead of c.what().
> =

> Any better ways of adding stubs are welcome.

#define try(x)   if (true) { x;
#define catch(x) } else

?


--===============6427216426917542470==--

