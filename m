Content-Type: multipart/mixed; boundary="===============6766077549412211319=="
MIME-Version: 1.0
From: Sergey Senozhatsky <sergey.senozhatsky at gmail.com>
Subject: Re: [Powertop] [RFC][PATCH 1/2] Adding report generator facility
Date: Tue, 09 Oct 2012 12:31:00 -0700
Message-ID: <20121009193100.GE3633@swordfish>
In-Reply-To: 20121009185555.GA3633@swordfish
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============6766077549412211319==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On (10/09/12 11:55), Sergey Senozhatsky wrote:
> =

> that leads to a quick solution (meaning that it may not be perfect nor be=
autiful). we define and
> implement base class with all function being both virtual and empty, let'=
s call it base (report_formatter).
> then we define base_impl class, and implement only type #1 functions, for=
 example, in our case a family of
> add*() functions plus get/clear result() and so on.
> =

> then we define and implement formatter clases, that should inherit from b=
ase_impl, and override
> class #2 functions (for example, escaping).
> =

> =

> from the top of my head, schematically is something like this:
>

I would like to state that I'm not forcing this solution or whatsoever, jus=
t an idea.

	-ss

 =

> class base {
>         public:
>                 base() {}
>                 virtual ~base() {}
>                 virtual void foo(const char *p)
>                 {
>                         printf("base foo call\n");
>                 }
>                 virtual void bar()
>                 {
>                         printf("base bar call\n");
>                 }
>                 virtual void xyz()
>                 {
>                         printf("base xyz call\n");
>                 }
>                 virtual void begin_table()
>                 {
>                         printf("base begin table call\n");
>                 }
> };
> =

> class base_impl : public base {
>         public:
>                 std::string data;
>                 virtual void foo(const char *p)
>                 {
>                         printf("impl foo call\n");
>                         data.append(p);
>                 }
> =

>                 virtual void bar()
>                 {
>                         printf("impl bar call: %s\n", data.c_str());
>                 }
> };
> =

> class derived : public base_impl {
>         public:
>                 virtual void begin_table()
>                 {
>                         printf("derived begin table call\n");
>                 }
> };
> =

> =

> int main()
> {
>         class derived *d =3D new derived();
>         d->foo("test");
>         d->bar();
>         d->xyz();
>         d->begin_table();
> =

>         class base *b =3D new base();
>         b->foo("test");
>         b->bar();
>         b->xyz();
>         b->begin_table();
> =

>         delete d;
>         delete b;
>         return 0;
> }
> =

> $g++ -O2 test.cpp -o a.out
> =

> $./a.out =

> impl foo call
> impl bar call: test
> base xyz call
> derived begin table call
> =

> base foo call
> base bar call
> base xyz call
> base begin table call
> =

> =

> =

> 	-ss

--===============6766077549412211319==--

