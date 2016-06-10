Content-Type: multipart/mixed; boundary="===============6813505137374132604=="
MIME-Version: 1.0
From: Joe Konno <joe.konno at linux.intel.com>
Subject: [Powertop] [PATCH 0/1 v1] Have git ignore editor and tool files
Date: Fri, 10 Jun 2016 08:26:59 -0700
Message-ID: <20160610152700.6825-1-joe.konno@linux.intel.com>
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============6813505137374132604==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Joe Konno <joe.konno(a)intel.com>

Simple patch to .gitignore which ignores files output by vim, cscope, and
ctags.

Did a sanity check with 'git ls-files -i --exclude-standard' after applying
this patch and no red flags raised.

Joe Konno (1):
  .gitignore: ignore vim swap, cscope, ctags

 .gitignore | 3 +++
 1 file changed, 3 insertions(+)

-- =

2.8.3


--===============6813505137374132604==--

