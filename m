Content-Type: multipart/mixed; boundary="===============0901844056061971066=="
MIME-Version: 1.0
From: Mohammad Merajul Islam Molla <meraj.enigma at gmail.com>
Subject: Re: [Powertop] [PATCH] powertop: fix various resource leaks
Date: Tue, 05 Aug 2014 20:47:22 +0600
Message-ID: <CAHu9=sPS7tHGQVd4HORxLEDhw-yf_L7PPL0cD7OcW16FmG=C5g@mail.gmail.com>
In-Reply-To: 20140805124418.GA965@swordfish
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============0901844056061971066==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Sergey,

Thanks for your review.

For this portion of changes, is the below diff ok? I will resend the
full patch if it is.

diff --git a/src/tuning/bluetooth.cpp b/src/tuning/bluetooth.cpp
index 2c1e283..9be327e 100644
--- a/src/tuning/bluetooth.cpp
+++ b/src/tuning/bluetooth.cpp
@@ -108,7 +108,7 @@ static int last_check_result;
 int bt_tunable::good_bad(void)
 {
        struct hci_dev_info devinfo;
-       FILE *file;
+       FILE *file =3D 0;
        int fd;
        int thisbytes =3D 0;
        int ret;
@@ -144,18 +144,14 @@ int bt_tunable::good_bad(void)
                if (file) {
                        char line[2048];
                        /* first line is standard header */
-                       if (fgets(line, 2047, file) =3D=3D NULL) {
-                               pclose(file);
+                       if (fgets(line, 2047, file) =3D=3D NULL)
                                goto out;
-                       }
                        memset(line, 0, 2048);
                        if (fgets(line, 2047, file) =3D=3D NULL) {
                                result =3D last_check_result =3D TUNE_GOOD;
-                               pclose(file);
                                goto out;
                        }

-                       pclose(file);
                        if (strlen(line) > 0) {
                                result =3D last_check_result =3D TUNE_GOOD;
                                goto out;
@@ -168,6 +164,8 @@ int bt_tunable::good_bad(void)

 out:
        previous_bytes =3D thisbytes;
+       if (file)
+               pclose(file);
        close(fd);
        return result;
 }


--
Thanks,
-Meraj



On Tue, Aug 5, 2014 at 6:44 PM, Sergey Senozhatsky
<sergey.senozhatsky(a)gmail.com> wrote:
> On (08/04/14 19:50), Mohammad Merajul Islam Molla wrote:
>> Date: Mon,  4 Aug 2014 19:50:57 +0600
>> From: Mohammad Merajul Islam Molla <meraj.enigma(a)gmail.com>
>> To: powertop(a)lists.01.org
>> Subject: [Powertop] [PATCH] powertop: fix various resource leaks
>> X-Mailer: git-send-email 1.9.1
>>
>> fixes some resource leaks detected by valgrind and coverity scan.
>>
>> Signed-off-by: Mohammad Merajul Islam Molla <meraj.enigma(a)gmail.com>
>> ---
>>  src/devices/ahci.cpp     | 4 +++-
>>  src/perf/perf_bundle.cpp | 4 +++-
>>  src/tuning/bluetooth.cpp | 4 +++-
>>  3 files changed, 9 insertions(+), 3 deletions(-)
>>
>> diff --git a/src/devices/ahci.cpp b/src/devices/ahci.cpp
>> index 3b4627a..a4d1345 100644
>> --- a/src/devices/ahci.cpp
>> +++ b/src/devices/ahci.cpp
>> @@ -67,8 +67,10 @@ static string disk_name(char *path, char *target, cha=
r *shortname)
>>               sprintf(line, "%s/%s/model", pathname, dirent->d_name);
>>               file =3D fopen(line, "r");
>>               if (file) {
>> -                     if (fgets(line, 4096, file) =3D=3D NULL)
>> +                     if (fgets(line, 4096, file) =3D=3D NULL) {
>> +                             fclose(file);
>>                               break;
>> +                     }
>>                       fclose(file);
>>                       c =3D strchr(line, '\n');
>>                       if (c)
>> diff --git a/src/perf/perf_bundle.cpp b/src/perf/perf_bundle.cpp
>> index b0e982b..cf1ae11 100644
>> --- a/src/perf/perf_bundle.cpp
>> +++ b/src/perf/perf_bundle.cpp
>> @@ -142,8 +142,10 @@ static void parse_event_format(const char *event_na=
me)
>>
>>       buf =3D read_file(file);
>>       free(file);
>> -     if (!buf)
>> +     if (!buf) {
>> +             free(name);
>>               return;
>> +     }
>>
>>       pevent_parse_event(perf_event::pevent, buf, strlen(buf), sys);
>>       free(name);
>> diff --git a/src/tuning/bluetooth.cpp b/src/tuning/bluetooth.cpp
>> index 92f5835..2c1e283 100644
>> --- a/src/tuning/bluetooth.cpp
>> +++ b/src/tuning/bluetooth.cpp
>> @@ -144,8 +144,10 @@ int bt_tunable::good_bad(void)
>>               if (file) {
>>                       char line[2048];
>>                       /* first line is standard header */
>> -                     if (fgets(line, 2047, file) =3D=3D NULL)
>> +                     if (fgets(line, 2047, file) =3D=3D NULL) {
>> +                             pclose(file);
>>                               goto out;
>> +                     }
>>                       memset(line, 0, 2048);
>>                       if (fgets(line, 2047, file) =3D=3D NULL) {
>>                               result =3D last_check_result =3D TUNE_GOOD;
>>
>
> how about moving pclose(file) to `out:' label scope? 3 out of 11 lines
> are doing same work here: cleaning up resource before jump.
>
>         -ss

--===============0901844056061971066==--

