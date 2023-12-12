import java.util.HashMap;
import java.util.Map;

class Dado {
    private String lexema;
    private String nome;
    private int index;

    public Dado(String lexema, String nome, int index) {
        this.lexema = lexema;
        this.nome = nome;
        this.index = index;
    }

    public String getLexema() {
        return lexema;
    }

    public String getNome() {
        return nome;
    }

    public int getIndex() {
        return index;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Dado dado = (Dado) o;
        // Compare os campos relevantes para determinar a igualdade
        if (index != dado.index) return false;
        if (lexema != null ? !lexema.equals(dado.lexema) : dado.lexema != null) return false;
        return nome != null ? nome.equals(dado.nome) : dado.nome == null;
    }

    @Override
    public int hashCode() {
        int result = lexema != null ? lexema.hashCode() : 0;
        result = 31 * result + (nome != null ? nome.hashCode() : 0);
        result = 31 * result + index;
        return result;
    }
}

public class TabelaSimbolos {

    private Map<Integer, Dado> tabela;
    private int proximoId;

    public TabelaSimbolos() {
        this.tabela = new HashMap<>();
        this.proximoId = 0;
        inicializarTabelaPalavrasReservadas();
    }
    public Integer obterChave(Dado dado) {
        for (Map.Entry<Integer, Dado> entry : tabela.entrySet()) {
            if (entry.getValue().equals(dado)) {
                return entry.getKey(); 
            }
        }
        return null; 
    }

    public void  adicionarEntrada(Yytoken token) {
        Dado dado = new Dado(token.getlexema(), token.getName(), token.getIndex());
        if (!contemToken(token)){
            int id = obterProximoId();
            tabela.put(id, dado);
            token.setPosicaoTs(id);
        }else{
            int id  = obterChave(dado);
            token.setPosicaoTs(id);
        }
        
    }


    public Dado obterDado(int posição) {
        return tabela.get(posição);
    }

    public boolean contemToken(Yytoken token) {
        Dado dado = new Dado(token.getlexema(), token.getName(), token.getIndex());
        return tabela.containsValue(dado);
    }

    public void imprimirTabela() {
        System.out.println("Tabela de Símbolos:");
        for (Map.Entry<Integer, Dado> entry : tabela.entrySet()) {
            System.out.println("ID: " + entry.getKey() +
                    ", Lexema: " + entry.getValue().getLexema() +
                    ", Nome: " + entry.getValue().getNome() +
                    ", Index: " + entry.getValue().getIndex());
        }
    }

    private int obterProximoId() {
        return proximoId++;
    }
    private void inicializarTabelaPalavrasReservadas() {
        adicionarEntrada(new Yytoken( "program", "Palavra reservada: program" , Sym.PROGRAM));
        adicionarEntrada(new Yytoken("declare", "Palavra reservada: declare", Sym.DECLARE));
        adicionarEntrada(new Yytoken("begin", "Palavra reservada: begin", Sym.BEGIN));
        adicionarEntrada(new Yytoken("integer", "Palavra reservada: integer", Sym.INTEGER));
        adicionarEntrada(new Yytoken("decimal", "Palavra reservada: decimal", Sym.DECIMAL));
        adicionarEntrada(new Yytoken("if", "Palavra reservada: if", Sym.IF));
        adicionarEntrada(new Yytoken("then", "Palavra reservada: then", Sym.THEN));
        adicionarEntrada(new Yytoken("else", "Palavra reservada: else", Sym.ELSE));
        adicionarEntrada(new Yytoken ("for", "Palavra reservada: for", Sym.FOR));
        adicionarEntrada(new Yytoken ("end", "Palavra reservada: end", Sym.END));
        adicionarEntrada(new Yytoken("do", "Palavra reservada: do", Sym.DO));
        adicionarEntrada(new Yytoken("to", "Palavra reservada: to", Sym.TO));
        adicionarEntrada(new Yytoken ("while", "Palavra reservada: while", Sym.WHILE));
        adicionarEntrada(new Yytoken("read", "Palavra reservada: read", Sym.READ));
        adicionarEntrada(new Yytoken ("write", "Palavra reservada: write", Sym.WRITE));
        adicionarEntrada(new Yytoken ("or", "Palavra reservada: or", Sym.OR));
        adicionarEntrada(new Yytoken("and", "Palavra reservada: and", Sym.AND));
        adicionarEntrada(new Yytoken("mod", "Palavra reservada: mod", Sym.MOD));
        adicionarEntrada(new Yytoken("not", "Palavra reservada: not", Sym.NOT));
    }
}
