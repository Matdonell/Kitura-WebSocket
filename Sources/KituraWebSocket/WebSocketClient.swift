/*
 * Copyright IBM Corporation 2015
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import Foundation

public class WebSocketClient {
    weak var processor: WSSocketProcessor?
    
    func received(frame: WSFrame) {
        
        print("WebSocketClient: Received a \(frame.finalFrame ? "final " : "")\(frame.opCode) frame")
        print("WebSocketClient: payload is \(frame.payload.length) bytes long")
        
        var zero: CChar = 0
        frame.payload.append(&zero, length: 1)
        print("WebSocketClient: payload=\(String(cString: frame.payload.bytes.assumingMemoryBound(to: CChar.self), encoding: .utf8))")
        frame.payload.length -= 1
    }
}