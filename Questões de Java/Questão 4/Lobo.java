public class Lobo extends Monstro implements Colorido {
    private double poderDeAtaqueMax;

    public Lobo(double vida, double poderDeAtaque, int nivel) {
        super(vida, poderDeAtaque, nivel);
        this.poderDeAtaqueMax = 2 * poderDeAtaque;
    }

    @Override
    public void mordida(Dummy dummy) {
        dummy.estado = "aterrorizado";
        this.estado = "atacando";
    }

    @Override
    public void arranhao(Dummy dummy) {
        dummy.vida *= 0.8;
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
        switch (turno) {
            case 1:
                monstro.mordida(dummy);
                break;
            case 2:
                monstro.investida(dummy);
                break;
            case 3:
                monstro.arranhao(dummy);
                break;
        }
    }

    @Override
    public void amarelo() {
        this.cor = "amarelo";
        switch (turno) {
            case 1:
                monstro.arranhão(dummy);
                break;
            case 2:
                monstro.arranhão(dummy);
                break;
        }
    }

    @Override
    public void verde() {
        this.cor = "verde";
        switch (turno) {
            case 1:
                monstro.mordida(dummy);
                break;
            case 2:
                monstro.mordida(dummy);
                break;
        }
    }

    @Override
    public void azul() {
        this.cor = "azul";
        switch (turno) {
            case 1:
                monstro.investida(dummy);
                break;
            case 2:
                monstro.investida(dummy);
                break;
        }
    }
}