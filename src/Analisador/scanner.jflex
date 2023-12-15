import java_cup.runtime.Symbol;
import java.io.IOException;
import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;


%%

%{

    
     TabelaSimbolos tabelaSimbolos = new TabelaSimbolos();

     public Yylex(String filePath,  TabelaSimbolos symbolTable) throws IOException {
        this.zzReader = new BufferedReader(new FileReader(filePath));
        this.tabelaSimbolos = symbolTable;
    }

%}

/* Opções e declarações */
%class Yylex
%line
%char
%full
%debug
%cup

WS = [\n| |\t|\r]
letter = [A-Za-z]
digit = [0-9]
INTEGER_CONSTANT = {digit}+
DECIMAL_CONSTANT = {digit}+\.{digit}+
identifier = {letter}({letter}|{digit})*
caractere = [^0-9A-Za-z\" \t\r\n]
Comentario = "%"(.*)\n
Literal = ``[^`]*´´

%%
<YYINITIAL>{
"program" {
    Yytoken token = new Yytoken(Sym.PROGRAM, yytext(), yyline, yychar, yychar + 7, "Palavra reservada: program");
    tabelaSimbolos.adicionarEntrada(token);
    return token;
}

"declare" {
    Yytoken token = new Yytoken(Sym.DECLARE, yytext(), yyline, yychar, yychar + 7, "Palavra reservada: declare");
    tabelaSimbolos.adicionarEntrada(token);
    return token;
}

"begin" {
    Yytoken token = new Yytoken(Sym.BEGIN, yytext(), yyline, yychar, yychar + 5, "Palavra reservada: begin");
    tabelaSimbolos.adicionarEntrada(token);
    return token;
}

"integer" {
    Yytoken token = new Yytoken(Sym.INTEGER, yytext(), yyline, yychar, yychar + 7, "Palavra reservada: integer");
    tabelaSimbolos.adicionarEntrada(token);
    return token;
}

"decimal" {
    Yytoken token = new Yytoken(Sym.DECIMAL, yytext(), yyline, yychar, yychar + 7, "Palavra reservada: decimal");
        tabelaSimbolos.adicionarEntrada(token);

    return token;
}

"if" {
    Yytoken token = new Yytoken(Sym.IF, yytext(), yyline, yychar, yychar + 2, "Palavra reservada: if");
        tabelaSimbolos.adicionarEntrada(token);

    return token;
}

"then" {
    Yytoken token = new Yytoken(Sym.THEN, yytext(), yyline, yychar, yychar + 4, "Palavra reservada: then");
        tabelaSimbolos.adicionarEntrada(token);

    return token;
}

"else" {
    Yytoken token = new Yytoken(Sym.ELSE, yytext(), yyline, yychar, yychar + 4, "Palavra reservada: else");
        tabelaSimbolos.adicionarEntrada(token);

    return token;
}

"for" {
    Yytoken token = new Yytoken(Sym.FOR, yytext(), yyline, yychar, yychar + 3, "Palavra reservada: for");
        tabelaSimbolos.adicionarEntrada(token);

    return token;
}

"end" {
    Yytoken token = new Yytoken(Sym.END, yytext(), yyline, yychar, yychar + 3, "Palavra reservada: end");
        tabelaSimbolos.adicionarEntrada(token);

    return token;
}

"do" {
    Yytoken token = new Yytoken(Sym.DO, yytext(), yyline, yychar, yychar + 2, "Palavra reservada: do");
        tabelaSimbolos.adicionarEntrada(token);

    return token;
}

"to" {
    Yytoken token = new Yytoken(Sym.TO, yytext(), yyline, yychar, yychar + 2, "Palavra reservada: to");
        tabelaSimbolos.adicionarEntrada(token);

    return token;
}

"while" {
    Yytoken token = new Yytoken(Sym.WHILE, yytext(), yyline, yychar, yychar + 5, "Palavra reservada: while");
        tabelaSimbolos.adicionarEntrada(token);

    return token;
}

"read" {
    Yytoken token = new Yytoken(Sym.READ, yytext(), yyline, yychar, yychar + 4, "Palavra reservada: read");
        tabelaSimbolos.adicionarEntrada(token);

    return token;
}

"write" {
    Yytoken token = new Yytoken(Sym.WRITE, yytext(), yyline, yychar, yychar + 5, "Palavra reservada: write");
        tabelaSimbolos.adicionarEntrada(token);

    return token;
}

"or" {
    Yytoken token = new Yytoken(Sym.OR, yytext(), yyline, yychar, yychar + 2, "Palavra reservada: or");
        tabelaSimbolos.adicionarEntrada(token);

    return token;
}

"and" {
    Yytoken token = new Yytoken(Sym.AND, yytext(), yyline, yychar, yychar + 3, "Palavra reservada: and");
        tabelaSimbolos.adicionarEntrada(token);

    return token;
}

"mod" {
    Yytoken token = new Yytoken(Sym.MOD, yytext(), yyline, yychar, yychar + 3, "Palavra reservada: mod");
        tabelaSimbolos.adicionarEntrada(token);

    return token;
}

"not" {
    Yytoken token = new Yytoken(Sym.NOT, yytext(), yyline, yychar, yychar + 3, "Palavra reservada: not");
        tabelaSimbolos.adicionarEntrada(token);

    return token;
}

"%" {
    Yytoken token = new Yytoken(Sym.MOD, yytext(), yyline, yychar, yychar + 3, "Modulo");
        tabelaSimbolos.adicionarEntrada(token);

    return token;
}


";" {
    Yytoken token = new Yytoken(Sym.SEMICOLON, yytext(), yyline, yychar, yychar + 1, "Semicolon");
        tabelaSimbolos.adicionarEntrada(token);

    return token;
}
"," {
    Yytoken token = new Yytoken(Sym.COMMA, yytext(), yyline, yychar, yychar + 1, "Comma");
        tabelaSimbolos.adicionarEntrada(token);

    return token;
}

")" {
    Yytoken token = new Yytoken(Sym.RIGHT_PAREN, yytext(), yyline, yychar, yychar + 1, "Right Parenthesis");
        tabelaSimbolos.adicionarEntrada(token);

    return token;
}

"(" {
    Yytoken token = new Yytoken(Sym.LEFT_PAREN, yytext(), yyline, yychar, yychar + 1, "Left Parenthesis");
        tabelaSimbolos.adicionarEntrada(token);

    return token;
}



"=" {
    Yytoken token = new Yytoken(Sym.EQ, yytext(), yyline, yychar, yychar + 1, "EQ");
        tabelaSimbolos.adicionarEntrada(token);

    return token;
}
"+" {
    Yytoken token = new Yytoken(Sym.PLUS, yytext(), yyline, yychar, yychar + 1, "Plus");
        tabelaSimbolos.adicionarEntrada(token);

    return token;
}

"-" {
    Yytoken token = new Yytoken(Sym.MINUS, yytext(), yyline, yychar, yychar + 1, "Minus");
        tabelaSimbolos.adicionarEntrada(token);

    return token;
}

">" {
    Yytoken token = new Yytoken(Sym.GT, yytext(), yyline, yychar, yychar + 1, "GT");
        tabelaSimbolos.adicionarEntrada(token);

    return token;
}

">=" {
    Yytoken token = new Yytoken(Sym.GE, yytext(), yyline, yychar, yychar + 2, "GE");
        tabelaSimbolos.adicionarEntrada(token);

    return token;
}

"<" {
    Yytoken token = new Yytoken(Sym.LT, yytext(), yyline, yychar, yychar + 1, "LT");
        tabelaSimbolos.adicionarEntrada(token);

    return token;
}

"<=" {
    Yytoken token = new Yytoken(Sym.LE, yytext(), yyline, yychar, yychar + 2, "LE");
        tabelaSimbolos.adicionarEntrada(token);

    return token;
}

"<>" {
    Yytoken token = new Yytoken(Sym.NE, yytext(), yyline, yychar, yychar + 2, "NE");
        tabelaSimbolos.adicionarEntrada(token);

    return token;
}

"<<" {
    Yytoken token = new Yytoken(Sym.DLT, yytext(), yyline, yychar, yychar + 2, "DLT");
        tabelaSimbolos.adicionarEntrada(token);

    return token;
}

">>" {
    Yytoken token = new Yytoken(Sym.DGT, yytext(), yyline, yychar, yychar + 2, "DGT");
        tabelaSimbolos.adicionarEntrada(token);

    return token;
}

"<<<" {
    Yytoken token = new Yytoken(Sym.TLT, yytext(), yyline, yychar, yychar + 3, "TLT");
        tabelaSimbolos.adicionarEntrada(token);

    return token;
}

">>>" {
    Yytoken token = new Yytoken(Sym.TGT, yytext(), yyline, yychar, yychar + 3, "TGT");
        tabelaSimbolos.adicionarEntrada(token);

    return token;
}

"*" {
    Yytoken token = new Yytoken(Sym.MULT, yytext(), yyline, yychar, yychar + 1, "Mult");
        tabelaSimbolos.adicionarEntrada(token);

    return token;
}

"/" {
    Yytoken token = new Yytoken(Sym.DIV, yytext(), yyline, yychar, yychar + 1, "Div");
        tabelaSimbolos.adicionarEntrada(token);

    return token;
}

"?" {
    Yytoken token = new Yytoken(Sym.QUESTION_MARK, yytext(), yyline, yychar, yychar + 1, "Question Mark");
        tabelaSimbolos.adicionarEntrada(token);

    return token;
}

":" {
    Yytoken token = new Yytoken(Sym.COLON, yytext(), yyline, yychar, yychar + 1, "Colon");
        tabelaSimbolos.adicionarEntrada(token);

    return token;
}


":=" {
  Yytoken token = new Yytoken(Sym.ASSIGN_OP, yytext(), yyline, yychar, yychar + 2, "ASSIGN_OP");
        tabelaSimbolos.adicionarEntrada(token);

    return token;
}

}

{identifier} {
    Yytoken token = new Yytoken(Sym.IDENTIFIER, yytext(), yyline, yychar, yychar + yylength(), "Identifier");
        tabelaSimbolos.adicionarEntrada(token);

    return token;
}

{WS} {
    // Ignorar espaços em branco e quebras de linha
}
{Comentario} {
    // Ignorar comentarios 
}

{Literal}  {
    Yytoken token = new Yytoken(Sym.TEXTO, yytext(), yyline, yychar, yychar + yylength(), "Literal");
        tabelaSimbolos.adicionarEntrada(token);

    return token;
}

{INTEGER_CONSTANT} {
    Yytoken token = new Yytoken(Sym.INTEGERCONSTANT, yytext(), yyline, yychar, yychar + yylength(), "Numero Inteiro ");
        tabelaSimbolos.adicionarEntrada(token);

    return token;
}

{DECIMAL_CONSTANT} {
    Yytoken token = new Yytoken(Sym.DECIMALCONSTANT, yytext(), yyline, yychar, yychar + yylength(), "Numero Decimal");
        tabelaSimbolos.adicionarEntrada(token);

    return token;
}


{caractere} {
    // Não é necessário um token para caracter é melhor reconhecer o literal 
}
. { 
    System.out.println("Illegal character: <" + yytext() + ">" + "line" + yyline);
    Yytoken token = new Yytoken(Sym.error, yytext(), yyline, yychar, yychar + yylength(), "Caractere");
        tabelaSimbolos.adicionarEntrada(token);

    return token;
  
}

<YYINITIAL> <<EOF>> {
    tabelaSimbolos.imprimirTabela();
    System.exit(0);
}

