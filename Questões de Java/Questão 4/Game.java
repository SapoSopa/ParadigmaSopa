import java.util.Random;

public class Game {
    private static Integer turno;

    public static void main(String[] args) {
        Dummy dummy = new Dummy();
        Monstro monstro = gerarMonstroAleatorio();
        Random random = new Random();
        int sequenciaDeAtaques[] = new int[] {-1, -1, -1, -1};

        if (monstro.tipo.equals("Lobo") && !monstro.cor.equals("normal")) {
            switch (monstro.cor) {
                case "roxo" -> sequenciaDeAtaques = new int[]{0, 2, 1, -1};
                case "amarelo" -> sequenciaDeAtaques = new int[]{1, 1, -1, -1};
                case "verde" -> sequenciaDeAtaques = new int[]{0, 0, -1, -1};
                case "azul" -> sequenciaDeAtaques = new int[]{2, 2, -1, -1};
            }
        }

        System.out.println("Um " + monstro.getNome() + " apareceu!");
        System.out.println("Vida do monstro: " + monstro.vida);
        double dummyAtaque = (monstro.vida / 9);
        
        for (turno = 1; turno <= 10; turno++) {
            if (!monstro.aindaVive()) {
                System.out.println("O " + monstro.getNome() + " já está morto!");
                break;
            }
            
            System.out.println("\n\nTurno " + turno + ":");

            boolean monstroAtacaPrimeiro = random.nextBoolean();
            if (monstro.estado.equals("atacando primeiro")) {
                monstroAtacaPrimeiro = true;
            }
            if (monstroAtacaPrimeiro) {    
                int ataque = random.nextInt(3);
                switch (monstro.estado) {
                    case "atacando duas vezes" -> {
                        ataque(monstro, dummy, ataque);
                        ataque = random.nextInt(3);
                        ataque(monstro, dummy, ataque);
                    }
                    case "atacando três vezes" -> {
                        ataque(monstro, dummy, ataque);
                        ataque = random.nextInt(3);
                        ataque(monstro, dummy, ataque);
                        ataque = random.nextInt(3);
                        ataque(monstro, dummy, ataque);
                    }
                    default -> {
                        if (monstro.tipo.equals("Lobo") && sequenciaDeAtaques[turno]!=(-1)) {
                            ataque = sequenciaDeAtaques[turno];
                        }
                        ataque(monstro, dummy, ataque);
                    }
                }
                System.out.println("Dummy revidou com sua espada e causou " + (dummyAtaque) + " de dano");
                monstro.sofreuDano(dummyAtaque);
            } else {
                System.out.println("O Dummy atacou com espada e causou " + (monstro.vida * 0.1) + " de dano");
                monstro.sofreuDano(dummyAtaque);

                int ataque = random.nextInt(3);
                switch (monstro.estado) {
                    case "atacando duas vezes" -> {
                        ataque(monstro, dummy, ataque);
                        ataque = random.nextInt(3);
                        ataque(monstro, dummy, ataque);
                    }
                    case "atacando três vezes" -> {
                        ataque(monstro, dummy, ataque);
                        ataque = random.nextInt(3);
                        ataque(monstro, dummy, ataque);
                        ataque = random.nextInt(3);
                        ataque(monstro, dummy, ataque);
                    }
                    default -> {
                        if (monstro.tipo.equals("Lobo") && sequenciaDeAtaques[turno]!=(-1)) {
                            ataque = sequenciaDeAtaques[turno];
                        }
                        ataque(monstro, dummy, ataque);
                    }
                }
            }

            if (!monstro.aindaVive()) {
                System.out.println("Dummy matou o " + monstro.getNome() + "!");
                break;
            }

            System.out.println("Vida do monstro: " + monstro.vida);
            dummy.reset();
            System.out.println("Vida do dummy usou hack e se regenerou completamente!");
        }
    }

    private static void ataque(Monstro monstro, Dummy dummy, int tipoAtaque) {
        Random random = new Random();

        int aplicarEstado = random.nextInt(2);
        switch (tipoAtaque) {
            case 0 -> {
                System.out.println(monstro.getNome() + " atacou com mordida");
                monstro.mordida(dummy);
            }
            case 1 -> {
                System.out.println(monstro.getNome() + " atacou com arranhão");
                monstro.arranhao(dummy);
            }
            case 2 -> {
                System.out.println(monstro.getNome() + " atacou com investida");
                monstro.investida(dummy);
            }
        }
        if (aplicarEstado == 1) {
            afetarDummy(dummy, monstro);
        }
    }

    private static void afetarDummy(Dummy dummy, Monstro monstro) {
        switch (monstro.estado) {
            case "sangramento" -> {
                System.out.println("O " + monstro.getNome() + " aplicou sangramento no dummy");
                dummy.estado = "sangrando";
            }
            case "aterrorizante" -> {
                System.out.println("O " + monstro.getNome() + " aplicou terror no dummy");
                dummy.estado = "aterrorizado";
            }
            case "venenoso" -> {
                System.out.println("O " + monstro.getNome() + " aplicou veneno no dummy");
                dummy.estado = "envenenado";
            }
            case "normal" -> {
            }
        }
    }

    private static Monstro gerarMonstroAleatorio() {
        Random random = new Random();
        int tipo = random.nextInt(3);
        int cor = random.nextInt(5);
        int nivel = random.nextInt(10) + 1;

        Monstro monstro = switch (tipo) {
            case 0 -> new Dragão(9999 + nivel / 2, 999 * Math.sqrt(nivel), nivel);
            case 1 -> new Rato(1000 + nivel, 100 + nivel * nivel, nivel);
            case 2 -> new Lobo(5000 + nivel * nivel, 500 + nivel, nivel);
            default -> null;
        };

        if (monstro != null) {
            switch (cor) {
                case 0 -> monstro.roxo();
                case 1 -> monstro.amarelo();
                case 2 -> monstro.verde();
                case 3 -> monstro.azul();
                case 4 -> {}
            }
        }

        return monstro;
    }
}