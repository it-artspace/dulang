

#ifndef ast_h
#define ast_h

#include "parser.h"
#include <stdarg.h>

enum asttype {
    SUBSCR,
	COMPOUND,
	ASSIGN,
	INPLADD,
	INPLSUB,
	INPLMULT,
	INPLDIV,
	MKTUPLE,
	LESSTHAN,
	LESSEQ,
	GREATERTHAN,
	GREATEREQ,
	EQUAL,
	NEQUAL,
	LOGOR,
	LOGAND,
	LOGNOT,
	FUNCCALL,
	DECL,
	FUNCDEF,
	WRITE,
	IFSTAT,
	PLUS,
	MINUS,
	MULT,
	DIV,
	NUMLIT,
	STRLIT,
    BOOLLIT,
	NAME,
    INOP,
    FORSTAT,
    ASYNC,
    NULL_,
    DULRETURN,
    MODULE,
    UNPACK_ITER,
    IMPORT,
    EXPR,
    WHILE,
    CLASS,
    OBJECT
};

typedef struct _an{
	int children_count;
	int ch_capacity;
	enum asttype type;
	struct _an** children;
	struct _an*	 parent;
	void* val;
    int lineno;
    int linepos;
    char * fname;
} astnode;

astnode*	astnode_new			( enum asttype type, int capacity, int children, ... );
void		astnode_emplace 	( astnode* parent, astnode* node, enum asttype type, int capacity, int children, ... );
void		astnode_emplace_va 	( astnode* parent, astnode* node, enum asttype type, int capacity, int children, va_list va );
void		astnode_print		( astnode* node );
void		astnode_print_impl	( astnode* node, int depth );
void		astnode_delete		( astnode* node );
void		astnode_add_child	( astnode* parent, astnode* child );

void		parse_error			( dulparser* parser, const char* format, ... );
void		parse_error_at		( lexem* currlexem, const char* format, ... );
void		parse_error_at_va	( lexem* currlexem, const char* format, va_list va );

astnode*	parse_file			( const char* );
astnode*	parse_compound		( dulparser* parser );
astnode*	parse_statement		( dulparser* parser );
astnode*	parse_expression	( dulparser* parser );
astnode*	parse_lrvalue		( dulparser* parser );
astnode*    parse_lambda        ( dulparser* parser );
astnode*	parse_logical_or	( dulparser* parser );
astnode*	parse_logical_and	( dulparser* parser );
astnode*    parse_in            ( dulparser* parser );
astnode* 	parse_comparison	( dulparser* parser );
astnode* 	parse_plusminus		( dulparser* parser );
astnode* 	parse_multdiv		( dulparser* parser );
astnode* 	parse_unaryprefix	( dulparser* parser );
astnode*	parse_postfix		( dulparser* parser );
astnode* 	parse_toplevel		( dulparser* parser );

astnode* 	parse_subexpr		( dulparser* parser, enum splexems closing_lexem );

#endif /* ast_h */
