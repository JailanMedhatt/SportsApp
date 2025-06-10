import Network

class NetworkMonitor {
    static let shared = NetworkMonitor()
    
    private let monitor = NWPathMonitor()
    private let queue = DispatchQueue(label: "NetworkMonitor")
    
    private(set) var isConnected: Bool? = nil

    var onConnected: (() -> Void)?
    var onDisconnected: (() -> Void)?

    private init() {}

    func startMonitoring() {
        monitor.pathUpdateHandler = { [weak self] path in
            guard let self = self else { return }
            
            let newStatus = (path.status == .satisfied)
            
         if self.isConnected != newStatus {
                self.isConnected = newStatus
                
                if newStatus {
                    print(" Connected")
                    self.onConnected?()
                } else {
                    print("Disconnected")
                    self.onDisconnected?()
                }
            }
        }
        
        monitor.start(queue: queue)
    }

    func stopMonitoring() {
        monitor.cancel()
        isConnected = nil 
    }
}
