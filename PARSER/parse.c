

#include "../api.h"
#include <stdarg.h>
#include <libgen.h>
#include "../debuginfo.h"


void		parse_error_at_va		( lexem* currlexem, const char* format, va_list va )
{
	char	buf[ 32768 ];
	vsnprintf( buf, 32767, format, va );
	
	if( currlexem != NULL )
	{
		dulparser* parser  = currlexem->parser;
		int       line_no = currlexem->line_no;
		if( parser == NULL || line_no > parser->lines_count || line_no <= 0 )
			fprintf( stderr, "Error at %d:%d: %s\n",  currlexem->line_no, currlexem->line_pos, buf );
		else
		{
			char*  line_text = parser->lines[ line_no - 1 ];
			fprintf( stderr, "Error at %s:%d:%d\n", parser->filename, currlexem->line_no, currlexem->line_pos );
			fprintf( stderr, "%s\n",  line_text );
			
			int  pos;
			for( pos = 0; pos < currlexem->line_pos; pos ++ )
				fprintf( stderr, " " );
			fprintf( stderr, "^\n" );
			for( pos = 0; pos < currlexem->line_pos; pos ++ )
				fprintf( stderr, " " );
			fprintf( stderr, "+----%s\n", buf );
		}
	}
	else
		fprintf( stderr, "Error beyond of file: %s\n", buf );
}

void		parse_error			( dulparser* parser, const char* format, ... )
{
	va_list		va;
	va_start( va, format );
	
	char	buf[ 32768 ];
	vsnprintf( buf, 32767, format, va );
	
	lexem*  currlexem = preview_lexem( parser );
	parse_error_at_va( currlexem, format, va );
	va_end( va );
}

void		parse_error_at			( lexem* currlexem, const char* format, ... )
{
	va_list		va;
	va_start( va, format );
	parse_error_at_va( currlexem, format, va );
	va_end( va );
}





astnode*	parse_file			( const char*fname ){
    dulparser* parser = open_parser(strdup(fname));
	while( get_string( parser ) == 0 )	{
		while( getlexem( parser ) != NONE )
			;
	}

	
#if print_lexems
	int i;
	int col = 0;
	char buf[ 1024 ];
	for( i = 0; i<parser->lexemcount; ++i ) {
        if( col > 0 )
			printf( ", " );
		lexem* l = parser->ls + i;
		char*  lexem_text = lexem_print_name( l, buf, sizeof( buf ));
		printf( "[%d]=%s", i, lexem_text );
		if( l->t == SPECIAL && l->sp == EOL )
		{
			col = 0;
			printf( "\n" );

		}
		else
			col ++;
	}
	printf( "\n" );
#endif

	astnode*  filefunc = astnode_new(MODULE, 100, 0 );
	lexem*	  curr;
	
	while( (curr=preview_lexem( parser )) != NULL )
	{
		if( curr->t == SPECIAL && curr->sp == EOL )
		{
			extract_lexem( parser );
			continue;
		}
		astnode* statement = parse_statement( parser );
		if( statement == NULL )
		{
			parse_error_at( curr, "Error parsing statement started here" );
			return NULL;
		}
		astnode_add_child( filefunc, statement );
	}
    destroy_parser(parser);
	return filefunc;
}

