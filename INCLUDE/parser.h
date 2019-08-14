

#ifndef parser_h
#define parser_h

#include "lexem.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

typedef struct _dulparser{
	FILE*inp;
	int current_indent;
	long lastpos;
	char* curstring;
	lexem* ls; 
	int lexemcount;
	int strpos;
	int curlexem;
	int line_no;
	
	char**	lines;
	int		lines_capacity;
	int		lines_count;
	
	char*	filename;
} dulparser;


dulparser* open_parser(const char*fname);
void destroy_parser(dulparser*);
enum lexemtype getlexem(dulparser*);
void lready(dulparser*p);
int get_string(dulparser*p);

lexem*	extract_lexem( dulparser* parser );
lexem*	preview_lexem( dulparser* parser );


#endif /* parser_h */
