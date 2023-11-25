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
}

public class TabelaSimbolos {

    private Map<Integer, Dado> tabela;
    private int proximoId;

    public TabelaSimbolos() {
        this.tabela = new HashMap<>();
        this.proximoId = 0;
        inicializarTabelaPalavrasReservadas();
    }

    public void  adicionarEntrada(Yytoken token) {
        Dado dado = new Dado(token.getlexema(), token.getName(), token.getIndex());
        int id = obterProximoId();
        tabela.put(id, dado);
        token.setPosicaoTs(id);

    }

    private void adicionarEntrada(String lexema, String nome, int index) {
        Dado dado = new Dado(lexema, nome, index);
        int id = obterProximoId();
        tabela.put(id, dado);
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
// a posição dos palavras reservadas é sempre igual ao index ;
    private void inicializarTabelaPalavrasReservadas() {
        adicionarEntrada(new Yytoken(1, "program", "Palavra reservada: program"));
        adicionarEntrada("program", "Palavra reservada: program", 0);
        adicionarEntrada("declare", "Palavra reservada: declare", 1);
        adicionarEntrada("begin", "Palavra reservada: begin", 2);
        adicionarEntrada("integer", "Palavra reservada: integer", 3);
        adicionarEntrada("decimal", "Palavra reservada: decimal", 4);
        adicionarEntrada("if", "Palavra reservada: if", 5);
        adicionarEntrada("then", "Palavra reservada: then", 6);
        adicionarEntrada("else", "Palavra reservada: else", 7);
        adicionarEntrada("for", "Palavra reservada: for", 8);
        adicionarEntrada("end", "Palavra reservada: end", 9);
        adicionarEntrada("do", "Palavra reservada: do", 10);
        adicionarEntrada("to", "Palavra reservada: to", 11);
        adicionarEntrada("while", "Palavra reservada: while", 12);
        adicionarEntrada("read", "Palavra reservada: read", 13);
        adicionarEntrada("write", "Palavra reservada: write", 14);
        adicionarEntrada("or", "Palavra reservada: or", 15);
        adicionarEntrada("and", "Palavra reservada: and", 16);
        adicionarEntrada("mod", "Palavra reservada: mod", 17);
        adicionarEntrada("not", "Palavra reservada: not", 18);
    }
}
