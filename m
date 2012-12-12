Content-Type: multipart/mixed; boundary="===============4353882697836588510=="
MIME-Version: 1.0
From: Arjan van de Ven <arjan at linux.intel.com>
Subject: Re: [Powertop] [PATCH] cpufreq: only try to open files under cpuX
Date: Wed, 12 Dec 2012 10:21:43 -0800
Message-ID: <50C8CB37.3040406@linux.intel.com>
In-Reply-To: 1308422363.328395.1355335523877.JavaMail.root@redhat.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============4353882697836588510==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 12/12/2012 10:05 AM, Jaroslav Skarvada wrote:
> -
>> Hello,
>> thanks for your patch. however, I'm afraid it does not fix all the
>> cases. looking at src/tuning/cpufreq.cpp we
>> have several more places with exactly the same cpuX detection --
>> ::toggle*().
>>
> NP, I will try to fix them all, I will post new version of the patch soon.
>
>> could you also please remove 'strlen(dirent->d_name) < 4', looks loke
>> a small overhead there.
>>
> Right :)

it makes sense to clean this up indeed

now, I'm still wanting to rewrite the whole frequency side... it's not grea=
t code right now,
and makes assumptions that aren't going to be true going forward.
but until that's done.. by all means lets do improvements like this to the =
existing code.



--===============4353882697836588510==--

