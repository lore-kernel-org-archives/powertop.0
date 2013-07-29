Content-Type: multipart/mixed; boundary="===============8807210110595186307=="
MIME-Version: 1.0
From: Arjan van de Ven <arjan at linux.intel.com>
Subject: Re: [Powertop] regarding cpuidle stats
Date: Mon, 29 Jul 2013 06:09:12 -0700
Message-ID: <51F66978.8070301@linux.intel.com>
In-Reply-To: CAKjcEiXF=FmKaUo6g_gW7s8R4hh5jjG-XpMQMm+A5eBez--Hwg@mail.gmail.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============8807210110595186307==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 7/29/2013 3:52 AM, remu kelly wrote:
> Hi powertop team,
> I have few questions about powertop as below:-
> 1) Does powertop use "<debugfs>/cpuidle/stats" for retriving the C state =
information.

no

it uses various kernel trace points to collect things as they happen

> 2) Is it possible that on "cat <debugfs>/cpuidle/stats" , we see the C3 s=
tate is having '0' count. but at same time powertop show the C3 state being=
 hit?

I am not sure how well cpuidle stats work; never used them.


--===============8807210110595186307==--

