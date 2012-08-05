Content-Type: multipart/mixed; boundary="===============6484175778614639409=="
MIME-Version: 1.0
From: Arjan van de Ven <arjan at linux.intel.com>
Subject: Re: [Powertop] [PATCH 4/4] Add support for Intel GPU statistics
Date: Sun, 05 Aug 2012 10:37:51 -0700
Message-ID: <501EAF6F.3020106@linux.intel.com>
In-Reply-To: 20120805173244.GA3199@swordfish
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============6484175778614639409==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

>>
>> +	file.open("/sys/class/drm/card0/power/rc6_residency_ms",  ios::in);
>> +
>> +	if (file) {
>> +		handle_i965_gpu();
>> +		file.close();
>> +	}
>> +
> =

> side note: just wonder how much C++ stream with its heavy buffering, etc.=
 is slower
> than stat(). I'll review and if it makes sense will probably prepare simp=
le stat()
> wrapper to lib.cpp

better to use access() than stat.

both have the fun of getting a bunch of low level system headers into C++
I'm sure that'll work most of the time, but for something as non-time criti=
cal as this
I wonder how badly that is inviting trouble.




>> +	=

>> +	if (line_nr =3D=3D 0)
>> +		d =3D 100.0 - ratio * (rc6_after + rc6p_after + rc6pp_after - rc6_bef=
ore - rc6p_before - rc6pp_before);
>> +	if (line_nr =3D=3D 1)
>> +		d =3D ratio * (rc6_after - rc6_before);
>> +	if (line_nr =3D=3D 2)
>> +		d =3D ratio * (rc6p_after - rc6p_before);
>> +	if (line_nr =3D=3D 3)
>> +		d =3D ratio * (rc6pp_after - rc6pp_before);
>> +	if (line_nr >=3D 4 || line_nr < 0)
>> +		return buffer;
>> +
> =

> small side note /* someone will do it anyway :-) */:
> how about
> =

> 	if (line_nr =3D=3D 0)
> 		d =3D 100.0 - ratio * (rc6_after + rc6p_after + rc6pp_after - rc6_befor=
e - rc6p_before - rc6pp_before);
> 	else if (line_nr =3D=3D 1)
> 		d =3D ratio * (rc6_after - rc6_before);
> 	else if (line_nr =3D=3D 2)
> 		d =3D ratio * (rc6p_after - rc6p_before);
> 	else if (line_nr =3D=3D 3)
> 		d =3D ratio * (rc6pp_after - rc6pp_before);
> 	else if (line_nr >=3D 4 || line_nr < 0)
> 		return buffer;

well last time I looked at the disassembly for such a case, this generated =
worse code.
I'll admit that that was about 2 gcc versions ago though.


--===============6484175778614639409==--

