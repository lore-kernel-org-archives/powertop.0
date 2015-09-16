Content-Type: multipart/mixed; boundary="===============0586724071770365191=="
MIME-Version: 1.0
From: Arjan van de Ven <arjan at linux.intel.com>
Subject: Re: [Powertop] [PATCH] Do not exit on MSR read errors
Date: Wed, 16 Sep 2015 12:31:08 -0700
Message-ID: <55F9C37C.9060403@linux.intel.com>
In-Reply-To: 55F9C0C0.1020606@linux.intel.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============0586724071770365191==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 9/16/2015 12:19 PM, Alexandra Yates wrote:
> Hi Jaroslav,
>
> On 05/11/2015 09:54 AM, Arjan van de Ven wrote:
>> but it's really not the right thing.
>> the reason is that the statistics code still uses the "native intel msr"=
 model,
>> so it gets all zeroes... it should use "just trust the kernel" model in
> Based on Arjan's feedback do you have a change for this patch? Otherwise =
I would have to reject it.

we do need to solve this problem... it's real.
just we need to really solve it, not just a workaround.

is not insane hard (we'd need to do a test read msr, if that fails because =
of broken virtualization, fall back to the degraded mode automatically)



--===============0586724071770365191==--

