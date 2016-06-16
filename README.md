# CloudFoundry buildpack: R

This is a CloudFoundry buildpack for applications which use
[R](http://www.r-project.org/) for statistical computing and [CRAN](http://cran.r-project.org/) for R packages.

It's a fork from the R buildpack for Heroku.

R is ‘GNU S’, a freely available language and environment for statistical computing and graphics which provides
a wide variety of statistical and graphical techniques: linear and nonlinear modelling, statistical tests, time
series analysis, classification, clustering, etc. Please consult
the [R project homepage](http://www.r-project.org/) for further information.

[CRAN](http://cran.r-project.org/) is a network of ftp and web servers around the world that
store identical, up-to-date, versions of code and documentation for R.

## Usage
Example usage (replace ```<app_name>``` with the name of your app):

```
$ ls
init.r prog1.r prog2.r ...

$ cf push <app_name> -b http://github.com/alexkago/cf-buildpack-r.git

...
-----> R successfully installed
```

The buildpack will detect your app makes use of R if it has the `init.r` file in the root.
The R runtime is vendored into your slug, and includes the gcc compiler for fortran support.


## Installing R packages
During the slug compilation process, the `init.r` R file is executed. Put code in this file to install any packages you may require.
See the [Installing-packages](http://cran.r-project.org/doc/manuals/R-admin.html#Installing-packages) for details. The
list of available packages can be found at [http://cran.r-project.org](http://cran.r-project.org/web/packages/available_packages_by_date.html).

```
# Example `init.r` file

install.packages("nlme", dependencies = TRUE)

```

R packages can also be included in your project source and installed when the `init.r` file is executed.

```
install.packages("optional-path-to-packages/local-r-package-file.tar.gz", repos=NULL, type="source")
```

## R Binaries
The binaries used by the buildpack are for R 3.0.1, and are hosted
on [https://s3.amazonaws.com/r-buildpack/R-3.1.0-binaries-20140629-2201.tar.gz](https://s3.amazonaws.com/r-buildpack/R-3.1.0-binaries-20140629-2201.tar.gz)

See the [guide](support/README.md) for building the R binaries yourself.

## Caveats
Due to the size of the R runtime, the slug size on Cloud Foundry, without any additional packages or program code, is approximately 98Mb.
If additional R packages are installed by the `init.r` script then the slug size will increase.

