#HW 01 Chatbot

crust_data <- 1:3
topping_data <- 1:3


check_crust <- function(user)
{
  if (user == 1)
    return (list("Pan", 5))
  else if (user == 2)
    return (list("crispy thin", 10))
  else
    return (list("extreme", 15))
}

check_topping <- function(user)
{
  if (user == 1)
    return (list("hawailan", 2))
  else if (user == 2)
    return (list("chicken", 3))
  else 
    return (list("deluxe", 4))
}


summary <- function(crust_lst, topping_lst, spaghetti)
{
  if(spaghetti == T)
    spaghetti_lst <- list("Ham spaghetti", 3)
  else
    spaghetti_lst <- list("Not ordered", 0)
  Topic <- c("crust", "topping", "spaghetti", "Total")
  Order <- c(crust_lst[[1]], topping_lst[[1]], spaghetti_lst[[1]], "")
  total <- sum(crust_lst[[2]], topping_lst[[2]], spaghetti_lst[[2]])
  Price_USD <- c(crust_lst[[2]], topping_lst[[2]], spaghetti_lst[[2]], total)
  df <- data.frame(
    Topic,
    Order,
    Price_USD             
  )
  while(TRUE)
  {
    View(df)
    print("Please press q to close summary window")
    print("If you can't see, please open the output window")
    user <- readLines("stdin", n=1)
    if(user == "q")
      break
  }
  print(paste("Total price :", total, "$"))
  print("Thanks for ordered!")
}

error <- function(user)
{
  print(paste0("Sorry you just press ", user))
  print("Please choose again 1, 2 or 3")
}

chatbot <- function()
{
  print("Hi !, you can order here.")
  while(T)
  {
    print("Choose your pizza crust:")
    print("Pan         press 1")
    print("Crispy Thin press 2")
    print("Extreme     press 3")
    user <- tolower(readLines("stdin", n=1))
    if((sum(user == crust_data) == 1))
    {
      crust_lst <- check_crust(user)
    }else{
      error(user)
      next
    }
    print("Choose your pizza topping:") 
    print("Hawailan press 1") 
    print("Deluxe   press 2") 
    print("Chicken  press 3")
    user <- tolower(readLines("stdin", n=1))
    if(sum(user == topping_data) == 1)
    {
      topping_lst <- check_topping(user)
    }else{
      error(user)
      next
    }
    print("Do you want Ham Spaghetti ?: Y/N")
    while(T)
    {
      user <- toupper(readLines("stdin", n=1))
      if(user == "Y" | user == "N")
        break
      else
        print("Please choose Y or N")
    }
    if(user == "Y")
      spaghetti <- T
    else
      spaghetti <- F
    summary(crust_lst, topping_lst, spaghetti)
    break
  }
}

chatbot()