astnode*	parse_statement	( dulparser* parser )
{
	lexem*	  curr = preview_lexem( parser );
	if( curr == NULL )
		return NULL;
	
    if(curr->t == SPECIAL){
        switch (curr->sp) {
            case kwif:
                do{
                    extract_lexem( parser );
                    
                    // 2. Parse expression
                    astnode* expr = parse_expression( parser );
                    //preview eol lexem
                    lexem*l = extract_lexem(parser);
                    if(l->t == SPECIAL && l->sp != EOL){
                        parse_error_at(l, "expected end of line but token found");
                        return 0;
                    }
                    
                    // 3. Parse compound
                    astnode* compound_true = parse_compound( parser );
                    
                    // 4. Build AST
                    l = preview_lexem(parser);
                    
                    astnode* if_statement = astnode_new( IFSTAT, 3, 2, expr, compound_true );
                    if( l != NULL && l->t == SPECIAL && l->sp == kwelse){
                        extract_lexem(parser);
                        extract_lexem(parser);
                        astnode* elseblock = parse_compound(parser);
                        astnode_add_child(if_statement, elseblock);
                        
                    }
                    return if_statement;
                }while(0);
                
            case kwfor:
                do{
                    extract_lexem( parser );
                    astnode* expr = parse_expression( parser );
                    if(expr->type != INOP){
                    	lexem* lex = preview_lexem(parser);
                        parse_error_at( lex, "expected in statement in for");
                    }
        
                    lexem*l = extract_lexem(parser);
                    if(l->t == SPECIAL && l->sp != EOL){
                        parse_error_at(l, "expected end of line but token found");
                        return 0;
                    }
                    astnode* compound_true = parse_compound( parser );
                    astnode* for_statement = astnode_new(FORSTAT , 2, 2, expr, compound_true );
                    return for_statement;
                }while(0);
                
            case kwasync:
                do{
                    extract_lexem( parser );
                    lexem*l = extract_lexem(parser);
                    if(l->t == SPECIAL && l->sp != EOL){
                        parse_error_at(l, "expected end of line but token found");
                        return 0;
                    }
                    astnode* compound_true = parse_compound( parser );
                    
                    astnode* async_statement = astnode_new( ASYNC, 1, 1, compound_true );
                    return async_statement;
                }while(0);
                
            case kwreturn:
                do{
                    extract_lexem(parser);
                    astnode* expr = parse_expression(parser);
                    if(expr == 0){
                        return 0;
                    }
                    extract_lexem(parser);
                    return astnode_new(DULRETURN, 1, 1, expr);
                }while(0);
            case kwwrite:
                do{
                    extract_lexem(parser);
                    astnode* expr = parse_expression(parser);
                    if(expr == 0){
                        return 0;
                    }
                    extract_lexem(parser);
                    return astnode_new(WRITE, 1, 1, expr);
                    
                }while(0);
                break;
            case kwimport: {
                extract_lexem(parser);
                astnode* arg = parse_toplevel(parser);
                if(arg == 0){
                    return 0;
                }
                return astnode_new(IMPORT, 1, 1, arg);
            } break;
            case kwwhile:{
                extract_lexem(parser);
                astnode*expr = parse_expression(parser);
                if(preview_lexem(parser)->t != SPECIAL || preview_lexem(parser)->sp != EOL){
                    //needed EOL
                    parse_error_at(preview_lexem(parser), "expected end of line but token found");
                    return 0;
                }
                extract_lexem(parser);
                astnode*comp = parse_compound(parser);
                if(comp == 0){
                    return 0;
                }
                return astnode_new(WHILE, 2, 2, expr, comp);
            }break;
            case kwobject:{
                extract_lexem(parser);
                lexem * name = preview_lexem(parser);
                astnode * nameNode = astnode_new(NAME, 0, 0);
                if(name->t == IDENTIFIER){
                    nameNode->val = strdup(name->literal);
                    extract_lexem(parser);
                } else {
                    nameNode->val = 0;
                }
                extract_lexem(parser);
                astnode* body = parse_compound(parser);
                if(!body){
                    parse_error_at(preview_lexem(parser), "expected object body");
                    return 0;
                }
                return astnode_new(OBJECT, 2, 2, nameNode, body);
            }break;
            default:
                break;
        }
    }
    
    
	

	
	// Otherwise it is an expression
	astnode*res = parse_expression(parser);
    if(res&& (res->type != ASSIGN|| res->children[1]->type != FUNCDEF)){
        lexem*next = extract_lexem(parser);
        if(next && (next->t != SPECIAL || next->sp != EOL)){
            parse_error_at(next, "unxpected token after expression");
            return 0;
        }
    }
	
	return res;
}


astnode*	parse_compound		( dulparser* parser )
{
	lexem*l = extract_lexem(parser);
	if(l->t == SPECIAL && l->sp != indent){
		parse_error(parser, "compound is required");
		return 0;
	}
	astnode* res = astnode_new(COMPOUND, 16, 0);
	do{
		astnode* stat = parse_statement(parser);
		if(stat == NULL){
			return NULL;
		}
		astnode_add_child(res, stat);
		l = preview_lexem(parser);
		if(l == NULL)
			break;
	} while(l->t!=SPECIAL || l->sp != dedent);
	if(l != NULL)
		if(l->t == SPECIAL && l->sp == dedent){
			extract_lexem(parser);
		}
	return res;
}

