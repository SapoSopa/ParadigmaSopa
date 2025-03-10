public class SmartTv implements SmartDevice {
    private boolean on;
    private int channel;

    public SmartTv() {
        this.on = true;
        this.channel = 0;
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
        return "SmartTv [on = " + on + "]";
    }

    @Override
    public boolean isOn() {
        return on;
    }

    public void changeChannel(int channel) {
        if (isOn()) {
            this.channel = channel;
        }
    }
}