Content-Type: multipart/mixed; boundary="===============6086101436680947138=="
MIME-Version: 1.0
From: Joe Konno <joe.konno at linux.intel.com>
Subject: Re: [Powertop] [PATCH 2/2] intel_cpus: no pstate Idle pct with
 intel_pstate
Date: Wed, 15 Jun 2016 08:14:04 -0700
Message-ID: <20160615151404.GA2586@jbkonno-anise.jf.intel.com>
In-Reply-To: 20160615145625.GA27695@jbkonno-anise.jf.intel.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============6086101436680947138==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 15, 2016 at 07:56:25AM -0700, Joe Konno wrote:
> On Wed, Jun 15, 2016 at 01:51:22AM +0000, Wang, Xiaolong wrote:
> > Hi Joe,
> > I just realized a further scenario that would be problematic with your =
current patch:
> > once I'd read from Len Brown's post to Red Hat, that enabling HWP in in=
tel_pstate driver is considered a mistake,
> > because enabling HWP only need to write a few msr bits, based on a few =
simple policies,
> > there's no need to load a whole intel_pstate driver to do that.
> > so future upstream kernel would remove that part, and HWP enabling will=
 be put to some CPPC driver,
> > and on HWP reinforced platform, intel_pstate driver will not be loaded =
at all.
> > =

> > So, if that happen, the is_intel_pstate_driver_loaded() will return fal=
se, and code will go to the old path,
> > but the frequency statistics still not exist, then we got nothing.
> =

> Good catch, thanks!
> =

> > mmm... maybe you could use 'cpufreq statistics exists or not' to branch=
 your code,
> >   if exist, use it; if not, calculate average freq from msrs.
> > there should have been such a function to check that condition.

The check is duplicated in no less than four places-- there is no
standalone utility function to perform the check. I'll address that
duplication in my next revision by re-factoring the check into a proper
function to ease re-use and maintenance.

> =

> My thoughts exactly. I'll see about submitting a new revision of this
> series.


--===============6086101436680947138==
Content-Type: application/pgp-signature
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="signature.asc"

LS0tLS1CRUdJTiBQR1AgU0lHTkFUVVJFLS0tLS0KVmVyc2lvbjogR251UEcgdjIKCmlRSWNCQUVC
Q0FBR0JRSlhZWEN3QUFvSkVJMklSOVV2U3FwbWZmSVFBTEo4aC9JZk1BOWZxVFlVQmNOTEpESFkK
K0pUU0dRdGEwTU0zVVRFd2tjUm1OREx1VGRWU09rVnJLZzZpMWxCcm51TGx3azhoTS9BQVdodW90
dXhudTBuMwpjc05kVkdobGlSaElEblhNYjZVQlVaZlVuRXp5dXc1cTlQOUhnSGEvS3htUC9BU1h6
WnpoN25EUC9LT1NZTUtnCjZ0SHZzZklQRFltSWxqWkxuTHI0TzZEb3IrdWxPbmlBZVdjWkViSG5Z
MmplR0lWMjRTSGxPcjFMS0tLRGJsTmoKRE03SmdFRkxNckduZDV1OVZLZE41ejYwZGNlSFFIc2Jz
N0w2OTBQR3owbGpEOFEzVUVROFVpd0FUZDBKVVk4LwpLNTFaeFM4dk8vTlpta1puL29odkV3QVB4
T2g5Zk10c1JVSDkwUDZOeFpuQlN5RGd0aHByNlQ2MTEreFNSWlJvCmFxZDVyN0VtdDAvcjk0Sytq
V1NGWk5PR3liL3lrcURaN2gwQW14VlMxU3ArdmhhK2VIaXBFSzFTSkltN0NVRm0KcitJKzdxQXo4
aHRKSTI0Qk5abVVUamIvOFZMTmx3MUJ6RHI1VXJ0T0tUSDNhT05yWFpEM0Q2YndtZEdXL1lDegpR
SU9QSDBTZnVlb1drbW1qNm1LdEl5SnpNaXptVkJ1OE5qQUJoQ2dGV282VlE5WEprWktPdEFZa0NI
eFlEQU1NClBJNTNhSGdkdE9sSm9hN0ZpL3lOQzJaOFVBVjdVUGV2aHFTNnRtdG1YUEF2MXh4T1Zz
TFFDSWJRclp6VHFaZ3IKclBZaXpKaFlnWmZvcXVQYWtVQTYybWpIbTBmU3JpUEY4TXdNZ3Vha3pU
Ykl0cmMwU1lkNUprWEJna001R1o4cQovQkU2eWFYTnB4UEE3RTJTVXBvVQo9SFA4SAotLS0tLUVO
RCBQR1AgU0lHTkFUVVJFLS0tLS0K

--===============6086101436680947138==--

