Content-Type: multipart/mixed; boundary="===============2065106236441294435=="
MIME-Version: 1.0
From: =?utf-8?q?Jan-Simon_M=C3=B6ller_=3Cdl9pf_at_gmx=2Ede=3E?=
Subject: Re: [Powertop] [bugreport] crash on powertop --debug --html=file.html
Date: Sun, 01 Jul 2012 22:07:40 +0200
Message-ID: <b127e9b0-82ab-46df-b76e-9347e7543867@email.android.com>
In-Reply-To: 20120701181351.GD4770@swordfish
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============2065106236441294435==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

no change.
-- =

Sent from my Android phone with K-9 Mail. Please excuse my brevity.



Sergey Senozhatsky <sergey.senozhatsky(a)gmail.com> schrieb:

On (07/01/12 15:46), Jan-Simon M=C3=B6ller wrote:
> Am Mittwoch, 27. Juni 2012, 18:32:42 schrieb Sergey Senozhatsky:
> > =

> > Could you please run
> > =

> > valgrind --tool=3Dmemcheck --leak-check=3Dfull --show-reachable=3Dyes
> > --leak-resolution=3Dhigh --track-origins=3Dyes -v
> > --log-file=3D./powertop-memcheck powertop --debug --html=3Dfile.html
> > =

> > and provide powertop-memcheck file?
> > =

> > =

> > 	-ss
> =

> Attached.

Thanks, I'll take a look.

Meanwhile, could you please try the following patch?

---

src/devlist.cpp | 7 ++++---
1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/src/devlist.cpp b/src/devlist.cpp
index 93f2081..9f06b92 100644
--- a/src/devlist.cpp
+++ b/src/devlist.cpp
@@ -146,11 +146,12 @@ void collect_open_devices(void)
				if (!dev)
					continue;
				dev->pid =3D strtoull(entry->d_name, NULL, 10);
-				strncpy(dev->device, link, 251);
+				strncpy(dev->device, link, 250);
+				dev->device[251] =3D 0x00;
				sprintf(filename, "/proc/%s/comm", entry->d_name);
-				strncpy(dev->comm, read_sysfs_string("/proc/%s/comm", entry->d_name).c=
_str(), 31);
+				strncpy(dev->comm, read_sysfs_string("/proc/%s/comm", entry->d_name).c=
_str(), 30);
+				dev->comm[31] =3D 0x00;
				target->push_back(dev);
-
			}
		}
		closedir(dir2);


