Content-Type: multipart/mixed; boundary="===============6062513337924485138=="
MIME-Version: 1.0
From: Chris Ferron <chris.e.ferron at linux.intel.com>
Subject: Re: [Powertop] [PATCH v2 2/2] Add stubs to support Android platform
Date: Fri, 28 Sep 2012 10:21:50 -0700
Message-ID: <5065DCAE.2000306@linux.intel.com>
In-Reply-To: 20120928171033.GA3110@swordfish.datadirect.datadirectnet.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============6062513337924485138==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 09/28/2012 10:10 AM, Sergey Senozhatsky wrote:
> On (09/28/12 09:54), Chris Ferron wrote:
> [..]
>> Well to be fair, not that I agree any-more, but years ago it was
>> common practice to disable exceptions (via the compiler) for C++ in
>> very specialized "REAL" "Embedded Systems". This practice was
>> problematic in that you needed to have a will defined Error handling
>> design, but saved space. Honestly, its been a long time since I
>> worked on anything that has a "REAL" size requirement, so I don't see
>> the point. On the other hand in some Embedded system  The whole
>> reason to using your own error handling design was that in a real
>> embedded system, design considerations like, uptime, failure control
>> and ability to eliminate undefined behaviour were KEY. So taking the
>> time to design was already a given, and size was not a single point
>> factor. (not arguing the C vs C++ point here BTW)  So for what ever
>> reason the decision to use C++ happens for an embedded project.
>> Problem was C++ exception were good for insure the program didn't
>> fail, but detailed failure handling became problematic. Sure you
>> could avoid general failures but often especially in an embedded
>> system you found yourself with undefined behaviour that was nearly
>> imposable to handle. OK in general history over :)
>>
>> Unfortunately this practice has been inherited still today in
>> segments of other then embedded. Most commonly you may see this
>> practice in specialized segments like gaming consoles. Such practices
>> are still in valid use in such device as switches,
>> telecommunications, avionic systems, weapon systems, medical devices,
>> ect.
>>
>> So I have an understanding of the issues, "some" of its history, and
>> valid uses. But in my opinion this is still a bad implementation for
>> anyone distributing a general operating system.
>>
>>
> Sure, I totally agree. Nowadays, with 4 CPU cores in a pocket, I simply d=
on't buy
> "exceptions are slow" argument. If in some particular project exceptions =
are so
> common that they're able to sensibly slow down application, then the proj=
ect most
> probably is doing something terribly wrong and mis-concept exceptions.
Agree
>
> The tragedy is that at this point in time I believe Google will never con=
sider using
> exceptions due to legacy reasons.
>
>
> 	-ss


--===============6062513337924485138==--

