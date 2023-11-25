import java_cup.runtime.Symbol;


public class Yytoken extends Symbol{

    private String name; // Nome do grupo
    private int index; // Id do Grupo de tokens (identificadores ,ifs, ....)
    private String lexema; // lexema
    private int line;
    private int charBegin;
    private int charEnd;
    private Integer PosicaoTs;

    public Yytoken(int index, String lexema, int line, int charBegin, int charEnd, String name) {
        super(index);
        this.lexema = lexema;
        this.line = line;
        this.charBegin = charBegin;
        this.charEnd = charEnd;
        this.name = name;
    }
    public Yytoken(int index , String lexema, String name){
        super(index);
        this.lexema = lexema;
        this.name = name;
    }

    // Getters
    public int getIndex() {
        return index;
    }

    public String getName() {
        return name;
    }

    public String getlexema() {
        return lexema;
    }

    public int getLine() {
        return line;
    }

    public int getCharBegin() {
        return charBegin;
    }

    public int getCharEnd() {
        return charEnd;
    }
    public int getPosicaoTs(){
        return this.PosicaoTs;
    }

    // Setters
    public void setIndex(int index) {
        this.index = index;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setlexema(String lexema) {
        this.lexema = lexema;
    }

    public void setLine(int line) {
        this.line = line;
    }

    public void setCharBegin(int charBegin) {
        this.charBegin = charBegin;
    }

    public void setCharEnd(int charEnd) {
        this.charEnd = charEnd;
    }
     public void setPosicaoTs( Integer ID){
         this.PosicaoTs = ID;
    }

    @Override
    public String toString() {
        return "lexema: " + lexema +
                "\nIndex: " + index +
                "\nName: " + name +
                "\nLine: " + line +
                "\nBegin: " + charBegin +
                "\nEnd: " + charEnd;
    }
}