astnode*	parse_logical_or	( dulparser* parser )
{
	astnode* result = parse_logical_and( parser );
	if( result == NULL )
		return NULL;
	lexem*   currlexem = preview_lexem( parser );
	while( currlexem != NULL && currlexem->t == SPECIAL && currlexem->sp == kw_logical_or )
	{
		extract_lexem(parser);
		astnode*right = parse_logical_and(parser);
		result = astnode_new( LOGOR, 2, 2, result, right);
		currlexem     = preview_lexem( parser );
	}
	return result;
}


astnode*	parse_logical_and	( dulparser* parser )
{
	astnode* result = parse_in( parser );
	if( result == NULL )
		return NULL;
	lexem*   currlexem = preview_lexem( parser );
	while( currlexem != NULL && currlexem->t == SPECIAL && currlexem->sp == kw_logical_and )
	{
		extract_lexem(parser);
		astnode*right = parse_in(parser);
		result        = astnode_new( LOGAND, 2, 2, result, right);
		currlexem     = preview_lexem( parser );
	}
	return result;
}

astnode* parse_in  (dulparser*parser){
    astnode* result = parse_comparison(parser);
    if(result == NULL)
        return NULL;
    lexem*crlexem = preview_lexem(parser);
    if(crlexem != NULL && crlexem->t == SPECIAL && crlexem->sp == kwin){
        extract_lexem(parser);
        astnode*right = parse_comparison(parser);
        result = astnode_new(INOP, 2, 2, result, right);
    }
    return result;
}

astnode* parse_comparison(dulparser*parser){
	astnode* left = parse_plusminus(parser);
	if(left == NULL)
		return NULL;
	lexem* curl = preview_lexem(parser);
	astnode* right;
	enum asttype t;
	if(curl != NULL && curl->t == SPECIAL ){
		switch (curl->sp) {
  			case equal:
				t = EQUAL;
    		break;
				
    		case nequal:
				t = NEQUAL;
				break;
			case lt:
				t = LESSTHAN;
				break;
			case gt:
				t = GREATERTHAN;
				break;
			case ge:
				t = GREATEREQ;
				break;
			case le:
				t = LESSEQ;
				break;
			
			
  			default:
  				return left;
    		break;
				
		}
		extract_lexem(parser);
		right = parse_plusminus(parser);
		left = astnode_new(t, 2, 2, left, right);
	}
	return left;
	
}


astnode*	parse_plusminus	( dulparser* parser )
{
	astnode* result = parse_multdiv( parser );
	if( result == NULL )
		return NULL;
	lexem*   curl = preview_lexem( parser );
	astnode* right;
	enum asttype t;
	while(curl != NULL && curl->t == SPECIAL ){
		switch (curl->sp) {
  			case plus:
				t = PLUS;
    		break;
				
    		case minus:
				t = MINUS;
				break;

  			default:
  				return result;
    		break;
				
		}
		extract_lexem(parser);
		right  = parse_multdiv(parser);
		result = astnode_new(t, 2, 2, result, right);
		curl   = preview_lexem( parser );
	}
	return result;
}

astnode*	parse_multdiv	( dulparser* parser )
{
	astnode* result = parse_unaryprefix( parser );
	if( result == NULL )
		return NULL;
	lexem*   curl = preview_lexem( parser );
	astnode* right;
	enum asttype t;
	while(curl != NULL && curl->t == SPECIAL ){
		switch (curl->sp) {
  			case asterisk:
				t = MULT;
    		break;
				
    		case slash:
				t = DIV;
				break;

  			default:
  				return result;
    		break;
				
		}
		extract_lexem(parser);
		right  = parse_unaryprefix(parser);
		result = astnode_new(t, 2, 2, result, right);
		curl   = preview_lexem( parser );
	}
	return result;
}

astnode* parse_unaryprefix(dulparser*parser){
	lexem*curl = preview_lexem(parser);
	if(curl == NULL){
		return NULL;
	}
	if(curl->t == SPECIAL){
		switch (curl->sp) {
		  case kw_logical_not:
			do {
				extract_lexem(parser);
				astnode*right = parse_postfix(parser);
				return astnode_new(LOGNOT, 1, 1, right);
			} while (0);
				
			break;
			
		case minus:
			do {
				extract_lexem(parser);
				astnode*right = parse_postfix(parser);
				astnode*left = astnode_new(NUMLIT, 0, 0);
				left->val = malloc(sizeof(double));
				*(double*)left->val = 0;
				return astnode_new(MINUS, 2, 2, left, right);
			} while(0);
			break;
			

		  default:
			return parse_postfix(parser);
		}
	}
	return parse_postfix(parser);
}


