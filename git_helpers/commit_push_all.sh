## just adds all files
## commit with commit messages

gitPush () {
	# add
	git add .
	git commit -m "$commitMessage"
	git push
	cd ../

}


# commit
read -p "Commit message: " commitMessage

cd ansible_role_collection
gitPush
cd drokdev_web_dev
gitPush
cd ethical_hacking
gitPush
cd nginx_configs
gitPush
cd script_collection
