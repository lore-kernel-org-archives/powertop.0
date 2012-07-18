Content-Type: multipart/mixed; boundary="===============5498031966923122275=="
MIME-Version: 1.0
From: Arjan van de Ven <arjan at linux.intel.com>
Subject: Re: [Powertop] [PATCH] Make ncurses dependency optional
Date: Wed, 18 Jul 2012 08:32:15 -0700
Message-ID: <5006D6FF.7090804@linux.intel.com>
In-Reply-To: 1342623267-30567-1-git-send-email-i.zhbanov@samsung.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============5498031966923122275==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 7/18/2012 7:54 AM, Igor Zhbanov wrote:
> Make ncurses dependency optional. Provide --without-ncurses option
> to configure.

I'm sorry but this patch is disgusting;
PowerTOP uses ncurses. Really.

crapping ifdefs all over the codebase to pretend it does not, we're just
really not going to do that this way.



--===============5498031966923122275==--

