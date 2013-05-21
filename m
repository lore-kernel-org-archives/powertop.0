Content-Type: multipart/mixed; boundary="===============6405995821087868250=="
MIME-Version: 1.0
From: Sergey Senozhatsky <sergey.senozhatsky at gmail.com>
Subject: Re: [Powertop] Seg Fault due to function format_watts in file
 src/lib.cpp
Date: Tue, 21 May 2013 10:34:58 +0300
Message-ID: <20130521073458.GA2653@swordfish.datadirectnet.com>
In-Reply-To: CABa1t5y47pWK3V-vsZKhm8Ks4yYz0FTtJ9dAP=tNW15c-j00=g@mail.gmail.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============6405995821087868250==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On (05/21/13 12:20), Ganapati Bhat wrote:
>    Dear Sergey,
>    Powertop --html is working fine with the patch applied. I am able to
>    successfully execute the command and get the results. However, still
>    trying to understand the patch and the difference when I changed the 0=
 to
>    len in=C2=A0while (mbstowcs(NULL,buffer,0) < len) inside src/lib.cpp f=
ile.
>    Now, will try to adopt the latest version of powertop for android.
>    Thanks for all the help and sorry for the delay.
>    Regards,
>    Ganapati Bhat
>

Thanks Ganapati!

Kristen, could you please take a look if we can land it in upcoming
release?

https://lists.01.org/pipermail/powertop/2013-February/000782.html


Reported-and-Tested-by: Ganapati Bhat <life.mytake(a)gmail.com>
Signed-off-by: Sergey Senozhatsky <sergey.senozhatsky(a)gmail.com>


	-ss


 =

>    On Tue, May 21, 2013 at 11:23 AM, Ganapati Bhat <[1]life.mytake(a)gmai=
l.com>
>    wrote:
> =

>      Hello,
>      I am really sorry. i was involved in some other tasks. Will get back=
 to
>      you in a couple of days.
>      Ganapati Bhat
> =

>      On Mon, May 20, 2013 at 6:56 PM, Sergey Senozhatsky
>      <[2]sergey.senozhatsky(a)gmail.com> wrote:
> =

>        On (02/28/13 14:45), Ganapati Bhat wrote:
>        > =C2=A0 =C2=A0Dear All,
>        > =C2=A0 =C2=A0I was compiling powertop as an Android external mod=
ule and using
>        the
>        > =C2=A0 =C2=A0option powertop --html. However, there used to be a=
 segmentation
>        fault.
>        > =C2=A0 =C2=A0When i looked into it, I observed that in the funct=
ion
>        format_watts in
>        > =C2=A0 =C2=A0src/lib.cpp, the last=EF=BF=BDargument=EF=BF=BDto m=
bstows was zero. By changing
>        the
>        > =C2=A0 =C2=A0argument to len, which is itself an argument to the=
 function
>        format_watts,
>        > =C2=A0 =C2=A0powertop worked properly? Does this also happen on =
an x86
>        machine? ( I am
>        > =C2=A0 =C2=A0unable to verify this due to some problems in my la=
ptop which I
>        have not
>        > =C2=A0 =C2=A0yet resolved.) If not then can someone explain to m=
e why is it
>        happening
>        > =C2=A0 =C2=A0in the case of android?
>        > =C2=A0 =C2=A0Thanks and Regards,
>        > =C2=A0 =C2=A0Ganapati
> =

>        Hello,
> =

>        did you have any chance to test the patch?
> =

>        =C2=A0 =C2=A0 =C2=A0 =C2=A0 -ss
> =

>        > _______________________________________________
>        > PowerTop mailing list
>        > [3]PowerTop(a)lists.01.org
>        > [4]https://lists.01.org/mailman/listinfo/powertop
> =

> References
> =

>    Visible links
>    1. mailto:life.mytake(a)gmail.com
>    2. mailto:sergey.senozhatsky(a)gmail.com
>    3. mailto:PowerTop(a)lists.01.org
>    4. https://lists.01.org/mailman/listinfo/powertop

--===============6405995821087868250==--

