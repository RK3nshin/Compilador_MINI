import java_cup.runtime.Symbol;
import java.io.IOException;

/* Declaração de variável global para rastrear o número da ação */

%%

%{
   TabelaSimbolos tabelaSimbolos = new TabelaSimbolos();
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
    Yytoken token = new Yytoken(0, yytext(), yyline, yychar, yychar + 7, "Palavra reservada: program");
    if (!tabelaSimbolos.contemToken(token)) {
        tabelaSimbolos.adicionarEntrada(token);
    }
    return token;
}

"declare" {
    Yytoken token = new Yytoken(1, yytext(), yyline, yychar, yychar + 7, "Palavra reservada: declare");
    if (!tabelaSimbolos.contemToken(token)) {
        tabelaSimbolos.adicionarEntrada(token);
    }
    return token;
}

"begin" {
    Yytoken token = new Yytoken(2, yytext(), yyline, yychar, yychar + 5, "Palavra reservada: begin");
    if (!tabelaSimbolos.contemToken(token)) {
        tabelaSimbolos.adicionarEntrada(token);
    }
    return token;
}

"integer" {
    Yytoken token = new Yytoken(3, yytext(), yyline, yychar, yychar + 7, "Palavra reservada: integer");
    if (!tabelaSimbolos.contemToken(token)) {
        tabelaSimbolos.adicionarEntrada(token);
    }
    return token;
}

"decimal" {
    Yytoken token = new Yytoken(4, yytext(), yyline, yychar, yychar + 7, "Palavra reservada: decimal");
    if (!tabelaSimbolos.contemToken(token)) {
        tabelaSimbolos.adicionarEntrada(token);
    }
    return token;
}

"if" {
    Yytoken token = new Yytoken(5, yytext(), yyline, yychar, yychar + 2, "Palavra reservada: if");
    if (!tabelaSimbolos.contemToken(token)) {
        tabelaSimbolos.adicionarEntrada(token);
    }
    return token;
}

"then" {
    Yytoken token = new Yytoken(6, yytext(), yyline, yychar, yychar + 4, "Palavra reservada: then");
    if (!tabelaSimbolos.contemToken(token)) {
        tabelaSimbolos.adicionarEntrada(token);
    }
    return token;
}

"else" {
    Yytoken token = new Yytoken(7, yytext(), yyline, yychar, yychar + 4, "Palavra reservada: else");
    if (!tabelaSimbolos.contemToken(token)) {
        tabelaSimbolos.adicionarEntrada(token);
    }
    return token;
}

"for" {
    Yytoken token = new Yytoken(8, yytext(), yyline, yychar, yychar + 3, "Palavra reservada: for");
    if (!tabelaSimbolos.contemToken(token)) {
        tabelaSimbolos.adicionarEntrada(token);
    }
    return token;
}

"end" {
    Yytoken token = new Yytoken(9, yytext(), yyline, yychar, yychar + 3, "Palavra reservada: end");
    if (!tabelaSimbolos.contemToken(token)) {
        tabelaSimbolos.adicionarEntrada(token);
    }
    return token;
}

"do" {
    Yytoken token = new Yytoken(10, yytext(), yyline, yychar, yychar + 2, "Palavra reservada: do");
    if (!tabelaSimbolos.contemToken(token)) {
        tabelaSimbolos.adicionarEntrada(token);
    }
    return token;
}

"to" {
    Yytoken token = new Yytoken(11, yytext(), yyline, yychar, yychar + 2, "Palavra reservada: to");
    if (!tabelaSimbolos.contemToken(token)) {
        tabelaSimbolos.adicionarEntrada(token);
    }
    return token;
}

"while" {
    Yytoken token = new Yytoken(12, yytext(), yyline, yychar, yychar + 5, "Palavra reservada: while");
    if (!tabelaSimbolos.contemToken(token)) {
        tabelaSimbolos.adicionarEntrada(token);
    }
    return token;
}

"read" {
    Yytoken token = new Yytoken(13, yytext(), yyline, yychar, yychar + 4, "Palavra reservada: read");
    if (!tabelaSimbolos.contemToken(token)) {
        tabelaSimbolos.adicionarEntrada(token);
    }
    return token;
}

"write" {
    Yytoken token = new Yytoken(14, yytext(), yyline, yychar, yychar + 5, "Palavra reservada: write");
    if (!tabelaSimbolos.contemToken(token)) {
        tabelaSimbolos.adicionarEntrada(token);
    }
    return token;
}

"or" {
    Yytoken token = new Yytoken(15, yytext(), yyline, yychar, yychar + 2, "Palavra reservada: or");
    if (!tabelaSimbolos.contemToken(token)) {
        tabelaSimbolos.adicionarEntrada(token);
    }
    return token;
}

"and" {
    Yytoken token = new Yytoken(16, yytext(), yyline, yychar, yychar + 3, "Palavra reservada: and");
    if (!tabelaSimbolos.contemToken(token)) {
        tabelaSimbolos.adicionarEntrada(token);
    }
    return token;
}

