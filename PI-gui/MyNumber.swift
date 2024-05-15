protocol MyNumber {
	func cut(n: Int) -> MyFloat
}

func /(X: MyFloat, Y: MyFloat) -> MyNumber {
	MyDiv(X: X, Y: Y)
}
class MyDiv: MyNumber {
	let X: MyFloat
	let Y: MyFloat
	func cut(n: Int) -> MyFloat {
		let Q: MyFloat = MyFloat.zero().cut(n: n)
		let R: MyFloat = X
		let y: MyList2 = Y.digits
		var q: MyList2 = Q.digits
		var r: MyList2 = R.digits
		while r.left != nil {
			r.left = r.left ?? MyList2(right: r, i: 0)
			q.left = q.left ?? MyList2(right: q, i: 0)
			r = r.left!
			q = q.left!
		}
		while true {
			while r >= y {
				r -= y
				q.i += 1
			}
			if q.right == nil {
				return Q
			}
			while r < y && q.right != nil {
				r.right = r.right ?? MyList2(left: r, i: 0)
				q.right = q.right ?? MyList2(left: q, i: 0)
				r = r.right!
				q = q.right!
			}
		}
	}
	init(X: MyFloat, Y: MyFloat) {
		self.X = MyFloat(X)
		self.Y = MyFloat(Y)
	}
}
private func <(_ X: MyList2, _ Y: MyList2) -> Bool {
	var x: MyList2 = X
	var y: MyList2 = Y
	while x.left != nil || y.left != nil {
		x.left = x.left ?? MyList2(right: x, i: 0)
		y.left = y.left ?? MyList2(right: y, i: 0)
		x = x.left!
		y = y.left!
	}
	while true {
		if x.i == y.i {
			if x.right != nil || y.right != nil {
				x.right = x.right ?? MyList2(left: x, i: 0)
				y.right = y.right ?? MyList2(left: y, i: 0)
				x = x.right!
				y = y.right!
			} else {
				return false
			}
		} else {
			return x.i < y.i
		}
	}
}
private func >=(_ X: MyList2, _ Y: MyList2) -> Bool {
	var x: MyList2 = X
	var y: MyList2 = Y
	while x.left != nil || y.left != nil {
		x.left = x.left ?? MyList2(right: x, i: 0)
		y.left = y.left ?? MyList2(right: y, i: 0)
		x = x.left!
		y = y.left!
	}
	while true {
		if x.i == y.i {
			if x.right != nil || y.right != nil {
				x.right = x.right ?? MyList2(left: x, i: 0)
				y.right = y.right ?? MyList2(left: y, i: 0)
				x = x.right!
				y = y.right!
			} else {
				return true
			}
		} else {
			return x.i >= y.i
		}
	}
}
private func -=(_ X: MyList2, _ Y: MyList2) {
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
		let s: Int = x.i - y.i - (cpt ? 1 : 0)
		if(s >= 0) {
			x.i = s
			cpt = false
		} else {
			x.i = s + 10
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

func sqrt(_ X: MyFloat) -> MyNumber {
	MySQRT(X: X)
}
class MySQRT: MyNumber {
	let X: MyFloat
	func cut(n: Int) -> MyFloat {
		var Y: MyFloat = MyFloat(X).cut(n: n)
		var Z: MyFloat = MyFloat(X).cut(n: n)
		repeat {
			Y = MyFloat(Z)
			Z = (( Y + (X/Y).cut(n: n)) / MyFloat.two()).cut(n: n)
		} while ( (Y - Z)/MyFloat.two() ).cut(n: n) != MyFloat.zero()
		return Y
	}
	init(X: MyFloat) {
		self.X = X
	}
}
func !=(_ X: MyFloat, _ Y: MyFloat) -> Bool {
	 X.digits != Y.digits
}
private func !=(_ X: MyList2, _ Y: MyList2) -> Bool {
	var x: MyList2 = X
	var y: MyList2 = Y
	while x.left != nil || y.left != nil {
		x.left = x.left ?? MyList2(right: x, i: 0)
		y.left = y.left ?? MyList2(right: y, i: 0)
		x = x.left!
		y = y.left!
	}
	while true {
		if x.i == y.i {
			if x.right != nil || y.right != nil {
				x.right = x.right ?? MyList2(left: x, i: 0)
				y.right = y.right ?? MyList2(left: y, i: 0)
				x = x.right!
				y = y.right!
			} else {
				return false
			}
		} else {
			return true
		}
	}
}

class PI: MyNumber {
	func cut(n: Int) -> MyFloat {
		var Pn: MyFloat = MyFloat.two() * MyFloat.four()
		var pn: MyFloat = sqrt(MyFloat.two()).cut(n: n) * MyFloat.four()
		while ( (Pn - pn)/MyFloat.two() ).cut(n: n) != MyFloat.zero() {
			Pn = (MyFloat.two() * (Pn * pn).cut(n: n) / (Pn + pn)).cut(n: n)
			pn = sqrt((pn * Pn).cut(n: n)).cut(n: n)
		}
		return (Pn / MyFloat.two()).cut(n: n)
	}
}