--===============2065106236441294435==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PGh0bWw+PGhlYWQ+PC9oZWFkPjxib2R5Pm5vIGNoYW5nZS48YnI+Ci0tIDxicj4KU2VudCBmcm9t
IG15IEFuZHJvaWQgcGhvbmUgd2l0aCBLLTkgTWFpbC4gUGxlYXNlIGV4Y3VzZSBteSBicmV2aXR5
Ljxicj48YnI+PGRpdiBjbGFzcz0iZ21haWxfcXVvdGUiPjxicj4KPGJyPgpTZXJnZXkgU2Vub3po
YXRza3kgJmx0O3NlcmdleS5zZW5vemhhdHNreUBnbWFpbC5jb20mZ3Q7IHNjaHJpZWI6PGJsb2Nr
cXVvdGUgY2xhc3M9ImdtYWlsX3F1b3RlIiBzdHlsZT0ibWFyZ2luOiAwcHQgMHB0IDBwdCAwLjhl
eDsgYm9yZGVyLWxlZnQ6IDFweCBzb2xpZCByZ2IoMjA0LCAyMDQsIDIwNCk7IHBhZGRpbmctbGVm
dDogMWV4OyI+CjxwcmUgc3R5bGU9IndoaXRlLXNwYWNlOiBwcmUtd3JhcDsgd29yZC13cmFwOmJy
ZWFrLXdvcmQ7IGZvbnQtZmFtaWx5OiBzYW5zLXNlcmlmIj5PbiAoMDcvMDEvMTIgMTU6NDYpLCBK
YW4tU2ltb24gTcO2bGxlciB3cm90ZTo8YnIgLz4mZ3Q7IEFtIE1pdHR3b2NoLCAyNy4gSnVuaSAy
MDEyLCAxODozMjo0MiBzY2hyaWViIFNlcmdleSBTZW5vemhhdHNreTo8YnIgLz4mZ3Q7ICZndDsg
PGJyIC8+Jmd0OyAmZ3Q7IENvdWxkIHlvdSBwbGVhc2UgcnVuPGJyIC8+Jmd0OyAmZ3Q7IDxiciAv
PiZndDsgJmd0OyAgdmFsZ3JpbmQgLS10b29sPW1lbWNoZWNrIC0tbGVhay1jaGVjaz1mdWxsIC0t
c2hvdy1yZWFjaGFibGU9eWVzPGJyIC8+Jmd0OyAmZ3Q7IC0tbGVhay1yZXNvbHV0aW9uPWhpZ2gg
LS10cmFjay1vcmlnaW5zPXllcyAtdjxiciAvPiZndDsgJmd0OyAtLWxvZy1maWxlPS4vcG93ZXJ0
b3AtbWVtY2hlY2sgcG93ZXJ0b3AgLS1kZWJ1ZyAtLWh0bWw9ZmlsZS5odG1sPGJyIC8+Jmd0OyAm
Z3Q7IDxiciAvPiZndDsgJmd0OyBhbmQgcHJvdmlkZSBwb3dlcnRvcC1tZW1jaGVjayBmaWxlPzxi
ciAvPiZndDsgJmd0OyA8YnIgLz4mZ3Q7ICZndDsgPGJyIC8+Jmd0OyAmZ3Q7IAktc3M8YnIgLz4m
Z3Q7IDxiciAvPiZndDsgQXR0YWNoZWQuPGJyIC8+PGJyIC8+VGhhbmtzLCBJJ2xsIHRha2UgYSBs
b29rLjxiciAvPjxiciAvPk1lYW53aGlsZSwgY291bGQgeW91IHBsZWFzZSB0cnkgdGhlIGZvbGxv
d2luZyBwYXRjaD88YnIgLz48YnIgLz4tLS08YnIgLz48YnIgLz4gc3JjL2Rldmxpc3QuY3BwIHwg
NyArKysrLS0tPGJyIC8+IDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDMgZGVsZXRp
b25zKC0pPGJyIC8+PGJyIC8+ZGlmZiAtLWdpdCBhL3NyYy9kZXZsaXN0LmNwcCBiL3NyYy9kZXZs
aXN0LmNwcDxiciAvPmluZGV4IDkzZjIwODEuLjlmMDZiOTIgMTAwNjQ0PGJyIC8+LS0tIGEvc3Jj
L2Rldmxpc3QuY3BwPGJyIC8+KysrCmIvc3JjL2Rldmxpc3QuY3BwPGJyIC8+QEAgLTE0NiwxMSAr
MTQ2LDEyIEBAIHZvaWQgY29sbGVjdF9vcGVuX2RldmljZXModm9pZCk8YnIgLz4gCQkJCWlmICgh
ZGV2KTxiciAvPiAJCQkJCWNvbnRpbnVlOzxiciAvPiAJCQkJZGV2LSZndDtwaWQgPSBzdHJ0b3Vs
bChlbnRyeS0mZ3Q7ZF9uYW1lLCBOVUxMLCAxMCk7PGJyIC8+LQkJCQlzdHJuY3B5KGRldi0mZ3Q7
ZGV2aWNlLCBsaW5rLCAyNTEpOzxiciAvPisJCQkJc3RybmNweShkZXYtJmd0O2RldmljZSwgbGlu
aywgMjUwKTs8YnIgLz4rCQkJCWRldi0mZ3Q7ZGV2aWNlWzI1MV0gPSAweDAwOzxiciAvPiAJCQkJ
c3ByaW50ZihmaWxlbmFtZSwgIi9wcm9jLyVzL2NvbW0iLCBlbnRyeS0mZ3Q7ZF9uYW1lKTs8YnIg
Lz4tCQkJCXN0cm5jcHkoZGV2LSZndDtjb21tLCByZWFkX3N5c2ZzX3N0cmluZygiL3Byb2MvJXMv
Y29tbSIsIGVudHJ5LSZndDtkX25hbWUpLmNfc3RyKCksIDMxKTs8YnIgLz4rCQkJCXN0cm5jcHko
ZGV2LSZndDtjb21tLCByZWFkX3N5c2ZzX3N0cmluZygiL3Byb2MvJXMvY29tbSIsIGVudHJ5LSZn
dDtkX25hbWUpLmNfc3RyKCksIDMwKTs8YnIgLz4rCQkJCWRldi0mZ3Q7Y29tbVszMV0gPSAweDAw
OzxiciAvPiAJCQkJdGFyZ2V0LSZndDtwdXNoX2JhY2soZGV2KTs8YnIgLz4tPGJyIC8+IAkJCX08
YnIgLz4gCQl9PGJyIC8+IAkJY2xvc2VkaXIoZGlyMik7PGJyIC8+PGJyIC8+PC9wcmU+PC9ibG9j
a3F1b3RlPjwvZGl2PjwvYm9keT48L2h0bWw+
--===============2065106236441294435==--

