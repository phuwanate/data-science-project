#HM2

print("Welcome to rock–paper–scissors game !")
user_score <- 0
bot_score  <- 0

while(TRUE)
{
  print("What you want to choose: ")
  print("Rock press 1")
  print("Paper press 2")
  print("Scissors press 3")
  while(TRUE)
  {
    user <- readLines("stdin", n=1)
    if(user == 1 | user == 2 | user == 3)
      break
    else
      print("Please choose again: 1, 2 or 3")
  }
  bot <- sample(1:3, size=1)
  if(user == bot)
    print("Draw!")
  else if((user == 1 & bot == 3) | (user == 2 & bot == 1) 
          | (user == 3 & bot == 2)){
    print("You win!")
    user_score <- user_score + 1
  }
  else
  {
    print("You lose!")
    bot_score <- bot_score + 1
  }
  print("Wanna try again ? Y/N")
  while(TRUE)
  {
    user <- tolower(readLines("stdin", n=1))
    if(user == "n" | user == "y")
      break
    else
      print("Please press Y or N")
  }
  if(user == "n")
  {
    print(paste("Your scores :", user_score))
    print(paste("Bot scores :", bot_score))
    break
  }
}