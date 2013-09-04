Content-Type: multipart/mixed; boundary="===============5702901314682905242=="
MIME-Version: 1.0
From: Sergey Senozhatsky <sergey.senozhatsky at gmail.com>
Subject: Re: [Powertop] ia64 builds fails (and maybe alpha too?)
Date: Wed, 04 Sep 2013 11:40:17 +0300
Message-ID: <20130904084017.GA4446@swordfish.minsk.epam.com>
In-Reply-To: 52266E38.3030307@debian.org
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============5702901314682905242==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On (09/03/13 18:48), Jose Luis Rivas wrote:
> On Tue Sep  3 18:39:26 2013, Arjan van de Ven wrote:
> >
> > if your kernel does not have "perf", there is no point in using
> > powertop....
> > really; it will not work at all.
> >
> > (including anything asm-generic/foo also is the wrong answer; that
> > directory is not architectural
> > from a kernel perspective, only for indirect inclusion)
> >
> >
> =

> It does. =


Sorry, I doubt that.


ia64 entry.S

        // the syscall number may have changed, so re-load it and re-calcul=
ate the
        // syscall entry-point:
        adds r15=3DPT(R15)+16,sp                  // r15 =3D &pt_regs.r15 (=
syscall #)
        ;;
        ld8 r15=3D[r15]
        mov r3=3DNR_syscalls - 1
        ;;
        adds r15=3D-1024,r15
        movl r16=3Dsys_call_table
        ;;
        shladd r20=3Dr15,3,r16                    // r20 =3D sys_call_table=
 + 8*(syscall-1024)
        cmp.leu p6,p7=3Dr15,r3
        ;;
(p6)    ld8 r20=3D[r20]                           // load address of syscal=
l entry point
(p7)    movl r20=3Dsys_ni_syscall
        ;;
        mov b6=3Dr20
        br.call.sptk.many rp=3Db6                 // do the syscall



where syscall_table is something like this:


        data8 sys_preadv
        data8 sys_pwritev                       // 1320
        data8 sys_rt_tgsigqueueinfo
        data8 sys_recvmmsg
        data8 sys_fanotify_init
        data8 sys_fanotify_mark
        data8 sys_prlimit64                     // 1325
        data8 sys_name_to_handle_at
        data8 sys_open_by_handle_at
        data8 sys_clock_adjtime
        data8 sys_syncfs
        data8 sys_setns                         // 1330
        data8 sys_sendmmsg
        data8 sys_process_vm_readv
        data8 sys_process_vm_writev
        data8 sys_accept4
        data8 sys_finit_module                  // 1335


and no, there is no perf_event_open syscall.


simply definining missing __NR
	#define __NR_perf_event_open           1336

and then performing

	call sys_call_table + 8*(syscall-1024)

will not do the trick. this only will make compilable binary, and that's it.


so I NACK the proposed patch at the moment.

	-ss


> I was just writing to Julian about this. It seems like it is
> actually a bug in the kernel not having it defined in ia64's unistd.h[0]
> (checking Linus's master branch).
> =

> [0]
> https://github.com/torvalds/linux/blob/master/arch/ia64/include/uapi/asm/=
unistd.h
> =

> Meaning that it wont fail in alpha, but's failing on ia64 because that
> line is missing.
> =

> Seems like the right hint, Arjan?
> -- =

> Jose Luis Rivas
> The Debian Project -- http://debian.org
> _______________________________________________
> PowerTop mailing list
> PowerTop(a)lists.01.org
> https://lists.01.org/mailman/listinfo/powertop
>=20

--===============5702901314682905242==--

