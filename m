Content-Type: multipart/mixed; boundary="===============0615486066084556190=="
MIME-Version: 1.0
From: Alexandra Yates <alexandra.yates at linux.intel.com>
Subject: Re: [Powertop] [Patches] snprintf,
 PATH_MAX + improvement of handling reporting filenames
Date: Thu, 17 Sep 2015 17:30:10 -0700
Message-ID: <55FB5B12.8050709@linux.intel.com>
In-Reply-To: 1581639328.16307870.1431448558175.JavaMail.zimbra@redhat.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============0615486066084556190==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Your patch was added.

On 05/12/2015 09:35 AM, Jaroslav Skarvada wrote:
> Hi,
>
> I have noticed there are some sprintf that may lead to buffer
> overflows, e.g. the following can crash powertop:
>
> # powertop --csv=3D`printf 'a%.0s' {1..5000}`
>
> I attempted to fix hopefully most of them by converting
> the code to snprintf. For data returned by kernel
> it's probably unlikely to cause overflows, but why
> not cover it all. I also tried to unify buffer
> sizes for paths/filenames to PATH_MAX.
>
> The second patch tries to improve handling of reporting
> filenames. It works the following way:
>
> powertop --html
> generates 'powertop.html' file
>
> powertop --html=3Dmyfile.suffix
> generates 'myfile.suffix' file
>
> powertop -i 2 --html
> generates 'powertop-TIMESTAMPS.html' files
>
> powertop -i 2 --html=3Dmyfile.suffix
> generates 'myfile-TIMESTAMPS.suffix' files
>
> powertop -i 2 --html=3Dmyfile
> generates 'myfile-TIMESTAMPS' files
>
> Similarly for CSV.
>
> I think this is more logical behavior
>
> regards
>
> Jaroslav
>
>
>
> _______________________________________________
> PowerTop mailing list
> PowerTop(a)lists.01.org
> https://lists.01.org/mailman/listinfo/powertop
>

-- =

Thank you,
<Alexandra>

--===============0615486066084556190==--

