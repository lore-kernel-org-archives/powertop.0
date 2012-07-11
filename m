Content-Type: multipart/mixed; boundary="===============8798379284657456940=="
MIME-Version: 1.0
From: Kok, Auke-jan H <auke-jan.h.kok at intel.com>
Subject: Re: [Powertop] [PATCH] csstoh shell-script for cross-compiling
 PowerTOP
Date: Wed, 11 Jul 2012 16:26:47 +0000
Message-ID: <CABsxX9+t+iM=RArsJ3=D-DK6mVetJrpou=274NNg8Ww9R-i71Q@mail.gmail.com>
In-Reply-To: 1342010946-19003-1-git-send-email-i.zhbanov@samsung.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============8798379284657456940==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 11, 2012 at 12:49 PM, Igor Zhbanov <i.zhbanov(a)samsung.com> wr=
ote:
> It was impossible to build PowerTOP for ARM with a cross-compiler
> because PowerTOP uses internal csstoh utility that converts
> powertop.css to powertoh.h for inclusion in *.cpp source files.
>
> When you use the cross-compiler (without making complicated rules
> in the Makefile) this utility will be compiled for ARM platform too.
> And you cannot run it on x86 build host.
>
> To solve this issue I have rewritten it in a shell script.

So, while this approach is correct, it's a clear case where basically
autotools is not used properly and should be able to solve the problem
for you, and this tool cuold remain a binary program.

In this case it's probably not worth it, since the program is so
small, but I'd like for everyone to realize that there is a lot of
support in autotools for using HOSTCC and building _noinst programs
etc. - autotools has excellent crosscompilation support.

Auke

--===============8798379284657456940==--

