//
//  ViewController.swift
//  TOEFLVocabQuiz
//
//  Created by LinaLiu on 4/11/24.
//


import UIKit

var count = 0

class ViewController: UIViewController {
    
    //Main View Outlets
    @IBOutlet weak var quesLabel: UILabel!
    @IBOutlet weak var btn0: UIButton!
    @IBOutlet weak var btn1: UIButton!
    @IBOutlet weak var btn2: UIButton!
    @IBOutlet weak var btn3: UIButton!
    @IBOutlet weak var lastScreen: UIButton!
    
    var ques:[Int] = []
    var queCnt = 0

    // To keep track of current Question Number
    var quesNumber = 0
    // Temporarily used to see the correct answers
    override func viewDidLoad() {
        lastScreen.isHidden = true
        super.viewDidLoad()
        question_selection()
        print(ques)
        
        NextQuestion(quesNumber: ques[0])
        //quesLabel.displayLbel()
        btn0.display()
        btn1.display()
        btn2.display()
        btn3.display()
        lastScreen.display()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    //All Questions in questions array
    var questions = ["zoology [zoh—ol—uh-jee]:zo, animal life",
                     "zooid [zoh—oid]:zo, animal life",
                     "zooplankton [zoh—uh-plangk-tuh n]:zo, animal life",
                     "xylocarp [zahy—luh-karp]:xyl, wood",
                     "zoology [zoh—ol—uh-jee]:zo, animal life",
                     "zooid [zoh—oid]:zo, animal life",
                     "zooplankton [zoh—uh-plangk-tuh n]:zo, animal life",
                     "xylocarp [zahy—luh-karp]:xyl, wood",
                     "zoology [zoh—ol—uh-jee]:zo, animal life",
                     "zooid [zoh—oid]:zo, animal life",
                     ]
    //All Anssers in allAnswers array
    var allAnswers = [  [
        "— study of animals",
        "clam temperament, evenness of temper,镇静,沉着，冷静,",
        "a book written by hand",
        "— respect foryourself",
    ],
                        [
                             "the study of people, the science of vital and social statistics",
                             "no longer working or alive",
                             " — a device used tosee over a distance",
                             "- any animal organism capableof separate existence",
                           ],
                        [
                             "- an actual or constructivesitting of a body",
                             "— the love of wisdom",
                             "— an element whichproduces a red solution",
                             " — minutefloating aquatic animals, animal-like organisms",
                           ],
                        [
                             " —- a fruit, such as acoconut, having a hard woody pericarp",
                             "— the human spirit or soul",
                             "having equal or constant temperature, A fridge works isothermally",
                             "- to put underwater",
                           ],
                        [
                           "— study of animals",
                           "clam temperament, evenness of temper,镇静,沉着，冷静,",
                           "a book written by hand",
                           "— respect foryourself",
                       ],
                                           [
                                                "the study of people, the science of vital and social statistics",
                                                "no longer working or alive",
                                                " — a device used tosee over a distance",
                                                "- any animal organism capableof separate existence",
                                              ],
                                           [
                                                "- an actual or constructivesitting of a body",
                                                "— the love of wisdom",
                                                "— an element whichproduces a red solution",
                                                " — minutefloating aquatic animals, animal-like organisms",
                                              ],
                                           [
                                                " —- a fruit, such as acoconut, having a hard woody pericarp",
                                                "— the human spirit or soul",
                                                "having equal or constant temperature, A fridge works isothermally",
                                                "- to put underwater",
                                              ],
                        [
                           "— study of animals",
                           "clam temperament, evenness of temper,镇静,沉着，冷静,",
                           "a book written by hand",
                           "— respect foryourself",
                       ],
                                           [
                                                "the study of people, the science of vital and social statistics",
                                                "no longer working or alive",
                                                " — a device used tosee over a distance",
                                                "- any animal organism capableof separate existence",
                                              ]
                      ]
    //corrent answer index for each question
    var correctAnswer = [0,3,3,0, 0,3,3,0,0,3]
    
    func question_selection(){
        
        var randomQuestion = Int(arc4random_uniform(UInt32(11) - 1 ))
        for _ in 0...4 {
            if ques.contains(randomQuestion) {
                while ques.contains(randomQuestion) {
                randomQuestion = Int(arc4random_uniform(UInt32(11) - 1 ))
                }
                ques.append(randomQuestion)
            } else {
                ques.append(randomQuestion)
                randomQuestion = Int(arc4random_uniform(UInt32(11) - 1 ))
            }
        }
    }
    
    
    // Method used to ask the next question to user
    func NextQuestion(quesNumber: Int) {
       
            quesLabel.text = questions[quesNumber]
            btn0.setTitle(allAnswers[quesNumber][0], for: .normal)
            btn1.setTitle(allAnswers[quesNumber][1], for: .normal)
            btn2.setTitle(allAnswers[quesNumber][2], for: .normal)
            btn3.setTitle(allAnswers[quesNumber][3], for: .normal)
            
          //  questions.remove(at: quesNumber)
           // allAnswers.remove(at: quesNumber)
            
            btn0.backgroundColor = UIColor(red:0.33, green:0.51, blue:1.00, alpha:1.0)
            btn1.backgroundColor = UIColor(red:0.33, green:0.51, blue:1.00, alpha:1.0)
            btn2.backgroundColor = UIColor(red:0.33, green:0.51, blue:1.00, alpha:1.0)
            btn3.backgroundColor = UIColor(red:0.33, green:0.51, blue:1.00, alpha:1.0)
            
        //
        }
  
    
    @IBAction func btnpres0(_ sender: UIButton)
    {
      let bt = sender.tag
        if(bt == correctAnswer[ques[queCnt]]) //Modified
        {
            count = count + 1
            sender.backgroundColor = UIColor.green
            queCnt += 1
        }
        else
        {
            sender.backgroundColor = UIColor.red
            queCnt += 1
        }
        
        /* Checking If 5 questions are asked or not. If yes then hiding the elements of screen.
           If no then calling the NextQuestion method */
        if(queCnt <= 4 ){ //Modified
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                self.NextQuestion(quesNumber: self.ques[self.queCnt])
            }
        }
        else {
           lastScreen.isHidden = false
            quesLabel.text = "Done!"
            btn0.isHidden = true
            btn1.isHidden = true
            btn2.isHidden = true
            btn3.isHidden = true
        }
    }
    

    
}

