import java_cup.runtime.Symbol;
import java.io.IOException;
import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;

/* Declaração de variável global para rastrear o número da ação */

%%

%{
     TabelaSimbolos tabelaSimbolos = new TabelaSimbolos();

    /* public Yylex(String filePath,  TabelaSimbolos symbolTable) throws IOException {
        this.zzReader = new BufferedReader(new FileReader(filePath));
        this.tabelaSimbolos = symbolTable;
    }*/

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
INTEGER_CONSTANT = [0-9]+
DECIMAL_CONSTANT = [0-9]+\.[0-9]+
identifier = {letter}({letter}|{digit})*
caractere = [^0-9A-Za-z]
assign_op = ":="

%%
<YYINITIAL>{
"program" {
    Yytoken token = new Yytoken(Sym.PROGRAM, yytext(), yyline, yychar, yychar + 7, "Palavra reservada: program");
    if (!tabelaSimbolos.contemToken(token)) {
        tabelaSimbolos.adicionarEntrada(token);
    }
    return token;
}

"declare" {
    Yytoken token = new Yytoken(Sym.DECLARE, yytext(), yyline, yychar, yychar + 7, "Palavra reservada: declare");
    if (!tabelaSimbolos.contemToken(token)) {
        tabelaSimbolos.adicionarEntrada(token);
    }
    return token;
}

"begin" {
    Yytoken token = new Yytoken(Sym.BEGIN, yytext(), yyline, yychar, yychar + 5, "Palavra reservada: begin");
    if (!tabelaSimbolos.contemToken(token)) {
        tabelaSimbolos.adicionarEntrada(token);
    }
    return token;
}

"integer" {
    Yytoken token = new Yytoken(Sym.INTEGER, yytext(), yyline, yychar, yychar + 7, "Palavra reservada: integer");
    if (!tabelaSimbolos.contemToken(token)) {
        tabelaSimbolos.adicionarEntrada(token);
    }
    return token;
}

"decimal" {
    Yytoken token = new Yytoken(Sym.DECIMAL, yytext(), yyline, yychar, yychar + 7, "Palavra reservada: decimal");
    if (!tabelaSimbolos.contemToken(token)) {
        tabelaSimbolos.adicionarEntrada(token);
    }
    return token;
}

"if" {
    Yytoken token = new Yytoken(Sym.IF, yytext(), yyline, yychar, yychar + 2, "Palavra reservada: if");
    if (!tabelaSimbolos.contemToken(token)) {
        tabelaSimbolos.adicionarEntrada(token);
    }
    return token;
}

"then" {
    Yytoken token = new Yytoken(Sym.THEN, yytext(), yyline, yychar, yychar + 4, "Palavra reservada: then");
    if (!tabelaSimbolos.contemToken(token)) {
        tabelaSimbolos.adicionarEntrada(token);
    }
    return token;
}

"else" {
    Yytoken token = new Yytoken(Sym.ELSE, yytext(), yyline, yychar, yychar + 4, "Palavra reservada: else");
    if (!tabelaSimbolos.contemToken(token)) {
        tabelaSimbolos.adicionarEntrada(token);
    }
    return token;
}

"for" {
    Yytoken token = new Yytoken(Sym.FOR, yytext(), yyline, yychar, yychar + 3, "Palavra reservada: for");
    if (!tabelaSimbolos.contemToken(token)) {
        tabelaSimbolos.adicionarEntrada(token);
    }
    return token;
}

"end" {
    Yytoken token = new Yytoken(Sym.END, yytext(), yyline, yychar, yychar + 3, "Palavra reservada: end");
    if (!tabelaSimbolos.contemToken(token)) {
        tabelaSimbolos.adicionarEntrada(token);
    }
    return token;
}

"do" {
    Yytoken token = new Yytoken(Sym.DO, yytext(), yyline, yychar, yychar + 2, "Palavra reservada: do");
    if (!tabelaSimbolos.contemToken(token)) {
        tabelaSimbolos.adicionarEntrada(token);
    }
    return token;
}

"to" {
    Yytoken token = new Yytoken(Sym.TO, yytext(), yyline, yychar, yychar + 2, "Palavra reservada: to");
    if (!tabelaSimbolos.contemToken(token)) {
        tabelaSimbolos.adicionarEntrada(token);
    }
    return token;
}

"while" {
    Yytoken token = new Yytoken(Sym.WHILE, yytext(), yyline, yychar, yychar + 5, "Palavra reservada: while");
    if (!tabelaSimbolos.contemToken(token)) {
        tabelaSimbolos.adicionarEntrada(token);
    }
    return token;
}

"read" {
    Yytoken token = new Yytoken(Sym.READ, yytext(), yyline, yychar, yychar + 4, "Palavra reservada: read");
    if (!tabelaSimbolos.contemToken(token)) {
        tabelaSimbolos.adicionarEntrada(token);
    }
    return token;
}

"write" {
    Yytoken token = new Yytoken(Sym.WRITE, yytext(), yyline, yychar, yychar + 5, "Palavra reservada: write");
    if (!tabelaSimbolos.contemToken(token)) {
        tabelaSimbolos.adicionarEntrada(token);
    }
    return token;
}

"or" {
    Yytoken token = new Yytoken(Sym.OR, yytext(), yyline, yychar, yychar + 2, "Palavra reservada: or");
    if (!tabelaSimbolos.contemToken(token)) {
        tabelaSimbolos.adicionarEntrada(token);
    }
    return token;
}

"and" {
    Yytoken token = new Yytoken(Sym.AND, yytext(), yyline, yychar, yychar + 3, "Palavra reservada: and");
    if (!tabelaSimbolos.contemToken(token)) {
        tabelaSimbolos.adicionarEntrada(token);
    }
    return token;
}

"mod" {
    Yytoken token = new Yytoken(Sym.MOD, yytext(), yyline, yychar, yychar + 3, "Palavra reservada: mod");
    if (!tabelaSimbolos.contemToken(token)) {
        tabelaSimbolos.adicionarEntrada(token);
    }
    return token;
}

"not" {
    Yytoken token = new Yytoken(Sym.NOT, yytext(), yyline, yychar, yychar + 3, "Palavra reservada: not");
    if (!tabelaSimbolos.contemToken(token)) {
        tabelaSimbolos.adicionarEntrada(token);
    }
    return token;
}

"%" {
  
}


";" {
    Yytoken token = new Yytoken(Sym.SEMICOLON, yytext(), yyline, yychar, yychar + 1, "Semicolon");
    if (!tabelaSimbolos.contemToken(token)) {
        tabelaSimbolos.adicionarEntrada(token);
    }
    return token;
}
"," {
    Yytoken token = new Yytoken(Sym.COMMA, yytext(), yyline, yychar, yychar + 1, "Comma");
    if (!tabelaSimbolos.contemToken(token)) {
        tabelaSimbolos.adicionarEntrada(token);
    }
    return token;
}

")" {
    Yytoken token = new Yytoken(Sym.RIGHT_PAREN, yytext(), yyline, yychar, yychar + 1, "Right Parenthesis");
    if (!tabelaSimbolos.contemToken(token)) {
        tabelaSimbolos.adicionarEntrada(token);
    }
    return token;
}

"(" {
    Yytoken token = new Yytoken(Sym.LEFT_PAREN, yytext(), yyline, yychar, yychar + 1, "Left Parenthesis");
    if (!tabelaSimbolos.contemToken(token)) {
        tabelaSimbolos.adicionarEntrada(token);
    }
    return token;
}



"=" {
    Yytoken token = new Yytoken(Sym.EQ, yytext(), yyline, yychar, yychar + 1, "EQ");
    if (!tabelaSimbolos.contemToken(token)) {
        tabelaSimbolos.adicionarEntrada(token);
    }
    return token;
}
"+" {
    Yytoken token = new Yytoken(Sym.PLUS, yytext(), yyline, yychar, yychar + 1, "Plus");
    if (!tabelaSimbolos.contemToken(token)) {
        tabelaSimbolos.adicionarEntrada(token);
    }
    return token;
}

"-" {
    Yytoken token = new Yytoken(Sym.MINUS, yytext(), yyline, yychar, yychar + 1, "Minus");
    if (!tabelaSimbolos.contemToken(token)) {
        tabelaSimbolos.adicionarEntrada(token);
    }
    return token;
}

">" {
    Yytoken token = new Yytoken(Sym.GT, yytext(), yyline, yychar, yychar + 1, "GT");
    if (!tabelaSimbolos.contemToken(token)) {
        tabelaSimbolos.adicionarEntrada(token);
    }
    return token;
}

">=" {
    Yytoken token = new Yytoken(Sym.GE, yytext(), yyline, yychar, yychar + 2, "GE");
    if (!tabelaSimbolos.contemToken(token)) {
        tabelaSimbolos.adicionarEntrada(token);
    }
    return token;
}

"<" {
    Yytoken token = new Yytoken(Sym.LT, yytext(), yyline, yychar, yychar + 1, "LT");
    if (!tabelaSimbolos.contemToken(token)) {
        tabelaSimbolos.adicionarEntrada(token);
    }
    return token;
}

"<=" {
    Yytoken token = new Yytoken(Sym.LE, yytext(), yyline, yychar, yychar + 2, "LE");
    if (!tabelaSimbolos.contemToken(token)) {
        tabelaSimbolos.adicionarEntrada(token);
    }
    return token;
}

"<>" {
    Yytoken token = new Yytoken(Sym.NE, yytext(), yyline, yychar, yychar + 2, "NE");
    if (!tabelaSimbolos.contemToken(token)) {
        tabelaSimbolos.adicionarEntrada(token);
    }
    return token;
}

"<<" {
    Yytoken token = new Yytoken(Sym.DLT, yytext(), yyline, yychar, yychar + 2, "DLT");
    if (!tabelaSimbolos.contemToken(token)) {
        tabelaSimbolos.adicionarEntrada(token);
    }
    return token;
}

">>" {
    Yytoken token = new Yytoken(Sym.DGT, yytext(), yyline, yychar, yychar + 2, "DGT");
    if (!tabelaSimbolos.contemToken(token)) {
        tabelaSimbolos.adicionarEntrada(token);
    }
    return token;
}

"<<<" {
    Yytoken token = new Yytoken(Sym.TLT, yytext(), yyline, yychar, yychar + 3, "TLT");
    if (!tabelaSimbolos.contemToken(token)) {
        tabelaSimbolos.adicionarEntrada(token);
    }
    return token;
}

">>>" {
    Yytoken token = new Yytoken(Sym.TGT, yytext(), yyline, yychar, yychar + 3, "TGT");
    if (!tabelaSimbolos.contemToken(token)) {
        tabelaSimbolos.adicionarEntrada(token);
    }
    return token;
}

"*" {
    Yytoken token = new Yytoken(Sym.MULT, yytext(), yyline, yychar, yychar + 1, "Mult");
    if (!tabelaSimbolos.contemToken(token)) {
        tabelaSimbolos.adicionarEntrada(token);
    }
    return token;
}

"/" {
    Yytoken token = new Yytoken(Sym.DIV, yytext(), yyline, yychar, yychar + 1, "Div");
    if (!tabelaSimbolos.contemToken(token)) {
        tabelaSimbolos.adicionarEntrada(token);
    }
    return token;
}





"?" {
    /* Crie um token correspondente ao símbolo "?" */
    Yytoken token = new Yytoken(Sym.QUESTION_MARK, yytext(), yyline, yychar, yychar + 1, "Question Mark");
    if (!tabelaSimbolos.contemToken(token)) {
        tabelaSimbolos.adicionarEntrada(token);
    }
    return token;
}

":" {
    /* Crie um token correspondente ao símbolo ":" */
    Yytoken token = new Yytoken(Sym.COLON, yytext(), yyline, yychar, yychar + 1, "Colon");
    if (!tabelaSimbolos.contemToken(token)) {
        tabelaSimbolos.adicionarEntrada(token);
    }
    return token;
}
"`" {
    /* Crie um token correspondente ao símbolo "`" */
    Yytoken token = new Yytoken(Sym.BACKTICK, yytext(), yyline, yychar, yychar + 1, "Backtick");
    if (!tabelaSimbolos.contemToken(token)) {
        tabelaSimbolos.adicionarEntrada(token);
    }
    return token;
}

"´" {
    /* Crie um token correspondente ao símbolo "´" */
    Yytoken token = new Yytoken(Sym.ACUTE_ACCENT, yytext(), yyline, yychar, yychar + 1, "Acute Accent");
    if (!tabelaSimbolos.contemToken(token)) {
        tabelaSimbolos.adicionarEntrada(token);
    }
    return token;
}


}

{identifier} {
    Yytoken token = new Yytoken(Sym.IDENTIFIER, yytext(), yyline, yychar, yychar + yylength(), "Identifier");
    if (!tabelaSimbolos.contemToken(token)) {
        tabelaSimbolos.adicionarEntrada(token);
    }
    return token;
}

{WS} {
    // Ignorar espaços em branco e quebras de linha
}

{INTEGER_CONSTANT} {
    Yytoken token = new Yytoken(Sym.INTEGERCONSTANT, yytext(), yyline, yychar, yychar + yylength(), "Interger");
    if (!tabelaSimbolos.contemToken(token)) {
        tabelaSimbolos.adicionarEntrada(token);
    }
    return token;
}

{DECIMAL_CONSTANT} {
    Yytoken token = new Yytoken(Sym.DECIMALCONSTANT, yytext(), yyline, yychar, yychar + yylength(), "Decimal");
    if (!tabelaSimbolos.contemToken(token)) {
        tabelaSimbolos.adicionarEntrada(token);
    }
    return token;
}

{assign_op} {
  Yytoken token = new Yytoken(Sym.ASSIGN_OP, yytext(), yyline, yychar, yychar + 2, "ASSIGN_OP");
    if (!tabelaSimbolos.contemToken(token)) {
        tabelaSimbolos.adicionarEntrada(token);
    }
    return token;
}
{caractere} {
    Yytoken token = new Yytoken(Sym.CARACTERE, yytext(), yyline, yychar, yychar + yylength(), "Caractere");
    if (!tabelaSimbolos.contemToken(token)) {
        tabelaSimbolos.adicionarEntrada(token);
    }
    return token;
}
. { 
    System.out.println("Illegal character: <" + yytext() + ">" + "line" + yyline);
	Utility.error(Utility.E_UNMATCHED);

    Yytoken token = new Yytoken(Sym.error, yytext(), yyline, yychar, yychar + yylength(), "Caractere");
    if (!tabelaSimbolos.contemToken(token)) {
        tabelaSimbolos.adicionarEntrada(token);
    }
    return token;
  
}
<YYINITIAL> <<EOF>> {
    tabelaSimbolos.imprimirTabela();
    System.exit(0);
}

