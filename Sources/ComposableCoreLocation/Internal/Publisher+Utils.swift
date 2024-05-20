//
//  Publisher+Utils.swift
//
//
//  Created by Julien Rahier on 20/05/2024.
//

import Combine
import XCTestDynamicOverlay

extension AnyPublisher {
  static func fireAndForget(_ work: @escaping () throws -> Void) -> Self {
    Deferred {
      try? work()
      return Empty<Output, Failure>()
    }
    .eraseToAnyPublisher()
  }
}
