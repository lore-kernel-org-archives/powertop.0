Content-Type: multipart/mixed; boundary="===============9141130727199635323=="
MIME-Version: 1.0
From: Sanjay Singh Rawat <sanjay.rawat at linaro.org>
Subject: Re: [Powertop] [PATCH] devfreq: add devfreq devices stats support
Date: Fri, 10 Oct 2014 15:12:36 +0530
Message-ID: <5437AA0C.5000506@linaro.org>
In-Reply-To: 20141001151216.GB946@swordfish
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============9141130727199635323==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

thanks for the review Sergey

On Wednesday 01 October 2014 08:42 PM, Sergey Senozhatsky wrote:
> On (09/30/14 12:04), Sanjay Singh Rawat wrote:
>> add window to show frequency stats for devfreq devices
>>
>> Signed-off-by: Rajagopal Venkat <rajagopal.venkat(a)gmail.com>
>> Signed-off-by: Sanjay Singh Rawat <sanjay.rawat(a)linaro.org>
>> ---
>>
>> v2 - Show devfreq window on support basis. Check for empty devfreq
>>       directory.
>>     - Free the open dirp while exiting.
>> ---
>>   src/Makefile.am           |   1 +
>>   src/devices/devfreq.cpp   | 367 ++++++++++++++++++++++++++++++++++++++=
++++++++
>>   src/devices/devfreq.h     |  75 ++++++++++
>>   src/main.cpp              |   9 ++
[...]
>> +	file.close();
>> +}
>> +
>> +void devfreq::start_measurement(void)
>> +{
>> +	unsigned int i;
>> +	ifstream file;
> not needed.

ack
>
[...]
>> +		is_enabled =3D false;
>> +		closedir(dir);
>> +		return;
>> +	}
> who close the dir if `num !=3D 2'?

the dir is closed in the clear_all_devfreq() function while exiting
>
>> +	callback fn =3D &devfreq_dev_callback;
>> +	process_directory(p.c_str(), fn);
>> +}
>> +
>> +void initialize_devfreq(void)
[...]
>> +
>> +void clear_all_devfreq()
>> +{
>> +	unsigned int i, j;
>> +
>> +	for (i=3D0; i < all_devfreq.size(); i++) {
>> +		class devfreq *df =3D all_devfreq[i];
>> +
>> +		for(j=3D0; j < df->dstates.size(); j++)
>> +			delete df->dstates[j];
>> +
>> +		df->dstates.resize(0);
> resize not needed, I think

ack
>
>> +		delete df;
>> +	}
>> +	all_devfreq.clear();
>> +	/* close /sys/class/devfreq */
[...]
>> +
>> +class devfreq: public device {
>> +	char dir_name[4096];
> hm. so this is 2 pages for each class instance.
> can you

will resize to 128 bytes
> 	const char *dir_name;
> 	=

> and then
> 	dir_name =3D strdup(dname); ?
>
>

-- =

sanjay


--===============9141130727199635323==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PGh0bWw+CiAgPGhlYWQ+CiAgICA8bWV0YSBjb250ZW50PSJ0ZXh0L2h0bWw7IGNoYXJzZXQ9SVNP
LTg4NTktMSIKICAgICAgaHR0cC1lcXVpdj0iQ29udGVudC1UeXBlIj4KICA8L2hlYWQ+CiAgPGJv
ZHkgYmdjb2xvcj0iI0ZGRkZGRiIgdGV4dD0iIzAwMDAwMCI+CiAgICA8Zm9udCBzaXplPSItMSI+
dGhhbmtzIGZvciB0aGUgcmV2aWV3IFNlcmdleTxicj4KICAgICAgPGJyPgogICAgPC9mb250Pgog
ICAgPGRpdiBjbGFzcz0ibW96LWNpdGUtcHJlZml4Ij5PbiBXZWRuZXNkYXkgMDEgT2N0b2JlciAy
MDE0IDA4OjQyIFBNLAogICAgICBTZXJnZXkgU2Vub3poYXRza3kgd3JvdGU6PGJyPgogICAgPC9k
aXY+CiAgICA8YmxvY2txdW90ZSBjaXRlPSJtaWQ6MjAxNDEwMDExNTEyMTYuR0I5NDZAc3dvcmRm
aXNoIiB0eXBlPSJjaXRlIj4KICAgICAgPHByZSB3cmFwPSIiPk9uICgwOS8zMC8xNCAxMjowNCks
IFNhbmpheSBTaW5naCBSYXdhdCB3cm90ZToKPC9wcmU+CiAgICAgIDxibG9ja3F1b3RlIHR5cGU9
ImNpdGUiPgogICAgICAgIDxwcmUgd3JhcD0iIj5hZGQgd2luZG93IHRvIHNob3cgZnJlcXVlbmN5
IHN0YXRzIGZvciBkZXZmcmVxIGRldmljZXMKClNpZ25lZC1vZmYtYnk6IFJhamFnb3BhbCBWZW5r
YXQgPGEgY2xhc3M9Im1vei10eHQtbGluay1yZmMyMzk2RSIgaHJlZj0ibWFpbHRvOnJhamFnb3Bh
bC52ZW5rYXRAZ21haWwuY29tIj4mbHQ7cmFqYWdvcGFsLnZlbmthdEBnbWFpbC5jb20mZ3Q7PC9h
PgpTaWduZWQtb2ZmLWJ5OiBTYW5qYXkgU2luZ2ggUmF3YXQgPGEgY2xhc3M9Im1vei10eHQtbGlu
ay1yZmMyMzk2RSIgaHJlZj0ibWFpbHRvOnNhbmpheS5yYXdhdEBsaW5hcm8ub3JnIj4mbHQ7c2Fu
amF5LnJhd2F0QGxpbmFyby5vcmcmZ3Q7PC9hPgotLS0KCnYyIC0gU2hvdyBkZXZmcmVxIHdpbmRv
dyBvbiBzdXBwb3J0IGJhc2lzLiBDaGVjayBmb3IgZW1wdHkgZGV2ZnJlcQogICAgIGRpcmVjdG9y
eS4KICAgLSBGcmVlIHRoZSBvcGVuIGRpcnAgd2hpbGUgZXhpdGluZy4KLS0tCiBzcmMvTWFrZWZp
bGUuYW0gICAgICAgICAgIHwgICAxICsKIHNyYy9kZXZpY2VzL2RldmZyZXEuY3BwICAgfCAzNjcg
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwogc3JjL2Rldmlj
ZXMvZGV2ZnJlcS5oICAgICB8ICA3NSArKysrKysrKysrCiBzcmMvbWFpbi5jcHAgICAgICAgICAg
ICAgIHwgICA5ICsrPC9wcmU+CiAgICAgIDwvYmxvY2txdW90ZT4KICAgIDwvYmxvY2txdW90ZT4K
ICAgIFsuLi5dPGJyPgogICAgPGJsb2NrcXVvdGUgY2l0ZT0ibWlkOjIwMTQxMDAxMTUxMjE2LkdC
OTQ2QHN3b3JkZmlzaCIgdHlwZT0iY2l0ZSI+CiAgICAgIDxibG9ja3F1b3RlIHR5cGU9ImNpdGUi
PgogICAgICAgIDxwcmUgd3JhcD0iIj4KKwlmaWxlLmNsb3NlKCk7Cit9CisKK3ZvaWQgZGV2ZnJl
cTo6c3RhcnRfbWVhc3VyZW1lbnQodm9pZCkKK3sKKwl1bnNpZ25lZCBpbnQgaTsKKwlpZnN0cmVh
bSBmaWxlOwo8L3ByZT4KICAgICAgPC9ibG9ja3F1b3RlPgogICAgICA8cHJlIHdyYXA9IiI+Cm5v
dCBuZWVkZWQuPC9wcmU+CiAgICA8L2Jsb2NrcXVvdGU+CiAgICA8YnI+CiAgICBhY2s8YnI+CiAg
ICA8YmxvY2txdW90ZSBjaXRlPSJtaWQ6MjAxNDEwMDExNTEyMTYuR0I5NDZAc3dvcmRmaXNoIiB0
eXBlPSJjaXRlIj4KICAgICAgPHByZSB3cmFwPSIiPgoKPC9wcmU+CiAgICA8L2Jsb2NrcXVvdGU+
CiAgICBbLi4uXTxicj4KICAgIDxibG9ja3F1b3RlIGNpdGU9Im1pZDoyMDE0MTAwMTE1MTIxNi5H
Qjk0NkBzd29yZGZpc2giIHR5cGU9ImNpdGUiPgogICAgICA8YmxvY2txdW90ZSB0eXBlPSJjaXRl
Ij4KICAgICAgICA8cHJlIHdyYXA9IiI+CisJCWlzX2VuYWJsZWQgPSBmYWxzZTsKKwkJY2xvc2Vk
aXIoZGlyKTsKKwkJcmV0dXJuOworCX0KPC9wcmU+CiAgICAgIDwvYmxvY2txdW90ZT4KICAgICAg
PHByZSB3cmFwPSIiPgp3aG8gY2xvc2UgdGhlIGRpciBpZiBgbnVtICE9IDInPzwvcHJlPgogICAg
PC9ibG9ja3F1b3RlPgogICAgPGJyPgogICAgdGhlIGRpciBpcyBjbG9zZWQgaW4gdGhlIGNsZWFy
X2FsbF9kZXZmcmVxKCkgZnVuY3Rpb24gd2hpbGUgZXhpdGluZzxicj4KICAgIDxibG9ja3F1b3Rl
IGNpdGU9Im1pZDoyMDE0MTAwMTE1MTIxNi5HQjk0NkBzd29yZGZpc2giIHR5cGU9ImNpdGUiPgog
ICAgICA8cHJlIHdyYXA9IiI+Cgo8L3ByZT4KICAgICAgPGJsb2NrcXVvdGUgdHlwZT0iY2l0ZSI+
CiAgICAgICAgPHByZSB3cmFwPSIiPisJY2FsbGJhY2sgZm4gPSAmYW1wO2RldmZyZXFfZGV2X2Nh
bGxiYWNrOworCXByb2Nlc3NfZGlyZWN0b3J5KHAuY19zdHIoKSwgZm4pOworfQorCit2b2lkIGlu
aXRpYWxpemVfZGV2ZnJlcSh2b2lkKTwvcHJlPgogICAgICA8L2Jsb2NrcXVvdGU+CiAgICA8L2Js
b2NrcXVvdGU+CiAgICBbLi4uXTxicj4KICAgIDxibG9ja3F1b3RlIGNpdGU9Im1pZDoyMDE0MTAw
MTE1MTIxNi5HQjk0NkBzd29yZGZpc2giIHR5cGU9ImNpdGUiPgogICAgICA8YmxvY2txdW90ZSB0
eXBlPSJjaXRlIj4KICAgICAgICA8cHJlIHdyYXA9IiI+CisKK3ZvaWQgY2xlYXJfYWxsX2RldmZy
ZXEoKQoreworCXVuc2lnbmVkIGludCBpLCBqOworCisJZm9yIChpPTA7IGkgJmx0OyBhbGxfZGV2
ZnJlcS5zaXplKCk7IGkrKykgeworCQljbGFzcyBkZXZmcmVxICpkZiA9IGFsbF9kZXZmcmVxW2ld
OworCisJCWZvcihqPTA7IGogJmx0OyBkZi0mZ3Q7ZHN0YXRlcy5zaXplKCk7IGorKykKKwkJCWRl
bGV0ZSBkZi0mZ3Q7ZHN0YXRlc1tqXTsKKworCQlkZi0mZ3Q7ZHN0YXRlcy5yZXNpemUoMCk7Cjwv
cHJlPgogICAgICA8L2Jsb2NrcXVvdGU+CiAgICAgIDxwcmUgd3JhcD0iIj5yZXNpemUgbm90IG5l
ZWRlZCwgSSB0aGluazwvcHJlPgogICAgPC9ibG9ja3F1b3RlPgogICAgPGJyPgogICAgYWNrPGJy
PgogICAgPGJsb2NrcXVvdGUgY2l0ZT0ibWlkOjIwMTQxMDAxMTUxMjE2LkdCOTQ2QHN3b3JkZmlz
aCIgdHlwZT0iY2l0ZSI+CiAgICAgIDxwcmUgd3JhcD0iIj4KCjwvcHJlPgogICAgICA8YmxvY2tx
dW90ZSB0eXBlPSJjaXRlIj4KICAgICAgICA8cHJlIHdyYXA9IiI+KwkJZGVsZXRlIGRmOworCX0K
KwlhbGxfZGV2ZnJlcS5jbGVhcigpOworCS8qIGNsb3NlIC9zeXMvY2xhc3MvZGV2ZnJlcSAqLzwv
cHJlPgogICAgICA8L2Jsb2NrcXVvdGU+CiAgICA8L2Jsb2NrcXVvdGU+CiAgICBbLi4uXTxicj4K
ICAgIDxibG9ja3F1b3RlIGNpdGU9Im1pZDoyMDE0MTAwMTE1MTIxNi5HQjk0NkBzd29yZGZpc2gi
IHR5cGU9ImNpdGUiPgogICAgICA8YmxvY2txdW90ZSB0eXBlPSJjaXRlIj4KICAgICAgICA8cHJl
IHdyYXA9IiI+CisKK2NsYXNzIGRldmZyZXE6IHB1YmxpYyBkZXZpY2UgeworCWNoYXIgZGlyX25h
bWVbNDA5Nl07CjwvcHJlPgogICAgICA8L2Jsb2NrcXVvdGU+CiAgICAgIDxwcmUgd3JhcD0iIj4K
aG0uIHNvIHRoaXMgaXMgMiBwYWdlcyBmb3IgZWFjaCBjbGFzcyBpbnN0YW5jZS4KY2FuIHlvdTwv
cHJlPgogICAgPC9ibG9ja3F1b3RlPgogICAgPGJyPgogICAgd2lsbCByZXNpemUgdG8gMTI4IGJ5
dGVzPGJyPgogICAgPGJsb2NrcXVvdGUgY2l0ZT0ibWlkOjIwMTQxMDAxMTUxMjE2LkdCOTQ2QHN3
b3JkZmlzaCIgdHlwZT0iY2l0ZSI+CiAgICAgIDxwcmUgd3JhcD0iIj4KCWNvbnN0IGNoYXIgKmRp
cl9uYW1lOwoJCmFuZCB0aGVuCglkaXJfbmFtZSA9IHN0cmR1cChkbmFtZSk7ID8KCjwvcHJlPgog
ICAgICA8YnI+CiAgICA8L2Jsb2NrcXVvdGU+CiAgICA8YnI+CiAgICA8cHJlIGNsYXNzPSJtb3ot
c2lnbmF0dXJlIiBjb2xzPSI3MiI+LS0gCnNhbmpheTwvcHJlPgogIDwvYm9keT4KPC9odG1sPgo=

--===============9141130727199635323==--

