Content-Type: multipart/mixed; boundary="===============8589475158207274351=="
MIME-Version: 1.0
From: Chris Ferron <chris.e.ferron at linux.intel.com>
Subject: Re: [Powertop] Suspecting incorrect if check during powertop init
Date: Tue, 07 Aug 2012 09:25:49 -0700
Message-ID: <5021418D.2060609@linux.intel.com>
In-Reply-To: 502117EA.3090506@linux.intel.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============8589475158207274351==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 08/07/2012 06:28 AM, Arjan van de Ven wrote:
> On 8/7/2012 3:54 AM, Rajagopal Venkat wrote:
>> Hi,
>>
>> Recently a patch[1] is applied to remove boardname support from powertop.
>> This commit adds few lines of code to powertop_init(), to initialize two
>> global variables. I suspect, if condition is not correct and is suppose
>> to be as follows. Is that intentional?
>>   =

>>          if (access("/var/cache/powertop/saved_parameters.powertop", R_O=
K) =3D=3D 0 ||
>>              access("/data/local/powertop/saved_parameters.powertop", R_=
OK) =3D=3D 0) {
>>                  global_fixed_parameters =3D 1;
>>                  global_power_override =3D 1;
>>          }
>>   =

> both are wrong
> the whole snippet that assigns these two globals needs to go.
>
> the logic used to be that you could do a boardname override, which would =
lock system parameters in place
> and stop the learning logic
> (say, if provided by a manufacturer)
>
> with the boardname stuff gone, those parameters shouldn't be set like this
>
> _______________________________________________
> PowerTop mailing list
> PowerTop(a)lists.01.org
> https://lists.01.org/mailman/listinfo/powertop
Thanks for the catch. I have pushed the fix.
-C


--===============8589475158207274351==--

