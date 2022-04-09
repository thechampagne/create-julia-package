using UUIDs

print("Pacakage name: ")
name = strip(readline())
if length(name) == 0
    showerror(stderr, "Error: Package name can't be empty")
    exit(1)
end
print("Version: (0.1.0) ")
version = strip(readline())
if length(version) == 0
    version = "0.1.0"
end

print("Author: ")
author = readline()

try

if !isdir(name)
    mkdir(name)
end

project = open("$name/Project.toml", "w")

write(project,"name = \"$name\"
uuid = \"$(UUIDs.uuid4())\"
authors = [\"$author\"]
version = \"$version\"
\n\n[deps]\n# dependencies declared here
\n[compat]
julia = \"1\"\n")

close(project)

if !isdir("$name/src")
    mkdir("$name/src")
end

source = open("$name/src/$name.jl", "w")

write(source,"module $name\n\n\nend # module end")

close(source)
catch ex
    showerror(stderr, "Error: $ex")
    exit(1)
end