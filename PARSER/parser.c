

#include "../api.h"
#include <ctype.h>
#include <stdio.h>
#include <assert.h>

int check_iden_name(char namesym){
	return (namesym >= 'a' && namesym <= 'z') || (namesym <= 'Z' && namesym >= 'A') || namesym == '_';
}

char*		_lexem_names[ ] = {
    "arrow",
	"EOL",
	"dot",
	"ORBracket",
	"CRBracket",
	"Obrace",
	"Cbrace",
	"OSbracket",
	"CSbracket",
	"comma",
	"colon",
	"equal",
	"nequal",
	"lt",
	"gt",
	"le",
	"ge",
	"inpadd",
	"inpsub",
	"inpmult",
	"inpdiv",
	"assign",
	"plus",
	"minus",
	"asterisk",
	"slash",
	"kw_logical_or",
	"kw_logical_and",
	"kw_logical_not",
	"kwif",
	"kwfor",
    "kwtrue",
    "kwfalse",
	"kwelse",
	"kwfunc",
	"kwclass",
	"kwasync",
	"kwwrite",
    "kwimport",
    "kwobject",
    "kwin",
    "kwreturn",
    "while",
	"indent",
	"dedent"
};

char*		lexem_print_name( const lexem* lex, char* buf, int bufsize )
{
	if( lex == NULL )
	{
		snprintf( buf, bufsize, "(null)" );
		return buf;
	}
	switch( lex->t )
	{
		case IDENTIFIER:
			snprintf( buf, bufsize, "I:%s", lex->literal );
			break;
		case STRLNGLITERAL:
			snprintf( buf, bufsize, "\"%s\"", lex->literal );
			break;
		case NUMLITERAL:
			snprintf( buf, bufsize, "N:%f", lex->num );
			break;
		case SPECIAL:
			snprintf( buf, bufsize, "S:%s", _lexem_names[ lex->sp ] );
			break;
		case NONE:
			snprintf( buf, bufsize, "(none)" );
			break;
	}
	return buf;
}

void destroy_parser(dulparser*self){
	fclose(self->inp);
	free(self->curstring);
	free(self->ls);
	free(self->lines);
	free(self->filename);
	free(self);
}

dulparser* open_parser(const char*fname){
	dulparser*nparser = (dulparser*)malloc(sizeof(dulparser));
	nparser->inp = fopen(fname, "r");
	if(nparser->inp == 0){
		trshoot("file not opened");
		free(nparser);
		return 0;
	}
	nparser->lastpos = 0;
	nparser->curstring = (char*)malloc(1024);
	nparser->current_indent = 0;
	nparser->ls = (lexem*)malloc(10000*sizeof(lexem));
	nparser->lexemcount = 0;
	nparser->curlexem   = 0;
	nparser->line_no    = 0;

	nparser->lines_capacity = 2048;
	nparser->lines			= (char**) malloc( sizeof( char* ) * nparser->lines_capacity );
	assert( nparser->lines != NULL );
	nparser->lines_count	= 0;
	
	nparser->filename		= strdup( fname );
	return nparser;
}

int get_string(dulparser*p){
	char	buf[ 1024 ];
	char*	begin;
    char *comment_checker;
    do{
        
        begin = fgets( buf, 1024, p->inp);
        if( begin == 0) {
            p->curstring = NULL;
            return 1;
        }
        comment_checker = begin;
        while(*comment_checker==' ' || *comment_checker=='\t')
            comment_checker++;
    } while(comment_checker[0]=='#');
	
   
	
	char	buf2[ 4096 ];
	char*	writer = buf2;
	char*	read  = buf;
	int		pos   = 0;
	
	for( ; *read != 0; )
	{
		char  ch = *read ++;
		if( ch == '\t' )
		{
			int  reminder = pos  % 4;
			int  spaces   = 4 - reminder;
			for( int i = 0; i < spaces; i ++ )
			{
				*writer ++ = ' ';
				pos ++;
			}
		}
		else
		{
			*writer ++ = ch;
			pos ++;
		}
	}
	*writer = 0;
	strcpy( p->curstring, buf2 );

	if( p->line_no >= p->lines_capacity )
	{
		p->lines_capacity <<= 1;
		p->lines = (char**) realloc( p->lines, sizeof( char* ) * p->lines_capacity );
		assert( p->lines != NULL );
	}
	
	p->lines[ p->line_no ] = strdup( p->curstring );
	p->lines_count         = ++ p->line_no;
	
	int i = 0;
	while(p->curstring[i++]==' ');
	if(i%4!=1){
		trshoot("INDENTS NOT QUADTUPLE");
		destroy_parser(p);
	}
	p->strpos = i-1;
	i = (i-1)/4;
	
	while(p->current_indent > i){
		lexem*clexem = (p->ls + p->lexemcount);
		clexem->line_no  = p->line_no;
		clexem->line_pos = p->strpos;
		clexem->parser   = p;
		clexem->sp = dedent;
		p->lexemcount++;
		clexem->t = SPECIAL;
		p->current_indent--;
	}
	while(p->current_indent < i){
		lexem*clexem = (p->ls + p->lexemcount);
		clexem->line_no  = p->line_no;
		clexem->line_pos = p->strpos;
		clexem->parser   = p;
		p->lexemcount++;
		clexem->sp = indent;
		clexem->t = SPECIAL;
		p->current_indent++;
	}
	return 0;
}

