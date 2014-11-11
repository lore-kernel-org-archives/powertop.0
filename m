Content-Type: multipart/mixed; boundary="===============1948071754621839927=="
MIME-Version: 1.0
From: Arjan van de Ven <arjan at linux.intel.com>
Subject: Re: [Powertop] [PATCH v2 07/14] configure: use autoconf-archive
 ax_cxx_compile_stdcxx_11.m4
Date: Mon, 10 Nov 2014 17:53:54 -0800
Message-ID: <54616C32.9080805@linux.intel.com>
In-Reply-To: 20141110215340.GA24890@sara.bahnhof.se
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============1948071754621839927==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 11/10/2014 1:53 PM, Magnus Fromreide wrote:
> On Sun, Nov 09, 2014 at 01:14:24PM +0000, Sami Kerola wrote:
>> From: Sami Kerola <kerolasa(a)iki.fi>
>>
>> Ensure the powertop is compiled C++11 compliant compiler.  That allows
>> project contributors to use features from the latest standard without
>> hesitation are they allowed in this project.  The idea is to grant
>> greater liberties to upstream in cost of a dependency to downstream.
>
> If this is the point, should we go for C++14?
> The latest standard part is also obviously wrong :^)

I will draw a line in sand on this (and you can tell me which side of the l=
ine this is)

requiring new technology is fine AS LONG AS the current *released* popular =
client distros
(say, two out of three of Fedora, openSuSE & Ubuntu) are shipping with that=
 supported.

If those guys don't have a release with it yet, it's too cutting edge and l=
eads to too many issues
for our users.



--===============1948071754621839927==--

