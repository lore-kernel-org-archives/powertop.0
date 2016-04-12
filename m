Content-Type: multipart/mixed; boundary="===============0923549462966565874=="
MIME-Version: 1.0
From: Valentin Lorentz <valentin.lorentz at ens-lyon.fr>
Subject: [Powertop] [bug] Commas used as decimal mark in CSV output
Date: Tue, 12 Apr 2016 13:12:58 +0200
Message-ID: <570CD83A.8010707@ens-lyon.fr>
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============0923549462966565874==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi,


Some locales use a comma instead of a dot as a decimal mark (ie.
separator between integer and fractional parts of a number).

When powertop is run with such a locale, numbers in the CSV output will
contain a comma; which breaks CSV parsing, because commas are also
separators for the CSV fields.


You can reproduce this with the following command (assuming French
locales are installed on your system):

# LANG=3Dfr_FR.UTF-8 powertop --time=3D1 --csv=3D/tmp/powertop.csv


Example of what one gets when running this command:

Usage,Device Name
 26,7%,CPU misc
 26,7%,DRAM
 26,7%,CPU core
 90,2 ops/s,GPU misc


Regards,
Valentin


--===============0923549462966565874==
Content-Type: application/pgp-signature
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="signature.asc"

LS0tLS1CRUdJTiBQR1AgU0lHTkFUVVJFLS0tLS0KVmVyc2lvbjogR251UEcgdjIKCmlRSWNCQUVC
Q0FBR0JRSlhETmcvQUFvSkVBNElLMERrTjJzZXYrZ1AvalNpNVU2REpxV2NlWXBtcXJQY0d2STMK
Ymh1VmQ0UGxnNFBmeEJtVmV0aG4yZUk1OTZNb0U1RzhCdVdaeE1FTllGeHNBakt6STNTSXJmVDd0
L0owZHprdQo4dkJ6UU1FZURsazhOSnMyaEFMbDBFTnFBU29pZGphbWJpRkM3S0ZUNlhUbGxVSmNQ
ZU5MVkNHMytNTC85dWtqCjJSY2doVG02TTRBaWxBOVVSQ2NYb09EU2hYNCt2bGVaa1pJdmNZN3I3
MzJuMVQ0Y2UxbzYwcGE3S0kwZGdxanQKNHVvanlLMlZxcjhhOUxZT1Zwa0Fhc2FFK1h4eElNeC8z
REw1NjVERXBza1hFUERUcU1BVmZyTEFtaWRISnZTUAplWFdEaDBjYVMvSTVsbDB1R1VRbjNqazl0
MkFDOE10OTZkODVIVUFlMExlZy8rQWhIOTBDNWpTR3pEY3IrbG5WCk1YZ0N2NFRDck9RK2VTQy9j
VjE3cG5abTZBclVrMHUzZHVtT2g2YzloVnBnbmdtSUhyeVkzU1lKWmNUKzNESHoKMW03QzJQWHZi
YmV6R3grZ0ZFaUZBbDY3SUcyTVliak5EdGVITThzNldnT3dhUnNTR1lKajd5NENIMU8rNENjdAo1
MGJmM2RERVVVa0F4SnZuU2VVdVloNWJScWlMUVJzWERGa3h2NUlRS3E0T3B4SmMyL3JIMEhjeTNw
cHRrNkVnCm9xZXBBTjVuY0xMdjByKytteHVUdHhWQVloZnRJc3lCbDdZMjVDT21NRkNycVlVZ1hp
d0tBeDR2UTc4cWRJdE4KNUdDaW9ZV2ZOZHFlSGFUMDdrUzBTOVJrY09kOUFITzFzejlEWXhWWjEw
ZFZIanNQRXpjKzRVTHluUkZpWUV2OAp0RHJQdy9STzUzV2VFbE5keWppYgo9ejgrYgotLS0tLUVO
RCBQR1AgU0lHTkFUVVJFLS0tLS0K

--===============0923549462966565874==--

