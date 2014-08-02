Content-Type: multipart/mixed; boundary="===============3336595401726782498=="
MIME-Version: 1.0
From: Sami Kerola <kerolasa at iki.fi>
Subject: Re: [Powertop] [PATCH 00/12] various build system and static analysis
 improvement
Date: Sat, 02 Aug 2014 23:29:14 +0100
Message-ID: <CAG27Bk3=X8z8MwcD0GDMnX=CpUm62hLN4DaSRNZM_hL0q2kpmw@mail.gmail.com>
In-Reply-To: 20140802135806.GB1018@swordfish
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============3336595401726782498==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 2 August 2014 14:58, Sergey Senozhatsky <sergey.senozhatsky(a)gmail.com>=
 wrote:
> On (08/02/14 12:54), Sami Kerola wrote:
>> Here is a set of various maintenance patches.  None very important, but I
>> am hopeful they are seen as usefull enought to be merged to the project.
>>
>> While working with the patch set I noticed my  Arch linux kernel 3.15.8-1
>> with powertop --auto-tune is printing
>>
>> $ ./src/powertop --auto
>> Loaded 242 prior measurements
>> RAPL device for cpu 0
>> RAPL device for cpu 0
>>   unknown op '{'
>>
>> An it seems the { is coming
>
> this is well a known warning, in short plugin support needs to be
> backported to traceevent.

Good to hear, and thank you Sergey and Magnus for first round of
review. As a result there are couple changes to few commits, biggest
being the split to the first commit. To avoid sending nearly the same
patches again to mail list I think it is better to fetch the latest
from my github branch.


The following changes since commit a5465a282107da5205b7928fe4ce4f642d1fd770:

  Bug-fix: for html & csv value for CPU Information (2014-06-18 14:23:18 -0=
700)

are available in the git repository at:

  https://github.com/kerolasa/powertop sami

for you to fetch changes up to 65b0eed332b515003dc1a38dbb51a43e563fb692:

  clean up .gitignore file (2014-08-02 22:50:26 +0100)

----------------------------------------------------------------
Sami Kerola (13):
      configure: use vertical lists
      configure: prefer AS_IF macro rather than shell if statement
      update .gitignore
      clean up Makefile.am files
      fix clang++ compilation errors
      remove unnecessary assignments
      remove unnecessary code reported by cppcheck
      move options structure to function scope
      do not use ncurses when --auto-tune is specified
      improve manual groff syntax
      fix couple typos
      wrap lines in README.traceevent
      clean up .gitignore file

-- =

Sami Kerola
http://www.iki.fi/kerolasa/

--===============3336595401726782498==--

