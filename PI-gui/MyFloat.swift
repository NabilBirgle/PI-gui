class MyFloat {
    var digits: MyList2
    var isPositif: Bool
	init(_ Y: MyFloat) {
		let X: MyFloat = MyFloat(digits: MyList2(i: Y.digits.i), isPositif: Y.isPositif)
		var x: MyList2
		var y: MyList2
		x = X.digits
		y = Y.digits
		while y.right != nil {
			x.right = MyList2(left: x, i: y.right!.i)
			x = x.right!
			y = y.right!
		}
		x = X.digits
		y = Y.digits
		while y.left != nil {
			x.left = MyList2(right: x, i: y.left!.i)
			x = x.left!
			y = y.left!
		}
		self.digits = X.digits
		self.isPositif = X.isPositif
	}
	private init(digits: MyList2, isPositif: Bool) {
        self.digits = digits
        self.isPositif = isPositif
    }
    static func zero() -> MyFloat {
        MyFloat(digits: MyList2(i: 0), isPositif: true)
    }
    static func one() -> MyFloat {
        MyFloat(digits: MyList2(i: 1), isPositif: true)
    }
	static func two() -> MyFloat {
		MyFloat(digits: MyList2(i: 2), isPositif: true)
	}
	static func three() -> MyFloat {
		MyFloat(digits: MyList2(i: 3), isPositif: true)
	}
	static func four() -> MyFloat {
		MyFloat(digits: MyList2(i: 4), isPositif: true)
	}
	func cut(n: Int) -> MyFloat {
		var l: MyList2 = self.digits
		for _ in stride(from: 1, through: n, by: 1) {
			l.right = l.right ?? MyList2(left: l, i: 0)
			l = l.right!
		}
		l.right = nil
		return self
	}
}

private func print_left(_ X: MyList2) -> String {
//	if X.left != nil {
//		print_left(X.left!)
//	}
//	print(X.i, terminator: "")
	if X.left != nil {
		print_left(X.left!) + "\(X.i)"
	} else {
		"\(X.i)"
	}
}
private func print_right(_ X: MyList2) -> String {
//	print(X.i, terminator: "")
//	if X.right != nil {
//		print_right(X.right!)
//	}
	if X.right != nil {
		"\(X.i)" + print_right(X.right!)
	} else {
		"\(X.i)"
	}
}
func print(_ X: MyFloat) -> String {
//	print_left(X.digits)
//	if X.digits.right != nil {
//		print(",", terminator: "")
//		print_right(X.digits.right!)
//	}
//	print()
	return print_left(X.digits) + (X.digits.right != nil ? "," + print_right(X.digits.right!) : "")
}

//func print(_ X: MyFloat){
//	var l: MyList2 = L
//	while l.left != nil {
//		l = l.left!
//	}
//	while true {
//		print(l.i, terminator: "")
//		if l.right != nil {
//			l = l.right!
//		} else {
//			print()
//			return
//		}
//	}
//}


func +(_ X: MyFloat, _ Y: MyFloat) -> MyFloat {
    let Z: MyFloat = MyFloat.zero()
    var x: MyList2 = X.digits
    var y: MyList2 = Y.digits
    var z: MyList2 = Z.digits
    while x.right != nil || y.right != nil {
        x.right = x.right ?? MyList2(left: x, i: 0)
        y.right = y.right ?? MyList2(left: y, i: 0)
        z.right = z.right ?? MyList2(left: z, i: 0)
        x = x.right!
        y = y.right!
        z = z.right!
    }
    var cpt: Bool = false
    while true {
        let s: Int = x.i + y.i + (cpt ? 1 : 0)
        if(s < 10) {
            z.i = s
            cpt = false
        } else {
            z.i = s - 10
            cpt = true
        }
        if cpt || x.left != nil || y.left != nil {
            x.left = x.left ?? MyList2(right: x, i: 0)
            y.left = y.left ?? MyList2(right: y, i: 0)
            z.left = z.left ?? MyList2(right: z, i: 0)
            x = x.left!
            y = y.left!
            z = z.left!
        } else {
            return Z
        }
    }
}

func -(_ X: MyFloat, _ Y: MyFloat) -> MyFloat {
	let Z: MyFloat = MyFloat.zero()
	var x: MyList2 = X.digits
	var y: MyList2 = Y.digits
	var z: MyList2 = Z.digits
	while x.right != nil || y.right != nil {
		x.right = x.right ?? MyList2(left: x, i: 0)
		y.right = y.right ?? MyList2(left: y, i: 0)
		z.right = z.right ?? MyList2(left: z, i: 0)
		x = x.right!
		y = y.right!
		z = z.right!
	}
	var cpt: Bool = false
	while true {
		let s: Int = x.i - y.i - (cpt ? 1 : 0)
		if(s >= 0) {
			z.i = s
			cpt = false
		} else {
			z.i = s + 10
			cpt = true
		}
		if cpt || x.left != nil || y.left != nil {
			x.left = x.left ?? MyList2(right: x, i: 0)
			y.left = y.left ?? MyList2(right: y, i: 0)
			z.left = z.left ?? MyList2(right: z, i: 0)
			x = x.left!
			y = y.left!
			z = z.left!
		} else {
			return Z
		}
	}
}

private func +=(_ X: MyList2, _ Y: MyList2) {
	var x: MyList2 = X
	var y: MyList2 = Y
	while y.right != nil {
		x.right = x.right ?? MyList2(left: x, i: 0)
		y.right = y.right ?? MyList2(left: y, i: 0)
		x = x.right!
		y = y.right!
	}
	var cpt: Bool = false
	while true {
		let s: Int = x.i + y.i + (cpt ? 1 : 0)
		if(s < 10) {
			x.i = s
			cpt = false
		} else {
			x.i = s - 10
			cpt = true
		}
		if cpt || y.left != nil {
			x.left = x.left ?? MyList2(right: x, i: 0)
			y.left = y.left ?? MyList2(right: y, i: 0)
			x = x.left!
			y = y.left!
		} else {
			return
		}
	}
}

func +=(_ X: MyFloat, _ Y: MyFloat) {
	X.digits += Y.digits
}

func *(_ X: MyFloat, _ Y: MyFloat) -> MyFloat {
	let Z: MyFloat = MyFloat.zero()
	var x: MyList2 = X.digits
	var y: MyList2 = Y.digits
	var z: MyList2 = Z.digits
	while x.right != nil {
		x.right = x.right ?? MyList2(left: x, i: 0)
		z.right = z.right ?? MyList2(left: z, i: 0)
		x = x.right!
		z = z.right!
	}
	while y.right != nil {
		y.right = y.right ?? MyList2(left: y, i: 0)
		z.right = z.right ?? MyList2(left: z, i: 0)
		y = y.right!
		z = z.right!
	}
	while true {
		for _ in stride(from: 1, through: y.i, by: 1) {
			z += x
		}
		if y.left != nil {
			y.left = y.left ?? MyList2(right: y, i: 0)
			z.left = z.left ?? MyList2(right: z, i: 0)
			y = y.left!
			z = z.left!
		} else {
			return Z
		}
	}
}
