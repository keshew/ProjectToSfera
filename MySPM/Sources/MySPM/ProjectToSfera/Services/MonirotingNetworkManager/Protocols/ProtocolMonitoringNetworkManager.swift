//
//  ProtocolMonitoringNetworkManager.swift
//  ProjectToSfera
//
//  Created by Артём Коротков on 03.12.2022.
//

import UIKit
import Network

protocol ProtocolMonitoringNetworkManager {
    static var shared: MonitoringNetworkManager { get }
    var queue: DispatchQueue { get }
    var monitor: NWPathMonitor { get }
    var isConnected: Bool { get }
}
