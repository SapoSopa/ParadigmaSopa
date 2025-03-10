import java.util.Random;

public class Game {
    private static Integer turno;

    public static void main(String[] args) {
        Dummy dummy = new Dummy();
        Monstro monstro = gerarMonstroAleatorio();
        Random random = new Random();

        for (turno = 1; turno <= 10; turno++) {
            if (!monstro.aindaVive()) {
                break;
            }

            int aplicarEstado = random.nextInt(2);
            int ataque = random.nextInt(3);
            switch (ataque) {
                case 0:
                    System.out.println("Turno " + turno + ": " + monstro + " atacou com mordida");
                    monstro.mordida(dummy);
                    break;
                case 1:
                    System.out.println("Turno " + turno + ": " + monstro + " atacou com arranhão");
                    monstro.arranhao(dummy);
                    break;
                case 2:
                    System.out.println("Turno " + turno + ": " + monstro + " atacou com investida");
                    monstro.investida(dummy);
                    break;
            }
            
            if (aplicarEstado == 1) {
                switch (monstro.estado)
                    case "sangramento":
                        System.out.println("Turno " + turno + ": " + monstro + " aplicou sangramento");
                        monstro.sangra(dummy);
                        break;
                    case "aterrorizante":
                        System.out.println("Turno " + turno + ": " + monstro + " aplicou terror");
                        monstro.aterroriza(dummy);
                        break;
                    case "envenenamento":
                        System.out.println("Turno " + turno + ": " + monstro + " aplicou veneno");
                        monstro.envenena(dummy);
                        break;
            }

            monstro.vida *= 0.9;
            if (!monstro.aindaVive()) {
                break;
            }

            dummy.reset();
        }
    }

    private static Monstro gerarMonstroAleatorio() {
        Random random = new Random();
        int tipo = random.nextInt(3);
        int cor = random.nextInt(5);
        int nivel = random.nextInt(10) + 1;

        Monstro monstro;
        switch (tipo) {
            case 0:
                monstro = new Dragao(9999 + nivel / 2, 999 * Math.sqrt(nivel), nivel);
                break;
            case 1:
                monstro = new Rato(1000 + nivel, 100 + nivel * nivel, nivel);
                break;
            case 2:
                monstro = new Lobo(5000 + nivel * nivel, 500 + nivel, nivel);
                break;
        }

        switch (cor) {
            case 0:
                monstro.roxo();
                break;
            case 1:
                monstro.amarelo();
                break;
            case 2:
                monstro.verde();
                break;
            case 3:
                monstro.azul();
                break;
            case 4:
                break;
        }

        return monstro;
    }
}