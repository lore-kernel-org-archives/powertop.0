Content-Type: multipart/mixed; boundary="===============6058312715251876806=="
MIME-Version: 1.0
From: Sanjay Singh Rawat <sanjay.rawat at linaro.org>
Subject: Re: [Powertop] [PATCH] devfreq: add devfreq devices stats support
Date: Tue, 30 Sep 2014 09:51:42 +0530
Message-ID: <542A2FD6.7050000@linaro.org>
In-Reply-To: 54007.10.24.5.188.1412030798.squirrel@linux.intel.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============6058312715251876806==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


On Tuesday 30 September 2014 04:16 AM, Alexandra Yates wrote:
>
> Hi Sanjay,
>
> It would be better that Device Frequency Stats appears only when
> /sys/class/devfewq is present on the system.  That will simplify code
> execution at runtime and remove the blank window with "No devfreq devices
> available".

ack, thanks for the review Alexandra

will update the patch as per your comment.
>
> Thank you,
> Alexandra.

-- =

sanjay


--===============6058312715251876806==--

