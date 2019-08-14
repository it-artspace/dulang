

#include "../api.h"
#include <assert.h>
#include "../debuginfo.h"
const char* astnames[] = {
    "SUBSCRIPT",
	"COMPOUND",
	"ASSIGN",
	"INPLADD",
	"INPLSUB",
	"INPLMULT",
	"INPLDIV",
	"MKTUPLE",
	"LESSTHAN",
	"LESSEQ",
	"GREATERTHAN",
	"GREATEREQ",
	"EQUAL",
	"NEQUAL",
	"LOGOR",
	"LOGAND",
	"LOGNOT",
	"FUNCCALL",
	"DECL",
	"FUNCDEF",
	"WRITE",
	"IFSTAT",
	"PLUS",
	"MINUS",
	"MULT",
	"DIV",
	"NUMLIT",
	"STRLIT",
    "BOOLLIT",
	"NAME",
    "IN",
    "FOR",
    "ASYNC",
    "NULL",
    "RETURN",
    "MODULE",
    "UNPACK_ITER",
    "IMPORT"
};

void		astnode_emplace_va 	( astnode* parent, astnode* node, enum asttype type, int capacity, int children, va_list va )
{
	if( children > capacity )
		capacity = children;
	if( capacity == 0 )
		capacity = 1;

	node->type 		     = type;
	node->ch_capacity 	 = capacity;
	node->children    	 = (astnode**) malloc( sizeof( astnode* ) * capacity );
	node->children_count = children;
	node->parent 		 = parent;
	node->val			 = 0;
	int	idx;
	for( idx = 0; idx < children; idx ++ )
		node->children[ idx ] = va_arg( va, astnode* );
}

void		astnode_emplace ( astnode* parent, astnode* node, enum asttype type, int capacity, int children, ... )
{
	va_list		va;
	va_start( va, children );
	astnode_emplace_va( parent, node, type, capacity, children, va );
	va_end( va );
}

astnode*	astnode_new		( enum asttype type, int capacity, int children, ... )
{
	astnode*	result = (astnode*) malloc( sizeof( astnode ));
	va_list		va;
	
	va_start( va, children );
	astnode_emplace_va( 0, result, type, capacity, children, va );
	va_end( va );
	return result;
}

void		astnode_print		( astnode* node )
{
	astnode_print_impl( node, 0 );
}

void		astnode_print_impl	( astnode* node, int depth )
{
	for( int i = 0; i < depth; i ++ )
		printf( "\t" );
	
	int		newline = 0;
	printf( "%s ", astnames[ node->type ] );
	if(node->type == NAME || node->type == STRLIT || node->type == FUNCDEF){
		printf("%s\n",(char*)node->val);
		newline = 1;
	}
	if(node->type == NUMLIT){
		printf("%lf\n", *(double*)node->val);
		newline = 1;
	}
    if(node->type == NULL_){
        putchar('\n');
		newline = 1;
    }
    if(node->type == BOOLLIT){
        if(*(char*)node->val)
            puts("true\n");
        else
            puts("false\n");
		newline = 1;
    }
	if( node->children_count != 0 )
	{
		if( ! newline )
			printf( "\n" );
		int idx;
		for( idx = 0; idx < node->children_count; idx ++ )
		{
			// printf( "[%d]:", idx );
			astnode_print_impl( node->children[ idx ], depth + 1 );
		}
	}
}

void		astnode_delete		( astnode* node )
{
	if( node == NULL )
		return;
	int	idx;
	for( idx = 0; idx < node->children_count; idx ++ )
	{
		astnode_delete( node->children[ idx ]);
	}
	if( node->children != NULL )
		free( node->children );
	node->children = NULL;
	node->ch_capacity = 0;
	node->children_count = 0;
	node->parent = NULL;
	if(node->val != NULL)
		free(node->val);
}

void		astnode_add_child	( astnode* parent, astnode* child )
{
	assert( parent );
	assert( child  );
	
	if( parent->children_count >= parent->ch_capacity )
	{
		parent->ch_capacity <<= 1;
		parent->children = (astnode**) realloc( parent->children, sizeof( astnode* ) * parent->ch_capacity );
		assert( parent->children != NULL );
	}
	
	parent->children[ parent->children_count ] = child;
	parent->children_count ++;
	child->parent = parent;
    
}
