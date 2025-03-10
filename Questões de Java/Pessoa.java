enum Ticket {
    ADULTO, CRIANÇA;
}

abstract class Pessoa implements Comparable<Pessoa> {
    protected String nome;
    protected int idade;

    public Pessoa (String nome, int idade){
        this.nome = nome;
        this.idade = idade;
    }

    public abstract Ticket getTicketType();

    public String getName(){
        return nome;
    }

    public int getAge(){
        return idade;
    }

    @Override
    public int compareTo(Pessoa pessoa){
        return Integer.compare(pessoa.idade, this.idade);
    }

    @Override
    public String toString(){
        return nome + ":" + idade + "[" + getTicketType() + "]";
    }
}