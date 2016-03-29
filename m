Content-Type: multipart/mixed; boundary="===============4272205433758894356=="
MIME-Version: 1.0
From: haoyu Wang <864290826 at qq.com>
Subject: [Powertop] how does powertop estimate the watt of laptop computers?
Date: Tue, 29 Mar 2016 14:20:49 +0800
Message-ID: <tencent_611127A954D980684BF72795@qq.com>
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============4272205433758894356==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

hi,powertop's  developers .I am a student which recently studing  power con=
sumption of pc.I have known windows power monitor software Joulemeter. ther=
e are some papers introduce how it works . but i can't find the same docume=
nts that introduce the powertop.

so  i want to know the  process of calculating the  watts of those componen=
ts .for example, how to calculate  the cpu's power ? i  have following  que=
stions :
1. does powertop  use power model to calculate the  power ?
2. does powertop use the utilization of cpu and combine some cpu's  power m=
odel to calculate power ?
3.how to get  those utilization ?use linux kernal function  or directly rea=
d some data from cpu  registers which likes  intel power gadget ?

thanks for you reading this email and hope you can reply soon .

--===============4272205433758894356==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

aGkscG93ZXJ0b3AncyZuYnNwOyZuYnNwO2RldmVsb3BlcnMmbmJzcDsuSSZuYnNwO2FtJm5ic3A7
YSZuYnNwO3N0dWRlbnQmbmJzcDt3aGljaCZuYnNwO3JlY2VudGx5Jm5ic3A7c3R1ZGluZyZuYnNw
OyZuYnNwO3Bvd2VyJm5ic3A7Y29uc3VtcHRpb24mbmJzcDtvZiZuYnNwO3BjLkkmbmJzcDtoYXZl
Jm5ic3A7a25vd24mbmJzcDt3aW5kb3dzJm5ic3A7cG93ZXImbmJzcDttb25pdG9yJm5ic3A7c29m
dHdhcmUmbmJzcDs8Zm9udCBzaXplPScyJz5Kb3VsZW1ldGVyLiZuYnNwO3RoZXJlJm5ic3A7YXJl
Jm5ic3A7c29tZSZuYnNwO3BhcGVycyZuYnNwO2ludHJvZHVjZSZuYnNwO2hvdyZuYnNwO2l0Jm5i
c3A7d29ya3MmbmJzcDsuJm5ic3A7YnV0Jm5ic3A7aSZuYnNwO2Nhbid0Jm5ic3A7ZmluZCZuYnNw
O3RoZSZuYnNwO3NhbWUmbmJzcDtkb2N1bWVudHMmbmJzcDt0aGF0Jm5ic3A7aW50cm9kdWNlJm5i
c3A7dGhlJm5ic3A7cG93ZXJ0b3AuPC9mb250Pjxicj48YnI+PGZvbnQgc2l6ZT0nMic+c28mbmJz
cDsmbmJzcDtpJm5ic3A7d2FudCZuYnNwO3RvJm5ic3A7a25vdyZuYnNwO3RoZSZuYnNwOyZuYnNw
O3Byb2Nlc3MmbmJzcDtvZiZuYnNwO2NhbGN1bGF0aW5nJm5ic3A7dGhlJm5ic3A7Jm5ic3A7d2F0
dHMmbmJzcDtvZiZuYnNwO3Rob3NlJm5ic3A7Y29tcG9uZW50cyZuYnNwOy5mb3ImbmJzcDtleGFt
cGxlLCZuYnNwO2hvdyZuYnNwO3RvJm5ic3A7Y2FsY3VsYXRlJm5ic3A7Jm5ic3A7dGhlJm5ic3A7
Y3B1J3MmbmJzcDtwb3dlciZuYnNwOz8mbmJzcDtpJm5ic3A7Jm5ic3A7aGF2ZSZuYnNwO2ZvbGxv
d2luZyZuYnNwOyZuYnNwO3F1ZXN0aW9ucyZuYnNwOzo8L2ZvbnQ+PGJyPjxmb250IHNpemU9JzIn
PjEuJm5ic3A7ZG9lcyZuYnNwO3Bvd2VydG9wJm5ic3A7Jm5ic3A7dXNlJm5ic3A7cG93ZXImbmJz
cDttb2RlbCZuYnNwO3RvJm5ic3A7Y2FsY3VsYXRlJm5ic3A7dGhlJm5ic3A7Jm5ic3A7cG93ZXIm
bmJzcDs/PC9mb250Pjxicj48Zm9udCBzaXplPScyJz4yLiZuYnNwO2RvZXMmbmJzcDtwb3dlcnRv
cCZuYnNwO3VzZSZuYnNwO3RoZSZuYnNwO3V0aWxpemF0aW9uJm5ic3A7b2YmbmJzcDtjcHUmbmJz
cDthbmQmbmJzcDtjb21iaW5lJm5ic3A7c29tZSZuYnNwO2NwdSdzJm5ic3A7Jm5ic3A7cG93ZXIm
bmJzcDttb2RlbCZuYnNwO3RvJm5ic3A7Y2FsY3VsYXRlJm5ic3A7cG93ZXImbmJzcDs/PC9mb250
Pjxicj48Zm9udCBzaXplPScyJz4zLmhvdyZuYnNwO3RvJm5ic3A7Z2V0Jm5ic3A7Jm5ic3A7dGhv
c2UmbmJzcDt1dGlsaXphdGlvbiZuYnNwOz91c2UmbmJzcDtsaW51eCZuYnNwO2tlcm5hbCZuYnNw
O2Z1bmN0aW9uJm5ic3A7Jm5ic3A7b3ImbmJzcDtkaXJlY3RseSZuYnNwO3JlYWQmbmJzcDtzb21l
Jm5ic3A7ZGF0YSZuYnNwO2Zyb20mbmJzcDtjcHUmbmJzcDsmbmJzcDtyZWdpc3RlcnMmbmJzcDt3
aGljaCZuYnNwO2xpa2VzJm5ic3A7Jm5ic3A7aW50ZWwmbmJzcDtwb3dlciZuYnNwO2dhZGdldCZu
YnNwOz88L2ZvbnQ+PGJyPjxicj48Zm9udCBzaXplPScyJz48Zm9udCBmYWNlPSJUaW1lcyBOZXcg
Um9tYW4sIHNlcmlmIj50aGFua3MmbmJzcDtmb3ImbmJzcDt5b3UmbmJzcDtyZWFkaW5nJm5ic3A7
dGhpcyZuYnNwO2VtYWlsJm5ic3A7YW5kJm5ic3A7aG9wZSZuYnNwO3lvdSZuYnNwO2NhbiZuYnNw
O3JlcGx5Jm5ic3A7c29vbiZuYnNwOy48L2ZvbnQ+PC9mb250Pjxicj4=
--===============4272205433758894356==--

