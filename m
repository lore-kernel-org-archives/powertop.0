Content-Type: multipart/mixed; boundary="===============3847913792065611248=="
MIME-Version: 1.0
From: Alexandra Yates <alexandra.yates at linux.intel.com>
Subject: Re: [Powertop] segmentation fault when shutting
Date: Mon, 12 May 2014 16:22:37 -0700
Message-ID: <58306.10.24.2.65.1399936957.squirrel@linux.intel.com>
In-Reply-To: 20140509100640.GE937@swordfish
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============3847913792065611248==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

> On (05/09/14 00:22), Martin Ziegler wrote:
>> The bisection resulted in
>>
>> commit 5f5976f8b42e4e4717f2d573cf43cb87ccd88fa2
>> Author: Dan Kalowsky <daniel.kalowsky(a)intel.com>
>> Date:   Tue Apr 29 15:55:31 2014 -0700
>>
>>     Adding a clean_shutdown function
>>
>>     Function is designed to be a on stop place to clean up
>>     the entire application at shutdown time.
>>
>> as the first bad commit.
>>
>
> thanks, Martin.
>
> yes... well
>
> a) clean_shutdown() calls close_display() which iterates
> tab_windows[tab_names[i]]
> and deletes every tab_window. the problem is that prior to
> close_display() main executes clear_tuning(), which [surprise surprise]
> does `delete tune_window' since commit
> eb08d4480969c8e48347c7621bd96dc248ee2138
> ("Remove another memory leak") , whilst tab_windows[tab_names[i]] still
> holds
> a pointer which we just secretly free()-d. so this is double free().
> and it has no other option (and will never have) than to crash.
>
> this obviously has not been tested before push.
>
>
> b) there is no point in free()-ing memory which will be free()-d anyway,
> because we exit() the program.
>
> 	-ss
>

Martin, thank you for reporting and bisecting the culprit.

Sergey, thank you for poking the issues.

Dan, please fix the patches and resend them.  They will be included after
release 2.6 is completed.

I reverted Dan Kalowsky's patches.

Thank you,
Alexandra.

--===============3847913792065611248==--

