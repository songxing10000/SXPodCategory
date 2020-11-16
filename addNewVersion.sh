# 使用 ./addNewVersion.sh 1.1.1  1.1.1是你想设置的新版本


# 拉取分支上现有的tags
git fetch --tags
#获取最新版本tag
LatestTag=$(git describe --tags `git rev-list --tags --max-count=1`)
# 修改为新version
sed -i "" s/${LatestTag}/$1/g ./basePod.podspec
# 提交缓存区
git add .
# 提交本地仓库，提交说明
git commit -m "addNewVersion $1"
# 提交到远程
git push origin

#将最新提交的commit作为tag标记在本地
git tag $1
#将最新提交的commit作为tag标记在远程
git push origin $1
