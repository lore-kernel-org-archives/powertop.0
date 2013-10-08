Content-Type: multipart/mixed; boundary="===============6857548368085683455=="
MIME-Version: 1.0
From: Sergey Senozhatsky <sergey.senozhatsky at gmail.com>
Subject: [Powertop] [PATCH] traceevent: update libtraceevent code base
Date: Tue, 08 Oct 2013 22:40:34 +0300
Message-ID: <20131008194034.GA2289@swordfish>
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============6857548368085683455==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

traceevent: update libtraceevent code base (3.12)

Signed-off-by: Sergey Senozhatsky <sergey.senozhatsky(a)gmail.com>

---

 traceevent/event-parse.c   | 824 +++++++++++++++++++++++++++++++++--------=
----
 traceevent/event-parse.h   |  64 +++-
 traceevent/event-utils.h   |   9 +-
 traceevent/kbuffer-parse.c | 732 ++++++++++++++++++++++++++++++++++++++++
 traceevent/kbuffer.h       |  67 ++++
 traceevent/parse-filter.c  |  18 +-
 traceevent/parse-utils.c   |  19 ++
 traceevent/trace-seq.c     |  16 +-
 8 files changed, 1514 insertions(+), 235 deletions(-)

diff --git a/traceevent/event-parse.c b/traceevent/event-parse.c
index aa16443..d1c2a6a 100644
--- a/traceevent/event-parse.c
+++ b/traceevent/event-parse.c
@@ -13,8 +13,7 @@
  * GNU Lesser General Public License for more details.
  *
  * You should have received a copy of the GNU Lesser General Public
- * License along with this program; if not, write to the Free Software
- * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-130=
1 USA.
+ * License along with this program; if not,  see <http://www.gnu.org/licen=
ses>
  *
  * ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
  *
@@ -24,13 +23,14 @@
  *  Frederic Weisbecker gave his permission to relicense the code to
  *  the Lesser General Public License.
  */
-#define _GNU_SOURCE
 #include <stdio.h>
 #include <stdlib.h>
 #include <string.h>
 #include <stdarg.h>
 #include <ctype.h>
 #include <errno.h>
+#include <stdint.h>
+#include <limits.h>
 =

 #include "event-parse.h"
 #include "event-utils.h"
