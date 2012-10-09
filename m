Content-Type: multipart/mixed; boundary="===============0951616799703573562=="
MIME-Version: 1.0
From: Sergey Senozhatsky <sergey.senozhatsky at gmail.com>
Subject: Re: [Powertop] [RFC][PATCH 1/2] Adding report generator facility
Date: Tue, 09 Oct 2012 11:55:55 -0700
Message-ID: <20121009185555.GA3633@swordfish>
In-Reply-To: 507458A4.8090403@samsung.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============0951616799703573562==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On (10/09/12 21:02), Igor Zhbanov wrote:
> Hi Sergey,
> =

> Sergey Senozhatsky wrote:
> =

> >Hello,
> >
> >- can we please avoid code duplication? for example, both html and csv
> >reporters contain identical implementations of
> >
> >clear_result()/get_result()/add*() and friends.
> =

> Done. Please check v2 patchset (after list moderator will approve those b=
ig letters).
> =

> >- I think null formatter could be a basic class with default
> >implementation (null) of virtual functions, rather than separate
> >implementation of basic formatter interface (abstract class).
> =

> The null formatter is needed only because the code that uses the report
> facility is called even when the reports are not needed.
> =

> The function one_measurement() (which calls to other reporting functions)=
 first
> called from make_report() with 1 second parameter. And that report will b=
e thrown
> away. In the comments there is a note that this is to warm-up the system.=
 I don't know
> whether it is really needed.
> =

> After that make_report() produces real reports inside the loop by calling
> the one_measurement() function.
> =

> Also one_measurement() is called from calibration code, and that code doe=
sn't need
> any reports too.
> =

> So we need to decide when to call reporting functions from one_measuremen=
t().
> We could check the report_type there. But what type of report maker shoul=
d we create
> when we don't need the reports? HTML? CSV? Sounds no good.
> =

> Providing a flag inside the report maker whether we need to produce the r=
eports
> and check it upon entry to every method is no good too.
> =

> We could create report maker and provide it to the needed functions by po=
inter.
> But what to provide when we need not report? NULL? Then we have to check =
for it
> in every function. Lot's of unnecessary checks.
> =

> We could combine two mentioned approaches -- create report maker only when
> we actually need to produce the report, and call report creating function=
s from
> one_measurement() with non-NULL pointer to report (and pass it down to all
> other functions that need it).
> =

> Then we could get rid of null report-maker. But now it is easier way to d=
eal with
> such usage of report facility.
> =

> What you think?
> =

> It is very hard to refactor this code.
> =


I see.

At the moment I don't have any problems with having null formatter. This is=
 still a
good improvement and valuable commit. Thank you, Igor.



Anyways, what I was thinking about, was that formatter-null can be a base c=
lass with empty
functions, we will use it as base class for csv and html reporters, while k=
eep valid usage of
formatter itself, by default none of base function would do anything sane

	class report_formatter {   /**  report_formatter_null **/

	 /** common formatter functions **/
	 virtual void addf(const char *fmt, ...)
	 {
	         va_list ap;
 =

	         va_start(ap, fmt);
	         addv(fmt, ap);
	         va_end(ap);
	 }

	 virtual const char * get_result()
	 {
	         return result.c_str();
	 }
 =

	 virtual void clear_result()
	 {
	         result.clear();
	 }
	 virtual void add(const char *str)
	 {
	         result +=3D escape_string(str);
	 }
 =

	 virtual void add_exact(const char *str)
	 {
	         result +=3D std::string(str);
	 }

	 [...]
	/** derived class specific formatter functions, like  **/

	 virtual void begin_section(section_type stype) {return; }
	 etc.
	};

so we still can call formatter =3D new report_formatter() and use it as we =
did before.
the obvious problem is that we waste memory and CPU cycles on add* calls fo=
r basic
class. in other words, if we take a look on the problem from a different an=
gle,
among all functions we have 3 types of functions (counting from 1):
#1 those that must be NULL in base class - derived class implementation spe=
cific
#2 those that must be same for all derived classes, but NULL in base class
#3 those that must be derived with basic implementation



that leads to a quick solution (meaning that it may not be perfect nor beau=
tiful). we define and
implement base class with all function being both virtual and empty, let's =
call it base (report_formatter).
then we define base_impl class, and implement only type #1 functions, for e=
xample, in our case a family of
add*() functions plus get/clear result() and so on.

then we define and implement formatter clases, that should inherit from bas=
e_impl, and override
class #2 functions (for example, escaping).


from the top of my head, schematically is something like this:

class base {
        public:
                base() {}
                virtual ~base() {}
                virtual void foo(const char *p)
                {
                        printf("base foo call\n");
                }
                virtual void bar()
                {
                        printf("base bar call\n");
                }
                virtual void xyz()
                {
                        printf("base xyz call\n");
                }
                virtual void begin_table()
                {
                        printf("base begin table call\n");
                }
};

class base_impl : public base {
        public:
                std::string data;
                virtual void foo(const char *p)
                {
                        printf("impl foo call\n");
                        data.append(p);
                }

                virtual void bar()
                {
                        printf("impl bar call: %s\n", data.c_str());
                }
};

class derived : public base_impl {
        public:
                virtual void begin_table()
                {
                        printf("derived begin table call\n");
                }
};


int main()
{
        class derived *d =3D new derived();
        d->foo("test");
        d->bar();
        d->xyz();
        d->begin_table();

        class base *b =3D new base();
        b->foo("test");
        b->bar();
        b->xyz();
        b->begin_table();

        delete d;
        delete b;
        return 0;
}

$g++ -O2 test.cpp -o a.out

$./a.out =

impl foo call
impl bar call: test
base xyz call
derived begin table call

base foo call
base bar call
base xyz call
base begin table call



	-ss

--===============0951616799703573562==--