int  check_identifier( const char* ident, const char* candidate )
{
	int 	started_from_alpha = isalpha( candidate[0] );
	size_t 	len                = strlen( candidate );
	
	if( strncmp( ident, candidate, len ) != 0 )
		return 0;
	
	if( !started_from_alpha )
		return 1;
	
	char	next_char = ident[len];
	if( isalnum( next_char ) || next_char == '_' )
		// identifier continues, e.g. f5
		return 0;
	else
		return 1;
}

enum lexemtype getlexem(dulparser*p){
	p->lastpos = ftell(p->inp);
	while(p->curstring[p->strpos]==' ')
		p->strpos++;
	lexem*clexem = (p->ls + p->lexemcount);
	clexem->line_no  = p->line_no;
	clexem->line_pos = p->strpos;
	clexem->parser   = p;

	if(p->curstring[p->strpos] == '\n' || p->curstring[p->strpos] == '\0'){
		p->lexemcount++;
		clexem->t = SPECIAL;
		clexem->sp = EOL;
		return NONE;
	}
	if(p->curstring[p->strpos] == '"'){
        char * strbuf = "";
		int strstart = p->strpos;
        while(p->curstring[++p->strpos] != '"'){
            if(p->strpos == strlen(p->curstring) - 1){
                //start new string
                fgets(p->curstring, 1024, p->inp);
                p->strpos = 0;
            }
            if(p->curstring[p->strpos] == '\\'){
                switch(p->curstring[++p->strpos]){
                    case 'n':
                        p->curstring[p->strpos] = '\n';
                        break;
                    default:
                        break;
                }
            }
            
        }
            p->strpos++;
        int size = p->strpos-strstart-2;
		clexem->literal = (char*)dulalloc( size + 1);
        char * strbegin = p->curstring + strstart+1;
        char * wr = clexem->literal;
        for(char * rdr = strbegin; rdr < strbegin + p->strpos-strstart-2; ++rdr){
            if(*rdr != '\\')
                *wr ++ = *rdr;
        }
        
        ((char*)clexem->literal)[wr - clexem->literal] = '\0';
		clexem->t = STRLNGLITERAL;
		p->lexemcount++;
        
		return STRLNGLITERAL;
	}
	
	// not string
    if(p->curstring[p->strpos]=='@'){
        clexem->t = IDENTIFIER;
        p->strpos+=1;
        clexem->literal = strdup("this");
        p->lexemcount++;
        clexem++;
        clexem->sp = dot;
        clexem->t = SPECIAL;
        p->lexemcount++;
        return SPECIAL;
    }
	for(int i = 0; i<ltextcount; ++i){
		if( check_identifier(p->curstring + p->strpos, ltext[i] )) {
			//success!!
			// i можно использовать как lexem identifier
			clexem->sp = i;
			clexem->t = SPECIAL;
			p->strpos+=strlen(ltext[i]);
			p->lexemcount++;
			return SPECIAL;
		}
	}
	
	//lexem is not special
	
	int numsym = 0;
	while((p->curstring[p->strpos + numsym] >= '0' && p->curstring[p->strpos + numsym] <= '9') || p->curstring[p->strpos + numsym]=='.') {
		numsym++;
	}
	if(numsym != 0){
		double d;
		sscanf(p->curstring+p->strpos, "%lf", &d);
		p->strpos += numsym;
		clexem->num = d;
		clexem->t = NUMLITERAL;
		p->lexemcount++;
		return NUMLITERAL;
	}
	
	//not number
	
	while(check_iden_name(p->curstring[p->strpos + numsym]))
		numsym++;
	if(numsym!=0){
		//is identifier
		clexem->literal = (char*)dulalloc(numsym+1);
		strncpy(clexem->literal, p->curstring+p->strpos, numsym);
        clexem->literal[numsym] = 0;
		clexem->t = IDENTIFIER;
		p->strpos += numsym;
		p->lexemcount++;
		return IDENTIFIER;
	}
	
	return NONE;
}

lexem*	extract_lexem( dulparser* parser )
{
	if( parser->curlexem >= parser->lexemcount )
		return NULL;
	else
	{
		lexem*	result = parser->ls + parser->curlexem;
		parser->curlexem ++;
		return result;
	}
}

lexem*	preview_lexem( dulparser* parser )
{
	if( parser->curlexem >= parser->lexemcount )
		return NULL;
	else
		return parser->ls + parser->curlexem;
}
