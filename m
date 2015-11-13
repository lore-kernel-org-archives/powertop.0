Content-Type: multipart/mixed; boundary="===============6021597622790095575=="
MIME-Version: 1.0
From: Jan Engelhardt <jengelh at inai.de>
Subject: Re: [Powertop] Incorrect reporting for Intel 3930K model and others
Date: Sat, 14 Nov 2015 00:52:22 +0100
Message-ID: <alpine.LSU.2.20.1511140046020.19260@nerf40.vanv.qr>
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============6021597622790095575==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


On Thursday 2015-03-26 19:39, Jan Engelhardt wrote:
>Using powertop v2.7-28-g3f5bccb, combined with the following CPU/system:
[some intel i7-3930K]
>
># powertop
><Frequency Stats tab>:
>            Package |             Core    |            CPU 0       CPU 1
>                    |                     | Actual    3.4 GHz     3.4 GHz
>Idle       100.0%   | Idle       100.0%   | Idle       100.0%      100.0%
>
>                    |             Core    |            CPU 2       CPU 3
>                    |                     | Actual    3.4 GHz     3.4 GHz
>                    | Idle       100.0%   | Idle       100.0%      100.0%
>
>                    |             Core    |            CPU 4       CPU 5
>                    |                     | Actual    3.4 GHz     3.4 GHz
>                    | Idle       100.0%   | Idle       100.0%      100.0%
>
>                    |             Core    |            CPU 6       CPU 7
>                    |                     | Actual    3.4 GHz     3.4 GHz
>                    | Idle       100.0%   | Idle       100.0%      100.0%
>
>                    |             Core    |            CPU 8       CPU 9
>                    |                     | Actual    3.4 GHz     3.4 GHz
>                    | Idle       100.0%   | Idle       100.0%      100.0%

This appears fixed when using Linux 4.3.
Both powertop 2.6 and 2.8 show useful info then.


            Package |             Core    |            CPU 0       CPU 1
                    |                     | Actual      1325 MHz    1331 MHz
Idle         0.3%   | Idle         9.5%   | Idle        27.1%       28.7%
3.81 GHz     1.2%   | 3.81 GHz     0.9%   | 3.81 GHz     0.9%        1.5%
3.50 GHz     0.1%   | 3.50 GHz     0.1%   | 3.50 GHz     0.1%        0.8%
3.60 GHz     0.0%   | 3.60 GHz     0.0%   | 3.60 GHz     0.0%       10.0%
3.31 GHz     0.0%   | 3.31 GHz     0.0%   | 3.31 GHz     0.0%       25.9%
3.00 GHz     0.0%   | 3.00 GHz     0.0%   | 3.00 GHz     0.0%        2.4%
1200 MHz     3.1%   | 1200 MHz     1.9%   | 1200 MHz     1.0%        1.1%
1.71 GHz     2.8%   | 1.71 GHz     2.5%   | 1.71 GHz     1.5%        8.4%
1400 MHz    16.8%   | 1400 MHz    16.6%   | 1400 MHz    14.6%       13.1%
2.31 GHz     1.0%   | 2.31 GHz     0.9%   | 2.31 GHz     0.7%        7.6%
2.21 GHz     0.0%   | 2.21 GHz     0.0%   | 2.21 GHz     0.0%        0.5%
1.91 GHz    10.0%   | 1.91 GHz    10.0%   | 1.91 GHz     5.9%
1300 MHz    36.4%   | 1300 MHz    33.2%   | 1300 MHz    29.2%
1.80 GHz     1.2%   | 1.80 GHz     1.1%   | 1.60 GHz     7.8%
1500 MHz    15.6%   | 1500 MHz    12.8%   | 1500 MHz    10.1%
1.60 GHz    10.9%   | 1.60 GHz     9.9%   | 1.80 GHz     0.6%
2.00 GHz     0.5%   | 2.00 GHz     0.5%   | 2.00 GHz     0.5%
                                            [...]

--===============6021597622790095575==--

