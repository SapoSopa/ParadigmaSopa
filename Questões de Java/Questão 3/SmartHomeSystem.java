public class SmartHomeSystem {
    public static void main(String[] args) {

    SmartTv tv = new SmartTv();
    SmartLamp lamp = new SmartLamp();
    SmartLock lock = new SmartLock();
    
    SmartHomeHub homeHub = new SmartHomeHub();
    
    homeHub.addDevice(tv);
    homeHub.addDevice(lamp);
    homeHub.addDevice(lock);
    
    System.out.println("Status inicial: ");
    homeHub.showStatus();
    
    System.out.println("\nLigando todos os dispositivos... ");
    homeHub.turnAllOn();
    
    tv.changeChannel(5);
    lamp.changeColor("blue");
    
    homeHub.showStatus();
    
    System.out.println("\nDesligando todos os dispositivos... ");
    homeHub.turnAllOff();
    homeHub.showStatus();
    }
}