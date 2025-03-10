import java.util.ArrayList;
import java.util.List;

public class SmartHomeHub {
    private List<SmartDevice> devices;

    public SmartHomeHub() {
        this.devices = new ArrayList<>();
    }

    public void addDevice(SmartDevice device) {
        this.devices.add(device);
    }

    public void turnAllOn() {
        for (SmartDevice device : devices) {
            device.turnOn();
        }
    }

    public void turnAllOff() {
        for (SmartDevice device : devices) {
            device.turnOff();
        }
    }

    public void showStatus() {
        for (SmartDevice device : devices) {
            System.out.println(device.getStatus());
        }
    }
}