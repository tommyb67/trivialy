Question.destroy_all

Question.create(category: 'sports', answer: 'LONG JUMP', difficulty: 1, question: 'Jesse Owen''s world record in which sporting event stood from 1935 until 1960?');
Question.create(category: 'sports', answer: 'CHICAGO WHITE SOX', difficulty: 1, question: 'When Michael Jordan retired from the Chicago Bulls for the first time in 1994, he signed a minor-league contract with what major league baseball team?')
Question.create(category: 'sports', answer: 'BUSTER DOUGLAS', difficulty: 1, question: 'Is Mike Tyson unbeatable? On February 10, 1990, in the heavyweight championship fight in Tokyo, this boxer knocked out Mike Tyson in the tenth round, the only fighter ever to defeat Tyson for the heavyweight boxing crown. Who was he?')
Question.create(category: 'sports', answer: 'STEEPLECHASE', difficulty: 1, question: 'This Olympic event is a 3,000 meter footrace around a track.  Runners must jump four hurdles and a water obstacle.  What is this event called?')
Question.create(category: 'sports', answer: 'Joe Louis', difficulty: 1, question: 'Under what name did Joseph L. Barrow gain fame in the world of sports?')
Question.create(category: 'animal', answer: 'ERMINE', difficulty: 1, question: 'By what name do we identify those certain kinds of weasels whose coats change color in the winter?')
Question.create(category: 'animal', answer: 'cheetah', difficulty: 1, question: 'what big cat cannot retract its claws?')
Question.create(category: 'animal', answer: '3 months', difficulty: 1, question: 'how long can a whale go without eating?')
Question.create(category: 'animal', answer: 'Hands', difficulty: 1, question: 'What unit of measurement is used to measure a horse''s height in?')
Question.create(category: 'animal', answer: 'Blue Whale', difficulty: 1, question: 'The largest mammal that ever lived weighs more than 100 tons. What kind of animal is this?')

require 'Unirest'

10.times do
  res = Unirest::get("https://privnio-trivia.p.mashape.com/exec?category=entertainment&v=1&method=getQuestions",
    {
      "X-Mashape-Authorization" => ENV["MASHAPE_KEY"]
    }
  )

  single_answer_ques = (res.body["result"].map do |q|
    q["answer"] = q["answer"].to_s
    q
  end.select do |q|
    !q["answer"].match /a\./
  end)

  single_answer_ques.each do |ques|
    Question.create(category: ques['category'], answer: ques['answer'], difficulty: ques['difficulty'], question: ques['question'])
  end
end
