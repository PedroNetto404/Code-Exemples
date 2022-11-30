
namespace Exemplo
{
    public interface IServicoDeEntrega {}
    public interface ITabelaDePreco {}

    //Diferentes serviços de tabelas de precos implementam a mesma abstração
    public class TabelaDePreco1 : ITabelaDePreco {}
    public class TabelaDePreco2 : ITabelaDePreco {}
    public class TabelaDePreco3 : ITabelaDePreco {}

    //Diferentes regas de frete para a mesma abstração
    public class Frete1 : IServicoDeEntrega {}
    public class Frete2 : IServicoDeEntrega {}
    public class Frete3 : IServicoDeEntrega {}

    //  Classe fechada para modificações, mas abertas para a extensão por meio
    //de passagem de implementações diferentes
    public class CalculadoraDePrecos
    {
        private readonly IServicoDeEntrega _servicoDeEntrega;
        private readonly ITabelaDePreco _tabelaDePreco;

        public CalculadoraDePrecos(
                IServicoDeEntrega servicoDeEntrega,
                ITabelaDePreco tabelaDePreco)
        {
            _servicoDeEntrega = servicoDeEntrega;
            _tabelaDePreco = tabelaDePreco;
        }


        public double Calcular(Compra produto)
        {
            double desconto = _tabelaDePreco.ObterDescontoParaValor(produto.GetValor());
            double frete = _servicoDeEntrega.ObterTaxaParaCidade(produto.GetCidade);

            return produto.GetValor() * (1 - desconto) + frete; 
        }
    }
}