@@ -117,14 +117,7 @@ void breakpoint(void)
 =

 struct print_arg *alloc_arg(void)
 {
-	struct print_arg *arg;
-
-	arg =3D malloc_or_die(sizeof(*arg));
-	if (!arg)
-		return NULL;
-	memset(arg, 0, sizeof(*arg));
-
-	return arg;
+	return calloc(1, sizeof(struct print_arg));
 }
 =

 struct cmdline {
@@ -158,7 +151,9 @@ static int cmdline_init(struct pevent *pevent)
 	struct cmdline *cmdlines;
 	int i;
 =

-	cmdlines =3D malloc_or_die(sizeof(*cmdlines) * pevent->cmdline_count);
+	cmdlines =3D malloc(sizeof(*cmdlines) * pevent->cmdline_count);
+	if (!cmdlines)
+		return -1;
 =

 	i =3D 0;
 	while (cmdlist) {
@@ -178,7 +173,7 @@ static int cmdline_init(struct pevent *pevent)
 	return 0;
 }
 =

-static char *find_cmdline(struct pevent *pevent, int pid)
+static const char *find_cmdline(struct pevent *pevent, int pid)
 {
 	const struct cmdline *comm;
 	struct cmdline key;
@@ -186,8 +181,8 @@ static char *find_cmdline(struct pevent *pevent, int pi=
d)
 	if (!pid)
 		return "<idle>";
 =

-	if (!pevent->cmdlines)
-		cmdline_init(pevent);
+	if (!pevent->cmdlines && cmdline_init(pevent))
+		return "<not enough memory for cmdlines!>";
 =

 	key.pid =3D pid;
 =

@@ -215,8 +210,8 @@ int pevent_pid_is_registered(struct pevent *pevent, int=
 pid)
 	if (!pid)
 		return 1;
 =

-	if (!pevent->cmdlines)
-		cmdline_init(pevent);
+	if (!pevent->cmdlines && cmdline_init(pevent))
+		return 0;
 =

 	key.pid =3D pid;
 =

@@ -258,10 +253,14 @@ static int add_new_comm(struct pevent *pevent, const =
char *comm, int pid)
 		return -1;
 	}
 =

-	cmdlines[pevent->cmdline_count].pid =3D pid;
 	cmdlines[pevent->cmdline_count].comm =3D strdup(comm);
-	if (!cmdlines[pevent->cmdline_count].comm)
-		die("malloc comm");
+	if (!cmdlines[pevent->cmdline_count].comm) {
+		free(cmdlines);
+		errno =3D ENOMEM;
+		return -1;
+	}
+
+	cmdlines[pevent->cmdline_count].pid =3D pid;
 		=

 	if (cmdlines[pevent->cmdline_count].comm)
 		pevent->cmdline_count++;
@@ -288,10 +287,15 @@ int pevent_register_comm(struct pevent *pevent, const=
 char *comm, int pid)
 	if (pevent->cmdlines)
 		return add_new_comm(pevent, comm, pid);
 =

-	item =3D malloc_or_die(sizeof(*item));
+	item =3D malloc(sizeof(*item));
+	if (!item)
+		return -1;
+
 	item->comm =3D strdup(comm);
-	if (!item->comm)
-		die("malloc comm");
+	if (!item->comm) {
+		free(item);
+		return -1;
+	}
 	item->pid =3D pid;
 	item->next =3D pevent->cmdlist;
 =

@@ -355,7 +359,10 @@ static int func_map_init(struct pevent *pevent)
 	struct func_map *func_map;
 	int i;
 =

-	func_map =3D malloc_or_die(sizeof(*func_map) * (pevent->func_count + 1));
+	func_map =3D malloc(sizeof(*func_map) * (pevent->func_count + 1));
+	if (!func_map)
+		return -1;
+
 	funclist =3D pevent->funclist;
 =

 	i =3D 0;
@@ -455,25 +462,36 @@ pevent_find_function_address(struct pevent *pevent, u=
nsigned long long addr)
 int pevent_register_function(struct pevent *pevent, char *func,
 			     unsigned long long addr, char *mod)
 {
-	struct func_list *item;
+	struct func_list *item =3D malloc(sizeof(*item));
 =

-	item =3D malloc_or_die(sizeof(*item));
+	if (!item)
+		return -1;
 =

 	item->next =3D pevent->funclist;
 	item->func =3D strdup(func);
-	if (mod)
+	if (!item->func)
+		goto out_free;
+
+	if (mod) {
 		item->mod =3D strdup(mod);
-	else
+		if (!item->mod)
+			goto out_free_func;
+	} else
 		item->mod =3D NULL;
 	item->addr =3D addr;
 =

-	if (!item->func || (mod && !item->mod))
-		die("malloc func");
-
 	pevent->funclist =3D item;
 	pevent->func_count++;
 =

 	return 0;
+
+out_free_func:
+	free(item->func);
+	item->func =3D NULL;
+out_free:
+	free(item);
+	errno =3D ENOMEM;
+	return -1;
 }
 =

 /**
@@ -524,14 +542,16 @@ static int printk_cmp(const void *a, const void *b)
 	return 0;
 }
 =

-static void printk_map_init(struct pevent *pevent)
+static int printk_map_init(struct pevent *pevent)
 {
 	struct printk_list *printklist;
 	struct printk_list *item;
 	struct printk_map *printk_map;
 	int i;
 =

-	printk_map =3D malloc_or_die(sizeof(*printk_map) * (pevent->printk_count =
+ 1));
+	printk_map =3D malloc(sizeof(*printk_map) * (pevent->printk_count + 1));
+	if (!printk_map)
+		return -1;
 =

 	printklist =3D pevent->printklist;
 =

@@ -549,6 +569,8 @@ static void printk_map_init(struct pevent *pevent)
 =

 	pevent->printk_map =3D printk_map;
 	pevent->printklist =3D NULL;
+
+	return 0;
 }
 =

 static struct printk_map *
@@ -557,8 +579,8 @@ find_printk(struct pevent *pevent, unsigned long long a=
ddr)
 	struct printk_map *printk;
 	struct printk_map key;
 =

-	if (!pevent->printk_map)
-		printk_map_init(pevent);
+	if (!pevent->printk_map && printk_map_init(pevent))
+		return NULL;
 =

 	key.addr =3D addr;
 =

@@ -580,21 +602,27 @@ find_printk(struct pevent *pevent, unsigned long long=
 addr)
 int pevent_register_print_string(struct pevent *pevent, char *fmt,
 				 unsigned long long addr)
 {
-	struct printk_list *item;
+	struct printk_list *item =3D malloc(sizeof(*item));
 =

-	item =3D malloc_or_die(sizeof(*item));
+	if (!item)
+		return -1;
 =

 	item->next =3D pevent->printklist;
-	item->printk =3D strdup(fmt);
 	item->addr =3D addr;
 =

+	item->printk =3D strdup(fmt);
 	if (!item->printk)
-		die("malloc fmt");
+		goto out_free;
 =

 	pevent->printklist =3D item;
 	pevent->printk_count++;
 =

 	return 0;
+
+out_free:
+	free(item);
+	errno =3D ENOMEM;
+	return -1;
 }
 =

 /**
@@ -619,24 +647,18 @@ void pevent_print_printk(struct pevent *pevent)
 =

 static struct event_format *alloc_event(void)
 {
-	struct event_format *event;
-
-	event =3D malloc(sizeof(*event));
-	if (!event)
-		return NULL;
-	memset(event, 0, sizeof(*event));
-
-	return event;
+	return calloc(1, sizeof(struct event_format));
 }
 =

-static void add_event(struct pevent *pevent, struct event_format *event)
+static int add_event(struct pevent *pevent, struct event_format *event)
 {
 	int i;
+	struct event_format **events =3D realloc(pevent->events, sizeof(event) *
+					       (pevent->nr_events + 1));
+	if (!events)
+		return -1;
 =

-	pevent->events =3D realloc(pevent->events, sizeof(event) *
-				 (pevent->nr_events + 1));
-	if (!pevent->events)
-		die("Can not allocate events");
+	pevent->events =3D events;
 =

 	for (i =3D 0; i < pevent->nr_events; i++) {
 		if (pevent->events[i]->id > event->id)
@@ -651,6 +673,8 @@ static void add_event(struct pevent *pevent, struct eve=
nt_format *event)
 	pevent->nr_events++;
 =

 	event->pevent =3D pevent;
+
+	return 0;
 }
 =

 static int event_item_type(enum event_type type)
@@ -827,9 +851,9 @@ static enum event_type __read_token(char **tok)
 	switch (type) {
 	case EVENT_NEWLINE:
 	case EVENT_DELIM:
-		*tok =3D malloc_or_die(2);
-		(*tok)[0] =3D ch;
-		(*tok)[1] =3D 0;
+		if (asprintf(tok, "%c", ch) < 0)
+			return EVENT_ERROR;
+
 		return type;
 =

 	case EVENT_OP:
@@ -1199,6 +1223,34 @@ static int field_is_long(struct format_field *field)
 	return 0;
 }
 =

+static unsigned int type_size(const char *name)
+{
+	/* This covers all FIELD_IS_STRING types. */
+	static struct {
+		const char *type;
+		unsigned int size;
+	} table[] =3D {
+		{ "u8",   1 },
+		{ "u16",  2 },
+		{ "u32",  4 },
+		{ "u64",  8 },
+		{ "s8",   1 },
+		{ "s16",  2 },
+		{ "s32",  4 },
+		{ "s64",  8 },
+		{ "char", 1 },
+		{ },
+	};
+	int i;
+
+	for (i =3D 0; table[i].type; i++) {
+		if (!strcmp(table[i].type, name))
+			return table[i].size;
+	}
+
+	return 0;
+}
+
 static int event_read_fields(struct event_format *event, struct format_fie=
ld **fields)
 {
 	struct format_field *field =3D NULL;
@@ -1208,6 +1260,8 @@ static int event_read_fields(struct event_format *eve=
nt, struct format_field **f
 	int count =3D 0;
 =

 	do {
+		unsigned int size_dynamic =3D 0;
+
 		type =3D read_token(&token);
 		if (type =3D=3D EVENT_NEWLINE) {
 			free_token(token);
@@ -1240,8 +1294,10 @@ static int event_read_fields(struct event_format *ev=
ent, struct format_field **f
 =

 		last_token =3D token;
 =

-		field =3D malloc_or_die(sizeof(*field));
-		memset(field, 0, sizeof(*field));
+		field =3D calloc(1, sizeof(*field));
+		if (!field)
+			goto fail;
+
 		field->event =3D event;
 =

 		/* read the rest of the type */
@@ -1282,7 +1338,7 @@ static int event_read_fields(struct event_format *eve=
nt, struct format_field **f
 		}
 =

 		if (!field->type) {
-			die("no type found");
+			do_warning("%s: no type found", __func__);
 			goto fail;
 		}
 		field->name =3D last_token;
@@ -1329,7 +1385,7 @@ static int event_read_fields(struct event_format *eve=
nt, struct format_field **f
 				free_token(token);
 				type =3D read_token(&token);
 				if (type =3D=3D EVENT_NONE) {
-					die("failed to find token");
+					do_warning("failed to find token");
 					goto fail;
 				}
 			}
@@ -1364,6 +1420,7 @@ static int event_read_fields(struct event_format *eve=
nt, struct format_field **f
 				field->type =3D new_type;
 				strcat(field->type, " ");
 				strcat(field->type, field->name);
+				size_dynamic =3D type_size(field->name);
 				free_token(field->name);
 				strcat(field->type, brackets);
 				field->name =3D token;
@@ -1436,7 +1493,8 @@ static int event_read_fields(struct event_format *eve=
nt, struct format_field **f
 			if (read_expect_type(EVENT_ITEM, &token))
 				goto fail;
 =

-			/* add signed type */
+			if (strtoul(token, NULL, 0))
+				field->flags |=3D FIELD_IS_SIGNED;
 =

 			free_token(token);
 			if (read_expected(EVENT_OP, ";") < 0)
@@ -1451,10 +1509,14 @@ static int event_read_fields(struct event_format *e=
vent, struct format_field **f
 		if (field->flags & FIELD_IS_ARRAY) {
 			if (field->arraylen)
 				field->elementsize =3D field->size / field->arraylen;
+			else if (field->flags & FIELD_IS_DYNAMIC)
+				field->elementsize =3D size_dynamic;
 			else if (field->flags & FIELD_IS_STRING)
 				field->elementsize =3D 1;
-			else
-				field->elementsize =3D event->pevent->long_size;
+			else if (field->flags & FIELD_IS_LONG)
+				field->elementsize =3D event->pevent ?
+						     event->pevent->long_size :
+						     sizeof(long);
 		} else
 			field->elementsize =3D field->size;
 =

@@ -1538,6 +1600,14 @@ process_cond(struct event_format *event, struct prin=
t_arg *top, char **tok)
 	left =3D alloc_arg();
 	right =3D alloc_arg();
 =

+	if (!arg || !left || !right) {
+		do_warning("%s: not enough memory!", __func__);
+		/* arg will be freed at out_free */
+		free_arg(left);
+		free_arg(right);
+		goto out_free;
+	}
+
 	arg->type =3D PRINT_OP;
 	arg->op.left =3D left;
 	arg->op.right =3D right;
@@ -1580,6 +1650,12 @@ process_array(struct event_format *event, struct pri=
nt_arg *top, char **tok)
 	char *token =3D NULL;
 =

 	arg =3D alloc_arg();
+	if (!arg) {
+		do_warning("%s: not enough memory!", __func__);
+		/* '*tok' is set to top->op.op.  No need to free. */
+		*tok =3D NULL;
+		return EVENT_ERROR;
+	}
 =

 	*tok =3D NULL;
 	type =3D process_arg(event, arg, &token);
@@ -1595,8 +1671,7 @@ process_array(struct event_format *event, struct prin=
t_arg *top, char **tok)
 	return type;
 =

 out_free:
-	free_token(*tok);
-	*tok =3D NULL;
+	free_token(token);
 	free_arg(arg);
 	return EVENT_ERROR;
 }
@@ -1682,7 +1757,7 @@ process_op(struct event_format *event, struct print_a=
rg *arg, char **tok)
 	if (arg->type =3D=3D PRINT_OP && !arg->op.left) {
 		/* handle single op */
 		if (token[1]) {
-			die("bad op token %s", token);
+			do_warning("bad op token %s", token);
 			goto out_free;
 		}
 		switch (token[0]) {
@@ -1699,10 +1774,16 @@ process_op(struct event_format *event, struct print=
_arg *arg, char **tok)
 =

 		/* make an empty left */
 		left =3D alloc_arg();
+		if (!left)
+			goto out_warn_free;
+
 		left->type =3D PRINT_NULL;
 		arg->op.left =3D left;
 =

 		right =3D alloc_arg();
+		if (!right)
+			goto out_warn_free;
+
 		arg->op.right =3D right;
 =

 		/* do not free the token, it belongs to an op */
@@ -1712,6 +1793,9 @@ process_op(struct event_format *event, struct print_a=
rg *arg, char **tok)
 	} else if (strcmp(token, "?") =3D=3D 0) {
 =

 		left =3D alloc_arg();
+		if (!left)
+			goto out_warn_free;
+
 		/* copy the top arg to the left */
 		*left =3D *arg;
 =

@@ -1720,6 +1804,7 @@ process_op(struct event_format *event, struct print_a=
rg *arg, char **tok)
 		arg->op.left =3D left;
 		arg->op.prio =3D 0;
 =

+		/* it will set arg->op.right */
 		type =3D process_cond(event, arg, tok);
 =

 	} else if (strcmp(token, ">>") =3D=3D 0 ||
@@ -1735,10 +1820,14 @@ process_op(struct event_format *event, struct print=
_arg *arg, char **tok)
 		   strcmp(token, "/") =3D=3D 0 ||
 		   strcmp(token, "<") =3D=3D 0 ||
 		   strcmp(token, ">") =3D=3D 0 ||
+		   strcmp(token, "<=3D") =3D=3D 0 ||
+		   strcmp(token, ">=3D") =3D=3D 0 ||
 		   strcmp(token, "=3D=3D") =3D=3D 0 ||
 		   strcmp(token, "!=3D") =3D=3D 0) {
 =

 		left =3D alloc_arg();
+		if (!left)
+			goto out_warn_free;
 =

 		/* copy the top arg to the left */
 		*left =3D *arg;
@@ -1746,6 +1835,7 @@ process_op(struct event_format *event, struct print_a=
rg *arg, char **tok)
 		arg->type =3D PRINT_OP;
 		arg->op.op =3D token;
 		arg->op.left =3D left;
+		arg->op.right =3D NULL;
 =

 		if (set_op_prio(arg) =3D=3D -1) {
 			event->flags |=3D EVENT_FL_FAILED;
@@ -1762,12 +1852,14 @@ process_op(struct event_format *event, struct print=
_arg *arg, char **tok)
 		    type =3D=3D EVENT_DELIM && (strcmp(token, ")") =3D=3D 0)) {
 			char *new_atom;
 =

-			if (left->type !=3D PRINT_ATOM)
-				die("bad pointer type");
+			if (left->type !=3D PRINT_ATOM) {
+				do_warning("bad pointer type");
+				goto out_free;
+			}
 			new_atom =3D realloc(left->atom.atom,
 					    strlen(left->atom.atom) + 3);
 			if (!new_atom)
-				goto out_free;
+				goto out_warn_free;
 =

 			left->atom.atom =3D new_atom;
 			strcat(left->atom.atom, " *");
@@ -1779,12 +1871,18 @@ process_op(struct event_format *event, struct print=
_arg *arg, char **tok)
 		}
 =

 		right =3D alloc_arg();
+		if (!right)
+			goto out_warn_free;
+
 		type =3D process_arg_token(event, right, tok, type);
 		arg->op.right =3D right;
 =

 	} else if (strcmp(token, "[") =3D=3D 0) {
 =

 		left =3D alloc_arg();
+		if (!left)
+			goto out_warn_free;
+
 		*left =3D *arg;
 =

 		arg->type =3D PRINT_OP;
@@ -1793,6 +1891,7 @@ process_op(struct event_format *event, struct print_a=
rg *arg, char **tok)
 =

 		arg->op.prio =3D 0;
 =

+		/* it will set arg->op.right */
 		type =3D process_array(event, arg, tok);
 =

 	} else {
@@ -1816,14 +1915,16 @@ process_op(struct event_format *event, struct print=
_arg *arg, char **tok)
 =

 	return type;
 =

- out_free:
+out_warn_free:
+	do_warning("%s: not enough memory!", __func__);
+out_free:
 	free_token(token);
 	*tok =3D NULL;
 	return EVENT_ERROR;
 }
 =

 static enum event_type
-process_entry(struct event_format *event __unused, struct print_arg *arg,
+process_entry(struct event_format *event __maybe_unused, struct print_arg =
*arg,
 	      char **tok)
 {
 	enum event_type type;
@@ -1880,7 +1981,11 @@ eval_type_str(unsigned long long val, const char *ty=
pe, int pointer)
 			return val;
 		}
 =

-		ref =3D malloc_or_die(len);
+		ref =3D malloc(len);
+		if (!ref) {
+			do_warning("%s: not enough memory!", __func__);
+			return val;
+		}
 		memcpy(ref, type, len);
 =

 		/* chop off the " *" */
@@ -1957,8 +2062,10 @@ eval_type_str(unsigned long long val, const char *ty=
pe, int pointer)
 static unsigned long long
 eval_type(unsigned long long val, struct print_arg *arg, int pointer)
 {
-	if (arg->type !=3D PRINT_TYPE)
-		die("expected type argument");
+	if (arg->type !=3D PRINT_TYPE) {
+		do_warning("expected type argument");
+		return 0;
+	}
 =

 	return eval_type_str(val, arg->typecast.type, pointer);
 }
@@ -2143,7 +2250,7 @@ static char *arg_eval (struct print_arg *arg)
 	case PRINT_STRING:
 	case PRINT_BSTRING:
 	default:
-		die("invalid eval type %d", arg->type);
+		do_warning("invalid eval type %d", arg->type);
 		break;
 	}
 =

@@ -2166,6 +2273,8 @@ process_fields(struct event_format *event, struct pri=
nt_flag_sym **list, char **
 			break;
 =

 		arg =3D alloc_arg();
+		if (!arg)
+			goto out_free;
 =

 		free_token(token);
 		type =3D process_arg(event, arg, &token);
@@ -2179,30 +2288,33 @@ process_fields(struct event_format *event, struct p=
rint_flag_sym **list, char **
 		if (test_type_token(type, token, EVENT_DELIM, ","))
 			goto out_free;
 =

-		field =3D malloc_or_die(sizeof(*field));
-		memset(field, 0, sizeof(*field));
+		field =3D calloc(1, sizeof(*field));
+		if (!field)
+			goto out_free;
 =

 		value =3D arg_eval(arg);
 		if (value =3D=3D NULL)
-			goto out_free;
+			goto out_free_field;
 		field->value =3D strdup(value);
 		if (field->value =3D=3D NULL)
-			goto out_free;
+			goto out_free_field;
 =

 		free_arg(arg);
 		arg =3D alloc_arg();
+		if (!arg)
+			goto out_free;
 =

 		free_token(token);
 		type =3D process_arg(event, arg, &token);
 		if (test_type_token(type, token, EVENT_OP, "}"))
-			goto out_free;
+			goto out_free_field;
 =

 		value =3D arg_eval(arg);
 		if (value =3D=3D NULL)
-			goto out_free;
+			goto out_free_field;
 		field->str =3D strdup(value);
 		if (field->str =3D=3D NULL)
-			goto out_free;
+			goto out_free_field;
 		free_arg(arg);
 		arg =3D NULL;
 =

@@ -2216,6 +2328,8 @@ process_fields(struct event_format *event, struct pri=
nt_flag_sym **list, char **
 	*tok =3D token;
 	return type;
 =

+out_free_field:
+	free_flag_sym(field);
 out_free:
 	free_arg(arg);
 	free_token(token);
@@ -2235,6 +2349,10 @@ process_flags(struct event_format *event, struct pri=
nt_arg *arg, char **tok)
 	arg->type =3D PRINT_FLAGS;
 =

 	field =3D alloc_arg();
+	if (!field) {
+		do_warning("%s: not enough memory!", __func__);
+		goto out_free;
+	}
 =

 	type =3D process_arg(event, field, &token);
 =

@@ -2243,7 +2361,7 @@ process_flags(struct event_format *event, struct prin=
t_arg *arg, char **tok)
 		type =3D process_op(event, field, &token);
 =

 	if (test_type_token(type, token, EVENT_DELIM, ","))
-		goto out_free;
+		goto out_free_field;
 	free_token(token);
 =

 	arg->flags.field =3D field;
@@ -2265,7 +2383,9 @@ process_flags(struct event_format *event, struct prin=
t_arg *arg, char **tok)
 	type =3D read_token_item(tok);
 	return type;
 =

- out_free:
+out_free_field:
+	free_arg(field);
+out_free:
 	free_token(token);
 	*tok =3D NULL;
 	return EVENT_ERROR;
@@ -2282,10 +2402,14 @@ process_symbols(struct event_format *event, struct =
print_arg *arg, char **tok)
 	arg->type =3D PRINT_SYMBOL;
 =

 	field =3D alloc_arg();
+	if (!field) {
+		do_warning("%s: not enough memory!", __func__);
+		goto out_free;
+	}
 =

 	type =3D process_arg(event, field, &token);
 	if (test_type_token(type, token, EVENT_DELIM, ","))
-		goto out_free;
+		goto out_free_field;
 =

 	arg->symbol.field =3D field;
 =

@@ -2297,7 +2421,9 @@ process_symbols(struct event_format *event, struct pr=
int_arg *arg, char **tok)
 	type =3D read_token_item(tok);
 	return type;
 =

- out_free:
+out_free_field:
+	free_arg(field);
+out_free:
 	free_token(token);
 	*tok =3D NULL;
 	return EVENT_ERROR;
@@ -2314,6 +2440,11 @@ process_hex(struct event_format *event, struct print=
_arg *arg, char **tok)
 	arg->type =3D PRINT_HEX;
 =

 	field =3D alloc_arg();
+	if (!field) {
+		do_warning("%s: not enough memory!", __func__);
+		goto out_free;
+	}
+
 	type =3D process_arg(event, field, &token);
 =

 	if (test_type_token(type, token, EVENT_DELIM, ","))
@@ -2324,6 +2455,12 @@ process_hex(struct event_format *event, struct print=
_arg *arg, char **tok)
 	free_token(token);
 =

 	field =3D alloc_arg();
+	if (!field) {
+		do_warning("%s: not enough memory!", __func__);
+		*tok =3D NULL;
+		return EVENT_ERROR;
+	}
+
 	type =3D process_arg(event, field, &token);
 =

 	if (test_type_token(type, token, EVENT_DELIM, ")"))
@@ -2381,6 +2518,12 @@ process_dynamic_array(struct event_format *event, st=
ruct print_arg *arg, char **
 =

 	free_token(token);
 	arg =3D alloc_arg();
+	if (!arg) {
+		do_warning("%s: not enough memory!", __func__);
+		*tok =3D NULL;
+		return EVENT_ERROR;
+	}
+
 	type =3D process_arg(event, arg, &token);
 	if (type =3D=3D EVENT_ERROR)
 		goto out_free_arg;
@@ -2434,10 +2577,16 @@ process_paren(struct event_format *event, struct pr=
int_arg *arg, char **tok)
 		/* make this a typecast and contine */
 =

 		/* prevous must be an atom */
-		if (arg->type !=3D PRINT_ATOM)
-			die("previous needed to be PRINT_ATOM");
+		if (arg->type !=3D PRINT_ATOM) {
+			do_warning("previous needed to be PRINT_ATOM");
+			goto out_free;
+		}
 =

 		item_arg =3D alloc_arg();
+		if (!item_arg) {
+			do_warning("%s: not enough memory!", __func__);
+			goto out_free;
+		}
 =

 		arg->type =3D PRINT_TYPE;
 		arg->typecast.type =3D arg->atom.atom;
@@ -2457,7 +2606,8 @@ process_paren(struct event_format *event, struct prin=
t_arg *arg, char **tok)
 =

 =

 static enum event_type
-process_str(struct event_format *event __unused, struct print_arg *arg, ch=
ar **tok)
+process_str(struct event_format *event __maybe_unused, struct print_arg *a=
rg,
+	    char **tok)
 {
 	enum event_type type;
 	char *token;
@@ -2489,6 +2639,9 @@ find_func_handler(struct pevent *pevent, char *func_n=
ame)
 {
 	struct pevent_function_handler *func;
 =

+	if (!pevent)
+		return NULL;
+
 	for (func =3D pevent->func_handlers; func; func =3D func->next) {
 		if (strcmp(func->name, func_name) =3D=3D 0)
 			break;
@@ -2521,7 +2674,7 @@ process_func_handler(struct event_format *event, stru=
ct pevent_function_handler
 	struct print_arg *farg;
 	enum event_type type;
 	char *token;
-	char *test;
+	const char *test;
 	int i;
 =

 	arg->type =3D PRINT_FUNC;
@@ -2532,6 +2685,11 @@ process_func_handler(struct event_format *event, str=
uct pevent_function_handler
 	next_arg =3D &(arg->func.args);
 	for (i =3D 0; i < func->nr_args; i++) {
 		farg =3D alloc_arg();
+		if (!farg) {
+			do_warning("%s: not enough memory!", __func__);
+			return EVENT_ERROR;
+		}
+
 		type =3D process_arg(event, farg, &token);
 		if (i < (func->nr_args - 1))
 			test =3D ",";
@@ -2676,7 +2834,8 @@ process_arg_token(struct event_format *event, struct =
print_arg *arg,
 =

 	case EVENT_ERROR ... EVENT_NEWLINE:
 	default:
-		die("unexpected type %d", type);
+		do_warning("unexpected type %d", type);
+		return EVENT_ERROR;
 	}
 	*tok =3D token;
 =

@@ -2697,6 +2856,10 @@ static int event_read_print_args(struct event_format=
 *event, struct print_arg **
 		}
 =

 		arg =3D alloc_arg();
+		if (!arg) {
+			do_warning("%s: not enough memory!", __func__);
+			return -1;
+		}
 =

 		type =3D process_arg(event, arg, &token);
 =

@@ -2768,10 +2931,8 @@ static int event_read_print(struct event_format *eve=
nt)
 	if (type =3D=3D EVENT_DQUOTE) {
 		char *cat;
 =

-		cat =3D malloc_or_die(strlen(event->print_fmt.format) +
-				    strlen(token) + 1);
-		strcpy(cat, event->print_fmt.format);
-		strcat(cat, token);
+		if (asprintf(&cat, "%s%s", event->print_fmt.format, token) < 0)
+			goto fail;
 		free_token(token);
 		free_token(event->print_fmt.format);
 		event->print_fmt.format =3D NULL;
@@ -2925,8 +3086,10 @@ static int get_common_info(struct pevent *pevent,
 	 * All events should have the same common elements.
 	 * Pick any event to find where the type is;
 	 */
-	if (!pevent->events)
-		die("no event_list!");
+	if (!pevent->events) {
+		do_warning("no event_list!");
+		return -1;
+	}
 =

 	event =3D pevent->events[0];
 	field =3D pevent_find_common_field(event, type);
@@ -3084,7 +3247,8 @@ eval_num_arg(void *data, int size, struct event_forma=
t *event, struct print_arg
 		if (!arg->field.field) {
 			arg->field.field =3D pevent_find_any_field(event, arg->field.name);
 			if (!arg->field.field)
-				die("field %s not found", arg->field.name);
+				goto out_warning_field;
+			=

 		}
 		/* must be a number */
 		val =3D pevent_read_number(pevent, data + arg->field.field->offset,
@@ -3145,8 +3309,10 @@ eval_num_arg(void *data, int size, struct event_form=
at *event, struct print_arg
 				if (!larg->field.field) {
 					larg->field.field =3D
 						pevent_find_any_field(event, larg->field.name);
-					if (!larg->field.field)
-						die("field %s not found", larg->field.name);
+					if (!larg->field.field) {
+						arg =3D larg;
+						goto out_warning_field;
+					}
 				}
 				field_size =3D larg->field.field->elementsize;
 				offset =3D larg->field.field->offset +
@@ -3182,7 +3348,7 @@ eval_num_arg(void *data, int size, struct event_forma=
t *event, struct print_arg
 				val =3D left !=3D right;
 				break;
 			default:
-				die("unknown op '%s'", arg->op.op);
+				goto out_warning_op;
 			}
 			break;
 		case '~':
@@ -3212,7 +3378,7 @@ eval_num_arg(void *data, int size, struct event_forma=
t *event, struct print_arg
 				val =3D left <=3D right;
 				break;
 			default:
-				die("unknown op '%s'", arg->op.op);
+				goto out_warning_op;
 			}
 			break;
 		case '>':
@@ -3227,12 +3393,13 @@ eval_num_arg(void *data, int size, struct event_for=
mat *event, struct print_arg
 				val =3D left >=3D right;
 				break;
 			default:
-				die("unknown op '%s'", arg->op.op);
+				goto out_warning_op;
 			}
 			break;
 		case '=3D':
 			if (arg->op.op[1] !=3D '=3D')
-				die("unknown op '%s'", arg->op.op);
+				goto out_warning_op;
+
 			val =3D left =3D=3D right;
 			break;
 		case '-':
@@ -3248,13 +3415,21 @@ eval_num_arg(void *data, int size, struct event_for=
mat *event, struct print_arg
 			val =3D left * right;
 			break;
 		default:
-			die("unknown op '%s'", arg->op.op);
+			goto out_warning_op;
 		}
 		break;
 	default: /* not sure what to do there */
 		return 0;
 	}
 	return val;
+
+out_warning_op:
+	do_warning("%s: unknown op '%s'", __func__, arg->op.op);
+	return 0;
+
+out_warning_field:
+	do_warning("%s: field %s not found", __func__, arg->field.name);
+	return 0;
 }
 =

 struct flag {
@@ -3331,8 +3506,10 @@ static void print_str_arg(struct trace_seq *s, void =
*data, int size,
 		field =3D arg->field.field;
 		if (!field) {
 			field =3D pevent_find_any_field(event, arg->field.name);
-			if (!field)
-				die("field %s not found", arg->field.name);
+			if (!field) {
+				str =3D arg->field.name;
+				goto out_warning_field;
+			}
 			arg->field.field =3D field;
 		}
 		/* Zero sized fields, mean the rest of the data */
@@ -3349,7 +3526,11 @@ static void print_str_arg(struct trace_seq *s, void =
*data, int size,
 			trace_seq_printf(s, "%lx", addr);
 			break;
 		}
-		str =3D malloc_or_die(len + 1);
+		str =3D malloc(len + 1);
+		if (!str) {
+			do_warning("%s: not enough memory!", __func__);
+			return;
+		}
 		memcpy(str, data + field->offset, len);
 		str[len] =3D 0;
 		print_str_to_seq(s, format, len_arg, str);
@@ -3389,7 +3570,7 @@ static void print_str_arg(struct trace_seq *s, void *=
data, int size,
 			str =3D arg->hex.field->field.name;
 			field =3D pevent_find_any_field(event, str);
 			if (!field)
-				die("field %s not found", str);
+				goto out_warning_field;
 			arg->hex.field->field.field =3D field;
 		}
 		hex =3D data + field->offset;
@@ -3441,6 +3622,11 @@ static void print_str_arg(struct trace_seq *s, void =
*data, int size,
 		/* well... */
 		break;
 	}
+
+	return;
+
+out_warning_field:
+	do_warning("%s: field %s not found", __func__, arg->field.name);
 }
 =

 static unsigned long long
@@ -3467,7 +3653,11 @@ process_defined_func(struct trace_seq *s, void *data=
, int size,
 	farg =3D arg->func.args;
 	param =3D func_handle->params;
 =

-	args =3D malloc_or_die(sizeof(*args) * func_handle->nr_args);
+	ret =3D ULLONG_MAX;
+	args =3D malloc(sizeof(*args) * func_handle->nr_args);
+	if (!args)
+		goto out;
+
 	for (i =3D 0; i < func_handle->nr_args; i++) {
 		switch (param->type) {
 		case PEVENT_FUNC_ARG_INT:
@@ -3479,13 +3669,19 @@ process_defined_func(struct trace_seq *s, void *dat=
a, int size,
 			trace_seq_init(&str);
 			print_str_arg(&str, data, size, event, "%s", -1, farg);
 			trace_seq_terminate(&str);
-			string =3D malloc_or_die(sizeof(*string));
+			string =3D malloc(sizeof(*string));
+			if (!string) {
+				do_warning("%s(%d): malloc str", __func__, __LINE__);
+				goto out_free;
+			}
 			string->next =3D strings;
 			string->str =3D strdup(str.buffer);
-			if (!string->str)
-				die("malloc str");
-
-			args[i] =3D (unsigned long long)string->str;
+			if (!string->str) {
+				free(string);
+				do_warning("%s(%d): malloc str", __func__, __LINE__);
+				goto out_free;
+			}
+			args[i] =3D (uintptr_t)string->str;
 			strings =3D string;
 			trace_seq_destroy(&str);
 			break;
@@ -3494,14 +3690,15 @@ process_defined_func(struct trace_seq *s, void *dat=
a, int size,
 			 * Something went totally wrong, this is not
 			 * an input error, something in this code broke.
 			 */
-			die("Unexpected end of arguments\n");
-			break;
+			do_warning("Unexpected end of arguments\n");
+			goto out_free;
 		}
 		farg =3D farg->next;
 		param =3D param->next;
 	}
 =

 	ret =3D (*func_handle->func)(s, args);
+out_free:
 	free(args);
 	while (strings) {
 		string =3D strings;
@@ -3515,6 +3712,18 @@ process_defined_func(struct trace_seq *s, void *data=
, int size,
 	return ret;
 }
 =

+static void free_args(struct print_arg *args)
+{
+	struct print_arg *next;
+
+	while (args) {
+		next =3D args->next;
+
+		free_arg(args);
+		args =3D next;
+	}
+}
+
 static struct print_arg *make_bprint_args(char *fmt, void *data, int size,=
 struct event_format *event)
 {
 	struct pevent *pevent =3D event->pevent;
@@ -3530,11 +3739,15 @@ static struct print_arg *make_bprint_args(char *fmt=
, void *data, int size, struc
 =

 	if (!field) {
 		field =3D pevent_find_field(event, "buf");
-		if (!field)
-			die("can't find buffer field for binary printk");
+		if (!field) {
+			do_warning("can't find buffer field for binary printk");
+			return NULL;
+		}
 		ip_field =3D pevent_find_field(event, "ip");
-		if (!ip_field)
-			die("can't find ip field for binary printk");
+		if (!ip_field) {
+			do_warning("can't find ip field for binary printk");
+			return NULL;
+		}
 		pevent->bprint_buf_field =3D field;
 		pevent->bprint_ip_field =3D ip_field;
 	}
@@ -3545,13 +3758,18 @@ static struct print_arg *make_bprint_args(char *fmt=
, void *data, int size, struc
 	 * The first arg is the IP pointer.
 	 */
 	args =3D alloc_arg();
+	if (!args) {
+		do_warning("%s(%d): not enough memory!", __func__, __LINE__);
+		return NULL;
+	}
 	arg =3D args;
 	arg->next =3D NULL;
 	next =3D &arg->next;
 =

 	arg->type =3D PRINT_ATOM;
-	arg->atom.atom =3D malloc_or_die(32);
-	sprintf(arg->atom.atom, "%lld", ip);
+		=

+	if (asprintf(&arg->atom.atom, "%lld", ip) < 0)
+		goto out_free;
 =

 	/* skip the first "%pf : " */
 	for (ptr =3D fmt + 6, bptr =3D data + field->offset;
@@ -3606,10 +3824,17 @@ static struct print_arg *make_bprint_args(char *fmt=
, void *data, int size, struc
 				val =3D pevent_read_number(pevent, bptr, vsize);
 				bptr +=3D vsize;
 				arg =3D alloc_arg();
+				if (!arg) {
+					do_warning("%s(%d): not enough memory!",
+						   __func__, __LINE__);
+					goto out_free;
+				}
 				arg->next =3D NULL;
 				arg->type =3D PRINT_ATOM;
-				arg->atom.atom =3D malloc_or_die(32);
-				sprintf(arg->atom.atom, "%lld", val);
+				if (asprintf(&arg->atom.atom, "%lld", val) < 0) {
+					free(arg);
+					goto out_free;
+				}
 				*next =3D arg;
 				next =3D &arg->next;
 				/*
@@ -3622,11 +3847,16 @@ static struct print_arg *make_bprint_args(char *fmt=
, void *data, int size, struc
 				break;
 			case 's':
 				arg =3D alloc_arg();
+				if (!arg) {
+					do_warning("%s(%d): not enough memory!",
+						   __func__, __LINE__);
+					goto out_free;
+				}
 				arg->next =3D NULL;
 				arg->type =3D PRINT_BSTRING;
 				arg->string.string =3D strdup(bptr);
 				if (!arg->string.string)
-					break;
+					goto out_free;
 				bptr +=3D strlen(bptr) + 1;
 				*next =3D arg;
 				next =3D &arg->next;
@@ -3637,22 +3867,15 @@ static struct print_arg *make_bprint_args(char *fmt=
, void *data, int size, struc
 	}
 =

 	return args;
-}
-
-static void free_args(struct print_arg *args)
-{
-	struct print_arg *next;
-
-	while (args) {
-		next =3D args->next;
 =

-		free_arg(args);
-		args =3D next;
-	}
+out_free:
+	free_args(args);
+	return NULL;
 }
 =

 static char *
-get_bprint_format(void *data, int size __unused, struct event_format *even=
t)
+get_bprint_format(void *data, int size __maybe_unused,
+		  struct event_format *event)
 {
 	struct pevent *pevent =3D event->pevent;
 	unsigned long long addr;
@@ -3665,8 +3888,10 @@ get_bprint_format(void *data, int size __unused, str=
uct event_format *event)
 =

 	if (!field) {
 		field =3D pevent_find_field(event, "fmt");
-		if (!field)
-			die("can't find format field for binary printk");
+		if (!field) {
+			do_warning("can't find format field for binary printk");
+			return NULL;
+		}
 		pevent->bprint_fmt_field =3D field;
 	}
 =

@@ -3674,9 +3899,8 @@ get_bprint_format(void *data, int size __unused, stru=
ct event_format *event)
 =

 	printk =3D find_printk(pevent, addr);
 	if (!printk) {
-		format =3D malloc_or_die(45);
-		sprintf(format, "%%pf : (NO FORMAT FOUND at %llx)\n",
-			addr);
+		if (asprintf(&format, "%%pf : (NO FORMAT FOUND at %llx)\n", addr) < 0)
+			return NULL;
 		return format;
 	}
 =

@@ -3684,8 +3908,8 @@ get_bprint_format(void *data, int size __unused, stru=
ct event_format *event)
 	/* Remove any quotes. */
 	if (*p =3D=3D '"')
 		p++;
-	format =3D malloc_or_die(strlen(p) + 10);
-	sprintf(format, "%s : %s", "%pf", p);
+	if (asprintf(&format, "%s : %s", "%pf", p) < 0)
+		return NULL;
 	/* remove ending quotes and new line since we will add one too */
 	p =3D format + strlen(format) - 1;
 	if (*p =3D=3D '"')
@@ -3702,7 +3926,7 @@ static void print_mac_arg(struct trace_seq *s, int ma=
c, void *data, int size,
 			  struct event_format *event, struct print_arg *arg)
 {
 	unsigned char *buf;
-	char *fmt =3D "%.2x:%.2x:%.2x:%.2x:%.2x:%.2x";
+	const char *fmt =3D "%.2x:%.2x:%.2x:%.2x:%.2x:%.2x";
 =

 	if (arg->type =3D=3D PRINT_FUNC) {
 		process_defined_func(s, data, size, event, arg);
@@ -3720,8 +3944,11 @@ static void print_mac_arg(struct trace_seq *s, int m=
ac, void *data, int size,
 	if (!arg->field.field) {
 		arg->field.field =3D
 			pevent_find_any_field(event, arg->field.name);
-		if (!arg->field.field)
-			die("field %s not found", arg->field.name);
+		if (!arg->field.field) {
+			do_warning("%s: field %s not found",
+				   __func__, arg->field.name);
+			return;
+		}
 	}
 	if (arg->field.field->size !=3D 6) {
 		trace_seq_printf(s, "INVALIDMAC");
@@ -3741,7 +3968,8 @@ static int is_printable_array(char *p, unsigned int l=
en)
 	return 1;
 }
 =

-static void print_event_fields(struct trace_seq *s, void *data, int size,
+static void print_event_fields(struct trace_seq *s, void *data,
+			       int size __maybe_unused,
 			       struct event_format *event)
 {
 	struct format_field *field;
@@ -3888,8 +4116,11 @@ static void pretty_print(struct trace_seq *s, void *=
data, int size, struct event
 				goto cont_process;
 			case '*':
 				/* The argument is the length. */
-				if (!arg)
-					die("no argument match");
+				if (!arg) {
+					do_warning("no argument match");
+					event->flags |=3D EVENT_FL_FAILED;
+					goto out_failed;
+				}
 				len_arg =3D eval_num_arg(data, size, event, arg);
 				len_as_arg =3D 1;
 				arg =3D arg->next;
@@ -3922,15 +4153,21 @@ static void pretty_print(struct trace_seq *s, void =
*data, int size, struct event
 			case 'x':
 			case 'X':
 			case 'u':
-				if (!arg)
-					die("no argument match");
+				if (!arg) {
+					do_warning("no argument match");
+					event->flags |=3D EVENT_FL_FAILED;
+					goto out_failed;
+				}
 =

 				len =3D ((unsigned long)ptr + 1) -
 					(unsigned long)saveptr;
 =

 				/* should never happen */
-				if (len > 31)
-					die("bad format!");
+				if (len > 31) {
+					do_warning("bad format!");
+					event->flags |=3D EVENT_FL_FAILED;
+					len =3D 31;
+				}
 =

 				memcpy(format, saveptr, len);
 				format[len] =3D 0;
@@ -3994,19 +4231,26 @@ static void pretty_print(struct trace_seq *s, void =
*data, int size, struct event
 						trace_seq_printf(s, format, (long long)val);
 					break;
 				default:
-					die("bad count (%d)", ls);
+					do_warning("bad count (%d)", ls);
+					event->flags |=3D EVENT_FL_FAILED;
 				}
 				break;
 			case 's':
-				if (!arg)
-					die("no matching argument");
+				if (!arg) {
+					do_warning("no matching argument");
+					event->flags |=3D EVENT_FL_FAILED;
+					goto out_failed;
+				}
 =

 				len =3D ((unsigned long)ptr + 1) -
 					(unsigned long)saveptr;
 =

 				/* should never happen */
-				if (len > 31)
-					die("bad format!");
+				if (len > 31) {
+					do_warning("bad format!");
+					event->flags |=3D EVENT_FL_FAILED;
+					len =3D 31;
+				}
 =

 				memcpy(format, saveptr, len);
 				format[len] =3D 0;
@@ -4024,6 +4268,11 @@ static void pretty_print(struct trace_seq *s, void *=
data, int size, struct event
 			trace_seq_putc(s, *ptr);
 	}
 =

+	if (event->flags & EVENT_FL_FAILED) {
+out_failed:
+		trace_seq_printf(s, "[FAILED TO PARSE]");
+	}
+
 	if (args) {
 		free_args(args);
 		free(bprint_fmt);
@@ -4197,7 +4446,7 @@ void pevent_event_info(struct trace_seq *s, struct ev=
ent_format *event,
 void pevent_print_event(struct pevent *pevent, struct trace_seq *s,
 			struct pevent_record *record)
 {
-	static char *spaces =3D "                    "; /* 20 spaces */
+	static const char *spaces =3D "                    "; /* 20 spaces */
 	struct event_format *event;
 	unsigned long secs;
 	unsigned long usecs;
@@ -4356,7 +4605,10 @@ get_event_fields(const char *type, const char *name,
 	struct format_field *field;
 	int i =3D 0;
 =

-	fields =3D malloc_or_die(sizeof(*fields) * (count + 1));
+	fields =3D malloc(sizeof(*fields) * (count + 1));
+	if (!fields)
+		return NULL;
+
 	for (field =3D list; field; field =3D field->next) {
 		fields[i++] =3D field;
 		if (i =3D=3D count + 1) {
@@ -4672,8 +4924,7 @@ static int find_event_handle(struct pevent *pevent, s=
truct event_format *event)
 }
 =

 /**
- * pevent_parse_event - parse the event format
- * @pevent: the handle to the pevent
+ * __pevent_parse_format - parse the event format
  * @buf: the buffer storing the event format string
  * @size: the size of @buf
  * @sys: the system the event belongs to
@@ -4685,28 +4936,27 @@ static int find_event_handle(struct pevent *pevent,=
 struct event_format *event)
  *
  * /sys/kernel/debug/tracing/events/.../.../format
  */
-int pevent_parse_event(struct pevent *pevent,
-		       const char *buf, unsigned long size,
-		       const char *sys)
+enum pevent_errno __pevent_parse_format(struct event_format **eventp,
+					struct pevent *pevent, const char *buf,
+					unsigned long size, const char *sys)
 {
 	struct event_format *event;
 	int ret;
 =

 	init_input_buf(buf, size);
 =

-	event =3D alloc_event();
+	*eventp =3D event =3D alloc_event();
 	if (!event)
-		return -ENOMEM;
+		return PEVENT_ERRNO__MEM_ALLOC_FAILED;
 =

 	event->name =3D event_read_name();
 	if (!event->name) {
 		/* Bad event? */
-		free(event);
-		return -1;
+		ret =3D PEVENT_ERRNO__MEM_ALLOC_FAILED;
+		goto event_alloc_failed;
 	}
 =

 	if (strcmp(sys, "ftrace") =3D=3D 0) {
-
 		event->flags |=3D EVENT_FL_ISFTRACE;
 =

 		if (strcmp(event->name, "bprint") =3D=3D 0)
@@ -4714,73 +4964,190 @@ int pevent_parse_event(struct pevent *pevent,
 	}
 		=

 	event->id =3D event_read_id();
-	if (event->id < 0)
-		die("failed to read event id");
+	if (event->id < 0) {
+		ret =3D PEVENT_ERRNO__READ_ID_FAILED;
+		/*
+		 * This isn't an allocation error actually.
+		 * But as the ID is critical, just bail out.
+		 */
+		goto event_alloc_failed;
+	}
 =

 	event->system =3D strdup(sys);
-	if (!event->system)
-		die("failed to allocate system");
+	if (!event->system) {
+		ret =3D PEVENT_ERRNO__MEM_ALLOC_FAILED;
+		goto event_alloc_failed;
+	}
 =

 	/* Add pevent to event so that it can be referenced */
 	event->pevent =3D pevent;
 =

 	ret =3D event_read_format(event);
 	if (ret < 0) {
-		do_warning("failed to read event format for %s", event->name);
-		goto event_failed;
+		ret =3D PEVENT_ERRNO__READ_FORMAT_FAILED;
+		goto event_parse_failed;
 	}
 =

 	/*
 	 * If the event has an override, don't print warnings if the event
 	 * print format fails to parse.
 	 */
-	show_warning =3D 0;
+	if (pevent && find_event_handle(pevent, event))
+		show_warning =3D 0;
 =

 	ret =3D event_read_print(event);
-	if (ret < 0) {
-		do_warning("failed to read event print fmt for %s",
-			   event->name);
-		show_warning =3D 1;
-		goto event_failed;
-	}
 	show_warning =3D 1;
 =

-	add_event(pevent, event);
+	if (ret < 0) {
+		ret =3D PEVENT_ERRNO__READ_PRINT_FAILED;
+		goto event_parse_failed;
+	}
 =

 	if (!ret && (event->flags & EVENT_FL_ISFTRACE)) {
 		struct format_field *field;
 		struct print_arg *arg, **list;
 =

 		/* old ftrace had no args */
-
 		list =3D &event->print_fmt.args;
 		for (field =3D event->format.fields; field; field =3D field->next) {
 			arg =3D alloc_arg();
-			*list =3D arg;
-			list =3D &arg->next;
+			if (!arg) {
+				event->flags |=3D EVENT_FL_FAILED;
+				return PEVENT_ERRNO__OLD_FTRACE_ARG_FAILED;
+			}
 			arg->type =3D PRINT_FIELD;
 			arg->field.name =3D strdup(field->name);
 			if (!arg->field.name) {
-				do_warning("failed to allocate field name");
 				event->flags |=3D EVENT_FL_FAILED;
-				return -1;
+				free_arg(arg);
+				return PEVENT_ERRNO__OLD_FTRACE_ARG_FAILED;
 			}
 			arg->field.field =3D field;
+			*list =3D arg;
+			list =3D &arg->next;
 		}
 		return 0;
 	}
 =

+	return 0;
+
+ event_parse_failed:
+	event->flags |=3D EVENT_FL_FAILED;
+	return ret;
+
+ event_alloc_failed:
+	free(event->system);
+	free(event->name);
+	free(event);
+	*eventp =3D NULL;
+	return ret;
+}
+
+/**
+ * pevent_parse_format - parse the event format
+ * @buf: the buffer storing the event format string
+ * @size: the size of @buf
+ * @sys: the system the event belongs to
+ *
+ * This parses the event format and creates an event structure
+ * to quickly parse raw data for a given event.
+ *
+ * These files currently come from:
+ *
+ * /sys/kernel/debug/tracing/events/.../.../format
+ */
+enum pevent_errno pevent_parse_format(struct event_format **eventp, const =
char *buf,
+				      unsigned long size, const char *sys)
+{
+	return __pevent_parse_format(eventp, NULL, buf, size, sys);
+}
+
+/**
+ * pevent_parse_event - parse the event format
+ * @pevent: the handle to the pevent
+ * @buf: the buffer storing the event format string
+ * @size: the size of @buf
+ * @sys: the system the event belongs to
+ *
+ * This parses the event format and creates an event structure
+ * to quickly parse raw data for a given event.
+ *
+ * These files currently come from:
+ *
+ * /sys/kernel/debug/tracing/events/.../.../format
+ */
+enum pevent_errno pevent_parse_event(struct pevent *pevent, const char *bu=
f,
+				     unsigned long size, const char *sys)
+{
+	struct event_format *event =3D NULL;
+	int ret =3D __pevent_parse_format(&event, pevent, buf, size, sys);
+
+	if (event =3D=3D NULL)
+		return ret;
+
+	if (add_event(pevent, event)) {
+		ret =3D PEVENT_ERRNO__MEM_ALLOC_FAILED;
+		goto event_add_failed;
+	}
+
 #define PRINT_ARGS 0
 	if (PRINT_ARGS && event->print_fmt.args)
 		print_args(event->print_fmt.args);
 =

 	return 0;
 =

- event_failed:
-	event->flags |=3D EVENT_FL_FAILED;
-	/* still add it even if it failed */
-	add_event(pevent, event);
-	return -1;
+event_add_failed:
+	pevent_free_format(event);
+	return ret;
+}
+
+#undef _PE
+#define _PE(code, str) str
+static const char * const pevent_error_str[] =3D {
+	PEVENT_ERRORS
+};
+#undef _PE
+
+int pevent_strerror(struct pevent *pevent __maybe_unused,
+		    enum pevent_errno errnum, char *buf, size_t buflen)
+{
+	int idx;
+	const char *msg;
+
+	if (errnum >=3D 0) {
+		msg =3D strerror_r(errnum, buf, buflen);
+		if (msg !=3D buf) {
+			size_t len =3D strlen(msg);
+			memcpy(buf, msg, min(buflen - 1, len));
+			*(buf + min(buflen - 1, len)) =3D '\0';
+		}
+		return 0;
+	}
+
+	if (errnum <=3D __PEVENT_ERRNO__START ||
+	    errnum >=3D __PEVENT_ERRNO__END)
+		return -1;
+
+	idx =3D errnum - __PEVENT_ERRNO__START - 1;
+	msg =3D pevent_error_str[idx];
+
+	switch (errnum) {
+	case PEVENT_ERRNO__MEM_ALLOC_FAILED:
+	case PEVENT_ERRNO__PARSE_EVENT_FAILED:
+	case PEVENT_ERRNO__READ_ID_FAILED:
+	case PEVENT_ERRNO__READ_FORMAT_FAILED:
+	case PEVENT_ERRNO__READ_PRINT_FAILED:
+	case PEVENT_ERRNO__OLD_FTRACE_ARG_FAILED:
+	case PEVENT_ERRNO__INVALID_ARG_TYPE:
+		snprintf(buf, buflen, "%s", msg);
+		break;
+
+	default:
+		/* cannot reach here */
+		break;
+	}
+
+	return 0;
 }
 =

 int get_field_val(struct trace_seq *s, struct format_field *field,
@@ -4999,6 +5366,7 @@ int pevent_register_print_function(struct pevent *pev=
ent,
 	struct pevent_func_params *param;
 	enum pevent_func_arg_type type;
 	va_list ap;
+	int ret;
 =

 	func_handle =3D find_func_handler(pevent, name);
 	if (func_handle) {
@@ -5011,14 +5379,20 @@ int pevent_register_print_function(struct pevent *p=
event,
 		remove_func_handler(pevent, name);
 	}
 =

-	func_handle =3D malloc_or_die(sizeof(*func_handle));
-	memset(func_handle, 0, sizeof(*func_handle));
+	func_handle =3D calloc(1, sizeof(*func_handle));
+	if (!func_handle) {
+		do_warning("Failed to allocate function handler");
+		return PEVENT_ERRNO__MEM_ALLOC_FAILED;
+	}
 =

 	func_handle->ret_type =3D ret_type;
 	func_handle->name =3D strdup(name);
 	func_handle->func =3D func;
-	if (!func_handle->name)
-		die("Failed to allocate function name");
+	if (!func_handle->name) {
+		do_warning("Failed to allocate function name");
+		free(func_handle);
+		return PEVENT_ERRNO__MEM_ALLOC_FAILED;
+	}
 =

 	next_param =3D &(func_handle->params);
 	va_start(ap, name);
@@ -5027,12 +5401,18 @@ int pevent_register_print_function(struct pevent *p=
event,
 		if (type =3D=3D PEVENT_FUNC_ARG_VOID)
 			break;
 =

-		if (type < 0 || type >=3D PEVENT_FUNC_ARG_MAX_TYPES) {
-			warning("Invalid argument type %d", type);
+		if (type >=3D PEVENT_FUNC_ARG_MAX_TYPES) {
+			do_warning("Invalid argument type %d", type);
+			ret =3D PEVENT_ERRNO__INVALID_ARG_TYPE;
 			goto out_free;
 		}
 =

-		param =3D malloc_or_die(sizeof(*param));
+		param =3D malloc(sizeof(*param));
+		if (!param) {
+			do_warning("Failed to allocate function param");
+			ret =3D PEVENT_ERRNO__MEM_ALLOC_FAILED;
+			goto out_free;
+		}
 		param->type =3D type;
 		param->next =3D NULL;
 =

@@ -5050,7 +5430,7 @@ int pevent_register_print_function(struct pevent *pev=
ent,
  out_free:
 	va_end(ap);
 	free_func_handle(func_handle);
-	return -1;
+	return ret;
 }
 =

 /**
@@ -5070,10 +5450,9 @@ int pevent_register_print_function(struct pevent *pe=
vent,
  * If @id is >=3D 0, then it is used to find the event.
  * else @sys_name and @event_name are used.
  */
-int pevent_register_event_handler(struct pevent *pevent,
-				  int id, char *sys_name, char *event_name,
-				  pevent_event_handler_func func,
-				  void *context)
+int pevent_register_event_handler(struct pevent *pevent, int id,
+				  const char *sys_name, const char *event_name,
+				  pevent_event_handler_func func, void *context)
 {
 	struct event_format *event;
 	struct event_handler *handle;
@@ -5102,8 +5481,12 @@ int pevent_register_event_handler(struct pevent *pev=
ent,
 =

  not_found:
 	/* Save for later use. */
-	handle =3D malloc_or_die(sizeof(*handle));
-	memset(handle, 0, sizeof(*handle));
+	handle =3D calloc(1, sizeof(*handle));
+	if (!handle) {
+		do_warning("Failed to allocate event handler");
+		return PEVENT_ERRNO__MEM_ALLOC_FAILED;
+	}
+
 	handle->id =3D id;
 	if (event_name)
 		handle->event_name =3D strdup(event_name);
@@ -5112,7 +5495,11 @@ int pevent_register_event_handler(struct pevent *pev=
ent,
 =

 	if ((event_name && !handle->event_name) ||
 	    (sys_name && !handle->sys_name)) {
-		die("Failed to allocate event/sys name");
+		do_warning("Failed to allocate event/sys name");
+		free((void *)handle->event_name);
+		free((void *)handle->sys_name);
+		free(handle);
+		return PEVENT_ERRNO__MEM_ALLOC_FAILED;
 	}
 =

 	handle->func =3D func;
@@ -5128,13 +5515,10 @@ int pevent_register_event_handler(struct pevent *pe=
vent,
  */
 struct pevent *pevent_alloc(void)
 {
-	struct pevent *pevent;
+	struct pevent *pevent =3D calloc(1, sizeof(*pevent));
 =

-	pevent =3D malloc(sizeof(*pevent));
-	if (!pevent)
-		return NULL;
-	memset(pevent, 0, sizeof(*pevent));
-	pevent->ref_count =3D 1;
+	if (pevent)
+		pevent->ref_count =3D 1;
 =

 	return pevent;
 }
@@ -5163,7 +5547,7 @@ static void free_formats(struct format *format)
 	free_format_fields(format->fields);
 }
 =

-static void free_event(struct event_format *event)
+void pevent_free_format(struct event_format *event)
 {
 	free(event->name);
 	free(event->system);
@@ -5214,7 +5598,7 @@ void pevent_free(struct pevent *pevent)
 	}
 =

 	if (pevent->func_map) {
-		for (i =3D 0; i < pevent->func_count; i++) {
+		for (i =3D 0; i < (int)pevent->func_count; i++) {
 			free(pevent->func_map[i].func);
 			free(pevent->func_map[i].mod);
 		}
@@ -5236,7 +5620,7 @@ void pevent_free(struct pevent *pevent)
 	}
 =

 	if (pevent->printk_map) {
-		for (i =3D 0; i < pevent->printk_count; i++)
+		for (i =3D 0; i < (int)pevent->printk_count; i++)
 			free(pevent->printk_map[i].printk);
 		free(pevent->printk_map);
 	}
@@ -5249,7 +5633,7 @@ void pevent_free(struct pevent *pevent)
 	}
 =

 	for (i =3D 0; i < pevent->nr_events; i++)
-		free_event(pevent->events[i]);
+		pevent_free_format(pevent->events[i]);
 =

 	while (pevent->handlers) {
 		handle =3D pevent->handlers;
diff --git a/traceevent/event-parse.h b/traceevent/event-parse.h
index 1a486ae..c37b202 100644
--- a/traceevent/event-parse.h
+++ b/traceevent/event-parse.h
@@ -13,8 +13,7 @@
  * GNU Lesser General Public License for more details.
  *
  * You should have received a copy of the GNU Lesser General Public
- * License along with this program; if not, write to the Free Software
- * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-130=
1 USA.
+ * License along with this program; if not,  see <http://www.gnu.org/licen=
ses>
  *
  * ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
  */
@@ -24,8 +23,8 @@
 #include <stdarg.h>
 #include <regex.h>
 =

-#ifndef __unused
-#define __unused __attribute__ ((unused))
+#ifndef __maybe_unused
+#define __maybe_unused __attribute__((unused))
 #endif
 =

 /* ----------------------- trace_seq ----------------------- */
@@ -49,7 +48,7 @@ struct pevent_record {
 	int			cpu;
 	int			ref_count;
 	int			locked;		/* Do not free, even if ref_count is zero */
-	void			*p_private;
+	void			*priv;
 #if DEBUG_RECORD
 	struct pevent_record	*prev;
 	struct pevent_record	*next;
@@ -70,6 +69,7 @@ struct trace_seq {
 };
 =

 void trace_seq_init(struct trace_seq *s);
+void trace_seq_reset(struct trace_seq *s);
 void trace_seq_destroy(struct trace_seq *s);
 =

 extern int trace_seq_printf(struct trace_seq *s, const char *fmt, ...)
@@ -106,7 +106,7 @@ struct plugin_option {
 	char				*plugin_alias;
 	char				*description;
 	char				*value;
-	void				*p_private;
+	void				*priv;
 	int				set;
 };
 =

@@ -345,6 +345,35 @@ enum pevent_flag {
 	PEVENT_NSEC_OUTPUT		=3D 1,	/* output in NSECS */
 };
 =

+#define PEVENT_ERRORS 							      \
+	_PE(MEM_ALLOC_FAILED,	"failed to allocate memory"),		      \
+	_PE(PARSE_EVENT_FAILED,	"failed to parse event"),		      \
+	_PE(READ_ID_FAILED,	"failed to read event id"),		      \
+	_PE(READ_FORMAT_FAILED,	"failed to read event format"),		      \
+	_PE(READ_PRINT_FAILED,	"failed to read event print fmt"), 	      \
+	_PE(OLD_FTRACE_ARG_FAILED,"failed to allocate field name for ftrace"),\
+	_PE(INVALID_ARG_TYPE,	"invalid argument type")
+
+#undef _PE
+#define _PE(__code, __str) PEVENT_ERRNO__ ## __code
+enum pevent_errno {
+	PEVENT_ERRNO__SUCCESS			=3D 0,
+
+	/*
+	 * Choose an arbitrary negative big number not to clash with standard
+	 * errno since SUS requires the errno has distinct positive values.
+	 * See 'Issue 6' in the link below.
+	 *
+	 * http://pubs.opengroup.org/onlinepubs/9699919799/basedefs/errno.h.html
+	 */
+	__PEVENT_ERRNO__START			=3D -100000,
+
+	PEVENT_ERRORS,
+
+	__PEVENT_ERRNO__END,
+};
+#undef _PE
+
 struct cmdline;
 struct cmdline_list;
 struct func_map;
@@ -371,6 +400,7 @@ struct pevent {
 =

 	int cpus;
 	int long_size;
+	int page_size;
 =

 	struct cmdline *cmdlines;
 	struct cmdline_list *cmdlist;
@@ -509,8 +539,11 @@ void pevent_print_event(struct pevent *pevent, struct =
trace_seq *s,
 int pevent_parse_header_page(struct pevent *pevent, char *buf, unsigned lo=
ng size,
 			     int long_size);
 =

-int pevent_parse_event(struct pevent *pevent, const char *buf,
-		       unsigned long size, const char *sys);
+enum pevent_errno pevent_parse_event(struct pevent *pevent, const char *bu=
f,
+				     unsigned long size, const char *sys);
+enum pevent_errno pevent_parse_format(struct event_format **eventp, const =
char *buf,
+				      unsigned long size, const char *sys);
+void pevent_free_format(struct event_format *event);
 =

 void *pevent_get_field_raw(struct trace_seq *s, struct event_format *event,
 			   const char *name, struct pevent_record *record,
@@ -530,7 +563,8 @@ int pevent_print_num_field(struct trace_seq *s, const c=
har *fmt,
 			   struct event_format *event, const char *name,
 			   struct pevent_record *record, int err);
 =

-int pevent_register_event_handler(struct pevent *pevent, int id, char *sys=
_name, char *event_name,
+int pevent_register_event_handler(struct pevent *pevent, int id,
+				  const char *sys_name, const char *event_name,
 				  pevent_event_handler_func func, void *context);
 int pevent_register_print_function(struct pevent *pevent,
 				   pevent_func_handler func,
@@ -561,6 +595,8 @@ int pevent_data_pid(struct pevent *pevent, struct peven=
t_record *rec);
 const char *pevent_data_comm_from_pid(struct pevent *pevent, int pid);
 void pevent_event_info(struct trace_seq *s, struct event_format *event,
 		       struct pevent_record *record);
+int pevent_strerror(struct pevent *pevent, enum pevent_errno errnum,
+		    char *buf, size_t buflen);
 =

 struct event_format **pevent_list_events(struct pevent *pevent, enum event=
_sort_type);
 struct format_field **pevent_event_common_fields(struct event_format *even=
t);
@@ -586,6 +622,16 @@ static inline void pevent_set_long_size(struct pevent =
*pevent, int long_size)
 	pevent->long_size =3D long_size;
 }
 =

+static inline int pevent_get_page_size(struct pevent *pevent)
+{
+	return pevent->page_size;
+}
+
+static inline void pevent_set_page_size(struct pevent *pevent, int _page_s=
ize)
+{
+	pevent->page_size =3D _page_size;
+}
+
 static inline int pevent_is_file_bigendian(struct pevent *pevent)
 {
 	return pevent->file_bigendian;
diff --git a/traceevent/event-utils.h b/traceevent/event-utils.h
index 0829638..e76c9ac 100644
--- a/traceevent/event-utils.h
+++ b/traceevent/event-utils.h
@@ -13,8 +13,7 @@
  * GNU Lesser General Public License for more details.
  *
  * You should have received a copy of the GNU Lesser General Public
- * License along with this program; if not, write to the Free Software
- * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-130=
1 USA.
+ * License along with this program; if not,  see <http://www.gnu.org/licen=
ses>
  *
  * ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
  */
@@ -39,6 +38,12 @@ void __vdie(const char *fmt, ...);
 void __vwarning(const char *fmt, ...);
 void __vpr_stat(const char *fmt, ...);
 =

+#define min(x, y) ({				\
+	typeof(x) _min1 =3D (x);			\
+	typeof(y) _min2 =3D (y);			\
+	(void) (&_min1 =3D=3D &_min2);		\
+	_min1 < _min2 ? _min1 : _min2; })
+
 static inline char *strim(char *string)
 {
 	char *ret;
diff --git a/traceevent/kbuffer-parse.c b/traceevent/kbuffer-parse.c
new file mode 100644
index 0000000..dcc6652
--- /dev/null
+++ b/traceevent/kbuffer-parse.c
@@ -0,0 +1,732 @@
+/*
+ * Copyright (C) 2009, 2010 Red Hat Inc, Steven Rostedt <srostedt(a)redhat=
.com>
+ *
+ * ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU Lesser General Public
+ * License as published by the Free Software Foundation;
+ * version 2.1 of the License (not later!)
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU Lesser General Public License for more details.
+ *
+ * You should have received a copy of the GNU Lesser General Public
+ * License along with this program; if not, write to the Free Software
+ * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-130=
1 USA.
+ *
+ * ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
+ */
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+
+#include "kbuffer.h"
+
+#define MISSING_EVENTS (1 << 31)
+#define MISSING_STORED (1 << 30)
+
+#define COMMIT_MASK ((1 << 27) - 1)
+
+enum {
+	KBUFFER_FL_HOST_BIG_ENDIAN	=3D (1<<0),
+	KBUFFER_FL_BIG_ENDIAN		=3D (1<<1),
+	KBUFFER_FL_LONG_8		=3D (1<<2),
+	KBUFFER_FL_OLD_FORMAT		=3D (1<<3),
+};
+
+#define ENDIAN_MASK (KBUFFER_FL_HOST_BIG_ENDIAN | KBUFFER_FL_BIG_ENDIAN)
+
+/** kbuffer
+ * @timestamp		- timestamp of current event
+ * @lost_events		- # of lost events between this subbuffer and previous
+ * @flags		- special flags of the kbuffer
+ * @subbuffer		- pointer to the sub-buffer page
+ * @data		- pointer to the start of data on the sub-buffer page
+ * @index		- index from @data to the @curr event data
+ * @curr		- offset from @data to the start of current event
+ *			   (includes metadata)
+ * @next		- offset from @data to the start of next event
+ * @size		- The size of data on @data
+ * @start		- The offset from @subbuffer where @data lives
+ *
+ * @read_4		- Function to read 4 raw bytes (may swap)
+ * @read_8		- Function to read 8 raw bytes (may swap)
+ * @read_long		- Function to read a long word (4 or 8 bytes with needed sw=
ap)
+ */
+struct kbuffer {
+	unsigned long long 	timestamp;
+	long long		lost_events;
+	unsigned long		flags;
+	void			*subbuffer;
+	void			*data;
+	unsigned int		index;
+	unsigned int		curr;
+	unsigned int		next;
+	unsigned int		size;
+	unsigned int		start;
+
+	unsigned int (*read_4)(void *ptr);
+	unsigned long long (*read_8)(void *ptr);
+	unsigned long long (*read_long)(struct kbuffer *kbuf, void *ptr);
+	int (*next_event)(struct kbuffer *kbuf);
+};
+
+static void *zmalloc(size_t size)
+{
+	return calloc(1, size);
+}
+
+static int host_is_bigendian(void)
+{
+	unsigned char str[] =3D { 0x1, 0x2, 0x3, 0x4 };
+	unsigned int *ptr;
+
+	ptr =3D (unsigned int *)str;
+	return *ptr =3D=3D 0x01020304;
+}
+
+static int do_swap(struct kbuffer *kbuf)
+{
+	return ((kbuf->flags & KBUFFER_FL_HOST_BIG_ENDIAN) + kbuf->flags) &
+		ENDIAN_MASK;
+}
+
+static unsigned long long __read_8(void *ptr)
+{
+	unsigned long long data =3D *(unsigned long long *)ptr;
+
+	return data;
+}
+
+static unsigned long long __read_8_sw(void *ptr)
+{
+	unsigned long long data =3D *(unsigned long long *)ptr;
+	unsigned long long swap;
+
+	swap =3D ((data & 0xffULL) << 56) |
+		((data & (0xffULL << 8)) << 40) |
+		((data & (0xffULL << 16)) << 24) |
+		((data & (0xffULL << 24)) << 8) |
+		((data & (0xffULL << 32)) >> 8) |
+		((data & (0xffULL << 40)) >> 24) |
+		((data & (0xffULL << 48)) >> 40) |
+		((data & (0xffULL << 56)) >> 56);
+
+	return swap;
+}
+
+static unsigned int __read_4(void *ptr)
+{
+	unsigned int data =3D *(unsigned int *)ptr;
+
+	return data;
+}
+
+static unsigned int __read_4_sw(void *ptr)
+{
+	unsigned int data =3D *(unsigned int *)ptr;
+	unsigned int swap;
+
+	swap =3D ((data & 0xffULL) << 24) |
+		((data & (0xffULL << 8)) << 8) |
+		((data & (0xffULL << 16)) >> 8) |
+		((data & (0xffULL << 24)) >> 24);
+
+	return swap;
+}
+
+static unsigned long long read_8(struct kbuffer *kbuf, void *ptr)
+{
+	return kbuf->read_8(ptr);
+}
+
+static unsigned int read_4(struct kbuffer *kbuf, void *ptr)
+{
+	return kbuf->read_4(ptr);
+}
+
+static unsigned long long __read_long_8(struct kbuffer *kbuf, void *ptr)
+{
+	return kbuf->read_8(ptr);
+}
+
+static unsigned long long __read_long_4(struct kbuffer *kbuf, void *ptr)
+{
+	return kbuf->read_4(ptr);
+}
+
+static unsigned long long read_long(struct kbuffer *kbuf, void *ptr)
+{
+	return kbuf->read_long(kbuf, ptr);
+}
+
+static int calc_index(struct kbuffer *kbuf, void *ptr)
+{
+	return (unsigned long)ptr - (unsigned long)kbuf->data;
+}
+
+static int __next_event(struct kbuffer *kbuf);
+
+/**
+ * kbuffer_alloc - allocat a new kbuffer
+ * @size;	enum to denote size of word
+ * @endian:	enum to denote endianness
+ *
+ * Allocates and returns a new kbuffer.
+ */
+struct kbuffer *
+kbuffer_alloc(enum kbuffer_long_size size, enum kbuffer_endian endian)
+{
+	struct kbuffer *kbuf;
+	int flags =3D 0;
+
+	switch (size) {
+	case KBUFFER_LSIZE_4:
+		break;
+	case KBUFFER_LSIZE_8:
+		flags |=3D KBUFFER_FL_LONG_8;
+		break;
+	default:
+		return NULL;
+	}
+
+	switch (endian) {
+	case KBUFFER_ENDIAN_LITTLE:
+		break;
+	case KBUFFER_ENDIAN_BIG:
+		flags |=3D KBUFFER_FL_BIG_ENDIAN;
+		break;
+	default:
+		return NULL;
+	}
+
+	kbuf =3D zmalloc(sizeof(*kbuf));
+	if (!kbuf)
+		return NULL;
+
+	kbuf->flags =3D flags;
+
+	if (host_is_bigendian())
+		kbuf->flags |=3D KBUFFER_FL_HOST_BIG_ENDIAN;
+
+	if (do_swap(kbuf)) {
+		kbuf->read_8 =3D __read_8_sw;
+		kbuf->read_4 =3D __read_4_sw;
+	} else {
+		kbuf->read_8 =3D __read_8;
+		kbuf->read_4 =3D __read_4;
+	}
+
+	if (kbuf->flags & KBUFFER_FL_LONG_8)
+		kbuf->read_long =3D __read_long_8;
+	else
+		kbuf->read_long =3D __read_long_4;
+
+	/* May be changed by kbuffer_set_old_format() */
+	kbuf->next_event =3D __next_event;
+
+	return kbuf;
+}
+
+/** kbuffer_free - free an allocated kbuffer
+ * @kbuf:	The kbuffer to free
+ *
+ * Can take NULL as a parameter.
+ */
+void kbuffer_free(struct kbuffer *kbuf)
+{
+	free(kbuf);
+}
+
+static unsigned int type4host(struct kbuffer *kbuf,
+			      unsigned int type_len_ts)
+{
+	if (kbuf->flags & KBUFFER_FL_BIG_ENDIAN)
+		return (type_len_ts >> 29) & 3;
+	else
+		return type_len_ts & 3;
+}
+
+static unsigned int len4host(struct kbuffer *kbuf,
+			     unsigned int type_len_ts)
+{
+	if (kbuf->flags & KBUFFER_FL_BIG_ENDIAN)
+		return (type_len_ts >> 27) & 7;
+	else
+		return (type_len_ts >> 2) & 7;
+}
+
+static unsigned int type_len4host(struct kbuffer *kbuf,
+				  unsigned int type_len_ts)
+{
+	if (kbuf->flags & KBUFFER_FL_BIG_ENDIAN)
+		return (type_len_ts >> 27) & ((1 << 5) - 1);
+	else
+		return type_len_ts & ((1 << 5) - 1);
+}
+
+static unsigned int ts4host(struct kbuffer *kbuf,
+			    unsigned int type_len_ts)
+{
+	if (kbuf->flags & KBUFFER_FL_BIG_ENDIAN)
+		return type_len_ts & ((1 << 27) - 1);
+	else
+		return type_len_ts >> 5;
+}
+
+/*
+ * Linux 2.6.30 and earlier (not much ealier) had a different
+ * ring buffer format. It should be obsolete, but we handle it anyway.
+ */
+enum old_ring_buffer_type {
+	OLD_RINGBUF_TYPE_PADDING,
+	OLD_RINGBUF_TYPE_TIME_EXTEND,
+	OLD_RINGBUF_TYPE_TIME_STAMP,
+	OLD_RINGBUF_TYPE_DATA,
+};
+
+static unsigned int old_update_pointers(struct kbuffer *kbuf)
+{
+	unsigned long long extend;
+	unsigned int type_len_ts;
+	unsigned int type;
+	unsigned int len;
+	unsigned int delta;
+	unsigned int length;
+	void *ptr =3D kbuf->data + kbuf->curr;
+
+	type_len_ts =3D read_4(kbuf, ptr);
+	ptr +=3D 4;
+
+	type =3D type4host(kbuf, type_len_ts);
+	len =3D len4host(kbuf, type_len_ts);
+	delta =3D ts4host(kbuf, type_len_ts);
+
+	switch (type) {
+	case OLD_RINGBUF_TYPE_PADDING:
+		kbuf->next =3D kbuf->size;
+		return 0;
+
+	case OLD_RINGBUF_TYPE_TIME_EXTEND:
+		extend =3D read_4(kbuf, ptr);
+		extend <<=3D TS_SHIFT;
+		extend +=3D delta;
+		delta =3D extend;
+		ptr +=3D 4;
+		break;
+
+	case OLD_RINGBUF_TYPE_TIME_STAMP:
+		/* should never happen! */
+		kbuf->curr =3D kbuf->size;
+		kbuf->next =3D kbuf->size;
+		kbuf->index =3D kbuf->size;
+		return -1;
+	default:
+		if (len)
+			length =3D len * 4;
+		else {
+			length =3D read_4(kbuf, ptr);
+			length -=3D 4;
+			ptr +=3D 4;
+		}
+		break;
+	}
+
+	kbuf->timestamp +=3D delta;
+	kbuf->index =3D calc_index(kbuf, ptr);
+	kbuf->next =3D kbuf->index + length;
+
+	return type;
+}
+
+static int __old_next_event(struct kbuffer *kbuf)
+{
+	int type;
+
+	do {
+		kbuf->curr =3D kbuf->next;
+		if (kbuf->next >=3D kbuf->size)
+			return -1;
+		type =3D old_update_pointers(kbuf);
+	} while (type =3D=3D OLD_RINGBUF_TYPE_TIME_EXTEND || type =3D=3D OLD_RING=
BUF_TYPE_PADDING);
+
+	return 0;
+}
+
+static unsigned int
+translate_data(struct kbuffer *kbuf, void *data, void **rptr,
+	       unsigned long long *delta, int *length)
+{
+	unsigned long long extend;
+	unsigned int type_len_ts;
+	unsigned int type_len;
+
+	type_len_ts =3D read_4(kbuf, data);
+	data +=3D 4;
+
+	type_len =3D type_len4host(kbuf, type_len_ts);
+	*delta =3D ts4host(kbuf, type_len_ts);
+
+	switch (type_len) {
+	case KBUFFER_TYPE_PADDING:
+		*length =3D read_4(kbuf, data);
+		data +=3D *length;
+		break;
+
+	case KBUFFER_TYPE_TIME_EXTEND:
+		extend =3D read_4(kbuf, data);
+		data +=3D 4;
+		extend <<=3D TS_SHIFT;
+		extend +=3D *delta;
+		*delta =3D extend;
+		*length =3D 0;
+		break;
+
+	case KBUFFER_TYPE_TIME_STAMP:
+		data +=3D 12;
+		*length =3D 0;
+		break;
+	case 0:
+		*length =3D read_4(kbuf, data) - 4;
+		*length =3D (*length + 3) & ~3;
+		data +=3D 4;
+		break;
+	default:
+		*length =3D type_len * 4;
+		break;
+	}
+
+	*rptr =3D data;
+
+	return type_len;
+}
+
+static unsigned int update_pointers(struct kbuffer *kbuf)
+{
+	unsigned long long delta;
+	unsigned int type_len;
+	int length;
+	void *ptr =3D kbuf->data + kbuf->curr;
+
+	type_len =3D translate_data(kbuf, ptr, &ptr, &delta, &length);
+
+	kbuf->timestamp +=3D delta;
+	kbuf->index =3D calc_index(kbuf, ptr);
+	kbuf->next =3D kbuf->index + length;
+
+	return type_len;
+}
+
+/**
+ * kbuffer_translate_data - read raw data to get a record
+ * @swap:	Set to 1 if bytes in words need to be swapped when read
+ * @data:	The raw data to read
+ * @size:	Address to store the size of the event data.
+ *
+ * Returns a pointer to the event data. To determine the entire
+ * record size (record metadata + data) just add the difference between
+ * @data and the returned value to @size.
+ */
+void *kbuffer_translate_data(int swap, void *data, unsigned int *size)
+{
+	unsigned long long delta;
+	struct kbuffer kbuf;
+	int type_len;
+	int length;
+	void *ptr;
+
+	if (swap) {
+		kbuf.read_8 =3D __read_8_sw;
+		kbuf.read_4 =3D __read_4_sw;
+		kbuf.flags =3D host_is_bigendian() ? 0 : KBUFFER_FL_BIG_ENDIAN;
+	} else {
+		kbuf.read_8 =3D __read_8;
+		kbuf.read_4 =3D __read_4;
+		kbuf.flags =3D host_is_bigendian() ? KBUFFER_FL_BIG_ENDIAN: 0;
+	}
+
+	type_len =3D translate_data(&kbuf, data, &ptr, &delta, &length);
+	switch (type_len) {
+	case KBUFFER_TYPE_PADDING:
+	case KBUFFER_TYPE_TIME_EXTEND:
+	case KBUFFER_TYPE_TIME_STAMP:
+		return NULL;
+	};
+
+	*size =3D length;
+
+	return ptr;
+}
+
+static int __next_event(struct kbuffer *kbuf)
+{
+	int type;
+
+	do {
+		kbuf->curr =3D kbuf->next;
+		if (kbuf->next >=3D kbuf->size)
+			return -1;
+		type =3D update_pointers(kbuf);
+	} while (type =3D=3D KBUFFER_TYPE_TIME_EXTEND || type =3D=3D KBUFFER_TYPE=
_PADDING);
+
+	return 0;
+}
+
+static int next_event(struct kbuffer *kbuf)
+{
+	return kbuf->next_event(kbuf);
+}
+
+/**
+ * kbuffer_next_event - increment the current pointer
+ * @kbuf:	The kbuffer to read
+ * @ts:		Address to store the next record's timestamp (may be NULL to igno=
re)
+ *
+ * Increments the pointers into the subbuffer of the kbuffer to point to t=
he
+ * next event so that the next kbuffer_read_event() will return a
+ * new event.
+ *
+ * Returns the data of the next event if a new event exists on the subbuff=
er,
+ * NULL otherwise.
+ */
+void *kbuffer_next_event(struct kbuffer *kbuf, unsigned long long *ts)
+{
+	int ret;
+
+	if (!kbuf || !kbuf->subbuffer)
+		return NULL;
+
+	ret =3D next_event(kbuf);
+	if (ret < 0)
+		return NULL;
+
+	if (ts)
+		*ts =3D kbuf->timestamp;
+
+	return kbuf->data + kbuf->index;
+}
+
+/**
+ * kbuffer_load_subbuffer - load a new subbuffer into the kbuffer
+ * @kbuf:	The kbuffer to load
+ * @subbuffer:	The subbuffer to load into @kbuf.
+ *
+ * Load a new subbuffer (page) into @kbuf. This will reset all
+ * the pointers and update the @kbuf timestamp. The next read will
+ * return the first event on @subbuffer.
+ *
+ * Returns 0 on succes, -1 otherwise.
+ */
+int kbuffer_load_subbuffer(struct kbuffer *kbuf, void *subbuffer)
+{
+	unsigned long long flags;
+	void *ptr =3D subbuffer;
+
+	if (!kbuf || !subbuffer)
+		return -1;
+
+	kbuf->subbuffer =3D subbuffer;
+
+	kbuf->timestamp =3D read_8(kbuf, ptr);
+	ptr +=3D 8;
+
+	kbuf->curr =3D 0;
+
+	if (kbuf->flags & KBUFFER_FL_LONG_8)
+		kbuf->start =3D 16;
+	else
+		kbuf->start =3D 12;
+
+	kbuf->data =3D subbuffer + kbuf->start;
+
+	flags =3D read_long(kbuf, ptr);
+	kbuf->size =3D (unsigned int)flags & COMMIT_MASK;
+
+	if (flags & MISSING_EVENTS) {
+		if (flags & MISSING_STORED) {
+			ptr =3D kbuf->data + kbuf->size;
+			kbuf->lost_events =3D read_long(kbuf, ptr);
+		} else
+			kbuf->lost_events =3D -1;
+	} else
+		kbuf->lost_events =3D 0;
+
+	kbuf->index =3D 0;
+	kbuf->next =3D 0;
+
+	next_event(kbuf);
+
+	return 0;
+}
+
+/**
+ * kbuffer_read_event - read the next event in the kbuffer subbuffer
+ * @kbuf:	The kbuffer to read from
+ * @ts:		The address to store the timestamp of the event (may be NULL to i=
gnore)
+ *
+ * Returns a pointer to the data part of the current event.
+ * NULL if no event is left on the subbuffer.
+ */
+void *kbuffer_read_event(struct kbuffer *kbuf, unsigned long long *ts)
+{
+	if (!kbuf || !kbuf->subbuffer)
+		return NULL;
+
+	if (kbuf->curr >=3D kbuf->size)
+		return NULL;
+
+	if (ts)
+		*ts =3D kbuf->timestamp;
+	return kbuf->data + kbuf->index;
+}
+
+/**
+ * kbuffer_timestamp - Return the timestamp of the current event
+ * @kbuf:	The kbuffer to read from
+ *
+ * Returns the timestamp of the current (next) event.
+ */
+unsigned long long kbuffer_timestamp(struct kbuffer *kbuf)
+{
+	return kbuf->timestamp;
+}
+
+/**
+ * kbuffer_read_at_offset - read the event that is at offset
+ * @kbuf:	The kbuffer to read from
+ * @offset:	The offset into the subbuffer
+ * @ts:		The address to store the timestamp of the event (may be NULL to i=
gnore)
+ *
+ * The @offset must be an index from the @kbuf subbuffer beginning.
+ * If @offset is bigger than the stored subbuffer, NULL will be returned.
+ *
+ * Returns the data of the record that is at @offset. Note, @offset does
+ * not need to be the start of the record, the offset just needs to be
+ * in the record (or beginning of it).
+ *
+ * Note, the kbuf timestamp and pointers are updated to the
+ * returned record. That is, kbuffer_read_event() will return the same
+ * data and timestamp, and kbuffer_next_event() will increment from
+ * this record.
+ */
+void *kbuffer_read_at_offset(struct kbuffer *kbuf, int offset,
+			     unsigned long long *ts)
+{
+	void *data;
+
+	if (offset < kbuf->start)
+		offset =3D 0;
+	else
+		offset -=3D kbuf->start;
+
+	/* Reset the buffer */
+	kbuffer_load_subbuffer(kbuf, kbuf->subbuffer);
+
+	while (kbuf->curr < offset) {
+		data =3D kbuffer_next_event(kbuf, ts);
+		if (!data)
+			break;
+	}
+
+	return data;
+}
+
+/**
+ * kbuffer_subbuffer_size - the size of the loaded subbuffer
+ * @kbuf:	The kbuffer to read from
+ *
+ * Returns the size of the subbuffer. Note, this size is
+ * where the last event resides. The stored subbuffer may actually be
+ * bigger due to padding and such.
+ */
+int kbuffer_subbuffer_size(struct kbuffer *kbuf)
+{
+	return kbuf->size;
+}
+
+/**
+ * kbuffer_curr_index - Return the index of the record
+ * @kbuf:	The kbuffer to read from
+ *
+ * Returns the index from the start of the data part of
+ * the subbuffer to the current location. Note this is not
+ * from the start of the subbuffer. An index of zero will
+ * point to the first record. Use kbuffer_curr_offset() for
+ * the actually offset (that can be used by kbuffer_read_at_offset())
+ */
+int kbuffer_curr_index(struct kbuffer *kbuf)
+{
+	return kbuf->curr;
+}
+
+/**
+ * kbuffer_curr_offset - Return the offset of the record
+ * @kbuf:	The kbuffer to read from
+ *
+ * Returns the offset from the start of the subbuffer to the
+ * current location.
+ */
+int kbuffer_curr_offset(struct kbuffer *kbuf)
+{
+	return kbuf->curr + kbuf->start;
+}
+
+/**
+ * kbuffer_event_size - return the size of the event data
+ * @kbuf:	The kbuffer to read
+ *
+ * Returns the size of the event data (the payload not counting
+ * the meta data of the record) of the current event.
+ */
+int kbuffer_event_size(struct kbuffer *kbuf)
+{
+	return kbuf->next - kbuf->index;
+}
+
+/**
+ * kbuffer_curr_size - return the size of the entire record
+ * @kbuf:	The kbuffer to read
+ *
+ * Returns the size of the entire record (meta data and payload)
+ * of the current event.
+ */
+int kbuffer_curr_size(struct kbuffer *kbuf)
+{
+	return kbuf->next - kbuf->curr;
+}
+
+/**
+ * kbuffer_missed_events - return the # of missed events from last event.
+ * @kbuf: 	The kbuffer to read from
+ *
+ * Returns the # of missed events (if recorded) before the current
+ * event. Note, only events on the beginning of a subbuffer can
+ * have missed events, all other events within the buffer will be
+ * zero.
+ */
+int kbuffer_missed_events(struct kbuffer *kbuf)
+{
+	/* Only the first event can have missed events */
+	if (kbuf->curr)
+		return 0;
+
+	return kbuf->lost_events;
+}
+
+/**
+ * kbuffer_set_old_forma - set the kbuffer to use the old format parsing
+ * @kbuf:	The kbuffer to set
+ *
+ * This is obsolete (or should be). The first kernels to use the
+ * new ring buffer had a slightly different ring buffer format
+ * (2.6.30 and earlier). It is still somewhat supported by kbuffer,
+ * but should not be counted on in the future.
+ */
+void kbuffer_set_old_format(struct kbuffer *kbuf)
+{
+	kbuf->flags |=3D KBUFFER_FL_OLD_FORMAT;
+
+	kbuf->next_event =3D __old_next_event;
+}
diff --git a/traceevent/kbuffer.h b/traceevent/kbuffer.h
new file mode 100644
index 0000000..c831f64
--- /dev/null
+++ b/traceevent/kbuffer.h
@@ -0,0 +1,67 @@
+/*
+ * Copyright (C) 2012 Red Hat Inc, Steven Rostedt <srostedt(a)redhat.com>
+ *
+ * ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU Lesser General Public
+ * License as published by the Free Software Foundation;
+ * version 2.1 of the License (not later!)
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU Lesser General Public License for more details.
+ *
+ * You should have received a copy of the GNU Lesser General Public
+ * License along with this program; if not, write to the Free Software
+ * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-130=
1 USA.
+ *
+ * ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
+ */
+#ifndef _KBUFFER_H
+#define _KBUFFER_H
+
+#ifndef TS_SHIFT
+#define TS_SHIFT		27
+#endif
+
+enum kbuffer_endian {
+	KBUFFER_ENDIAN_BIG,
+	KBUFFER_ENDIAN_LITTLE,
+};
+
+enum kbuffer_long_size {
+	KBUFFER_LSIZE_4,
+	KBUFFER_LSIZE_8,
+};
+
+enum {
+	KBUFFER_TYPE_PADDING		=3D 29,
+	KBUFFER_TYPE_TIME_EXTEND	=3D 30,
+	KBUFFER_TYPE_TIME_STAMP		=3D 31,
+};
+
+struct kbuffer;
+
+struct kbuffer *kbuffer_alloc(enum kbuffer_long_size size, enum kbuffer_en=
dian endian);
+void kbuffer_free(struct kbuffer *kbuf);
+int kbuffer_load_subbuffer(struct kbuffer *kbuf, void *subbuffer);
+void *kbuffer_read_event(struct kbuffer *kbuf, unsigned long long *ts);
+void *kbuffer_next_event(struct kbuffer *kbuf, unsigned long long *ts);
+unsigned long long kbuffer_timestamp(struct kbuffer *kbuf);
+
+void *kbuffer_translate_data(int swap, void *data, unsigned int *size);
+
+void *kbuffer_read_at_offset(struct kbuffer *kbuf, int offset, unsigned lo=
ng long *ts);
+
+int kbuffer_curr_index(struct kbuffer *kbuf);
+
+int kbuffer_curr_offset(struct kbuffer *kbuf);
+int kbuffer_curr_size(struct kbuffer *kbuf);
+int kbuffer_event_size(struct kbuffer *kbuf);
+int kbuffer_missed_events(struct kbuffer *kbuf);
+int kbuffer_subbuffer_size(struct kbuffer *kbuf);
+
+void kbuffer_set_old_format(struct kbuffer *kbuf);
+
+#endif /* _K_BUFFER_H */
diff --git a/traceevent/parse-filter.c b/traceevent/parse-filter.c
index ad17855..2500e75 100644
--- a/traceevent/parse-filter.c
+++ b/traceevent/parse-filter.c
@@ -13,8 +13,7 @@
  * GNU Lesser General Public License for more details.
  *
  * You should have received a copy of the GNU Lesser General Public
- * License along with this program; if not, write to the Free Software
- * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-130=
1 USA.
+ * License along with this program; if not,  see <http://www.gnu.org/licen=
ses>
  *
  * ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
  */
@@ -209,7 +208,16 @@ static void free_arg(struct filter_arg *arg)
 	switch (arg->type) {
 	case FILTER_ARG_NONE:
 	case FILTER_ARG_BOOLEAN:
+		break;
+
 	case FILTER_ARG_NUM:
+		free_arg(arg->num.left);
+		free_arg(arg->num.right);
+		break;
+
+	case FILTER_ARG_EXP:
+		free_arg(arg->exp.left);
+		free_arg(arg->exp.right);
 		break;
 =

 	case FILTER_ARG_STR:
@@ -218,6 +226,12 @@ static void free_arg(struct filter_arg *arg)
 		free(arg->str.buffer);
 		break;
 =

+	case FILTER_ARG_VALUE:
+		if (arg->value.type =3D=3D FILTER_STRING ||
+		    arg->value.type =3D=3D FILTER_CHAR)
+			free(arg->value.str);
+		break;
+
 	case FILTER_ARG_OP:
 		free_arg(arg->op.left);
 		free_arg(arg->op.right);
diff --git a/traceevent/parse-utils.c b/traceevent/parse-utils.c
index f023a13..bba701c 100644
--- a/traceevent/parse-utils.c
+++ b/traceevent/parse-utils.c
@@ -1,3 +1,22 @@
+/*
+ * Copyright (C) 2010 Red Hat Inc, Steven Rostedt <srostedt(a)redhat.com>
+ *
+ * ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU Lesser General Public
+ * License as published by the Free Software Foundation;
+ * version 2.1 of the License (not later!)
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU Lesser General Public License for more details.
+ *
+ * You should have received a copy of the GNU Lesser General Public
+ * License along with this program; if not,  see <http://www.gnu.org/licen=
ses>
+ *
+ * ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
+ */
 #include <stdio.h>
 #include <stdlib.h>
 #include <string.h>
diff --git a/traceevent/trace-seq.c b/traceevent/trace-seq.c
index b1ccc92..d7f2e68 100644
--- a/traceevent/trace-seq.c
+++ b/traceevent/trace-seq.c
@@ -13,8 +13,7 @@
  * GNU Lesser General Public License for more details.
  *
  * You should have received a copy of the GNU Lesser General Public
- * License along with this program; if not, write to the Free Software
- * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-130=
1 USA.
+ * License along with this program; if not,  see <http://www.gnu.org/licen=
ses>
  *
  * ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
  */
@@ -50,6 +49,19 @@ void trace_seq_init(struct trace_seq *s)
 }
 =

 /**
+ * trace_seq_reset - re-initialize the trace_seq structure
+ * @s: a pointer to the trace_seq structure to reset
+ */
+void trace_seq_reset(struct trace_seq *s)
+{
+	if (!s)
+		return;
+	TRACE_SEQ_CHECK(s);
+	s->len =3D 0;
+	s->readpos =3D 0;
+}
+
+/**
  * trace_seq_destroy - free up memory of a trace_seq
  * @s: a pointer to the trace_seq to free the buffer
  *


--===============6857548368085683455==--

