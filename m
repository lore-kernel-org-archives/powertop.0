Content-Type: multipart/mixed; boundary="===============5299329376712383062=="
MIME-Version: 1.0
From: Arjan van de Ven <arjan at linux.intel.com>
Subject: Re: [Powertop] [powertop] ::wiggle() - what does that do?
Date: Tue, 19 Mar 2013 12:53:26 -0700
Message-ID: <5148C236.8080200@linux.intel.com>
In-Reply-To: 2702081.CWDp0UbVS9@intelfx-laptop
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============5299329376712383062==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 3/19/2013 12:51 PM, Ivan Shapovalov wrote:
> Hello all,
>
> I've been wondering on what does the abstract_cpu::wiggle() function does=
 and
> why it is needed?.. All the code says is that it is needed to "have a rec=
ord
> of CPU at the start and end of the perf trace".
>
> I'm asking just because I feel somewhat uncomfortable to have powertop
> changing my scaling frequency back and forth each N seconds. :)

the reason this exists is that powertop wants to track what frequency the c=
pu is at for the duration...
... and there's no way to ask for "current", only to get change notificatio=
ns

so wiggle() forces a change... and from then on we know what it's at.


--===============5299329376712383062==--

