Content-Type: multipart/mixed; boundary="===============2791861408871959226=="
MIME-Version: 1.0
From: SF Markus Elfring <elfring at users.sourceforge.net>
Subject: Re: [Powertop] Complete build options for Pthread API
Date: Mon, 20 Oct 2014 06:44:57 +0200
Message-ID: <54449349.2000400@users.sourceforge.net>
In-Reply-To: CAG27Bk0EgYDVvoPPoqqSP1UwmVuLpL_ax1Z4fwmLAYSdtM9ZHw@mail.gmail.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============2791861408871959226==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

> I don't know what sort of adjustments you have in mind.

I suggest a bit more fine-tuning for the explanation.


> The variables are in commit body, so I am assuming people who read code
> can see them without explicit note about them.

I would prefer a commit message that will also be useful to some degree wit=
hout
reading the affected source code.


> But if you insist improvement with the message could you write what you
> would like to see so that I can include it without confusions.

You can see from a few contributions for other software that I used a wordi=
ng
like the following:

The configuration script "AX_PTHREAD" was added to the build specification
so that corresponding special parameters will be taken into account.
http://www.gnu.org/software/autoconf-archive/ax_pthread.html



You might be still interested to stress other details for your PowerTop tes=
ters
and reviewers.



>>> +AX_PTHREAD([], [AC_MSG_ERROR([Could not configure pthreads support])])
>>
>> 2. You chose to pass an empty "ACTION-IF-FOUND". Would it make sense to
>> restructure this place a bit in the configuration script so that the
>> following statements will be directly used by the first macro parameter?
> =

> That would make powertop m4 code copy to drift from version provided by
> autotools-archive, making the upstream fixes to incompatible. I strongly
> recommend against adding additional maintenance cost to this sort of stuf=
f.

I do not really understand the intention in this feedback.


How do you think about the following statement layout at the discussed scri=
pt place?

diff --git a/configure.ac b/configure.ac
index 4991d97..0ebe69d 100644
--- a/configure.ac
+++ b/configure.ac
@@ -128,11 +128,12 @@ AS_IF([test "$has_libpci" -eq 0], [
 	])
 ])

-AC_SEARCH_LIBS([pthread_create], [pthread], [], [
-	AC_MSG_ERROR([libpthread is required but was not found])
-], [])
-AC_SEARCH_LIBS([inet_aton], [resolv], [], [
-	AC_MSG_ERROR([libresolv is required but was not found])
-], [])
-
-AC_OUTPUT
+AX_PTHREAD([LIBS=3D"$PTHREAD_LIBS $LIBS"
+CFLAGS=3D"$CFLAGS $PTHREAD_CFLAGS"
+CC=3D"$PTHREAD_CC"
+AC_SEARCH_LIBS([inet_aton],
+               [resolv],
+               [AC_OUTPUT],
+               [AC_MSG_ERROR([libresolv is required but was not found])],
+               [])],
+           [AC_MSG_ERROR([Could not configure pthreads support])])


Regards,
Markus

--===============2791861408871959226==--

