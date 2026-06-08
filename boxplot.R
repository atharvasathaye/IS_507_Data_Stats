# Exam scores data
exam_scores <- c(56, 64, 67, 73, 74, 77, 78, 79, 81, 81, 82, 85, 88, 89, 90, 92, 94, 95)

# Create the box plot
boxplot(exam_scores, 
        main="Box Plot: Statistical Learning Exam Scores",
        ylab="Scores",
        col="lightblue",
        border="darkblue",
        horizontal=TRUE)

# Add a grid
grid(nx=NULL, ny=NA, lty=2, col="gray")

# Add text labels for the five-number summary
fivenum_summary <- fivenum(exam_scores)
text(x=fivenum_summary, y=1.3, labels=round(fivenum_summary, 1), pos=3)

# Add a subtitle with the sample size
title(sub=paste("n =", length(exam_scores)), line=4)

