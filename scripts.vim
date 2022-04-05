if did_filetype()
	finish
endif
if getline(1) =~# '^[^ ]* wants you to sign in with your Ethereum account:$'
	setf siwe
endif
