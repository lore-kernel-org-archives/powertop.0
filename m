Content-Type: multipart/mixed; boundary="===============1439393208383650112=="
MIME-Version: 1.0
From: Pascal Diogo Antunes <pascal at diogoantunes.org>
Subject: Re: [Powertop] Power Estimation
Date: Wed, 10 Jul 2013 18:58:48 +0200
Message-ID: <20130710185848.1d67b351d16140525c387d0d@diogoantunes.org>
In-Reply-To: CABsxX9+V75mJrSjmB-A6BNnyPcHVb0UC8PJBqm7nS6zPEsyHww@mail.gmail.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============1439393208383650112==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, 9 Jul 2013 14:24:33 -0700
"Kok, Auke-jan H" <auke-jan.h.kok(a)intel.com> wrote:

> On Tue, Jul 9, 2013 at 1:36 PM, Pascal Diogo Antunes
> <pascal(a)diogoantunes.org> wrote:
> > On Tue, 9 Jul 2013 12:47:38 -0700
> > "Kok, Auke-jan H" <auke-jan.h.kok(a)intel.com> wrote:
> >
> >> On Tue, Jul 9, 2013 at 8:41 AM,  <pascal(a)diogoantunes.org> wrote:
> >> > Hi,
> >> > I installed powertop, a great program. But I see on the
> >> > https://01.org/powertop/sites/default/files/powertop.png picture that
> >> > is possible to have a power estimation.
> >> > Great, but I don't have no power indication available.
> >> >
> >> > What can I do?
> >>
> >> Power consumption can be estimated by running on the battery (draining
> >> it and measuring the drain). So, logically, you should unplug your
> >> power cable.
> >>
> >> If you do not have a battery in your system, you can use an external
> >> power meter, but those can be costly.
> >>
> >> Cheers,
> >>
> >> Auke
> >
> > I unpluged and ...
> > # acpi
> > Battery 0: Discharging, 79%, rate information unavailable
> > # powertop (powertop 2.0 /usr/local/sbin/powertop)
> > Loaded 0 prior measurements
> > Cannot load from file /var/cache/powertop/saved_parameters.powertop
> >  [?1049h [1;58r (B [m [4l [?7h [39;49m [?1h =3D [39;49m (B [m [H
> > [2Jterminate called after throwing an instance of
> > 'std::ios_base::failure' what():  basic_filebuf::underflow error
> > reading the file
> =

> it may be interesting to open a bug report and provide the details on
> the system and the battery information that sysfs provides for your
> system such that that crash can be fixed.
> =

> Cheers,
> =

> Auke

I installed the last powertop release, and it works.
But still no power indication available. It's blank instead.
May be a program/package is missing?

-- =

Libere,
Pascal Diogo Antunes.

--===============1439393208383650112==
Content-Type: application/pgp-signature
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.sig"

LS0tLS1CRUdJTiBQR1AgU0lHTkFUVVJFLS0tLS0KVmVyc2lvbjogR251UEcgdjEuNC4xMSAoR05V
L0xpbnV4KQoKaVFJY0JBRUJBZ0FHQlFKUjNaTElBQW9KRVBnbXhyZTNYdFk0RE9jUC8yVjg3bis2
eEQ3Z3c0Ym5RQllRajFMdApIcThwb1NnUlVsNkZ4bStJZW8yR1hpUEdjT0RYNHdNb2cyVUMyU05N
cFNmdjMvc3JpcWhNYWxyZWg5Tk91Z2NICmx5bDAzaFFVVW45SXB5SGY3WXQ0RTFZTFNkeDBvaHZu
c0s5Nmh4ak9oQUthdkN3bGllSE4zdzZrSERDa1JqN0wKdVJHR1I0dENreUFUQld2bDhWb3J1SHcr
ZWJCRDMzYWNRM1hHdTIzQ0JubnlNRFdQRnczTDJPMkdySFRLcGM2YQpnSC9qdXdLUVNUZkFsOCtl
N3FpdkNEYzhnRnp5V2p6cTJwcEdmZ1JiTVFnbUFVbVVCNkRUQnRZODd4T1ZJK3owClBDanRHVzJQ
RTF3ZmM0VkNsTlBEaW9mZzduVzBRVXRrZWNOcCtMVVJheVBMN29kVWxnMzBIdUhGT0s0N0JsdXcK
MDZBSzRrR2JITVRkcFdTcEhDK0lsQ2ExVlg4bWVhdXh5UUdFODBodkJCRmp0RStmMW50RXBBMTJU
MmZxODRTSwpPMTN3czVqQWRFeC8xL3N6eHdnVmJEcDliaVFhV25CbEh4WVV1ZFFncXcvR1lBZUVR
OGVRN3hhaW9xSkFvT3Q4CmVkeCtWTnZ0K3V0aTBHa0wwUkdyaE9lSXNFc1VycWgwMWxoVWpFZHZl
dWxXMUo0VG4xaGdDcU9YVzVaZjM0RngKU2NoRGFtcEpkRGNQVUFNKy9wL2lqRVdEUy8xV0NDbnFl
dER0Z3dKdExZSVpaa3R1cE5XeERPMWx6bUJjZWpxYQpNcjEwazJrbVNxZ3NUZHFiaVQxbUxGU01R
eXl5eEs2VXRkRlNWUk0wQWJlRmRvZlBGZ1NSMXNQQjFmanBTMDZICkdQUFZ3NExyejB0Ni9DSkxZ
bEdDCj1Zb0hhCi0tLS0tRU5EIFBHUCBTSUdOQVRVUkUtLS0tLQo=

--===============1439393208383650112==--

