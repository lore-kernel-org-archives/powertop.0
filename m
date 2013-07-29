Content-Type: multipart/mixed; boundary="===============2658449950662778961=="
MIME-Version: 1.0
From: Arjan van de Ven <arjan at linux.intel.com>
Subject: Re: [Powertop] regarding cpuidle stats
Date: Mon, 29 Jul 2013 06:34:15 -0700
Message-ID: <51F66F57.70307@linux.intel.com>
In-Reply-To: 51F66978.8070301@linux.intel.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============2658449950662778961==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 7/29/2013 6:09 AM, Arjan van de Ven wrote:
> On 7/29/2013 3:52 AM, remu kelly wrote:
>> Hi powertop team,
>> I have few questions about powertop as below:-
>> 1) Does powertop use "<debugfs>/cpuidle/stats" for retriving the C state=
 information.
>
> no
>
> it uses various kernel trace points to collect things as they happen
I should mention that we also use hardware counters on systems that have th=
em;
much more accurate than any OS counter ;)


--===============2658449950662778961==--

