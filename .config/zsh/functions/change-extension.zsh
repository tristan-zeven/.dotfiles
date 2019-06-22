# change file extensions recursively in current directory
# usage: change-extension <ext1> <ext2>
# change-extension js jsx

function change-extension() {
	foreach f (**/*.$1)
		mv $f $f:r.$2
	end
}
