Content-Type: multipart/mixed; boundary="===============6781370245992061978=="
MIME-Version: 1.0
From: Sergey Senozhatsky <sergey.senozhatsky at gmail.com>
Subject: Re: [Powertop] [RFC] [PATCH 11/11] Ignore non-P-state-enabled CPUs
 when calculating frequency.
Date: Tue, 13 Nov 2012 22:23:53 +0300
Message-ID: <20121113192353.GA3314@swordfish>
In-Reply-To: 50A29C2C.8020609@linux.intel.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============6781370245992061978==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On (11/13/12 11:14), Chris Ferron wrote:
> On 11/05/2012 03:12 AM, Ivan Shapovalov wrote:
> >This fixes bogus reported CPU frequencies (actually, uninitialized
> >values from i965_core) when i965 monitoring is used.
> >
> >Signed-off-by: Ivan Shapovalov <intelfx100(a)gmail.com>
> >---
> >  src/cpu/abstract_cpu.cpp | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> >diff --git a/src/cpu/abstract_cpu.cpp b/src/cpu/abstract_cpu.cpp
> >index d64cb24..fea377b 100644
> >--- a/src/cpu/abstract_cpu.cpp
> >+++ b/src/cpu/abstract_cpu.cpp
> >@@ -380,7 +380,7 @@ void abstract_cpu::calculate_freq(uint64_t time)
> >  	/* calculate the maximum frequency of all children */
> >  	for (i =3D 0; i < children.size(); i++)
> >-		if (children[i]) {
> >+		if (children[i] && children[i]->has_pstates()) {
> >  			uint64_t f =3D 0;
> >  			if (!children[i]->idle) {
> >  				f =3D children[i]->current_frequency;
> This patch for the bug fix has been merged.
> Thanks,
> Chris
> =


thanks, Chris! =

sorry, my bad, I somehow forgot to ask to merge this one.
the whole patch series looks interesting and I'd like to revisit it after r=
elease. thanks Ivan.


	-ss

--===============6781370245992061978==--

