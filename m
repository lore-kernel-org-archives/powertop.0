Content-Type: multipart/mixed; boundary="===============2349843898711712409=="
MIME-Version: 1.0
From: Valentin Hoebel <valentin.hoebel at nfon.com>
Subject: Re: [Powertop] Does PowerTop support MHz numbers for Intel Xeon L5410
 CPUs ?
Date: Mon, 07 Jul 2014 10:21:44 +0200
Message-ID: <53BA5898.7050709@nfon.com>
In-Reply-To: 20140703135949.GA993@swordfish
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============2349843898711712409==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi,

as you already guessed Debian still uses a 2.0 version.
However, I git cloned 2.6.1 and the "head" versions from GitHub, built =

them both and tried them - still the same result.

Is it known if this particular CPU model does not support reading out =

the CPU frequency values or could this be another problem?

Best regards
Valentin


Am 03.07.2014 15:59, schrieb Sergey Senozhatsky:
> On (07/03/14 14:26), Valentin Hoebel wrote:
>> Hello,
>>
>> I have been using PowerTop for some time now and would like to thank all
>> contributors for their work, especially Intel!
>>
>> However, when using PowerTop on Debian 7 (Kernel 3.2, PowerTop package
>> 2.0-0.3) and navigating to "Frequency stats", it does not show the MHz
>> numbers. Instead, it shows me the following:
>
> Hello,
> am not really familiar with debian versioning, but if "2.0" means
> upstream release v2.0, then you use a really-really outdated powertop
> (several years). in that case I'd recommend to switch to recent version
> (2.6 IIRC).
>
> 	-ss
>
>>            CPU 0
>> Idle      138%
>>
>>            CPU 2
>> Idle      111,7%
>>
>>            CPU 1
>> Idle      111,7%
>>
>>            CPU 3
>> Idle      111,7%
>>
>> Is the CPU model Intel Xeon L5410 simply not supported or is there no wa=
y to
>> read out the frequencies?
>>
>> Browsing the source code, I did not stumple accross this CPU model.
>>
>> Thanks in advance.
>>
>> Best regards
>> Valentin
>>
>>
>> --
>> Mit freundlichen Gr=C3=BC=C3=9Fen
>>
>> Valentin H=C3=B6bel
>> Cloud Architect
>>
>> NFON AG
>> Leonrodstra=C3=9Fe 68
>> D-80636 M=C3=BCnchen
>>
>> Telefon +49 89 45300-407
>> valentin.hoebel(a)nfon.com
>> www.nfon.com
>>
>> Support-Hotline der NFON AG
>> Telefon 0800 - 6366 555
>>
>> Die gesetzlichen Pflichtangaben finden Sie unter
>> https://www.nfon.net/pflichtangaben
>> _______________________________________________
>> PowerTop mailing list
>> PowerTop(a)lists.01.org
>> https://lists.01.org/mailman/listinfo/powertop
>>

-- =

Mit freundlichen Gr=C3=BC=C3=9Fen

Valentin H=C3=B6bel
Cloud Architect

NFON AG
Leonrodstra=C3=9Fe 68
D-80636 M=C3=BCnchen

Telefon +49 89 45300-407
valentin.hoebel(a)nfon.com
www.nfon.com

Support-Hotline der NFON AG
Telefon 0800 - 6366 555

Die gesetzlichen Pflichtangaben finden Sie unter =

https://www.nfon.net/pflichtangaben

--===============2349843898711712409==--

