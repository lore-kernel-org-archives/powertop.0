Content-Type: multipart/mixed; boundary="===============1260641494336758947=="
MIME-Version: 1.0
From: =?utf-8?q?N=C3=A9meth_M=C3=A1rton_=3Cnm127_at_freemail=2Ehu=3E?=
Subject: Re: [Powertop] PowerTOP: _("Cannot load from file")
Date: Wed, 06 Jun 2012 07:38:07 +0200
Message-ID: <4FCEECBF.4020300@freemail.hu>
In-Reply-To: 4FC920C7.5070609@linux.intel.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============1260641494336758947==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Chris Ferron wrote:
> On 06/01/2012 12:23 AM, N=C3=A9meth M=C3=A1rton wrote:
>> Hi Chris,
>> Chris Ferron wrote:
>>> On 05/30/2012 09:53 PM, N=C3=A9meth M=C3=A1rton wrote:
>>>> Hi Chris,
>>>>
>>>> I have seen in commit 0e9374d27bfa51b885ee3fe69fbb3b12bdae3600 that
>>>> the last space of the "Cannot load from file " was removed. This resul=
ts
>>>> even in English the following output:
>>>>
>>>> Cannot load from file/var/cache/powertop/saved_parameters.powertop
>>>>
>>>> One solution would be something like this:
>>>>
>>>>     cout<<   _("Cannot load from file")<<   ""<<   pathname<<   "\n";
>>> Good input thank you. I am still learning about the difficulty's in
>>> translation on internationalization.
>>> I will make some adjustments from your input.
>> See the attached patch what I really ment.
>>
>> Otherwise it could be also better as I described:
> ah ok.
> So you would rather see translatable strings that look like this?
> =

> "PCI Device %s has no runtime power management"
> =

> or in this case
> =

> "Cannot load from file %s"
> ?

Yes, I think it is better translatable.


>>>> However, in Hungarian this sentence is difficult to translate because =
of
>>>> the word order. For example the natural translation of the following
>>>> English sentence would be:
>>>>
>>>>     English: Cannot load from file foo.bar
>>>>     Hungarian: Nem lehetett a foo.bar f=C3=A1jlb=C3=B3l bet=C3=B6lteni
>>>>
>>>> As you can see in this case it would be better to use the %s format st=
ring
>>>> for printing pathname because this gives better flexibility for the tr=
anslator
>>>> to place the pathname string in natural place in a translated sentence.
>>>>
>>>> Regards,
>>>>
>>>> 	M=C3=A1rton N=C3=A9meth
>> From: M=C3=A1rton N=C3=A9meth<nm127(a)freemail.hu>
>>
>> Fix space between localized string and pathname.
>>
>> Signed-off-by: M=C3=A1rton N=C3=A9meth<nm127(a)freemail.hu>
>> ---
>> diff --git a/src/parameters/persistent.cpp b/src/parameters/persistent.c=
pp
>> index 47b8824..553cccb 100644
>> --- a/src/parameters/persistent.cpp
>> +++ b/src/parameters/persistent.cpp
>> @@ -43,7 +43,7 @@ void save_all_results(const char *filename)
>>
>>   	file.open(pathname, ios::out);
>>   	if (!file) {
>> -		cout<<  _("Cannot save to file ")<<  pathname<<  "\n";
>> +		cout<<  _("Cannot save to file")<<  " "<<  pathname<<  "\n";
>>   		return;
>>   	}
>>   	for (i =3D 0; i<  past_results.size(); i++) {
>> @@ -75,7 +75,7 @@ void load_results(const char *filename)
>>
>>   	file.open(pathname, ios::in);
>>   	if (!file) {
>> -		cout<<  _("Cannot load from file ")<<  pathname<<  "\n";
>> +		cout<<  _("Cannot load from file")<<  " "<<  pathname<<  "\n";
>>   		return;
>>   	}
>>
>> @@ -137,7 +137,7 @@ void save_parameters(const char *filename)
>>
>>   	file.open(pathname, ios::out);
>>   	if (!file) {
>> -		cout<<  _("Cannot save to file ")<<  ""<<  pathname<<  "\n";
>> +		cout<<  _("Cannot save to file")<<  " "<<  pathname<<  "\n";
>>   		return;
>>   	}
>>
>> @@ -162,7 +162,7 @@ void load_parameters(const char *filename)
>>
>>   	file.open(pathname, ios::in);
>>   	if (!file) {
>> -		cout<<  _("Cannot load from file ")<<  ""<<  pathname<<  "\n";
>> +		cout<<  _("Cannot load from file")<<  " "<<  pathname<<  "\n";
>>   		return;
>>   	}
>>
> =

> =

> =



--===============1260641494336758947==--