"mod" {
    Yytoken token = new Yytoken(17, yytext(), yyline, yychar, yychar + 3, "Palavra reservada: mod");
    if (!tabelaSimbolos.contemToken(token)) {
        tabelaSimbolos.adicionarEntrada(token);
    }
    return token;
}

"not" {
    Yytoken token = new Yytoken(18, yytext(), yyline, yychar, yychar + 3, "Palavra reservada: not");
    if (!tabelaSimbolos.contemToken(token)) {
        tabelaSimbolos.adicionarEntrada(token);
    }
    return token;
}

"%" {
    Yytoken token = new Yytoken(19, yytext(), yyline, yychar, yychar + 1, "Comentario / Mod");
    if (!tabelaSimbolos.contemToken(token)) {
        tabelaSimbolos.adicionarEntrada(token);
    }
    return token;
}


";" {
    Yytoken token = new Yytoken(19, yytext(), yyline, yychar, yychar + 1, "Semicolon");
    if (!tabelaSimbolos.contemToken(token)) {
        tabelaSimbolos.adicionarEntrada(token);
    }
    return token;
}
"," {
    Yytoken token = new Yytoken(31, yytext(), yyline, yychar, yychar + 1, "Comma");
    if (!tabelaSimbolos.contemToken(token)) {
        tabelaSimbolos.adicionarEntrada(token);
    }
    return token;
}

")" {
    Yytoken token = new Yytoken(32, yytext(), yyline, yychar, yychar + 1, "Right Parenthesis");
    if (!tabelaSimbolos.contemToken(token)) {
        tabelaSimbolos.adicionarEntrada(token);
    }
    return token;
}

"(" {
    Yytoken token = new Yytoken(33, yytext(), yyline, yychar, yychar + 1, "Left Parenthesis");
    if (!tabelaSimbolos.contemToken(token)) {
        tabelaSimbolos.adicionarEntrada(token);
    }
    return token;
}

"[" {
    Yytoken token = new Yytoken(34, yytext(), yyline, yychar, yychar + 1, "Left Square Bracket");
    if (!tabelaSimbolos.contemToken(token)) {
        tabelaSimbolos.adicionarEntrada(token);
    }
    return token;
}

"]" {
    Yytoken token = new Yytoken(35, yytext(), yyline, yychar, yychar + 1, "Right Square Bracket");
    if (!tabelaSimbolos.contemToken(token)) {
        tabelaSimbolos.adicionarEntrada(token);
    }
    return token;
}

"{" {
    Yytoken token = new Yytoken(36, yytext(), yyline, yychar, yychar + 1, "Left Curly Brace");
    if (!tabelaSimbolos.contemToken(token)) {
        tabelaSimbolos.adicionarEntrada(token);
    }
    return token;
}

"}" {
    Yytoken token = new Yytoken(37, yytext(), yyline, yychar, yychar + 1, "Right Curly Brace");
    if (!tabelaSimbolos.contemToken(token)) {
        tabelaSimbolos.adicionarEntrada(token);
    }
    return token;
}

"=" {
    Yytoken token = new Yytoken(3, yytext(), yyline, yychar, yychar + 1, "EQ");
    if (!tabelaSimbolos.contemToken(token)) {
        tabelaSimbolos.adicionarEntrada(token);
    }
    return token;
}
"+" {
    Yytoken token = new Yytoken(3, yytext(), yyline, yychar, yychar + 1, "Plus");
    if (!tabelaSimbolos.contemToken(token)) {
        tabelaSimbolos.adicionarEntrada(token);
    }
    return token;
}

"-" {
    Yytoken token = new Yytoken(1, yytext(), yyline, yychar, yychar + 1, "Minus");
    if (!tabelaSimbolos.contemToken(token)) {
        tabelaSimbolos.adicionarEntrada(token);
    }
    return token;
}

">" {
    Yytoken token = new Yytoken(5, yytext(), yyline, yychar, yychar + 1, "GE");
    if (!tabelaSimbolos.contemToken(token)) {
        tabelaSimbolos.adicionarEntrada(token);
    }
    return token;
}

">=" {
    Yytoken token = new Yytoken(6, yytext(), yyline, yychar, yychar + 2, "GE");
    if (!tabelaSimbolos.contemToken(token)) {
        tabelaSimbolos.adicionarEntrada(token);
    }
    return token;
}

"<" {
    Yytoken token = new Yytoken(7, yytext(), yyline, yychar, yychar + 1, "LT");
    if (!tabelaSimbolos.contemToken(token)) {
        tabelaSimbolos.adicionarEntrada(token);
    }
    return token;
}

"<=" {
    Yytoken token = new Yytoken(8, yytext(), yyline, yychar, yychar + 2, "LE");
    if (!tabelaSimbolos.contemToken(token)) {
        tabelaSimbolos.adicionarEntrada(token);
    }
    return token;
}

"<>" {
    Yytoken token = new Yytoken(9, yytext(), yyline, yychar, yychar + 2, "NE");
    if (!tabelaSimbolos.contemToken(token)) {
        tabelaSimbolos.adicionarEntrada(token);
    }
    return token;
}

