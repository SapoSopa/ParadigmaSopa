import java.util.Arrays;

public class Main {
    public static void main(String[] args) {
        Cafeteria cafeteria = new Cafeteria();
        Bebida cafe = new Bebida(1, "Café", 3.50, 100, 250);
        Comida sanduiche = new Comida(2, "Sanduíche", 7.00, 50, Arrays.asList("Pão", "Queijo", "Presunto"));

        cafeteria.adicionarProduto(cafe);
        cafeteria.adicionarProduto(sanduiche);

        try {
            cafeteria.realizarVenda("Café", 2);
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }

        try {
            cafeteria.realizarVenda("Suco", 1);
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }

        try {
            cafeteria.realizarVenda("Sanduíche", 0);
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }

        try {
            cafeteria.realizarVenda("Sanduíche", 60);
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }
}