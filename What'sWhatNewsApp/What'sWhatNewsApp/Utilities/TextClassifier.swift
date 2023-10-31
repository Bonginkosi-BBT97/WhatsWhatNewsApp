//
//  TextClassifier.swift
//  What'sWhatNewsApp
//
//  Created by Bonginkosi Tshabalala on 2023/10/21.
//

import Foundation
import CoreML


func predictSentement(text: String) -> String? {
    do {
        let config = MLModelConfiguration()
        let sentimentClassifier = try MyTextClassifier_(configuration: config)
        let prediction = try sentimentClassifier.prediction(text: text)
        return prediction.label
        
    } catch {
        print("Failed to make predictionL \(error.localizedDescription)")
        return nil
        
    }
}
