export https_proxy=http://127.0.0.1:2081

GREEN=$(tput setaf 2)
NC=$(tput sgr0)

print(){
	echo "${GREEN}$1${NC}"
}

cd /e/_GitHubProjects/myProfile/blog-nav || exit
hugo --gc --minify --cleanDestinationDir &> /dev/null
print "[1/2] hugo gc"

git add -A &> /dev/null
git commit -m "Automated backup @ $(date '+%Y-%m-%d %H:%M:%S') Asia/Shanghai"
git push -f &> /dev/null
print "[2/2] Push Sources successfully"
