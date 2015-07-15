complete <- function(directory = "specdata", id = 1:332) {
        base <- file.path(getwd(), directory)
        files <- file.path(base, list.files(base))

        completecount <- rep(NA, length(id))
        j <- 1;
        for(i in id){
                completecount[j] <- sum(complete.cases(read.csv(files[i])))
                j <- j+1
        }
        my_df <- data.frame(id = id, nobs = completecount)
#        print(my_df)


        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files
        
        ## 'id' is an integer vector indicating the monitor ID numbers
        ## to be used
        
        ## Return a data frame of the form:
        ## id nobs
        ## 1  117
        ## 2  1041
        ## ...
        ## where 'id' is the monitor ID number and 'nobs' is the
        ## number of complete cases
}