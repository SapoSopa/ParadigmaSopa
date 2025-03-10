import java.util.ArrayList;
import java.util.List;

public class Cafeteria {
    private List<Produto> produtos;

    public Cafeteria() {
        this.produtos = new ArrayList<>();
    }

    public void adicionarProduto(Produto produto) {
        produtos.add(produto);
    }

    public Produto buscarProdutoPorNome(String nome) throws ProdutoNaoEncontradoException {
        for (Produto produto : produtos) {
            if (produto.getNome().equalsIgnoreCase(nome)) {
                return produto;
            }
        }
        throw new ProdutoNaoEncontradoException("Produto não encontrado: " + nome);
    }

    public void realizarVenda(String nomeProduto, int quantidade) throws ProdutoNaoEncontradoException, QuantidadeInvalidaException {
        if (quantidade <= 0) {
            throw new QuantidadeInvalidaException("Quantidade inválida: " + quantidade);
        }

        Produto produto = buscarProdutoPorNome(nomeProduto);

        if (produto.getEstoque() < quantidade) {
            throw new QuantidadeInvalidaException("Estoque insuficiente para o produto: " + nomeProduto);
        }

        produto.setEstoque(produto.getEstoque() - quantidade);
        double valorTotal = produto.getPreco() * quantidade;
        System.out.println("Venda realizada: " + produto.getNome() + ", Quantidade: " + quantidade + ", Valor total: R$" + valorTotal);
    }
}