Content-Type: multipart/mixed; boundary="===============4680596451466064450=="
MIME-Version: 1.0
From: Sami Kerola <kerolasa at iki.fi>
Subject: Re: [Powertop] [PATCH 00/14] pull: various changes,
 mostly build system related
Date: Sun, 09 Nov 2014 13:03:47 +0000
Message-ID: <CAG27Bk2WdHDSv_YsyyFAZ=kRV=dp1Zt0ANtzcYfzyhVoGUmZ2Q@mail.gmail.com>
In-Reply-To: 53905.10.24.5.246.1414796869.squirrel@linux.intel.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============4680596451466064450==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 31 October 2014 23:07, Alexandra Yates
<alexandra.yates(a)linux.intel.com> wrote:

Hi Alexandra, et.al.,

> Keep in mind that for PowerTOP patches there is a turnaround cycle of
> about two weeks give and take.  This gives the maintainer and the
> community time to check your work.

ACK.

Looking the PowerTop 2.7 release planning changes in this patch set are
unlikely to be part of the release.  Please mention if you would like to
see these changes in 2.7, so that I can hurry up with possible extra
changes.

> Here is my first pass for your patches:
>
> 3, 4, 5, 6, 8, 10, 11, 12, 13, 14: At glance look good. They need testing.

0003-add-missing-space-to-version-print-out.patch
0004-csstoh.sh-check-every-single-return-value.patch
0005-configure-use-AC_USE_SYSTEM_EXTENSIONS-to-determine-.patch
0006-powertop.m4-GCC_FORTIFY_SOURCE_CC-copy-idea-of-macro.patch

0008-main-fix-incompatible-operand-type.patch

0010-make-quiet-option-to-suppress-various-info-messages.patch
0011-squeeze-all-extra-bits-from-size-of-binary-and-html-.patch
0012-add-timestamp-to-html-report.patch
0013-fix-typo-in-message.patch
0014-add-missing-include.patch

> 1: Require at least automake 1.12.2 to avoid exploitable issues with
> earlier versions.

0001-configure-require-the-least-automake-version-1.11.1.patch

Thank you for mentioning the CVE fix.  I'll make autoconf to require that
version.

Notice that the request to split m4 directories

https://lists.01.org/pipermail/powertop/2014-October/001639.html

will makes dependency to AC_CONFIG_MACRO_DIR that is supported in
automake 1.13 and added to autoconf that is not yet released.

http://git.savannah.gnu.org/cgit/automake.git/tree/NEWS#n640
http://git.savannah.gnu.org/cgit/autoconf.git/tree/NEWS#n40

Are you absolutely sure splitting generated and projects own m4 data to
different directories is worth of requiring very latest & upstream
versions?

> 9: Looks good. However, what is the object of moving
> measurment_interval(def_sampling_interval) to be after first_cpu(cpu)?

0009-move-variables-to-protected-scope.patch

The function is moved because of an ordering issue reported by clang++.

make[3]: Entering directory '/home/src/powertop/src'
  CXX      cpu/rapl/powertop-rapl_interface.o
cpu/rapl/rapl_interface.cpp:78:2: warning: field 'measurment_interval'
will be initialized after field 'first_cpu' [-Wreorder]
        measurment_interval(def_sampling_interval),

I added that to v2 commit message.

> 2: Please explain what is the difference from what we have to what you
> propose?

Markus Elfring proposed the change, I simply implemented the proposal.
Here is his justification.

https://lists.01.org/pipermail/powertop/2014-October/001643.html

I will keep the change as part of patch set until it is merged or clearly
rejected.

> 7: This one makes no sense as-is. Please update the commit message
> explaining why the patch is necessary. As far as I can tell from the
> PowerTOP source code, it doesn't use C++11, so I don't understand why it
> would be necessary to fail.

I see, the message could have been a bit more verbose.  Let me rephrase,
and keep the change part of submission at least for now.

-- snip

Executive summary: The resubmitted v2 patch set is unlikely final
version.  I am guessing v3 will end up dropping all m4 related changes:
0002, 0006, and 0007.

-- =

Sami Kerola
http://www.iki.fi/kerolasa/

--===============4680596451466064450==--

