Content-Type: multipart/mixed; boundary="===============0323947651089626882=="
MIME-Version: 1.0
From: Joe Konno <joe.konno at linux.intel.com>
Subject: Re: [Powertop] close_display() sigsegv
Date: Tue, 18 Nov 2014 17:43:10 -0800
Message-ID: <546BF5AE.3020705@linux.intel.com>
In-Reply-To: CAG27Bk39ET-Ccz0ahfufUwHgxQiWKj=MCioVx+3ztomLtwXxng@mail.gmail.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============0323947651089626882==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

The game of whack-a-mole continues. Good find, Sami.

Alex, suggest we revert the errant patch. Memory management as a whole
within the tool deserves (much) more time and focus than a few
band-aids, so I wouldn't be opposed to reverting the entire series (of 5).

On 11/18/2014 02:29 PM, Sami Kerola wrote:
> Hello,
> =

> It might be good idea to check before final release if the issue
> reported in this email can be reproduced.
> =

> $ echo $CC
> clang
> $ echo $CFLAGS
> -O0 -g -ggdb -Wall -Wextra -pedantic -fno-omit-frame-pointer
> $ echo $LD
> ld.gold
> =

> After compiling the version above I always get crash.
> =

> $ git describe
> v2.7-rc1-1-g959227c
> =

> $ ./src/powertop
> ....
> Leaving PowerTOPtimates do 21 measurement(s) connected to battery only
> Segmentation fault (core dumped)
> =

> It looks like commit 706bc28ff536f4f53fdf6e24178b9e3bac67d53f might
> have something to do with the issue.


--===============0323947651089626882==
Content-Type: application/pgp-signature
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="signature.asc"

LS0tLS1CRUdJTiBQR1AgU0lHTkFUVVJFLS0tLS0KVmVyc2lvbjogR251UEcgdjEKCmlRSWNCQUVC
QWdBR0JRSlVhL1cyQUFvSkVJMklSOVV2U3FwbWJMNFFBTFVKVXpVbHQ3R3pVNkk2T2dBUFFXZ04K
MHF6RHhPRHpGSitEL0lpbWc3RS9vS0pseitNMFFoN3lsNy9oT2QvaWdWQVp0YzVxSityL3hOZEgw
RDk5dFRFQwo0MUpsMS9oYitoVE1UYlBJTHl2cUZFS0xGU1hCbTZTaHhsZy9jWDBvdTBHNnQ1SGE5
NERkalZOTERmOVFLOTdJCnV4Rm5TQjQvL2hxRGNnOXBVSEpqSGpqbU8zUS9YSWQzSXd3ajJVdGZ5
eUZQc3FQaUNlOGN4NnZES3pmY3NLenAKT1hvTjU3MTJWUnZtRFNSa0VXbjBKQWJFazEyQS8vQVFS
aW5nSGxNTkN3cHk4LzZkWU4zc3Q1M3FIK2JtNktJTAo0dm56Wko4QjJPaFp5WFZBUUdtQndZUHZr
ZlU2NENQR2lWNjM0VFVWMENzRVlHWEh3ZitBbndoTkR2dEFSQU85CjBSWWo5Y1FsVkNsZFpQdmR2
d0JZV3ZZQ2lsSkhUT2w0cHNkTzBQM2RXeW1kYnE0aVgzaCtDcmQ0MmZQRVY2bC8KcDRzam5DU2Nz
NC9USUR5a2dUbEhkMnlqUlVOOGdYNlNrcTRTRi9ZNjMvNnVGUGN2N3EyRWdkRFgybTdVNUJWdwpQ
ZGRwQmxrbWZ0dmtSWldhWmZ4L0FHeExJM0g0ZkRzc1pHQWtsOExJdW5xVlg3bFlmUnlBQndvVCtN
T3lybjNlClM5UmVhSjR0djVoVFJOc294REZkd0QwaWpUaVdQN29lWWI4bUJuc2tML3h5UEZMUnhu
VFJIMEFPYkFIV1BpVGMKa2drcnJrWlVJOFhRcHIwYzlXRlNmMVkwMlYxdEtDcDJhMVgxaFZCTjYw
OXBRS2FHb2FxWDYralpvV3ZQdGxhNwp0a09TY2lYeEZLdllrZ0Fwc0Q5dAo9dk9vRAotLS0tLUVO
RCBQR1AgU0lHTkFUVVJFLS0tLS0K

--===============0323947651089626882==--

