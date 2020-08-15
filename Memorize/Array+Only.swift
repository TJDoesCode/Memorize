//
//  Array+Only.swift
//  Memorize
//
//  Created by Trevor Reigh on 8/8/20.
//  Copyright © 2020 Trevor Reigh. All rights reserved.
//

import Foundation

extension Array {
	var only: Element? {
		count == 1 ? first : nil
	}
}
