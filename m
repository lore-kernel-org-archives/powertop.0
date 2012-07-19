Content-Type: multipart/mixed; boundary="===============6513796001613060998=="
MIME-Version: 1.0
From: Arjan van de Ven <arjan at linux.intel.com>
Subject: Re: [Powertop] [PATCH] Make ncurses dependency optional
Date: Thu, 19 Jul 2012 08:15:16 -0700
Message-ID: <50082484.6060000@linux.intel.com>
In-Reply-To: 5007A8B1.9090404@samsung.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============6513796001613060998==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 7/18/2012 11:26 PM, Igor Zhbanov wrote:
> Arjan van de Ven wrote:
>> On 7/18/2012 7:54 AM, Igor Zhbanov wrote:
>>> Make ncurses dependency optional. Provide --without-ncurses option
>>> to configure.
>> I'm sorry but this patch is disgusting;
>> PowerTOP uses ncurses. Really.
>>
>> crapping ifdefs all over the codebase to pretend it does not, we're just
>> really not going to do that this way.
> I agree that lots of #ifdefs are ugly. But some mobile platforms doesn't
> have ncurses. =


then maybe those mobile platforms should add ncurses?

I did not realize Tizen lacked ncurses for example, sounds daft to be
honest.



--===============6513796001613060998==--

