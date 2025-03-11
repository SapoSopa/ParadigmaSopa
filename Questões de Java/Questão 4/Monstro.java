public abstract class Monstro implements Colorido {
    protected double vida;
    protected String estado;
    protected double poderDeAtaque;
    protected Integer nível;
    protected String cor;
    protected String tipo;

    public Monstro (double vida, double poderDeAtaque, Integer nível, String tipo) {
        this.vida = vida;
        this.poderDeAtaque = poderDeAtaque;
        this.nível = nível;
        this.estado = "normal";
        this.cor = "normal";
        this.tipo = tipo;
    }

    public String getNome() {
        return (this.tipo + " " + this.cor);
    }

    public boolean aindaVive() {
        return this.vida > 0;
    }

    public void sofreuDano(double dano) {
        this.vida -= dano;
    }

    public abstract void mordida(Dummy dummy);
    public abstract void arranhao(Dummy dummy);
    public abstract void investida(Dummy dummy);

    public void sangra() {
        this.estado = "sangramento";
    }

    public void aterroriza() {
        this.estado = "aterrorizante";
    }

    public void envenena() {
        this.estado = "venenoso";
    }

    @Override
    public abstract void roxo();
    @Override
    public abstract void amarelo();
    @Override
    public abstract void verde();
    @Override
    public abstract void azul();
}