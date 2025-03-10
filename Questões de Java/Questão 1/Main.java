public class Main {
    public static void main(String[] args) {
        Queue<Pessoa> queue = new Queue<>(5);

        queue.push(new Criança("Criança 1", 5));
        queue.push(new Adulto("Adulto 1", 30));
        queue.push(new Criança("Criança 2", 6));
        queue.push(new Adulto("Adulto 2", 20));
        queue.push(new Criança("Criança 3", 8));

        while (!queue.isEmpty()) {
            Pessoa p = queue.pop();
            System.out.println(p);
        }
    }
}
