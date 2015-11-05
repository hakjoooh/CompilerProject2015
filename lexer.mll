(*
  TODO: Complete the lexical specification for the S language.
*)

{
 open Parser
 exception Eof
 exception LexicalError
 let comment_depth = ref 0

 let dowhile_depth = ref 0
 let sqblock_depth = ref 0
} 

let blank = [' ' '\n' '\t' '\r']+
let id = ['a'-'z' 'A'-'Z']['a'-'z' 'A'-'Z' '0'-'9' '_']*
let number = ['0'-'9']+

rule start = parse 
     | blank { start lexbuf }
     | "/*" { comment_depth :=1; comment lexbuf; start lexbuf }
     | eof   { EOF}

     | "int[" {TARR}
     | ']' {start lexbuf}
     | "int" {TINT}
     | '=' {ASSIGN}
     | "if" {IF}
     | "while" {if !dowhile_depth > 0
                    then (dowhile_depth := !dowhile_depth-1; start lexbuf)
                    else WHILE}
     | "do" {dowhile_depth := !dowhile_depth+1; DOWHILE}
     | "read" {READ}
     | "print" {PRINT}
     | '{' {BLOCK}
     | '}' {BLOCK}
     | '+' {ADD}
     | '-' {SUB}
     | '*' {MUL}
     | '/' {DIV}


     | _ { raise LexicalError }

and comment = parse
     "/*" {comment_depth := !comment_depth+1; comment lexbuf}
   | "*/" {comment_depth := !comment_depth-1;
           if !comment_depth > 0 then comment lexbuf }
   | eof {raise Eof}
   | _   {comment lexbuf}
