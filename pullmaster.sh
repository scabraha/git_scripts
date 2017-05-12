git checkout master
git pull
git checkout -

for i in "$@"; do
	if [[ $i == "-r" ]]; then
		git rebase -i master
		break
	fi
done
