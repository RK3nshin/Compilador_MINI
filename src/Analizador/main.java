import java.io.IOException;

public class main {
    public static void main(String[] args) {
        try {
            TabelaSimbolos symbolTable = new TabelaSimbolos();
            Yylex lexer = new Yylex("Test/Entradas/Entrada1.txt", symbolTable);
           
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}


