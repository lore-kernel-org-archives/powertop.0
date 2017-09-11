Content-Type: multipart/mixed; boundary="===============3792313985476457211=="
MIME-Version: 1.0
From: Joe Konno <joe.konno at linux.intel.com>
Subject: Re: [Powertop] [PATCH 0/4 v1] lib and tuning cleanup series
Date: Mon, 11 Sep 2017 08:51:55 -0700
Message-ID: <c91458$4fi1ru@fmsmga006.fm.intel.com>
In-Reply-To: 20170908223651.27979-1-joe.konno@linux.intel.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============3792313985476457211==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Feedback appreciated, Magnus. I'll integrate that feedback into a v2 submis=
sion.


On Fri,  8 Sep 2017 15:36:47 -0700
Joe Konno <joe.konno(a)linux.intel.com> wrote:

> From: Joe Konno <joe.konno(a)intel.com>
> =

> This series could be split in two, one for the libpci stuff in "lib",
> and another for "tuning" cleanups. The cleanups in "lib" are not
> dependent on the cleanups in "tuning" and vice-versa. There should be
> no changes to PowerTOP operations or usage as a result of these
> patches-- code cleanups only.
> =

> I was re-learning libpci a while back and, during my walks along various
> PCI buses, spotted a trivial refactor for the libpci functionality in
> "lib". This is to make it (slightly) more tempting to embark on future
> changes to walk PCI buses with libpci instead of sysfs-- especially in
> "tuning" cases.
> =

> While looking into additional runtime PM tunables, I stumbled upon
> #defines used for tunable states. Implemented those states in an enum
> instead. Proved easy as those defines were not used as factors in math
> operations, so they were acting as enum entries to begin with. After the
> enum was implemented, gcc warned about unhandled states in
> tunable::result_string()'s switch statement, so I fixed it.
> =

> =

> Joe Konno (4):
>   lib: refactor pci_access checks
>   lib: have check_pci_access() scan the entire bus
>   tuning: use tunable_state enum instead of defines
>   tuning: complete tunable result switch
> =

>  src/lib.cpp                | 14 ++++++++++----
>  src/tuning/bluetooth.cpp   |  6 +++---
>  src/tuning/bluetooth.h     |  2 +-
>  src/tuning/ethernet.cpp    |  4 ++--
>  src/tuning/ethernet.h      |  2 +-
>  src/tuning/runtime.cpp     |  2 +-
>  src/tuning/runtime.h       |  2 +-
>  src/tuning/tunable.h       | 26 +++++++++++++++++---------
>  src/tuning/tuningi2c.cpp   |  2 +-
>  src/tuning/tuningi2c.h     |  2 +-
>  src/tuning/tuningsysfs.cpp |  2 +-
>  src/tuning/tuningsysfs.h   |  2 +-
>  src/tuning/tuningusb.cpp   |  2 +-
>  src/tuning/tuningusb.h     |  2 +-
>  src/tuning/wifi.cpp        |  2 +-
>  src/tuning/wifi.h          |  2 +-
>  16 files changed, 44 insertions(+), 30 deletions(-)
> =



--===============3792313985476457211==
Content-Type: application/pgp-signature
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.sig"

LS0tLS1CRUdJTiBQR1AgU0lHTkFUVVJFLS0tLS0KCmlRSXpCQUVCQ0FBZEZpRUVrUS8vcXlmRjdF
UndpV2hLalloSDFTOUtxbVlGQWxtMnNSc0FDZ2tRalloSDFTOUsKcW1aTTRRLytKRktmMElCeC9r
RHRSKytQNFFzRWp4MnQ1TUNvU3c2c3RxbnNNRnpXQkVZM1pLSThwSmxPSiszagpOdXllOGIzT2Fw
aG5qTzNDL0Q2V1Jta21DcFVSNk9weFkydHN3ZWphWDF1VW1JaGRBSk91cWtFdkV4Yi9pMjFyCmp0
YXZubEoyUDhxU0tuNXo1VmVxTFQ4cmhXVDJuYWpib3B2V1d1dW1KdnJ5bllQZVh0c3RYclM1VFhT
V2JDdk8KWE1DbmFQQnBnTWZCaW1TaGU5RW9XbnZVM1U4NmgxZm83TCt3TG1NYk9BazRCSFB1UWZz
YUdlUVhqSzdzdG1qOQpsbjd5aXRhR2F4UUNvalNZRnV4emRMNFVUVG82NGpaNDhPUExtalJGVUoy
WHZWVnQrVSsrZFo4cmJTb0s1Nm1ZCkxBSjBueTBTS2hUengzSENRQUlnRG5SOGVNVlFVdnBLeXY5
bDF4aDNyeTRJdCtWdThoU2lFbnI5aThJcGc1Y0cKUHFPUUlaR1B2M0RVdGFuVjVtandVYUpBbjZu
bCtsRm1kU3ZRdGlUZkkzMmZENHV6YVpKR3hFdVZaTndzeFEydAp0QUJISHQ2czJ1NXJQMW1LRG5H
R2srcitCbGhOSzNxZTNWVW1uajlLblhRT2pHK0I5eE82L2NjNXVlRTdlZ3RBCk5Na0M4dTA4Qnor
NDR6VVcwZUpRWmFTZGVGYkhpSUFVR2l4Vk5mdTJwNHpWQ1VmYzFRMjBrT25xV01LQmZFaWMKRkp2
dnBtMlFYTkVKTkRNOHcwSndkakhENnA5ejBpSlU0emNPY1A1VlNRUXZzUW9LQkQvWTB6bTRBZnkz
R2xBSApTKzBHWE9ac3BMb2U5MHA4UldNSklQQkgxU1RKdmNPcWJzMFFTSWMvRVBuNWFOZjRBY2s9
Cj1BWHY1Ci0tLS0tRU5EIFBHUCBTSUdOQVRVUkUtLS0tLQo=

--===============3792313985476457211==--