astnode* parse_postfix(dulparser*parser){
    astnode*main = parse_toplevel(parser);
    lexem*l = preview_lexem(parser);
    while( l != NULL && l->t == SPECIAL &&(l->sp == ORBracket || l->sp == OSbracket || l->sp == dot || l->sp == Obrace)){
        switch (l->sp) {
            case ORBracket:
                do {
                    extract_lexem(parser);
                    //funccall can be with empty parameters, but subscript cant
                    lexem*n = preview_lexem(parser);
                    astnode*subexp;
                    if(n!= NULL && (n->t != SPECIAL || n->sp != CRBracket)){
                        subexp = parse_subexpr(parser, CRBracket);
                        
                    } else {
                        subexp = astnode_new(NULL_, 0, 0);
                        extract_lexem(parser);
                    }
                    
                    main = astnode_new(FUNCCALL, 2, 2, main, subexp);
                } while(0);
                break;
                
            case OSbracket:
                do {
                    extract_lexem(parser);
                    astnode*subexp = parse_subexpr(parser, CSbracket);
                    main = astnode_new(SUBSCR, 2, 2, main, subexp);
                } while(0);
                break;
            case dot:{
                extract_lexem(parser);
                astnode*ll = parse_toplevel(parser);
                if(!ll || ll->type!=NAME){
                    parse_error(parser, "cannot dot-subscript not to an identifier");
                }
                ll->type = STRLIT;
                main = astnode_new(SUBSCR, 2, 2, main, ll);
                }
                break;
            case Obrace:{
                extract_lexem(parser);
                //extract EOL or check what is here
                lexem*l_ = preview_lexem(parser);
                if(l_->t == SPECIAL && l_->sp == EOL){
                    //here is compound
                    extract_lexem(parser);
                    astnode* comp = parse_compound(parser);
                    if(!comp){
                        parse_error(parser, "error at inline func declaration");
                        main = 0;
                    }
                    l_ = preview_lexem(parser);
                    if(l_->t == SPECIAL && l_->sp == Cbrace){
                        //okay
                        extract_lexem(parser);
                        astnode*nn = astnode_new(FUNCDEF, 2, 2, astnode_new(NULL_, 0, 0), comp);
                        nn->val = (void*)strdup("lambda");
                        main = astnode_new(FUNCCALL, 2, 2, main, nn);
                    } else {
                        main = 0;
                    }
                } else {
                    //here is one line expr
                    astnode*expr = parse_statement(parser);
                    extract_lexem(parser);
                    astnode* exprnode = astnode_new(EXPR, 1, 1, expr);
                    main = astnode_new(FUNCCALL, 2, 2, main, exprnode);
                }
                
            }break;
            default:
                break;
        }
        l = preview_lexem(parser);
    }
    return main;
}

astnode* 	parse_subexpr( dulparser* parser, enum splexems closing_lexem )
{
    astnode* first = parse_expression( parser );
	lexem*   after = preview_lexem( parser );
	if( after != NULL && after->t == SPECIAL && after->sp == closing_lexem )
	{
		extract_lexem( parser );
		return first;
	}
	else
	{
		// Unexpected
		parse_error( parser, "Unclosed sub-expression" );
		return NULL;
	}
}

astnode* parse_toplevel(dulparser*parser){
	astnode* node = astnode_new(NAME, 0, 0);
	lexem*lex = preview_lexem(parser);
	if(lex == NULL){
		parse_error(parser, "lexem expected but eof found");
		return NULL;
	}
	switch(lex->t){
		case IDENTIFIER:
			node->type = NAME;
			node->val = strdup(lex->literal);
			extract_lexem(parser);
			return node;
		
		case STRLNGLITERAL:
			node->type = STRLIT;
			node->val = strdup(lex->literal);
			extract_lexem(parser);
			return node;
		case NUMLITERAL:
			node->type = NUMLIT;
			node->val = malloc(sizeof(double));
			*(double*)node->val = lex->num;
			extract_lexem(parser);
			return node;
		case SPECIAL:
            if(lex->sp == kwtrue || lex->sp == kwfalse){
                node->type = BOOLLIT;
                node->val = malloc(sizeof(char**));
                *(char**)node->val  = lex->sp==kwtrue?1:0;
                extract_lexem(parser);
                return node;
            }
			if( lex->sp == ORBracket )
			{
				extract_lexem( parser );
				return parse_subexpr( parser, CRBracket );
			}
		default:
			parse_error(parser, "unexpected token");
			return 0;
	}
	
}

