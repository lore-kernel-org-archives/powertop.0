Content-Type: multipart/mixed; boundary="===============0825338577274968146=="
MIME-Version: 1.0
From: Wang, Xiaolong <xiaolong.wang at intel.com>
Subject: [Powertop] Frequency stats show only 100% idle on servers in
 "performance" profile
Date: Tue, 13 Jan 2015 07:07:23 +0000
Message-ID: <3D803AC0BEBB604B9799C45D4E4A14B70129A666@SHSMSX103.ccr.corp.intel.com>
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============0825338577274968146==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Powertop developers,

Please help to evaluate if this is a bug:

I was using Powertop 2.6.1 on RHEL7.1beta and some servers including Ivybri=
dge-EP/EX and Haswell-1S/EP/EX.
And found Frequency stats show only 100% idle and no other frequency percen=
tage, like the following:

PowerTOP 2.6.1    Overview   Idle stats   Frequency stats   Device stats   =
Tunab


            Package |             Core    |            CPU 0       CPU 4
                    |                     | Actual    3.9 GHz     3.8 GHz
Idle       100.0%   | Idle       100.0%   | Idle       100.0%      100.0%

                    |             Core    |            CPU 1       CPU 5
                    |                     | Actual    3.9 GHz     3.9 GHz
                    | Idle       100.0%   | Idle       100.0%      100.0%

                    |             Core    |            CPU 2       CPU 6
                    |                     | Actual    3.8 GHz     3.8 GHz
                    | Idle       100.0%   | Idle       100.0%      100.0%

                    |             Core    |            CPU 3       CPU 7
                    |                     | Actual    3.8 GHz     3.7 GHz
                    | Idle       100.0%   | Idle       100.0%      100.0%

When I add workloads, the Idle percentage drops, but still no other frequen=
cy percentage.
For servers, RHEL7 would use "throughput-performance" profile, which would =
keep processor at its top frequency.

I just think PowerTop should not display idle percentage only, in my point =
of view,
when no workload, 90%+ idle and a few percentage at max frequency is reason=
able.
when high workload, a few percentage idle and high percentage at max freque=
ncy is reasonable.

The following is the result of "balanced" profile,
at least not all 100% idle.

PowerTOP 2.6.1    Overview   Idle stats   Frequency stats   Device stats   =
Tunab

            Package |             Core    |            CPU 0       CPU 4
                    |                     | Actual    3.6 GHz     3.3 GHz
Idle        99.8%   | Idle       100.0%   | Idle       100.0%      100.0%
4.00 GHz     0.1%   | 4.00 GHz     0.0%   | 4.00 GHz     0.0%        0.0%
3.31 GHz     0.0%   |                     |
1400 MHz     0.0%   |                     |
2.10 GHz     0.1%   |                     |

                    |             Core    |            CPU 1       CPU 5
                    |                     | Actual    3.6 GHz     3.5 GHz
                    | Idle        99.8%   | Idle       100.0%       99.9%
                    | 4.00 GHz     0.1%   | 3.31 GHz     0.0%        0.1%
                    | 3.31 GHz     0.0%   | 1400 MHz     0.0%        0.1%
                    | 1400 MHz     0.0%   | 4.00 GHz     0.0%
                    | 2.10 GHz     0.1%   |

                    |             Core    |            CPU 2       CPU 6
                    |                     | Actual    3.4 GHz     3.2 GHz
                    | Idle       100.0%   | Idle       100.0%      100.0%
                    | 4.00 GHz     0.0%   | 4.00 GHz     0.0%        0.0%
                    | 2.10 GHz     0.0%   | 2.10 GHz     0.0%
                    |                     |
                    |                     |

                    |             Core    |            CPU 3       CPU 7
                    |                     | Actual    3.4 GHz     2.9 GHz
                    | Idle       100.0%   | Idle       100.0%      100.0%
                    | 3.31 GHz     0.0%   | 3.31 GHz     0.0%        0.0%
                    | 4.00 GHz     0.0%   | 4.00 GHz     0.0%
                    | 2.10 GHz     0.0%   | 2.10 GHz     0.0%

Thanks,

-Wang, Xiaolong from Intel OTC OSV-Enabling

--===============0825338577274968146==--

