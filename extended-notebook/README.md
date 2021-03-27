# NOTES
The extended notebokk was created by Giuliano Langella to extend libraries required in the LandSupport project.
For instance to include R packages such as sf which were not allowed from the datascience-notebook.

This extended version is also used by myself for didactics.

## I experienced some issues in building the extended notebook image
The most sensible part of the building was the selection and introuction of R packages to be installed via conda.
Some packages required to change some configurations. In my Mac, open the docker dashboard and
  - click on Resources and set the Memory to 8 GB (it was 1GB)
  - click on Docker Engine and add the following configuration (I was receiving the error `<<[output clipped, log limit 1MiB reached]>>`:
    ```
{
  "features": {
    "buildkit": true
  },
  "experimental": false,
  "log-opts": {
    "labels": "somelabel",
    "max-file": "5",
    "max-size": "10m"
  }
}    
    ```
    See the complete configuration you can set at this [web page](https://docs.docker.com/engine/reference/commandline/dockerd/)
