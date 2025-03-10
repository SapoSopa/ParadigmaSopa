public class SmartLamp implements SmartDevice {
    private boolean on;
    private String color;
    private int intensity;

    public SmartLamp() {
        this.on = true;
        this.color = "white";
        this.intensity = 100;
    }

    @Override
    public void turnOn() {
        this.on = true;
    }

    @Override
    public void turnOff() {
        this.on = false;
    }

    @Override
    public String getStatus() {
        return "Lampada [on = " + on + "]" + " / Cor [" + color + "] / Intensidade [" + intensity + "%]";
    }

    @Override
    public boolean isOn() {
        return on;
    }

    public void changeColor(String color, int intensity) {
        this.color = color;
        this.intensity = intensity;
    }

    public void changeColor(String color) {
        this.color = color;
    }
}