//
//  Parse expression until it finds either EOL or EQUAL sign
//
astnode*	parse_lrvalue	( dulparser* parser )
{
    
    lexem*l = preview_lexem(parser);
    if( l != NULL && l->t == SPECIAL && l->sp == kwfunc ) {
        //remove f lexem
        extract_lexem(parser);
        //check if theres a name
        astnode*funcnode = astnode_new(FUNCDEF, 2, 0);
        lexem*l = preview_lexem(parser);
		if( l == NULL ) {
            parse_error_at(l, "expected either identifier or opening bracket ( at func decl but EOF found" );
            return NULL;
        }
        if( l->t == IDENTIFIER ){
            //hooray!
            funcnode->val = strdup(l->literal);
            extract_lexem(parser);
        } else {
            funcnode->val = strdup("lambda");
        }
		
        l = extract_lexem(parser);
        if( l == NULL ) {
            parse_error_at(l, "expected ( at func decl but another token found");
			return NULL;
        }
        if( l->t != SPECIAL || l->sp!= ORBracket){
            parse_error_at(l, "expected ( at func decl but another token found");
			return NULL;
        }
        l = preview_lexem(parser);
        if( l == NULL ) {
            parse_error_at(l, "expected either argument or closing bracket ), but EOF encountered" );
			return NULL;
        }
        astnode*p;
        if(l->t != SPECIAL || l->sp != CRBracket){
            p = parse_expression(parser);
        } else {
            p = astnode_new(NULL_, 0, 0);
        }
		extract_lexem(parser);		// take away lexem, processed above
		l = extract_lexem( parser );
		if( l == NULL ) {
            parse_error_at(l, "EOF encountered just after function declaration - functions with empty bodies not allowed" );
			return NULL;
		}
		if( l->t != SPECIAL || l->sp == indent ) {
            parse_error_at(l, "After function declaration ident is expected, but another token found" );
			return NULL;
		}
        astnode*comp = parse_compound(parser);
        if( comp == NULL )
        	return NULL;
        astnode_add_child(funcnode, p);
        astnode_add_child(funcnode, comp);
        return funcnode;
      
    }
    
	astnode*  left = parse_logical_or( parser );
	if( left == NULL )
		return NULL;
	lexem*	  curr = preview_lexem( parser );
	if( curr == NULL )
		// nothing afterwards
		return left;
	if( curr->t != SPECIAL || curr->sp != comma )
	{
		// No comma, it is single expression
		return left;
	}
	
	astnode*  tuple = astnode_new( MKTUPLE, 4, 1, left );
	do
	{
		extract_lexem( parser );
		astnode*  next = parse_logical_or( parser );
		if( next == NULL )
			return NULL;
		astnode_add_child( tuple, next );
		curr = preview_lexem( parser );
	}
	while( curr != NULL && curr->t == SPECIAL && curr->sp == comma );
	return tuple;
}

astnode*	parse_expression	( dulparser* parser )
{
	astnode* left = parse_lrvalue( parser );

	lexem*	  curr = preview_lexem( parser );
	if( curr == NULL || ( curr->t == SPECIAL && curr->sp == EOL ))
	{
		// No = sign
		// It is just an expression
		return left;
	}
	else if( curr->t == SPECIAL)
	{
		enum asttype t = 0;
		switch (curr->sp) {
  			case assign:
				t = ASSIGN;
    			break;
			case inpadd:
				t = INPLADD;
				break;
			case inpsub:
				t = INPLSUB;
				break;
				
			case inpmult:
				t = INPLMULT;
				break;
				
			case inpdiv:
				t = INPLDIV;
				break;

			case CRBracket:
			case CSbracket:
            case Cbrace:
				return left;
				

 	 		default:
    			break;
		}
		if(t!=0){
			extract_lexem( parser );
			astnode* right = parse_lrvalue( parser );
			if( right == NULL )
				return NULL;
			astnode* equal_statement = astnode_new( t, 2, 2, left, right );
			return equal_statement;
		}
		// Next lexem is = sign
		// eat it first
		
	}
	
		// What is here???
		parse_error( parser, "Unexpected text after expression" );
		return NULL;
}

