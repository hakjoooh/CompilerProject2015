# COSE312 Compiler Project 2015, Korea University


The goal of this project is to build a front-end of a toy compiler.
The source language ("S") and target language ("T") are defined in lecture slides.

This package includes the following files:
- [lexer.mll]: the lexer specification for ocamllex
- [parser.mly]: the parser specification for ocamlyacc
- [s.ml]: abstract syntax and interpreter definitions for the S language
- [t.ml]: abstract syntax and interpreter definitions for the T language
- [translate.ml]: the translator that compiles S to T

Your job is to complete the implementation of the lexer, parser, and translator:
- Complete the lexical definition of S in [lexer.mll]
- Complete the syntax definition of S in [parser.mly]
- Implement the translator from S to T in [translate.ml]

# How to run
 
    $ Make
    $ ./run test/t0.s

If everything is properly done, you will get the following output:
(It shows the source program, the execution result of the source program by the S interpreter,
the translated T program, and the execution result of the translated program by the T interpreter.
The results from the S and T interpreters must be equivalent.)

    == source program ==
    {
     int x;
     x = 0;
     print x+1;
    }
    == execute the source program ==
    1
    == translated target program ==
    0 : x = 0
    0 : t1 = 0
    0 : x = t1
    0 : t3 = x
    0 : t4 = 1
    0 : t2 = t3 + t4
    0 : write t2
    0 : HALT
    == execute the translated program ==
    1
