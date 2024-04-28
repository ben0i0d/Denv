# auto build image

remote="docker.io/ben0i0d/denv"
targets="base cpp java js python julia quarto r"

for target in $targets; do
    podman push $remote:$target 
done