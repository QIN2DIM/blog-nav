export https_proxy=http://127.0.0.1:2081

GREEN=$(tput setaf 2)
RED=$(tput setaf 1)
NC=$(tput sgr0)

print_success() {
    echo "${GREEN}$1${NC}"
}

print_error() {
    echo "${RED}$1${NC}"
}

blog_nav_path1="/e/_GitHubProjects/myProfile/blog-nav"
blog_nav_path2="/d/_GitHubProjects/Sources/blog-nav"

if [ -d "$blog_nav_path1" ]; then
    cd "$blog_nav_path1" || exit
elif [ -d "$blog_nav_path2" ]; then
    cd "$blog_nav_path2" || exit
else
    print_error "无法找到 blog-nav 目录，请检查路径是否正确。"
    exit 1
fi

hugo --gc --minify --cleanDestinationDir &> /dev/null
print_success "[1/2] hugo gc"

git add -A &> /dev/null
git commit -m "Automated backup @ $(date '+%Y-%m-%d %H:%M:%S') Asia/Shanghai"
git push -f &> /dev/null
print_success "[2/2] Push Sources successfully"