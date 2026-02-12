### Functions

# we already use lots of functions in R
# read.csv()
min(43, 65, 76, 324, 7)

paste("hello", "Kyle")

# all the dplyr, like mutate, summarize, etc.
# ggplot2 functions

### Writing our own functions

# try with a basic addition function (basically recreating sum() )
add_numbers <- function(num1, num2){
  # body of the function where I do my work
  answer <- num1 + num2
  
  # at the end return the value that someone can save into a variable
  return(answer)
}

# Now I can run my function just like any other function
add_numbers(2, 2)

# my function returned a result, so I can
# save that into a variable
example_sum <- add_numbers(89435, 43534)

# what will break with my function
# 1. my function requires two values
add_numbers()
add_numbers(1)
add_numbers(1,2,3)

# 2. If I give my function values that won't work with its calculations
add_numbers(1, "hello")


### function with an optional argumenmt
# I'll make the second number optional by providing a defualt
add_numbers <- function(num1, num2 = 1){
  # do calculation
  answer <- num1 + num2
  
  # return result so it can be saved in a variable
  return(answer)
}
# call function with 2 numbers
add_numbers(2,2)
# call function with 1 number
add_numbers(7)
# I can send num2 and be specific about what default I'm replacing
add_numbers(2, num2 = 3)

#### A function that does stuff with text
make_greeting <- function(name){
  greeting <- paste("Hello", name)
  return(greeting)
}
# try running it
make_greeting("Kyle")

# redo with an optional argument for greeting word
make_greeting <- function(name, greeting_word = "Hello"){
  greeting <- paste(greeting_word, name)
  return(greeting)
}
make_greeting("Kyle")
make_greeting("Kyle", greeting_word="Hi")
make_greeting("Kyle", greeting_word="Hola")

# try with a vector of names
greeting_vector <- make_greeting(
  c("Kyle", "William", "Lexeigh", "Sophia")
)

# redo with one more argument for post name text
make_greeting <- 
  function(name, greeting_word = "Hello", post_name_text = ""){
      greeting <- paste0(greeting_word, " ", name, post_name_text)
      return(greeting)
  }
make_greeting("Kyle")
make_greeting("Kyle", post_name_text = "!")
make_greeting("Kyle", greeting_word = "¡Hola", post_name_text = "!")
