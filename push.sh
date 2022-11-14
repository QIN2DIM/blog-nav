GREEN=$(tput setaf 2)
NC=$(tput sgr0)

print(){
	echo "${GREEN}$1${NC}"
}

cd /e/_GithubProjects/myProfile/blog-nav || exit
hugo &> /dev/null
print "[1/2] hugo gc"

git add -A &> /dev/null
git commit -m "Automated backup @ $(date '+%Y-%m-%d %H:%M:%S') Asia/Shanghai"
git push -f &> /dev/null
print "[2/2] Push Sources successfully"
