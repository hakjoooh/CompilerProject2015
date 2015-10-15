# COSE312 Compiler Project 2015, Korea University

The goal of this project is to build a front-end of a toy compiler.
The source language ("S") and target language ("T") are defined in lecture slides. 

Your job is to complete the implementation of the lexer, parser, and translator:
1. Complete the lexical definition of S in [lexer.mll]
2. Complete the syntax definition of S in [parser.mly]
3. Implement the translator from S to T in [translate.ml]

# How to run
 
    $ Make
    $ ./run test/t0.s
