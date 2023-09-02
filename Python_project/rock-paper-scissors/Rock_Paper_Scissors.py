## HW01 - create rock paper scissors
import random
import pandas as pd

def init_dataframe(log_b, log_u, log_ans):
            bot_df = pd.DataFrame(log_b).reset_index()
            bot_df.columns = ["round", "Bot"]
            user_df = pd.DataFrame(log_u).reset_index()
            user_df.columns = ["round", "User"]
            log_df = pd.DataFrame(log_ans).reset_index()
            log_df.columns = ["round", "result"]
            full_df = pd.merge(bot_df, user_df, on="round").reset_index(drop=True)
            full_df["result"] = log_df["result"]
            display(full_df)

def get_user():
    while True:
        choice = input()
        if choice == "1":
            return "rock"
        elif choice == "2":
            return "paper"
        elif choice == "3":
            return "scissors"
        else:
            print("Please choose your choice again (only 1, 2 or 3)")

def get_choice():
    bot = ["rock", "paper", "scissors"]
    return (random.choice(bot))

def fight(bot_ans, user_ans, log_ans):
    if (bot_ans == user_ans):
        log_ans.append("draw")
        return("Draw!")
    elif ((bot_ans == "rock") and user_ans == "scissors"):
        log_ans.append("lose")
        return("You lose!")
    elif (bot_ans == "paper" and user_ans == "rock"):
        log_ans.append("lose")
        return("You lose!")
    elif (bot_ans == "scissors" and user_ans == "paper"):
        log_ans.append("lose")
        return("You lose!")
    else:
        log_ans.append("win")
        return("You win!")

def main_game():
    log_u = []
    log_b = []
    log_ans = []

    while True:
        print("Please choose your choice : \n 1 is rock\n 2 is paper\n 3 is scissors")
        bot_ans = get_choice()
        user_ans = get_user()
        log_b.append(bot_ans)
        log_u.append(user_ans)
        print(fight(bot_ans, user_ans, log_ans))
        while True:
            print("Do you want to try again ?\n Choose:\n 1 if Yes \n 2 if No")
            status = input()
            if status == "2":
                init_dataframe(log_b, log_u, log_ans)
                return
            elif status == "1":
                break
            else:
                print("Please choose only 1 or 2 !")
