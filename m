Content-Type: multipart/mixed; boundary="===============6383314236475086750=="
MIME-Version: 1.0
From: Sergey Senozhatsky <sergey.senozhatsky at gmail.com>
Subject: Re: [Powertop] [RFC][PATCH 1/2] Adding report generator facility
Date: Mon, 08 Oct 2012 09:57:44 -0700
Message-ID: <20121008165743.GA21958@swordfish.datadirect.datadirectnet.com>
In-Reply-To: 1349283900-26721-1-git-send-email-i.zhbanov@samsung.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============6383314236475086750==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On (10/03/12 21:05), Igor Zhbanov wrote:
> ---
>  po/Makevars                          |    2 +-
>  src/Makefile.am                      |    4 +
>  src/report/report-formatter-csv.cpp  |  274 ++++++++++++++++++
>  src/report/report-formatter-csv.h    |   89 ++++++
>  src/report/report-formatter-html.cpp |  514 ++++++++++++++++++++++++++++=
++++++
>  src/report/report-formatter-html.h   |  127 +++++++++
>  src/report/report-formatter-null.cpp |  179 ++++++++++++
>  src/report/report-formatter-null.h   |   67 +++++
>  src/report/report-formatter.h        |   63 ++++
>  src/report/report-maker.cpp          |  331 ++++++++++++++++++++++
>  src/report/report-maker.h            |  209 ++++++++++++++
>  11 files changed, 1858 insertions(+), 1 deletions(-)
>  create mode 100644 src/report/report-formatter-csv.cpp
>  create mode 100644 src/report/report-formatter-csv.h
>  create mode 100644 src/report/report-formatter-html.cpp
>  create mode 100644 src/report/report-formatter-html.h
>  create mode 100644 src/report/report-formatter-null.cpp
>  create mode 100644 src/report/report-formatter-null.h
>  create mode 100644 src/report/report-formatter.h
>  create mode 100644 src/report/report-maker.cpp
>  create mode 100644 src/report/report-maker.h
> =


Hello,


- can we please avoid code duplication? for example, both html and csv
reporters contain identical implementations of

clear_result()/get_result()/add*() and friends.


- I think null formatter could be a basic class with default
implementation (null) of virtual functions, rather than separate
implementation of basic formatter interface (abstract class).


	-ss

--===============6383314236475086750==--

