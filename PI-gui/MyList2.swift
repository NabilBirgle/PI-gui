class MyList2 {
	var left: MyList2?
	var right: MyList2?
	var i: Int
	init(left: MyList2? = nil, right: MyList2? = nil, i: Int) {
		self.left = left
		self.right = right
		self.i = i
	}
}

func print(_ L: MyList2) {
	var l: MyList2 = L
	while l.left != nil {
		l = l.left!
	}
	while true {
		print(l.i, terminator: "")
		if l.right != nil {
			l = l.right!
		} else {
			print()
			return
		}
	}
}
