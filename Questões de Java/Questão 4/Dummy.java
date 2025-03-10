public class Dummy {
    public String estado;
    public double vida ;

    public Dummy() {
        this.estado = "normal";
        this.vida = Double.MAX_VALUE;
    }

    public void reset() {
        this.estado = "normal";
        this.vida = Double.MAX_VALUE;
    }
}