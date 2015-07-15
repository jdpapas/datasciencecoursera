pollutantmean <- function(directory = "specdata", pollutant ="sulfate", id = 1:332) {

        base <- file.path(getwd(), directory)
        files <- file.path(base, list.files(base))
        my_data <- data.frame()
        for(i in id){
                my_data <- rbind(my_data, read.csv(files[i]))
        }
        my_mean = mean(my_data[[pollutant]], trim=0, na.rm=TRUE);
        print(my_mean)
}