//
//  RookieQuizSession
//  Quiz
//
//  Created by Pascal Hurni on 14.02.17.
//  Copyright © 2017 Pascal Hurni. All rights reserved.
//

import Foundation

class RookieQuizSession : QuizSession {
    var _currentQuestionCount: Int
    override class var  rules: String {return "Niveau le plus simple, 10 questions"}
    init(questionRepository: QuestionRepository) {
        _currentQuestionCount = 0
        super.init(questionRepository: questionRepository, totalQuestionCount: 10)
    }
   
    override func nextQuestion() -> Question? {
        _currentQuestionCount += 1
        if _currentQuestionCount > _totalQuestionCount {
            return nil
        }
        
        return super.nextQuestion()
    }
    
    override func checkAnswer(_ answer: String) -> Bool {
        let correct = super.checkAnswer(answer)
        if correct { _score += 1 }
        return true
    }
    
}
