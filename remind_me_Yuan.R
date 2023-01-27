## remind_me() function
remind_me <- function(){
  Name <- c("Mom", "Kai", "Dad", "Laura", "Lola")
  Birthday <- c("22-01-1963", "30-01-1994", "02-02-1954", "06-02-1997","10-02-1995")
  Birthdays <- data.frame(Name, Birthday)
  To_do <- c("Rene research proposal pitch", "ManyBabies lab meeting prep", "Basic Skills preparation")
  Deadline <- c("Jan 30th", "Feb 2nd", "Feb 6th")
  Deadlines <- data.frame(To_do, Deadline)
  Shopping_list <- c("Cottage cheese", "Bananas", "Almonds", "Leffe")
  print("These are your reminders for today:")
  print(Birthdays)
  print(Deadlines)
  print(Shopping_list)
}

remind_me()