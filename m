Content-Type: multipart/mixed; boundary="===============5400175385580155232=="
MIME-Version: 1.0
From: Arjan van de Ven <arjan at linux.intel.com>
Subject: Re: [Powertop] How does powertop deal with multiple executions
Date: Tue, 29 Oct 2013 08:31:21 -0700
Message-ID: <526FD4C9.2020000@linux.intel.com>
In-Reply-To: CAA3v608roAC6tWo6DQ+NU6fyvptFw_weCw=PWhsykeqrfVYo1w@mail.gmail.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============5400175385580155232==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 10/29/2013 12:23 AM, Jes=C3=BAs D wrote:
> Thank you, Arjan.
>
> But my question is how does powertop group programs with the same name.
>
> Unless I'm doing something wrong, I doubt that it is just adding the powe=
r consumption of all the independent executions. I say this because powerto=
p estimates a
> consumption of 335 mW for 500 executions, and a consumption of 364 mW for=
 5000. I am configuring the monitorization time with the --time parameter (=
with a value long enough
> to cover all the 500 or 5000 executions).
>
> Is it calculating an average then?
>


remember Watts are a "Joules per second" measure!


--===============5400175385580155232==--

