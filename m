Content-Type: multipart/mixed; boundary="===============7853075441449772926=="
MIME-Version: 1.0
From: Alexandra Yates <alexandra.yates at linux.intel.com>
Subject: Re: [Powertop] [PATCH 07/12] move options structure to function scope
Date: Mon, 04 Aug 2014 16:41:18 -0700
Message-ID: <61169.10.24.6.146.1407195678.squirrel@linux.intel.com>
In-Reply-To: 20140803114643.GA1150@swordfish
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============7853075441449772926==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


> On (08/03/14 10:34), Sami Kerola wrote:
>> On 3 August 2014 04:52, Sergey Senozhatsky
>> <sergey.senozhatsky(a)gmail.com> wrote:
>> > On (08/02/14 23:20), Sami Kerola wrote:
>> >> On 2 August 2014 14:47, Sergey Senozhatsky
>> <sergey.senozhatsky(a)gmail.com> wrote:
>> >> >> Subject: [Powertop] [PATCH 07/12] move options structure to
>> function scope
>> >> >
>> >> > what for?
>> >>
>> >> They've told me keeping variables in as narrow scope as possible is a
>> >> virtue. Even if it would not be I don't see any harm of moving
>> >> everything out of global scope when ever possible.
>> >>
>> >> https://www.securecoding.cert.org/confluence/display/cplusplus/DCL07-=
CPP.+Minimize+the+scope+of+variables+and+methods
>> >
>> > this is different. let's keep it as is.
>>
>> Hi Sergey,
>>
>> That's alright the scope move is reverted. When I did that I started
>> to look the option structure, and later switch case segment. I started
>> to wonder why '-a' is marked as an option in structure but it is
>> missing from short options in optstring. That lead me to write two
>> small clean ups.
>>
>> https://github.com/kerolasa/powertop/commit/09a3bb68d1f92c30675679b64d63=
cddeafbfbce7
>> https://github.com/kerolasa/powertop/commit/8d81534bf55486b5230e18b21752=
4a07694c5e9e
>>
>> Reminder. As mentioned yesterday, the patch series in maillist is
>> broken. Up to date versions of these changes are in my github branch,
>> which makes this a pull request.
>>
>>   https://github.com/kerolasa/powertop sami
>>
>
> Hi,
>
> powertop does not pull from outside repos. please resend
> your patch series to the list. thanks for your contribution.
>
> 	-ss
> _______________________________________________
> PowerTop mailing list
> PowerTop(a)lists.01.org
> https://lists.01.org/mailman/listinfo/powertop
>

Hello All,

Welcome Sami to PowerTOP, and thank you very much for submitting your
patches, and everyone else for reviewing them.

Sami, I would appreciate you make the changes people requested on the
list, and be prepared for further rounds of reviews/changes of your
patches.  This is the current process PowerTOP developers do code reviews.

Here are few other things to consider before sending your patches for
PowerTOP:

As I mentioned on a previous thread PowerTOp uses the linux kernel coding
style, please change all your code to follow this guidelines.
https://www.kernel.org/doc/Documentation/CodingStyle.

Before creating a set of patches please check the code using =

https://github.com/torvalds/linux/blob/master/scripts/checkpatch.pl

Lastly, when creating your new set of patches use the flag
--subject-prefix=3D"PATCH Vx" x being the revision version.  That will make
things easy on the mailing list.

After your code gets an ok from the community I will go ahead and add it
to mainline.

Thank you very much again for sending all your changes,
Alexandra.


--===============7853075441449772926==--

