# auto build image

tool= "podman"
remote="docker.io/ben0i0d/denv"
targets="base cpp java js python julia quarto r"
arch="amd64"

for arch in $arch; do
    for target in $targets; do
        podman build --arch=$arch -t $remote:$target $target
    done
done
