//
//  NetworkMoniitoringManager.swift
//  ProjectToSfera
//
//  Created by Артём Коротков on 03.12.2022.
//

import UIKit
import Network

final public class MonitoringNetworkManager: ProtocolMonitoringNetworkManager {
    
    static public let shared = MonitoringNetworkManager()

    let queue = DispatchQueue.global()
    let monitor: NWPathMonitor
    public private(set) var isConnected: Bool = false

    init() {
        monitor = NWPathMonitor()
    }
    
    public func startMonitoring() {
        monitor.start(queue: queue)
        monitor.pathUpdateHandler = { [weak self] path in
            self?.isConnected = path.status == .satisfied
        }
    }
    
    public func endMonitoring() {
        monitor.cancel()
    }
    
    func checkConnection() -> Bool {
        var boolValue = true
        if isConnected == false {
           boolValue = false
        }
        return boolValue
    }
}
