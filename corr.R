corr <- function(directory="specdata", threshold = 0) {
        
        base <- file.path(getwd(), directory)
        files <- file.path(base, list.files(base))

        samples <- complete(directory, 1:332)
        for(i in samples$id)
        {
                if(samples[i, "nobs"] > threshold)
                {
                        data <- read.csv(files[i])
                        nit_vals <- vector(mode = "numeric", length = samples[[i, "nobs"]])
                        sul_vals <- vector(mode = "numeric", length = samples[[i, "nobs"]])
                        nit_vals <- data$nitrate[complete.cases(data)]
                        sul_vals <- data$sulfate[complete.cases(data)]
                        print(i)
                }
        }
        str(nit_vals)
        str(sul_vals)
        cor_vals <- cor(nit_vals, sul_vals)
        print(cor_vals)
        
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files
        
        ## 'threshold' is a numeric vector of length 1 indicating the
        ## number of completely observed observations (on all
        ## variables) required to compute the correlation between
        ## nitrate and sulfate; the default is 0
        
        ## Return a numeric vector of correlations
        ## NOTE: Do not round the result!
}