class Criança extends Pessoa{
    public Criança(String nome, int idade){
        super(nome, idade);
    } 

    @Override
    public Ticket getTicketType(){
        return Ticket.CRIANÇA;
    }
}
