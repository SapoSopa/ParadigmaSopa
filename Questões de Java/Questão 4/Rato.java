
import java.util.Random;


public class Rato extends Monstro {

    public Rato(double vida, double poderDeAtaque, int nível) {
        super(vida, poderDeAtaque, nível, "Rato");
    }

    @Override
    public void mordida(Dummy dummy) {
        dummy.estado = "envenenado";
        System.out.println("Rato envenenou o dummy");
    }

    @Override
    public void arranhao(Dummy dummy) {
        dummy.vida -= 10 * nível;
        System.out.println("Rato causou " + 10 * nível + " de dano");
    }

    @Override
    public void investida(Dummy dummy) {
        Random random = new Random();
        int hit = random.nextInt(2);
        if (hit == 1) {
            int ataque = random.nextInt(2);
            for (int i = 0; i < 2; i++) {
                switch (ataque) {
                    case 0 -> {
                        System.out.println("Na parte " + (i+1) + " da investida o Rato atacou com mordida");
                        this.mordida(dummy);
                    }
                    case 1 -> {
                        System.out.println("Na parte " + (i+1) + " da investida o Rato atacou com arranhão");
                        this.arranhao(dummy);
                    }
                }
            }
        }
        else {
            System.out.println("Rato errou a investida");
        }
    }

    @Override
    public void roxo() {
        this.cor = "roxo";
        this.estado = "atacando três vezes";
    }

    @Override
    public void amarelo() {
        this.cor = "amarelo";
        super.aterroriza();
    }

    @Override
    public void verde() {
        this.cor = "verde";
        this.estado = "atacando primeiro";
    }

    @Override
    public void azul() {
        this.cor = "azul";
        super.envenena();
    }
}