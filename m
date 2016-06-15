Content-Type: multipart/mixed; boundary="===============2835751693924346201=="
MIME-Version: 1.0
From: Joe Konno <joe.konno at linux.intel.com>
Subject: Re: [Powertop] [PATCH 2/2] intel_cpus: no pstate Idle pct with
 intel_pstate
Date: Wed, 15 Jun 2016 07:56:25 -0700
Message-ID: <20160615145625.GA27695@jbkonno-anise.jf.intel.com>
In-Reply-To: 3D803AC0BEBB604B9799C45D4E4A14B7113C646C@SHSMSX103.ccr.corp.intel.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============2835751693924346201==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 15, 2016 at 01:51:22AM +0000, Wang, Xiaolong wrote:
> Hi Joe,
> I just realized a further scenario that would be problematic with your cu=
rrent patch:
> once I'd read from Len Brown's post to Red Hat, that enabling HWP in inte=
l_pstate driver is considered a mistake,
> because enabling HWP only need to write a few msr bits, based on a few si=
mple policies,
> there's no need to load a whole intel_pstate driver to do that.
> so future upstream kernel would remove that part, and HWP enabling will b=
e put to some CPPC driver,
> and on HWP reinforced platform, intel_pstate driver will not be loaded at=
 all.
> =

> So, if that happen, the is_intel_pstate_driver_loaded() will return false=
, and code will go to the old path,
> but the frequency statistics still not exist, then we got nothing.

Good catch, thanks!

> mmm... maybe you could use 'cpufreq statistics exists or not' to branch y=
our code,
>   if exist, use it; if not, calculate average freq from msrs.
> there should have been such a function to check that condition.

My thoughts exactly. I'll see about submitting a new revision of this
series.

--===============2835751693924346201==
Content-Type: application/pgp-signature
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="signature.asc"

LS0tLS1CRUdJTiBQR1AgU0lHTkFUVVJFLS0tLS0KVmVyc2lvbjogR251UEcgdjIKCmlRSWNCQUVC
Q0FBR0JRSlhZV3lTQUFvSkVJMklSOVV2U3FwbTl2d1FBS2E5OWFsU210eEZFakcyNUdkdjM4anUK
eWExUERiVXhYUUZnL05ya2tJSUNBVmJ6SkFtZTJaeFNZVHR5d1ZqVkpwMU1DVDd5UndXanduVUZk
dlExVFVROQpnd21XR0pNNXJnODMvdEdnRCtZM1psaWUxeDlIRnVmVUZ0anNNUVBCL3pZUTdjN1FE
ZkJDb2Rjenc0WXo4M25NClFRV0ZvOEhLRlgrb2pxMHlhM2N4UlpKQTF6clJVUC9kK09VRlM4NDZR
Y2NmQXhwQzg5bUNDSWZaTUlsY0RHdnkKQ2kvY0VPSlNNMHdlNVY0SnF5QVp6WHUreTRPd3c3OUtn
SG9jZkpDdEJyUDA2clZ3TG5XRmJkYjJQS3JaK0F3VQpzWmdWRG41QnZXdEtLaFJZT29JaHd3L1hM
YmlhaGlzMitxQ010RSthbDhKYjVSbWFMWDRUSWJrRzhWSnRPUTJLCmljeHl3dGhjQ2ZKWjJTaGcv
Uk1abmhac01TUDk2Y2UzeGVtcFozRXV2Z2hzak00NVVoLzhWR1BJMFFXeUptYncKOWEzdy9QUSt3
cjNiMk9PM245Y3RWLzdUOFJLVi9SSEZ0OE1wT0kvSk13ejl4VzdTSzI1djVsdk1KM0lIR3hXQQov
TUFkZUoyQ0h3bklaZzAxUFdJRFQ4akJkTGNqNkpQeXZUN2taSWZseFV6RnVoMU1sUzkwSktRa1A4
QURFT2JMCml2TndPSllvdEV4Y0VuT3V4RThZV0h2R1Rkb1dtem1maGlGNkJma0JKOEpmQ09tN0N6
TjZJdHcvbU5HeFpGekIKKzhHU2Rtd0pVUGc3Y2U1aXZNN3Y1dzltV0lqeGdqUk1ETEhJRWNFN0JC
M0ZKSFBQVkZycGVDekVkNEh4R01zMwpGUExMUE9KaUxreTRLQjV4aXZMOQo9cVZlagotLS0tLUVO
RCBQR1AgU0lHTkFUVVJFLS0tLS0K

--===============2835751693924346201==--

