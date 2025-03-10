public class Rato extends Monstro implements Colorido {

    public Rato(double vida, double poderDeAtaque, int nivel) {
        super(vida, poderDeAtaque, nivel);
    }

    @Override
    public void mordida(Dummy dummy) {
        dummy.estado = "envenenado";
        System.out.println("Rato envenenou o dummy");
        this.estado = "atacando";
    }

    @Override
    public void arranhao(Dummy dummy) {
        dummy.vida -= 10 * nivel;
        System.out.println("Rato causou " + 10 * nivel + " de dano");
        this.estado = "atacando";
    }

    @Override
    public void investida(Dummy dummy) {
        this.estado = "rápido";///
    }

    @Override
    public void roxo() {
        this.estado = "muito rápido";///
    }

    @Override
    public void amarelo() {
        super.aterroriza();
    }

    @Override
    public void verde() {
        this.estado = "preparado";///
    }

    @Override
    public void azul() {
        super.envenena();
    }
}