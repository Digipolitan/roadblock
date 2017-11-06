//
//  FieldTransformers.swift
//  Roadblock
//
//  Created by Benoit BRIATTE on 25/07/2017.
//  Copyright © 2017 Digipolitan. All rights reserved.
//

import Foundation

public class FieldTransformers {

    private init() { }

    public class func trim() -> FieldTransformer {
        return TrimFieldTransformer.whitespacesAndNewlines
    }

    public class func emptyIsNil() -> FieldTransformer {
        return EmptyIsNilFieldTransformer.shared
    }

    public class func group(_ transformers: FieldTransformer...) -> FieldTransformer {
        return FieldTransformerArray(transformers: transformers)
    }
}
