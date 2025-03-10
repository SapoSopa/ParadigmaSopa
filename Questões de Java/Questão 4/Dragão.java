public class Dragão extends Monstro implements Colorido {
    private double poderDeAtaqueMax;

    public Dragão(double vida, double poderDeAtaque, Integer nível) {
        super(vida, poderDeAtaque, nível);
        this.poderDeAtaqueMax = poderDeAtaque * 1.5;
    }

    @Override
    public void mordida(Dummy dummy) {
        dummy.estado = "sangramento";
        this.estado = "atacando";
    }

    @Override
    public void arranhao(Dummy dummy) {
        dummy.vida -= 50 * this.nível;
        this.estado = "atacando";
    }

    @Override
    public void investida(Dummy dummy) {
        this.poderDeAtaque *= 1.1;
        if (this.poderDeAtaque > this.poderDeAtaqueMax) {
            this.poderDeAtaque = this.poderDeAtaqueMax;
        }
        this.estado = "atacando";
    }

    @Override
    public void roxo() {
        this.cor = "roxo";
        this.poderDeAtaque *= 1.5;
        this.vida *= 0.75;
    }

    @Override
    public void amarelo() {
        this.cor = "amarelo";
        this.estado = "preparado"/////
    }

    @Override
    public void verde() {
        this.cor = "verde";
        this.poderDeAtaque *= 1.2;
    }

    @Override
    public void azul() {
        this.cor = "azul";
        this.vida *= 1.25;
    }
}