"<<" {
    Yytoken token = new Yytoken(10, yytext(), yyline, yychar, yychar + 2, "DLT");
    if (!tabelaSimbolos.contemToken(token)) {
        tabelaSimbolos.adicionarEntrada(token);
    }
    return token;
}

">>" {
    Yytoken token = new Yytoken(11, yytext(), yyline, yychar, yychar + 2, "DGT");
    if (!tabelaSimbolos.contemToken(token)) {
        tabelaSimbolos.adicionarEntrada(token);
    }
    return token;
}

"<<<" {
    Yytoken token = new Yytoken(12, yytext(), yyline, yychar, yychar + 3, "TLT");
    if (!tabelaSimbolos.contemToken(token)) {
        tabelaSimbolos.adicionarEntrada(token);
    }
    return token;
}

">>>" {
    Yytoken token = new Yytoken(13, yytext(), yyline, yychar, yychar + 3, "TGT");
    if (!tabelaSimbolos.contemToken(token)) {
        tabelaSimbolos.adicionarEntrada(token);
    }
    return token;
}

"*" {
    Yytoken token = new Yytoken(14, yytext(), yyline, yychar, yychar + 1, "Mult");
    if (!tabelaSimbolos.contemToken(token)) {
        tabelaSimbolos.adicionarEntrada(token);
    }
    return token;
}

"/" {
    Yytoken token = new Yytoken(15, yytext(), yyline, yychar, yychar + 1, "Div");
    if (!tabelaSimbolos.contemToken(token)) {
        tabelaSimbolos.adicionarEntrada(token);
    }
    return token;
}



":=" {
    Yytoken token = new Yytoken(18, yytext(), yyline, yychar, yychar + 2, "ASSIGN_OP");
    if (!tabelaSimbolos.contemToken(token)) {
        tabelaSimbolos.adicionarEntrada(token);
    }
    return token;
}

"?" {
    /* Crie um token correspondente ao símbolo "?" */
    Yytoken token = new Yytoken(QUESTION_MARK, yytext(), yyline, yychar, yychar + 1, "Question Mark");
    if (!tabelaSimbolos.contemToken(token)) {
        tabelaSimbolos.adicionarEntrada(token);
    }
    return token;
}

":" {
    /* Crie um token correspondente ao símbolo ":" */
    Yytoken token = new Yytoken(COLON, yytext(), yyline, yychar, yychar + 1, "Colon");
    if (!tabelaSimbolos.contemToken(token)) {
        tabelaSimbolos.adicionarEntrada(token);
    }
    return token;
}
"`" {
    /* Crie um token correspondente ao símbolo "`" */
    Yytoken token = new Yytoken(BACKTICK, yytext(), yyline, yychar, yychar + 1, "Backtick");
    if (!tabelaSimbolos.contemToken(token)) {
        tabelaSimbolos.adicionarEntrada(token);
    }
    return token;
}

"´" {
    /* Crie um token correspondente ao símbolo "´" */
    Yytoken token = new Yytoken(ACUTE_ACCENT, yytext(), yyline, yychar, yychar + 1, "Acute Accent");
    if (!tabelaSimbolos.contemToken(token)) {
        tabelaSimbolos.adicionarEntrada(token);
    }
    return token;
}


}

{identifier} {
    Yytoken token = new Yytoken(20, yytext(), yyline, yychar, yychar + yylength(), "Identifier");
    if (!tabelaSimbolos.contemToken(token)) {
        tabelaSimbolos.adicionarEntrada(token);
    }
    return token;
}

{WS} {
    // Ignorar espaços em branco e quebras de linha
}

{INTEGER_CONSTANT} {
    Yytoken token = new Yytoken(25, yytext(), yyline, yychar, yychar + yylength(), "Interger");
    if (!tabelaSimbolos.contemToken(token)) {
        tabelaSimbolos.adicionarEntrada(token);
    }
    return token;
}

{DECIMAL_CONSTANT} {
    Yytoken token = new Yytoken(26, yytext(), yyline, yychar, yychar + yylength(), "Decimal");
    if (!tabelaSimbolos.contemToken(token)) {
        tabelaSimbolos.adicionarEntrada(token);
    }
    return token;
}

{assign_op} {
    Yytoken token = new Yytoken(27, yytext(), yyline, yychar, yychar + 2, "Assing_op");
    if (!tabelaSimbolos.contemToken(token)) {
        tabelaSimbolos.adicionarEntrada(token);
    }
    return token;
}
{caractere} {
    Yytoken token = new Yytoken(29, yytext(), yyline, yychar, yychar + yylength(), "Caractere");
    if (!tabelaSimbolos.contemToken(token)) {
        tabelaSimbolos.adicionarEntrada(token);
    }
    return token;
}
. { 
  System.out.println("Illegal character: <" + yytext() + ">" + "line" + yyline);
	Utility.error(Utility.E_UNMATCHED);
}
<YYINITIAL> <<EOF>> {
    Yytoken token = new Yytoken(29, yytext(), yyline, yychar, yychar + 5, "<EOF>");
    tabelaSimbolos.imprimirTabela();
    return token;
}

