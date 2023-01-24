start:
	mdbook serve --port 3001
clean_branch:
	git branch --merged >/tmp/merged-branches && nano /tmp/merged-branches && xargs git branch -D </tmp/merged-branches && git fetch --prune --all