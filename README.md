# CloudFoundry buildpack: R

This is a CloudFoundry buildpack for applications which use
[R](http://www.r-project.org/) for statistical computing and [CRAN](http://cran.r-project.org/) for R packages.

It started as a fork from the R buildpack for Heroku and since then has evolved into an entirely different approach using conda to install the necessary anaconda based packages and gcc to compile those parts of R which are not yet available as conda packages.

My thanks to [Eric Dill](https://github.com/ericdill) for introducing me to conda and for creating the initial working script to automate this install.

R is ‘GNU S’, a freely available language and environment for statistical computing and graphics which provides
a wide variety of statistical and graphical techniques: linear and nonlinear modeling, statistical tests, time
series analysis, classification, clustering, etc. Please consult
the [R project homepage](http://www.r-project.org/) for further information.

[CRAN](http://cran.r-project.org/) is a network of ftp and web servers around the world that
store identical, up-to-date, versions of code and documentation for R.

## Usage

The conda install process loads packages from the anaconda site. Your base folder needs to have a file called "conda_objects" which lists all of the R and related (like gcc) packages you will need for your installation. This file is read during the staging process to determine what packages to load.

At the end of the staging process, a file called init.r will be executed. This is used to install any packages required by your application which you could not find on the conda package site.

At this time, I have not yet figured out how to correctly set the paths which will be used at application execution time. So your manifest.yml file will have to call my bash script with the name of your startup r script. For example, my personal application is started via a script called "engineGlobal.r". The "command" variable in the manifest.yml file looks like this: 

command: bash load_R engineGlobal.r

for this buildpack to work successfully on your system, the command: option must be present and must start with "bash load_R " followed by the name of your starting script, which will be loaded via the Rscript command. 

Because we are compiling, I set memory at 1024Mb. For planning purposes, I have an app of moderate complexity, using Rook to provide web services and several packages from biocLite. My execution environment shows that I am using a bit under 500Mb memory when the app is active. 

Examples of both of these files are available in the exampleFiles folder in this repository.

Example usage (replace ```<app_name>``` with the name of your app):

$ cf push <app_name> -b https://github.com/rddill-IBM/BlueMix-R-Buildpack.git
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

Although R packages can also be included in your project source as part of the file named in your manifest.yml file, I recommend that you do not do this as it may cause your application to time out during the application initialization process.

## R Binaries
The binaries used by the buildpack are for R 3.2.2, and are hosted
on the Anaconda web site

See the [guide](support/README.md) for building the R binaries yourself.

## Caveats
Due to the size of the R runtime, the slug size on Cloud Foundry, without any additional packages or program code, is approximately 100Mb.
If additional R packages are installed by the `init.r` script then the slug size will increase. In the case of my test application, which includes full support for the RGraphvz package from bioconductor, the slug size is approximately 290Mb
