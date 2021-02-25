/******************************************************************
*
*   file:     cmds.c
*   author:   betty o'neil
*   date:     ?
*
*   semantic actions for commands called by tutor (cs341, mp1)
*
*   revisions:
*      9/90  eb   cleanup, convert function declarations to ansi
*      9/91  eb   changes so that this can be used for hw1
*      9/02  re   minor changes to quit command
*/
/* the Makefile arranges that #include <..> searches in the right
   places for these headers-- 200920*/

#include <stdio.h>
#include "slex.h"

/*===================================================================*
*
*   Command table for tutor program -- an array of structures of type
*   cmd -- for each command provide the token, the function to call when
*   that token is found, and the help message.
*
*   slex.h contains the typdef for struct cmd, and declares the
*   cmds array as extern to all the other parts of the program.
*   Code in slex.c parses user input command line and calls the
*   requested semantic action, passing a pointer to the cmd struct
*   and any arguments the user may have entered.
*
*===================================================================*/

PROTOTYPE int stop(Cmd *cp, char *arguments);
PROTOTYPE int mem_display(Cmd *cp, char *arguments);
PROTOTYPE int mem_set(Cmd *cp, char *arguments);
PROTOTYPE int help(Cmd *cp, char *arguments);

/* command table */

Cmd cmds[] = {{"md",  mem_display, "Memory display: MD <addr>"},
              {"s",   stop,        "Stop" },
              {"ms",  mem_set,     "Memory set: ms <addr> <value>" },
              {"h",   help,        "Help <cmd>" },
              {NULL,  NULL,        NULL}};  /* null cmd to flag end of table */

char xyz = 6;  /* test global variable  */
char *pxyz = &xyz;  /* test pointer to xyz */
/*===================================================================*
*		command			routines
*
*   Each command routine is called with 2 args, the remaining
*   part of the line to parse and a pointer to the struct cmd for this
*   command. Each returns 0 for continue or 1 for all-done.
*
*===================================================================*/

int stop(Cmd *cp, char *arguments)
{
  return 1;			/* all done flag */
}

/*===================================================================*
*
*   mem_display: display contents of 16 bytes in hex
*
*/

int mem_display(Cmd *cp, char *arguments){
	int location;
	unsigned char *pointer; //strange overflow glitches if i leave this as a normal char
	sscanf(arguments, "%x", &location); //convet string to a hex and store it
	pointer = location;
	//printf("Reached mem_display, passed argument string: |%s|\n", arguments);
	//printf("        help message: %s\n", cp->help);
	//printf("pxyz location: %p\n", pxyz);
	//printf("xyz location: %p\n", &xyz);
	//printf("%02x, ", *pointer);
	//above are some debugging prints because i found gdb useless here
	printf("%s\t", arguments);
	for(int i = 0; i<16; i++){
		printf("%02x ", *(pointer + i)); //the 02 forces leading zeroes to format, x is for hex (lowercase)
	}
	printf("\t");
	for(int i = 0; i<16; i++){
		if(*(pointer + i) >= 32 && *(pointer + i) <= 127){ //checks if its in in the specified ascii range to not just leave a dot
			printf("%c ", *(pointer + i));
		}
		else{ printf(". ");}
	}
	printf("\n");//formatting
	return 0;}
int mem_set(Cmd *cp, char *arguments){
	int location, value;
	unsigned char *pointer; //i still dont really know the nuances of this but im just going to use unsigned char because it caused a problem in md
	sscanf(arguments, "%x %x", &location, &value); //parse args
	pointer = location;
//	printf("detected address: %x\n", &location);
//	printf("value at address: %02x\n", *pointer);
//	printf("value to insert: %02x\n", value);
//	printf("setting value...\n");
	*pointer = value; //set value
//	printf("value at address: %02x\n", *pointer);
//the prints were debugging stuff because i still feel like gdb is not nearly as usable as a debugger in a real ide that will show my every variable line by line during execution
return 0;}
int help(Cmd *cp, char *arguments){
//	printf("command to eval:%s\n", arguments);
	if(strcmp(" ms", arguments) == 0){ //compares string to arg
		printf("%s\n", cmds[2].help);//grabs from location from the cmd table, this could be more efficient this works and ive spent 20 hours on this project so this will have to do
	}
	else if(strcmp(" md", arguments) == 0){
		printf("%s\n", cmds[0].help);
	}
	else if(strcmp(" h", arguments) == 0){
		printf("%s\n", cp->help);
	}
	else if(strcmp(" s", arguments) == 0){
		printf("%s\n", cmds[1].help);
	}
	else{ printf("couldnt find any matches, your code is broke or you didn't actually type a valid command");}
return 0;}

