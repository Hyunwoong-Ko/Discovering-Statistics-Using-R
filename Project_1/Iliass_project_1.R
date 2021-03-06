library(pollstR)
library(car)
library(ggplot2)

setwd("~/Dropbox/Math567/Discovering-Statistics-Using-R/Project_1/")

imageDirectory <- "~/Dropbox/Math567/Discovering-Statistics-Using-R/Project_1"

## 2016 National Republican Primary -----------------------------------------

gop_chart <- pollstr_chart('2016-national-gop-primary')

gop_frame <- gop_chart[["estimates_by_date"]]

## filtering only from Feb. 2015
gop_frame <- gop_frame[gop_frame$date > as.Date("2015-02-01"),]

## plotting and saving 
gop_plot <- (ggplot(gop_frame, aes(x = date, y = value, color = choice)) + geom_line())
ggsave(file = paste(imageDirectory,"gop.png",sep="/"))
gop_plot




## 2016 National Democrate Primary --------------------------------------

dem_chart <- pollstr_chart('2016-national-democratic-primary')  
dem_frame <- dem_chart[["estimates_by_date"]]
# filtering by date
dem_frame <- dem_frame[dem_frame$date > as.Date("2015-02-01"),]

# plotting
dem_plot <- (ggplot(dem_frame, aes(x = date, y = value, color = choice))+ geom_line())
ggsave(file = paste(imageDirectory,"dem.png",sep="/"))
dem_plot




### 2016 South Carolina Republican Presidential Primary --------------------------------

slug <- "2016-south-carolina-presidential-republican-primary"

sc_chart <- pollstr_chart(slug)

## Filtering 
sc_estimates <- sc_chart[["estimates_by_date"]]

sc_estimates <- sc_estimates[sc_estimates$date >= as.Date("2015-07-1"),]

sc_polls <- pollstr_polls(chart = slug, after = "2015-07-1", max_pages = 1000000)

sc_questions <-sc_polls[sc_polls$questions$subpopulation == "Likely Voters"] 

plotdata <- merge(sc_polls$polls, sc_questions, by = "id")
## -------- plotting------
sc_plot <- (ggplot(sc_estimates, aes(x = date, y = value, color = choice))+ geom_line())
ggsave(file = paste(imageDirectory,"sc_gop.png",sep="/"))
sc_plot
ggplot() + geom_line(data = sc_estimates, mapping = aes(y = value, x = date, color = choice))
                     


                     
### President Obama's Job Approval---------------------------------------------

slug <- "obama-job-approval"

## pollster Chart
chart <- pollstr_chart(slug)
estimates <- chart[["estimates_by_date"]]

## filtering by Undecided
estimates <- estimates[ estimates$choice == "Approve" | estimates$choice == "Disapprove",]

## Ploting
ggplot(estimates, aes(x = date, y = value, color = choice)) + geom_line()
ggsave(file = paste(imageDirectory,"O_job_approval.png",sep="/"))

### Congress Job Approval---------------------------------------------------------

slug <- "congress-job-approval"

## polster Chart
chart_congress <- pollstr_chart(slug)

# Filter by date
estimates_congress <- chart_congress[["estimates_by_date"]]

## filtering by Undecided
estimates_congress <- estimates_congress[ estimates_congress$choice == "Approve" | estimates_congress$choice == "Disapprove",]

# Generate the plot using ggplot2 and save
ggplot(estimates_congress, aes(x = date, y = value, color = choice)) + geom_line()
ggsave(file = paste(imageDirectory,"Congress_job_app.png",sep="/"))



