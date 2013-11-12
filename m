Content-Type: multipart/mixed; boundary="===============6372960027273852836=="
MIME-Version: 1.0
From: Kristen Carlson Accardi <kristen at linux.intel.com>
Subject: Re: [Powertop] [Announce] v2.5-rc2
Date: Tue, 12 Nov 2013 14:51:40 -0800
Message-ID: <20131112145140.7d84a0dc@bluebird.jf.intel.com>
In-Reply-To: 20131112210828.GA5709@swordfish
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============6372960027273852836==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, 13 Nov 2013 00:08:28 +0300
Sergey Senozhatsky <sergey.senozhatsky(a)gmail.com> wrote:

> On (11/05/13 12:34), Kristen Carlson Accardi wrote:
> > > > Thanks for your report, I bisected this issue down to this commit:
> > > > commit 2b980e1b36cf6150308a9db07b958726dad36571
> > > > Author: Sergey Senozhatsky <sergey.senozhatsky(a)gmail.com>
> > > > Date:   Tue Oct 8 22:35:53 2013 +0300
> > > > =

> > > >     traceevent: update libtraceevent code base (3.12)
> > > > =

> > > > Sergey?  See report below for how to duplicate.
> > > =

> > > hm... big problem, libtraceevent unable to support hrtimers event at
> > > the moment with arg construction in TP_printk()
> > > =

> > =

> > OK, I am thinking that we'll consider this a showstopper and delay the
> > release of 2.5 until it is fixed if we need to.
> > =

> =

> Hello,
> sorry it took me so long to get back to this.
> =

> after short investigation, I don't think we need to postpone 2.5 release.
> yes, libtraceevent does not handle nicely
> /** nor trace-cmd does
>      kworker/1:0-3925  [001]  1626.266585: hrtimer_cancel:       hrtimer=
=3D0xffff880157c8df80
>                X-2175  [000]  1626.266585: hrtimer_cancel:       hrtimer=
=3D0xffff880157c0df80
>                X-2175  [000]  1626.266586: hrtimer_expire_entry: [FAILED =
TO PARSE] hrtimer=3D0xffff880157c0df80 now=3D1625348004324 function=3D0xfff=
fffff810cadf0
>      kworker/1:0-3925  [001]  1626.266586: hrtimer_expire_entry: [FAILED =
TO PARSE] hrtimer=3D0xffff880157c8df80 now=3D1625348004320 function=3D0xfff=
fffff810cadf0
>      kworker/1:0-3925  [001]  1626.266591: hrtimer_expire_exit:  hrtimer=
=3D0xffff880157c8df80
>      kworker/1:0-3925  [001]  1626.266592: hrtimer_start:        [FAILED =
TO PARSE] hrtimer=3D0xffff880157c8df80 function=3D0xffffffff810cadf0 expire=
s=3D1625352000000 softexpires=3D1625352000000
>                X-2175  [000]  1626.266593: hrtimer_expire_exit:  hrtimer=
=3D0xffff880157c0df80
>                X-2175  [000]  1626.266594: hrtimer_start:        [FAILED =
TO PARSE] hrtimer=3D0xffff880157c0df80 function=3D0xffffffff810cadf0 expire=
s=3D1625352000000 softexpires=3D1625352000000
>      kworker/1:0-3925  [001]  1626.266596: timer_cancel:         timer=3D=
0xffff880157c8ff28
> **/
> some of hrtimer events printk format [e.g. hrtimer_expire_entry]
> =

> 	print fmt: "hrtimer=3D%p function=3D%pf now=3D%llu", REC->hrtimer, REC->=
function, (unsigned long long)(((ktime_t) { .tv64 =3D REC->now }).tv64)
> =

> having issues with arg construction { .tv64 =3D REC->now }.tv64 (and that=
 unknown op '{' warning),
> however, we're able to parse hrtimer event and to handle it. /* as far as=
 I understand, correct me if I'm wrong */
> =

> debug output from do_process perf_process_bundle::handle_trace_point()
> =

> [..]
> >> hrtimer_expire_exit: pop_consumer: 0
>   >> timer done: 0x8683f90 5941
>   >> timer created: 0x8683f90 [timer]
> >> hrtimer_expire_entry: push_consumer: 0
>   >> timer created: 0x8683f90 [timer]
> >> hrtimer_expire_entry: push_consumer: 2
> >> hrtimer_expire_exit: pop_consumer: 0
>   >> timer done: 0x8683f90 9857
> >> hrtimer_expire_exit: pop_consumer: 2
>   >> timer done: 0x8683f90 12529
>   >> timer created: 0x8683f90 [timer]
> >> hrtimer_expire_entry: push_consumer: 0
>   >> timer created: 0x8683f90 [timer]
> >> hrtimer_expire_entry: push_consumer: 2
> >> hrtimer_expire_exit: pop_consumer: 0
>   >> timer done: 0x8683f90 4481
> >> hrtimer_expire_exit: pop_consumer: 2
>   >> timer done: 0x8683f90 6535
> [..]
> =

> any objections?
> =

> 	-ss

good, thanks! as long as we actually get the events it doesn't seem
like a showstopper anymore to me :).

--===============6372960027273852836==--

