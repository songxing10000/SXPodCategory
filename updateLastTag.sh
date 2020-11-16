#一个tag可能有错，多次修改后，删除之前的tag,把最新的做为此tag



# 拉取分支上现有的tags
git fetch --tags
#获取最新版本tag
LatestTag=$(git describe --tags `git rev-list --tags --max-count=1`)

# 提交缓存区
git add .
# 提交本地仓库，提交说明
git commit -m "updateLastTag ${LatestTag}"
# 提交到远程
git push origin

#在本地删除老的最新的tag
git tag -d ${LatestTag}
#在远程删除老的最新的tag
git push origin --delete $LatestTag
#将最新提交的commit作为tag标记在本地
git tag ${LatestTag}
#将最新提交的commit作为tag标记在远程
git push origin ${LatestTag}
