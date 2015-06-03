Content-Type: multipart/mixed; boundary="===============2856941827632893542=="
MIME-Version: 1.0
From: Arjan van de Ven <arjan at linux.intel.com>
Subject: Re: [Powertop] [RFC 0/9] Use udev for accessing sysfs
Date: Wed, 03 Jun 2015 13:25:46 -0700
Message-ID: <556F62CA.3070208@linux.intel.com>
In-Reply-To: CAJDL4uLsyFK5DJsbC1b4yKyJEqKxUKrUmGk-QZUriiz4af8QvQ@mail.gmail.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============2856941827632893542==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 6/3/2015 1:23 PM, Nanley Chery wrote:

>>
>> .... how does this work on Android ?
>
> That's a good question. I actually hadn't considered the affects on
> that platform. It seems like there is no udev-like abstraction layer
> on Android. It looks like the way forward would be to either keep a
> separate folder for android specific code or to create more helper
> functions to abstract how we access sysfs. The latter method seems
> preferable because it wouldn't increase the complexity of the project
> as a whole. Thoughts?

but if we keep the code anyway, what's the benefit of going through one
more layer of indirection????
Am I missing something here?

--===============2856941827632893542==--

