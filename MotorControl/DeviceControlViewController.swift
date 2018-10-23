//
//  DeviceControlViewController.swift
//  MotorControl
//
//  Created by ujs on 7/24/18.
//  Copyright © 2018 ujs. All rights reserved.
//

import UIKit
import CoreBluetooth
import Toast_Swift

class DeviceControlViewController: UIViewController,CBPeripheralManagerDelegate {
    
    var peripheralManager: CBPeripheralManager?
    var peripheral: CBPeripheral!

    override func viewDidLoad() {
        super.viewDidLoad()
        peripheralManager = CBPeripheralManager(delegate: self, queue: nil)
        NotificationCenter.default.addObserver(forName: NSNotification.Name(rawValue: "Notify"), object: nil , queue: nil){
            notification in
            self.view.makeToast("Signal Received !")
        }
    }

    @IBAction func clickLeft(_ sender: Any) {
        writeCharacteristic(val: 0)
    }
    @IBAction func clickRight(_ sender: Any) {
        writeCharacteristic(val: 1)
    }
    
    func writeCharacteristic(val: Int8){
        var val = val
        let ns = NSData(bytes: &val, length: MemoryLayout<Int8>.size)
        blePeripheral!.writeValue(ns as Data, for: txCharacteristic!, type: CBCharacteristicWriteType.withResponse)
    }

    func peripheralManagerDidUpdateState(_ peripheral: CBPeripheralManager) {
        if peripheral.state == .poweredOn {
            return
        }
    }

}
