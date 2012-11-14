Content-Type: multipart/mixed; boundary="===============5458873747423986635=="
MIME-Version: 1.0
From: Chris Ferron <chris.e.ferron at linux.intel.com>
Subject: Re: [Powertop] [RFC] [PATCH 11/11] Ignore non-P-state-enabled CPUs
 when calculating frequency.
Date: Wed, 14 Nov 2012 08:32:11 -0800
Message-ID: <50A3C78B.2010602@linux.intel.com>
In-Reply-To: 1427547.3NqOqQh5qg@intelfx-laptop
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============5458873747423986635==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 11/14/2012 06:30 AM, Ivan Shapovalov wrote:
> On 13 November 2012 11:14:52 Chris Ferron wrote:
>> On 11/05/2012 03:12 AM, Ivan Shapovalov wrote:
>>> This fixes bogus reported CPU frequencies (actually, uninitialized
>>> values from i965_core) when i965 monitoring is used.
>>>
>>> Signed-off-by: Ivan Shapovalov <intelfx100(a)gmail.com>
>>> ---
>>>
>>>    src/cpu/abstract_cpu.cpp | 2 +-
>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/src/cpu/abstract_cpu.cpp b/src/cpu/abstract_cpu.cpp
>>> index d64cb24..fea377b 100644
>>> --- a/src/cpu/abstract_cpu.cpp
>>> +++ b/src/cpu/abstract_cpu.cpp
>>> @@ -380,7 +380,7 @@ void abstract_cpu::calculate_freq(uint64_t time)
>>>
>>>    	/* calculate the maximum frequency of all children */
>>>    	for (i =3D 0; i < children.size(); i++)
>>>
>>> -		if (children[i]) {
>>> +		if (children[i] && children[i]->has_pstates()) {
>>>
>>>    			uint64_t f =3D 0;
>>>    			if (!children[i]->idle) {
>>>    			=

>>>    				f =3D children[i]->current_frequency;
>> This patch for the bug fix has been merged.
> Ugh, I forgot to notify - to make it work without previous patches,
> one shall rather modify {cpu,nhm}_package::calculate_freq(),
> so merging this patch alone and as-is doesn't do anything...
>
> Please, consider this one for the release:
>
> ---
> diff --git a/src/cpu/cpu_package.cpp b/src/cpu/cpu_package.cpp
> index 2e2e8a3..4675167 100644
> --- a/src/cpu/cpu_package.cpp
> +++ b/src/cpu/cpu_package.cpp
> @@ -149,7 +149,7 @@ void cpu_package::calculate_freq(uint64_t time)
>   =

>   	/* calculate the maximum frequency of all children */
>   	for (i =3D 0; i < children.size(); i++)
> -		if (children[i]) {
> +		if (children[i] && children[i]->has_pstates()) {
>   			uint64_t f =3D 0;
>   			if (!children[i]->idle) {
>   				f =3D children[i]->current_frequency;
> diff --git a/src/cpu/intel_cpus.cpp b/src/cpu/intel_cpus.cpp
> index 24465a0..a4ed86d 100644
> --- a/src/cpu/intel_cpus.cpp
> +++ b/src/cpu/intel_cpus.cpp
> @@ -460,7 +460,7 @@ void nhm_package::calculate_freq(uint64_t time)
>   =

>   	/* calculate the maximum frequency of all children */
>   	for (i =3D 0; i < children.size(); i++)
> -		if (children[i]) {
> +		if (children[i] && children[i]->has_pstates()) {
>   			uint64_t f =3D 0;
>   			if (!children[i]->idle) {
>   				f =3D children[i]->current_frequency;
> ---
Yep, I already caught that. Thanks for the follow up.


--===============5458873747423986635==--

