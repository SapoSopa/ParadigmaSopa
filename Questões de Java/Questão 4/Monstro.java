public abstract class Monstro {
    protected double vida;
    protected String estado;
    protected double poderDeAtaque;
    protected Integer nível;
    protected String cor;

    public Monstro (double vida, double poderDeAtaque, Integer nível) {
        this.vida = vida;
        this.poderDeAtaque = poderDeAtaque;
        this.nível = nível;
        this.estado = "normal";
        this.cor = "normal";
    }

    public boolean aindaVive() {
        return this.vida > 0;
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
}