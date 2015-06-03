Content-Type: multipart/mixed; boundary="===============5354296494591523311=="
MIME-Version: 1.0
From: Nanley Chery <nanleychery at gmail.com>
Subject: Re: [Powertop] [RFC 0/9] Use udev for accessing sysfs
Date: Wed, 03 Jun 2015 14:10:13 -0700
Message-ID: <CAJDL4uLOoY=dpLPbg44NJvKpYERV0Mwi-KchQMXk0pQqjvDyxg@mail.gmail.com>
In-Reply-To: 556F62CA.3070208@linux.intel.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============5354296494591523311==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 3, 2015 at 1:25 PM, Arjan van de Ven <arjan(a)linux.intel.com> =
wrote:
> On 6/3/2015 1:23 PM, Nanley Chery wrote:
>
>>>
>>> .... how does this work on Android ?
>>
>>
>> That's a good question. I actually hadn't considered the affects on
>> that platform. It seems like there is no udev-like abstraction layer
>> on Android. It looks like the way forward would be to either keep a
>> separate folder for android specific code or to create more helper
>> functions to abstract how we access sysfs. The latter method seems
>> preferable because it wouldn't increase the complexity of the project
>> as a whole. Thoughts?
>
>
> but if we keep the code anyway, what's the benefit of going through one
> more layer of indirection????
> Am I missing something here?

The main benefit would be increased protection from sysfs
reorganizations with progressive kernel releases. If this is actually
something we should be proactive about, I am not sure.
Udev should provide faster reading of sysfs files due to caching, but
I do not have any hard numbers to back this claim up.
Lastly there are some general wins in the realm of software
readability and maintainability (in my opinion). This should make the
process of adding more features and fixing bugs easier.

- Nanley

--===============5354296494591523311==--

