//
//  ChallengeQuizSession.swift
//  Quiz
//
//  Created by cpnv on 03.04.20.
//  Copyright © 2020 Pascal Hurni. All rights reserved.
//

import Foundation
class ChallengeQuizSession : QuizSession {
    var _currentQuestionCount: Int
    override class var  rules: String {return "Niveau tres tres tres dur, 12 questions,perdu si vous arrivez a 0 points"}
    override init(questionRepository: QuestionRepository, totalQuestionCount: Int = 12) {
        _currentQuestionCount = 0
        super.init(questionRepository: questionRepository, totalQuestionCount: totalQuestionCount)
    }
    
    override func nextQuestion() -> Question? {
        _currentQuestionCount += 1
        if _currentQuestionCount > _totalQuestionCount {
            return nil
        }
        if(_score <= 0 && _currentQuestionCount > 1 ){
            return nil
        }
        return super.nextQuestion()
    }
    
    override func checkAnswer(_ answer: String) -> Bool {
        let correct = super.checkAnswer(answer)
        _score += correct ? 1 : -1
        return true
    }
    
}
