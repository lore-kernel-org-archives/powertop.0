Content-Type: multipart/mixed; boundary="===============5148319798667417814=="
MIME-Version: 1.0
From: Arjan van de Ven <arjan at linux.intel.com>
Subject: Re: [Powertop] Regarding Missed power est. column in powertop
Date: Wed, 03 Jul 2013 07:07:37 -0700
Message-ID: <51D43029.5060509@linux.intel.com>
In-Reply-To: CANCOGtgUibNa88Lxujdmk6=fyKQ=E3otCNuO-ydzhHR+ANttCw@mail.gmail.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============5148319798667417814==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 7/3/2013 2:17 AM, Suyambulingam R M wrote:
> Hi,
>
> I am using powertop command in my pc. But "power est" column is missing. =
What is the way to enable that column ? Am using powerto pversion 2.3
>
> Is there any way to measure the exact power in mW for a particular proces=
s using powertop ??
>
>
for this to work you need "sufficient" measurements while on battery, on a =
system where
the battery reports the power/current drain rate.
sufficient is relatively high (> 100)... but if powertop reports
a total consumption rate your battery is capable of reporting the power dra=
in..
and it's just a matter of getting enough measurements.



--===============5148319798667417814==--

