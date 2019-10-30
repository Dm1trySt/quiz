# Путь к папке с программой
current_path  = File.dirname(__FILE__ )

# Пути к файлам вопросов и ответов
answers_path = current_path + '/data/answers.txt'
questions_path = current_path + '/data/questions.txt'

# Если какого-то файла нет, выходим и сообщаем об этом пользователю
unless File.exist?(answers_path) && File.exist?(questions_path)
  abort 'Один из файлов не найден!'
end

# Открываем файл c ответами, считываем вопросы в массив answers
answers_file = File.new(answers_path, 'r:UTF-8')
# Записываем все строки в массив
answers = answers_file.readlines
#закрываем файл
answers_file.close

# Открываем файл c вопросами, считываем вопросы в массив questions
questions_file = File.new(questions_path, 'r:UTF-8')
# Записываем все строки в массив
questions = questions_file.readlines
#закрываем файл
questions_file.close

puts "Мини-викторина. Ответьте на вопросы."

# Количество правильных ответов
correct_answers = 0

# Количество вопросов
current_index = 0

# Пока колчиство заданных вопросов не станет равно количеству вопросов
while current_index < questions.size  do
  # Задаем вопрос
  puts questions[current_index]



# Ввод данных пользователем
  user_answer = STDIN.gets.to_s

# Проверка ответа
# .gsub("\n",'') ищет в строке символ \n и заменяет его на ''
# можно просто использовать .chomop так же отбросит последний символ
  if user_answer.chomp == answers[current_index].gsub("\n",'')
    puts "Верный ответ!"

    # Счетчик правильных ответов
    correct_answers += 1
  else
    puts "Неправильно. Правильный ответ: #{answers[current_index]}"
  end

# Счетчик вопросов
  current_index +=1
end

puts "У вас #{correct_answers} правильных ответов из #{current_index}"




