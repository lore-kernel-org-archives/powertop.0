Content-Type: multipart/mixed; boundary="===============4542466648276962448=="
MIME-Version: 1.0
From: Chris Ferron <chris.e.ferron at linux.intel.com>
Subject: Re: [Powertop] Please revert the workload patch
Date: Mon, 18 Jun 2012 09:43:02 -0700
Message-ID: <4FDF5A96.9010009@linux.intel.com>
In-Reply-To: 4FDF4717.8040707@gmail.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============4542466648276962448==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Magnus,
     Sorry about that, that patch was lost in the shuffle. All patches =

have now been applied upstream, and all should now be well.
-Chris

On 06/18/2012 08:19 AM, Dirk Brandewie wrote:
> Hi Magnus,
>
> This patch should fix your problem.  I will work with Chris to get it
> pushed out.
>
> BTW could not find the commit you quoted
>
> --Dirk
>
> diff --git a/src/main.cpp b/src/main.cpp
> index 880d745..c57c984 100644
> --- a/src/main.cpp
> +++ b/src/main.cpp
> @@ -452,7 +452,7 @@ int main(int argc, char **argv)
>
>      while (!leave_powertop) {
>          show_cur_tab();
> -        one_measurement(time_out, workload);
> +        one_measurement(time_out, NULL);
>          learn_parameters(15, 0);
>      }
>  #ifndef DISABLE_NCURSES


--===============4542466648276962448==--

