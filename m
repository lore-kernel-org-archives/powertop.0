Content-Type: multipart/mixed; boundary="===============3715907034994582223=="
MIME-Version: 1.0
From: Ferron, Chris E <chris.e.ferron at intel.com>
Subject: Re: [Powertop] [RFC][PATCH 2/2] Convert powertop to use new report
 generator facility
Date: Tue, 09 Oct 2012 13:25:30 -0700
Message-ID: <CAMFVxVhepL+G4mYjjAiuRwKg0c5SE9gwEbUJES=e-EUQm_uRpQ@mail.gmail.com>
In-Reply-To: 50745C1E.6060503@samsung.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============3715907034994582223==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 9, 2012 at 10:17 AM, Igor Zhbanov <i.zhbanov(a)samsung.com> wro=
te:
> Hi Chris,
>
> Please check the new version of the patch set (when it will be approved
> by mailing list moderator because of its size).
Sorry about that, I have approved.
>
>
> Chris Ferron wrote:
>>
>> Couple of things,
>>
>> #1 I noticed that the scripts section of Software Settings in need of
>> Tuning is missing. I see the nice header, but not data.
>
> Done.
>
>> #2 C0 active table cells are not aligned , and the CPU's are also not
>> aligned correctly in the Processor Idle state report section.
>
> Done. I hope. :-) I have aligned table headers as in original Powertop
> If you mean something else please tell.
>
>> #3 I get some warning compiling, I know PowerTOP is not warning less, but
>> would like to attempt to prevent adding more. (and fixing exiting ones of
>> course)
>> report/report-maker.cpp: In destructor =E2=80=98report_maker::~report_ma=
ker()=E2=80=99:
>> report/report-maker.cpp:51:10: warning: deleting object of abstract class
>> type =E2=80=98report_formatter=E2=80=99 which has non-virtual destructor=
 will cause
>> undefined behaviour [-Wdelete-non-virtual-dtor]
>> report/report-maker.cpp: In member function =E2=80=98void
>> report_maker::setup_report_formatter()=E2=80=99:
>> report/report-maker.cpp:110:10: warning: deleting object of abstract cla=
ss
>> type =E2=80=98report_formatter=E2=80=99 which has non-virtual destructor=
 will cause
>> undefined behaviour [-Wdelete-non-virtual-dtor]
>
> Done.
>
>> #4 report[c,h] should probable just go in your new sub/dir (report).
>
> I will send this patch later because it will make my patch bigger and that
> could
> make the understanding more difficult. It could be a separated patch to
> easily
> see changes.
>
>> #5 csv report has alignment issues for both the cpu Idle and Freq. Even =
if
>> they are machine readable, they need to be easily parsed using open offi=
ce
>> or MS excel and look aligned with the http report.
>
> CSV has a lots of questions. First of all, what CSV standard to follow?
> Should it be readable by parsers or by Offices?
>
> I have tried to make report maker to be CSV RFC compliant, but as I see
> Offices doesn't like that CSV. They both prefer to use semicolon as
> separator,
> and not to quote strings because of spaces inside of them, and not to quo=
te
> empty strings. The only reason to quote is when the string contains
> semicolon
> inside of it.
>
> So I have tuned CSV report maker to produce CSVs to be read by Offices.
> Both (MS and Open) can read it with default settings.
>
> The other question is formatting inside the CSV. In my opinion there shou=
ld
> not
> be any space padding for values inside the CSV. First of all, is is a
> machine-readable
> format. Second, MS Office ignores it totally.
>
> By the way, as I see, both offices uses following text alignment rules: if
> the cell
> consists of text (letters) then it will be shown aligned to the left, and=
 if
> the cell
> is a number, then it will be shown aligned to the right. This formatting
> rules
> are reasonable, so we could totally remove any padding by space in CSV (a=
nd
> still
> have pretty table in Offices).
>
> What you think?
Sounds reasonable to me.
>
> And if we need report in human readable text format, we could create TXT
> report
> formatter.
As long as CSV can be parsed nicely (FOR THE MOST PART) in (MS/Open
office) that will be fine.

I will test your latest patches and if Sergey also satisfied I will
start to merge.
-C
THANKS AGAIN, this is looking great.

>
> --
> Best regards,
> Igor Zhbanov,
> Expert Software Engineer,
> phone: +7 (495) 797 25 00 ext 3806
> e-mail: i.zhbanov(a)samsung.com
>
> ASWG, Moscow R&D center, Samsung Electronics
> 12 Dvintsev street, building 1
> 127018, Moscow, Russian Federation
>
>
> _______________________________________________
> PowerTop mailing list
> PowerTop(a)lists.01.org
> https://lists.01.org/mailman/listinfo/powertop

--===============3715907034994582223==--

