Content-Type: multipart/mixed; boundary="===============5932587788368878543=="
MIME-Version: 1.0
From: Sergey Senozhatsky <sergey.senozhatsky at gmail.com>
Subject: Re: [Powertop] [Announce] v2.5-rc2
Date: Wed, 13 Nov 2013 01:12:49 +0300
Message-ID: <20131112221249.GD5709@swordfish>
In-Reply-To: 20131112210828.GA5709@swordfish
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============5932587788368878543==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On (11/13/13 00:08), Sergey Senozhatsky wrote:
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

taking my words about trace-cmd back.
trace-cmd can parse it, just need proper plugin placement
[..]
         <idle>-0     [000]  7126.976512: hrtimer_cancel:       hrtimer=3D0=
xffff880157c0df80
              ls-21607 [001]  7126.976513: hrtimer_expire_entry: hrtimer=3D=
0xffff880157c8df80 now=3D7123856003259 function=3Dtick_sched_timer/0x0
          <idle>-0     [000]  7126.976513: hrtimer_expire_entry: hrtimer=3D=
0xffff880157c0df80 now=3D7123856003132 function=3Dtick_sched_timer/0x0
               X-2175  [003]  7126.976513: hrtimer_cancel:       hrtimer=3D=
0xffff880157d8df80
               X-2175  [003]  7126.976515: hrtimer_expire_entry: hrtimer=3D=
0xffff880157d8df80 now=3D7123856003882 function=3Dtick_sched_timer/0x0
              ls-21607 [001]  7126.976518: hrtimer_expire_exit:  hrtimer=3D=
0xffff880157c8df80
          <idle>-0     [000]  7126.976519: hrtimer_expire_exit:  hrtimer=3D=
0xffff880157c0df80
              ls-21607 [001]  7126.976519: hrtimer_start:        hrtimer=3D=
0xffff880157c8df80 function=3Dtick_sched_timer expires=3D7123860000000 soft=
expires=3D7123860000000
          <idle>-0     [000]  7126.976519: hrtimer_start:        hrtimer=3D=
0xffff880157c0df80 function=3Dtick_sched_timer expires=3D7123860000000 soft=
expires=3D7123860000000
               X-2175  [003]  7126.976522: hrtimer_expire_exit:  hrtimer=3D=
0xffff880157d8df80
[..]

powertop does not use char function name representation, but instead uint64=
_t (passing to find_create_timer(uint64_t func)).

	-ss

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

--===============5932587788368878543==--

