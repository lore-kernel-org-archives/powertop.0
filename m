Content-Type: multipart/mixed; boundary="===============2649639394173331951=="
MIME-Version: 1.0
From: Manoj Gupta <manojgupta at chromium.org>
Subject: [Powertop] Fix powertop build with libc++
Date: Sat, 04 Nov 2017 15:30:06 -0700
Message-ID: <CAAMbb04MYopNxfRYY-PVpt-XcQjg_ogxsTyvMhEO07b+6vpOxw@mail.gmail.com>
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============2649639394173331951==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi,

We are facing a build issue in powertop with libc++.
The attached patch fixes the problem by including the <ctime> header in
lib/src.h


Thanks,
Manoj

--===============2649639394173331951==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PGRpdiBkaXI9Imx0ciI+PGRpdiBjbGFzcz0iZ21haWxfcXVvdGUiPjxkaXYgZGlyPSJsdHIiPkhp
LDxkaXY+PGJyPjwvZGl2PjxkaXY+V2UgYXJlIGZhY2luZyBhIGJ1aWxkIGlzc3VlIGluIHBvd2Vy
dG9wIHdpdGggbGliYysrLjwvZGl2PjxkaXY+VGhlIGF0dGFjaGVkIHBhdGNoIGZpeGVzIHRoZSBw
cm9ibGVtIGJ5IGluY2x1ZGluZyB0aGUgJmx0O2N0aW1lJmd0OyBoZWFkZXIgaW4gbGliL3NyYy5o
PC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj5UaGFua3MsPC9kaXY+PGRp
dj5NYW5vajwvZGl2PjwvZGl2Pgo8L2Rpdj48YnI+PC9kaXY+Cg==

--===============2649639394173331951==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="powertop-libcxx.patch"

RnJvbSBjZTNlYWJmYmU4YmJmOTJhOTg0YTQ3ZThiZWViYjk0OGFjZjExMGQ0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBNYW5vaiBHdXB0YSA8bWFub2pndXB0YUBjaHJvbWl1bS5vcmc+
CkRhdGU6IFNhdCwgNCBOb3YgMjAxNyAxMzo0NDowNCAtMDcwMApTdWJqZWN0OiBbUEFUQ0hdIEZp
eCBwb3dlcnRvcCBidWlsZCB3aXRoIGxpYmMrKy4KCjxjdGltZT4gaGVhZGVyIGlzIG5vdCBhdXRv
bWF0aWNhbGx5IGluY2x1ZGVkIHdpdGggbGliYysrLgpBZGQgaXQgZXhwbGljaXRseSB0byBtYWtl
IHBvd2VydG9wIGJ1aWxkIHdpdGggbGliYysrLgoKVGhpcyBmaXhlcyB0aGUgZm9sbG93aW5nIGVy
cm9yczoKZGV2aWNlcy9ncHVfcmFwbF9kZXZpY2UuY3BwOjM1OjE0OiBlcnJvcjogdXNlIG9mIHVu
ZGVjbGFyZWQgaWRlbnRpZmllcgondGltZSc7IGRpZCB5b3UgbWVhbiAndGllJz8KbGFzdF90aW1l
ID0gdGltZShOVUxMKTsKICAgICAgICAgICAgICAgIF5+fn4KZGV2aWNlcy9ncHVfcmFwbF9kZXZp
Y2UuY3BwOjQ1OjE0OiBlcnJvcjp1c2Ugb2YgdW5kZWNsYXJlZCBpZGVudGlmaWVyCid0aW1lJzsg
ZGlkIHlvdSBtZWFuICd0aWUnPwpsYXN0X3RpbWUgPSB0aW1lKE5VTEwpOwogICAgICAgICAgICAg
ICAgXn5+fgoKcGFyYW1ldGVycy9sZWFybi5jcHA6MTYxOjEwOiBlcnJvcjogdXNlIG9mIHVuZGVj
bGFyZWQgaWRlbnRpZmllcgondGltZSc7IGRpZCB5b3UgbWVhbiAndGllJz8Kc3RhcnQgPQl0aW1l
KE5VTEwpOwogICAgICAgICAgICBefn5+Ci0tLQogc3JjL2xpYi5oIHwgMiArLQogMSBmaWxlIGNo
YW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvc3JjL2xp
Yi5oIGIvc3JjL2xpYi5oCmluZGV4IGI2NGJiMGYuLjZkODVlYjYgMTAwNjQ0Ci0tLSBhL3NyYy9s
aWIuaAorKysgYi9zcmMvbGliLmgKQEAgLTU0LDcgKzU0LDcgQEAgZXh0ZXJuIGNvbnN0IGNoYXIg
Kmtlcm5lbF9mdW5jdGlvbih1aW50NjRfdCBhZGRyZXNzKTsKIAogCiAKLQorI2luY2x1ZGUgPGN0
aW1lPgogI2luY2x1ZGUgPHN0cmluZz4KIHVzaW5nIG5hbWVzcGFjZSBzdGQ7CiAKCg==

--===============2649639394173331951==--

