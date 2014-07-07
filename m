Content-Type: multipart/mixed; boundary="===============7319575554512690438=="
MIME-Version: 1.0
From: Arjan van de Ven <arjan at linux.intel.com>
Subject: Re: [Powertop] Does PowerTop support MHz numbers for Intel Xeon L5410
 CPUs ?
Date: Mon, 07 Jul 2014 07:00:06 -0700
Message-ID: <53BAA7E6.8070200@linux.intel.com>
In-Reply-To: 20140707112453.GC1135@swordfish
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============7319575554512690438==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 7/7/2014 4:24 AM, Sergey Senozhatsky wrote:
> On (07/07/14 13:13), Valentin Hoebel wrote:
>> Hi,
>>
>> thanks a lot for your efforts, I appreciate it.
>> My co-worker applied your patch and sent me the following output:
>>
>>    --------------------------------------------------
>> /   ./powertop -t 1 --csv
>>                                              =E2=8F=8E
>>
>
> thanks! ok, so cpu model 0x17 is not listed as a supported one in
> src/cpu/intel_cpus.cpp:intel_cpu_models[] to begin with, and no
> C-states are initialized as a result. Let's wait for Intel devs
> to add cpu/core/package models and corresponding C-states.
>
> Alexandra, will you take care of this?
>
> 	-ss
>
>> Loaded 0 prior measurements
>> Cannot load from file /var/cache/powertop/saved_parameters.powertop
>> check cpu model 0x17
>> ERROR: not supported
>> RAPL device for cpu 0
>> RAPL device for cpu 0
>> check cpu model 0x17

so turns out the L5410 is one generation prior to NHM, and does not support=
 some of the internal MSRs we're using.
I'll talk to Alexandra (pending vacations, it's that season) to see what we=
 can do



--===============7319575554512690438==--

