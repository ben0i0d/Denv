# Denv
This is a project for creating development containers. 

The outcome of this project is containers used for a unified development environment. 

In practice, this project has been separated from another Jupyter project to better align with the requirements of devcontainers in VScode. 

It has removed IDE components, including Jupyter Notebook, leaving only the essential toolchain for development. 

In the future, we are considering creating an Renv project based on this project to provide a lighter runtime environment.

# HOW TO USE

## Use like a container
you can just `docker run -it`

## Use like a devcontainer(VScode)
`cp -r .devcontainer WORKSOLDIR`

# NOTICE

Maybe I will change some image's name rapidly