Content-Type: multipart/mixed; boundary="===============8396900150014327981=="
MIME-Version: 1.0
From: Arjan van de Ven <arjan at linux.intel.com>
Subject: Re: [Powertop] [PATCH] Enable asserts and make correct comment
Date: Wed, 17 Oct 2012 08:21:21 -0700
Message-ID: <507ECCF1.3050202@linux.intel.com>
In-Reply-To: 20121017151745.GA3012@swordfish.minsk.epam.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============8396900150014327981==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 10/17/2012 8:17 AM, Sergey Senozhatsky wrote:
> On (10/17/12 19:10), Igor Zhbanov wrote:
>> Hi all.
>>
>> Any comments? ;-)
>> This patch fixes the comments and enables the asserts.
>>
> =

> Hello,
> sorry, I thought it was merged. I don't have any objections for testing p=
eriod.
> =

> can we make global flag somewhere and inverse the flag logic: `define DEB=
UG' instead of `define NO_DEBUG'?

nah

asserts should just always be on
no excuse not to.



--===============8396900150014327981==--

