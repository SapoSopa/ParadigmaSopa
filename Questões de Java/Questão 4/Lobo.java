public class Lobo extends Monstro {
    final double poderDeAtaqueMax;

    public Lobo(double vida, double poderDeAtaque, int nível) {
        super(vida, poderDeAtaque, nível, "Lobo");
        this.poderDeAtaqueMax = 2 * poderDeAtaque;
    }

    @Override
    public void mordida(Dummy dummy) {
        dummy.estado = "aterrorizado";
        System.out.println("Lobo aterrorizou o dummy");
    }

    @Override
    public void arranhao(Dummy dummy) {
        dummy.vida *= 0.8;
        System.out.println("Lobo causou " + 20 * this.nível + " de dano");
    }

    @Override
    public void investida(Dummy dummy) {
        this.poderDeAtaque *= 1.1;
        if (this.poderDeAtaque > this.poderDeAtaqueMax) {
            this.poderDeAtaque = this.poderDeAtaqueMax;
        }
        System.out.println("Lobo aumentou seu poder de ataque para " + this.poderDeAtaque);
    }

    @Override
    public void roxo() {
        this.cor = "roxo";
        this.estado = "sequencia de ataques 3";
    }

    @Override
    public void amarelo() {
        this.cor = "amarelo";
        this.estado = "sequencia de ataques 2";
    }

    @Override
    public void verde() {
        this.cor = "verde";
        this.estado = "sequencia de ataques 1";
    }

    @Override
    public void azul() {
        this.cor = "azul";
        this.estado = "sequencia de ataque";
    }
}