//
//  main.swift
//  JSONParser
//
//  Created by JK on 10/10/2017.
//  Copyright © 2017 JK. All rights reserved.
//

import Foundation

struct Main {
    static func start(){
        do {
            let input = try InputView.read()
            let lexer = Lexer(for: input)
            let tokens = lexer.tokens
            let type = lexer.type
            let values = try Formatter.parse(from: tokens, to: type)
            OutputView.display(values)
        }catch let error as JSONParserError {
            OutputView.display(error)
        }catch {
            OutputView.display(.unexpected)
        }
    }
}

Main.start()
