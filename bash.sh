function mkcdir() {
	mkdir -p $1 &&
	cd $_
}

function lazyjs() {
	mkdir $1 &&
	cd $_
	touch index.js styles.js
}

function upto ()
{
  if [ -z "$1" ]; then
    return
  fi
  local upto=$1
  cd "${PWD/\/$upto\/*//$upto}"
}

function gomaster() {
	upto src &&
	cd ..
}

function lazygit() {
	echo -n "Are you in the master folder? (y/n) "
	read option
	if [[ "$option" = "n" ]]
	then gomaster
	fi
	
	echo -n "What's changed? "
	read changes
	echo "Committing..."
	git add . &&
	git commit -m "$changes" &&
	git push origin master
	echo "Done! Succesfully commited and pushed the code to GitHub!"
}

function ngrok() {
	port=$1

	if [[ -z $port ]]
	then
		echo -n "Type in the port you want the ngrok server to run on: "
		read port
	fi
	echo "Starting server on port $port..."
	sleep 1
	start $your_ngrokexe_here http $port
	echo "Successfully lauched ngrok server!"
}
