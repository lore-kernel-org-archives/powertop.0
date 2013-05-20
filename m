Content-Type: multipart/mixed; boundary="===============5428192761384781811=="
MIME-Version: 1.0
From: Sergey Senozhatsky <sergey.senozhatsky at gmail.com>
Subject: Re: [Powertop] Seg Fault due to function format_watts in file
 src/lib.cpp
Date: Mon, 20 May 2013 16:26:39 +0300
Message-ID: <20130520132639.GC2238@swordfish>
In-Reply-To: CABa1t5xZAVYvWagoJR8n-K1iMUZGSJzWtsfmm3HC-FXF-B9hXw@mail.gmail.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============5428192761384781811==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On (02/28/13 14:45), Ganapati Bhat wrote:
>    Dear All,
>    I was compiling powertop as an Android external module and using the
>    option powertop --html. However, there used to be a segmentation fault.
>    When i looked into it, I observed that in the function format_watts in
>    src/lib.cpp, the last=EF=BF=BDargument=EF=BF=BDto mbstows was zero. By=
 changing the
>    argument to len, which is itself an argument to the function format_wa=
tts,
>    powertop worked properly? Does this also happen on an x86 machine? ( I=
 am
>    unable to verify this due to some problems in my laptop which I have n=
ot
>    yet resolved.) If not then can someone explain to me why is it happeni=
ng
>    in the case of android?
>    Thanks and Regards,
>    Ganapati

Hello,

did you have any chance to test the patch?


	-ss

> _______________________________________________
> PowerTop mailing list
> PowerTop(a)lists.01.org
> https://lists.01.org/mailman/listinfo/powertop


--===============5428192761384781811==--

