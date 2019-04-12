//
//  main.swift
//  PostgresClientKit-CommandLine-Example
//
//  Copyright 2019 David Pitfield and the PostgresClientKit contributors
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//  http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.
//

import PostgresClientKit

do {
    var configuration = PostgresClientKit.ConnectionConfiguration()
    configuration.host = "127.0.0.1"
    configuration.ssl = true
    configuration.database = "example"
    configuration.user = "bob"
    configuration.credential = .md5Password(password: "welcome1")
    
    let connection = try PostgresClientKit.Connection(configuration: configuration)
    defer { connection.close() }
    
    let text = "SELECT city, temp_lo, temp_hi, prcp, date FROM weather WHERE city = $1;"
    let statement = try connection.prepareStatement(text: text)
    defer { statement.close() }
    
    let cursor = try statement.execute(parameterValues: [ "San Francisco" ])
    defer { cursor.close() }
    
    for row in cursor {
        let columns = try row.get().columns
        let city = try columns[0].string()
        let tempLo = try columns[1].int()
        let tempHi = try columns[2].int()
        let prcp = try columns[3].optionalDouble()
        let date = try columns[4].date()
        
        print("""
            \(city) on \(date): low: \(tempLo), high: \(tempHi), \
            precipitation: \(String(describing: prcp))
            """)
    }
} catch {
    print(error) // better error handling goes here
}

// EOF
