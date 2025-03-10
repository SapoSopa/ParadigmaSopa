import java.util.ArrayList;
import java.util.Collections;

public class Queue <T extends Pessoa> {
    private ArrayList<T> pessoas;

    public Queue(int tamanho) {
        this.pessoas = new ArrayList<>(tamanho);
    }

    public Queue() {
        this.pessoas = new ArrayList<>(10);
    }

    public void push(T pessoa) {
        pessoas.add(pessoa);
        Collections.sort(pessoas);
    }

    public T pop() {
        if (isEmpty()){
            return null;
        }
        return pessoas.remove(0);
    }

    public boolean isEmpty() {
        return pessoas.isEmpty();
    }
}
