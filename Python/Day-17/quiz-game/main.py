from question_model import Question
from data import question_data
from quiz_brain import QuizBrain

# array to save the question
question_bank = []
for item in question_data:
    question_text = item["question"]
    question_answer = item["correct_answer"]
    new_question = Question(question_text, question_answer)
    question_bank.append(new_question)


quiz = QuizBrain(question_bank)
while quiz.still_has_question():
    quiz.next_question()

# print in the end the result
print("you have finished the game")
print(f"your final score was: {quiz.score}/{quiz.question_number}")
