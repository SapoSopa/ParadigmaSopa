public class SmartLock implements SmartDevice {
    private boolean on;

    public SmartLock() {
        this.on = true;
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
        return "Fechadura [on = " + on + "]";
    }

    @Override
    public boolean isOn() {
        return on;
    }
}