gomokuBoard <- function(){
	windows(10,10)
	par(mar = c(1,0,1,3), bg=rgb(.88,.75,.60))
	plot(1:19, type = "n",xlim = c(0,19), axes = FALSE, ann = FALSE)
	rect(1,1,2:19,2:19)
	rect(1:18,1:18,19,19)
	axis(1, at = 1:19, labels = 1:19, line = -2, tick = FALSE)
	axis(2, at = 1:19, labels = 1:19, line = -4, tick = FALSE)
	points(rep(c(4,10,16),3),rep(c(4,10,16),each=3),pch=19,cex=1)
	points(20.2,10,pch=19,cex=5, col = "grey30", xpd = NA)
	points(20.2,10,pch=19,cex=3.8, col = "red", xpd = NA)  ## Click this button, end game
	text(20.2,11,"END", xpd = NA) 
}
#gomokuBoard()


vs <- function(Host="localhost",Port=79,Server=TRUE){
  status = 1  # No winner
  gomokuBoard()
  Sys.sleep(.1)
  socket=make.socket(host=Host,port=Port,server=Server)
  on.exit(close.socket(socket))
  me=ifelse(Server, "black", "white")
  you=ifelse(Server, "white", "black")
  playedlist <- NULL
  if(Server==FALSE){
    ss <- read.socket(socket)
    if(!length(ss)){
        close.socket(socket)
        cat("Program has been ended by your partner\nEND\n")
        return(invisible(playedlist))
      }
    output <- as.numeric(strsplit(ss,',')[[1]])
    points(output[1],output[2],cex=3,pch=21,bg=you)
    playedlist <- c(playedlist, ss)
  }

  while(status){
    repeat{
      input=locator(1)
      input$x=round(input$x)
      input$y=round(input$y)
      if(input$x == 20 & input$y == 10){
      close.socket(socket)
      cat("Program has been ended by you\nEND\n")
      return(invisible(playedlist))
      }
      xy <- paste(input,collapse=",")
      if (!is.element(xy,playedlist)&input$x<19.5&input$x>.5&input$y<19.5&input$y>.5)
       break
      else
      cat("Please point at the right place!\n")
      }
    playedlist <- c(playedlist,xy)
    points(input$x,input$y,cex=3,pch=21,bg=me)
    Sys.sleep(.2) #没有弄清原因，如果不暂停一会，上面一句就会等到下一句执行完才执行
    write.socket(socket,xy)
    ss <- read.socket(socket)
    if(ss==""){
      close.socket(socket)
      cat("Program has been ended by your partner\nEND\n")
      return(invisible(playedlist))
    }
    output <- as.numeric(strsplit(ss,',')[[1]])
    points(output[1],output[2],cex=3,pch=21,bg=you)
    playedlist <- c(playedlist,paste(output,collapse=','))
      ## FIXME: give win rules
    if(length(playedlist) == 361)
      status = 0
    }
  close.socket(socket)
  cat("END\n")
  return(invisible(playedlist))
}

#aa = vs(Server= FALSE)

## Get IP adress
getIP <- function(){
	x = system("ipconfig",intern = TRUE)
	xx=x[grep("IPv4", x)]
	xxx = sub("IPv4.*:","",xx)
	sub("^ *","",xxx)
}
#getIP()
