public class Dragão extends Monstro {
    final double poderDeAtaqueMax;

    public Dragão(double vida, double poderDeAtaque, Integer nível) {
        super(vida, poderDeAtaque, nível, "Dragão");
        this.poderDeAtaqueMax = poderDeAtaque * 1.5;
    }

    @Override
    public void mordida(Dummy dummy) {
        dummy.estado = "sangramento";
        System.out.println("Dragão causou sangramento");
    }

    @Override
    public void arranhao(Dummy dummy) {
        dummy.vida -= 50 * this.nível;
        System.out.println("Dragão causou " + 50 * this.nível + " de dano");
    }

    @Override
    public void investida(Dummy dummy) {
        this.poderDeAtaque *= 1.1;
        if (this.poderDeAtaque > this.poderDeAtaqueMax) {
            this.poderDeAtaque = this.poderDeAtaqueMax;
        }
        System.out.println("Dragão aumentou seu poder de ataque para " + this.poderDeAtaque);
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
        this.estado = "atacando duas vezes";
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