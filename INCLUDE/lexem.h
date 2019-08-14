

#ifndef lexem_h
#define lexem_h

static int (*trshoot)(const char*message) = &puts;

enum lexemtype {
	IDENTIFIER,
	STRLNGLITERAL,
	NUMLITERAL,
	SPECIAL,
	NONE
};

enum splexems{
    arrow,
	EOL,
	dot,
	ORBracket,
	CRBracket,
	Obrace,
	Cbrace,
	OSbracket,
	CSbracket,
	comma,
	colon,
	equal,
	nequal,
	lt,
	gt,
	le,
	ge,
	inpadd,
	inpsub,
	inpmult,
	inpdiv,
	assign,
	plus,
	minus,
	asterisk,
	slash,
	kw_logical_or,
	kw_logical_and,
	kw_logical_not,
	kwif,
	kwfor,
    kwtrue,
    kwfalse,
	kwelse,
	kwfunc,
	kwclass,
	kwasync,
	kwwrite,
    kwimport,
    kwin,
    kwreturn,
	indent,
	dedent
};

static const char* ltext[] = {"->","$eol",".", "(", ")", "{", "}", "[", "]", ",", ":", "==", "!=", "<", ">", "<=", ">=", "+=", "-=", "*=", "/=", "=", "+", "-", "*", "/", "or", "and", "not", "if", "for", "true", "false", "else", "fun", "class", "async", "write", "import", "in", "return", "$indent", "$dedent" };

static const int ltextcount = indent;

struct _dulparser;
typedef struct {
	enum lexemtype t;
	enum splexems sp;
	
	char* 	literal;
	double 	num; //equals
	int		line_no;		// Line # in file
	int		line_pos;		// # column in source line
	struct _dulparser * parser;
} lexem;

char*		lexem_print_name( const lexem* lex, char* buf, int bufsize );




#endif /* lexem_h */
